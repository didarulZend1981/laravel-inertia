<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductController extends Controller{



    public function ProductSavePage(Request $request){
        $user_id = $request->header('id');
        $product_id = $request->query('id');
        $product = Product::where('id',$product_id)->where('user_id',$user_id)->first();
        $categories = Category::where('user_id', $user_id)->get();
        return Inertia::render('ProductSavePage', ['product' => $product, 'categories' => $categories]);
    }

    public function ProductPage(Request $request){
        $user_id = $request->header('id');
        $products = Product::where('user_id', $user_id)
            ->with('category')->latest()->get();
        return Inertia::render('ProductPage', ['products' => $products]);
    }


    public function CreateProduct(Request $request){
        // dd($request->all());
         $user_id = $request->header('id');


        $request->validate([
            'name' => 'required',
            'price' => 'required',
            'unit' => 'required',
            'category_id' => 'required',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);

        $data = [
            'name' => $request->name,
            'price' => $request->price,
            'unit' => $request->unit,
            'category_id' => $request->category_id,
            'user_id' => $user_id
        ];

        if($request->hasFile('image')){
            $image = $request->file('image');
            $fileName = time().'.'.$image->getClientOriginalExtension();
            $filePath = 'uploads/producs/'.$fileName;
            $image->move(public_path('uploads/producs'), $fileName);
            $data['image'] = $filePath;
        }

        //  dd($data);
         Product::create($data);

        // return response()->json([
        //     'status' => 'success',
        //     'message' => 'Product created successfully'
        // ]);

         $data = ['message'=>'Product created successfully','status'=>true,'error'=>''];
        return redirect('/ProductPage')->with($data);

    }


    public function ProductList(Request $request){

        $user_id = $request->header('id');

        $products = Product::where('user_id', $user_id)->get();
        return $products;
    }

    public function ProductById(Request $request){
        $user_id = $request->header('id');
        $product = Product::where('user_id', $user_id)->where('id', $request->id)->first();
        return $product;
    }


    public function ProductUpdate(Request $request){
        // dd($request->all());

        $user_id = $request->header('id');

        $request->validate([
            'name' => 'required',
            'price' => 'required',
            'unit' => 'required',
            'category_id' => 'required'
        ]);

        $product = Product::where('user_id', $user_id)->findOrFail($request->id);

      //  dd($product);

        $product->name = $request->name;
        $product->price = $request->price;
        $product->unit = $request->unit;
        $product->category_id = $request->category_id;

        if($request->hasFile('image')){
            if($product->image && file_exists(public_path($product->image))){
                unlink(public_path($product->image));
            }

            $request->validate([
                'image' => 'image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048'
            ]);
            $image = $request->file('image');

            $fileName = time().'.'.$image->getClientOriginalExtension();
            $filePath = 'uploads/producs/'.$fileName;

            $image->move(public_path('uploads/producs'), $fileName);
            $product->image = $filePath;
        }

        // dd($product);

        $product->save();

        // return response()->json([
        //     'status' => 'success',
        //     'message' => 'Product Updated successfully'
        // ]);

        $data = ['message'=>'Product updated successfully','status'=>true,'error'=>''];
        return redirect('/ProductPage')->with($data);

    }//end method

    public function ProductDelete(Request $request,$id){
        try{
            // $user_id = $request->header('id');
            $product = Product::findOrFail($id);
            if($product->image && file_exists(public_path($product->image))){
                unlink(public_path($product->image));
            }

            $product->delete();
            // return response()->json([
            //     'status' => 'success',
            //     'message' => 'Product Deleted successfully'
            // ]);

            $data = ['message'=>'Product Deleted successfully','status'=>true,'error'=>''];
            return redirect()->back()->with($data);

        }catch(Exception $e){
            return response()->json([
                'status' => 'failed',
                'message' => $e->getMessage()
            ]);


            $data = ['message'=> 'Something went wrong','status'=>false,'error'=>$e->getMessage()];
            return redirect()->back()->with($data);

        }

    }



}
