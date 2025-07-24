<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\ProductName;
use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductNameController extends Controller{
    public function ProductNameSavePage(Request $request){
        $user_id = $request->header('id');
        // $product_name_id = $request->query('id');
        // $product_name = ProductName::where('id',$product_name_id)->where('user_id',$user_id)->first();
        $categories = Category::where('user_id', $user_id)->get();
        return Inertia::render('ProductNameSavePage', ['categories' => $categories]);


    }
    public function CreateProductName(Request $request){

         $user_id = $request->header('id');


        $request->validate([
            'name' => 'required',
            'category_id' => 'required',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);

        $data = [
            'name' => $request->name,
            'type' => $request->type,
            'category_id' => $request->category_id,
            'user_id' => $user_id
        ];

        if($request->hasFile('image')){
            $image = $request->file('image');
            $fileName = time().'.'.$image->getClientOriginalExtension();
            $filePath = 'uploads/productNames/'.$fileName;
            $image->move(public_path('uploads/productNames'), $fileName);
            $data['image'] = $filePath;
        }


         ProductName::create($data);

        // return response()->json([
        //     'status' => 'success',
        //     'message' => 'Product created successfully',
        //     'message' => $data
        // ]);

         $data = ['message'=>'Product created successfully','status'=>true,'error'=>''];
        return redirect('/ProductNamePage')->with($data);

    }


    public function ProductNamePage(Request $request){
        $user_id = $request->header('id');
        $productNamesPage = ProductName::where('user_id', $user_id)
            ->with('category')->latest()->get();

        // return $productNamesPage;
        return Inertia::render('ProductNamePage', ['productNamesPage' => $productNamesPage]);
    }

    //

    public function edit(Request $request){
        $user_id = $request->header('id');
        $product_names = ProductName::findOrFail($request->id);
        $categories = Category::where('user_id', $user_id)->get();
        return Inertia::render('ProductNameSavePage',['product_names'=>$product_names,'categories' => $categories]);
    }

    public function ProductNamePageDelete(Request $request,$id){
        try{
            // $user_id = $request->header('id');
            $product = ProductName::findOrFail($id);
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


       public function ProductNameUpdate(Request $request){
        // dd($request->all());

        $user_id = $request->header('id');

        $request->validate([
            'name' => 'required',
            'category_id' => 'required',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);

        $product = ProductName::where('user_id', $user_id)->findOrFail($request->id);

      //  dd($product);

        $product->name = $request->name;
        $product->type = $request->type;
        $product->category_id = $request->category_id;
        $product->user_id = $user_id;



        if($request->hasFile('image')){
            if($product->image && file_exists(public_path($product->image))){
                unlink(public_path($product->image));
            }

            $request->validate([
                'image' => 'image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048'
            ]);
            $image = $request->file('image');

            $fileName = time().'.'.$image->getClientOriginalExtension();
            $filePath = 'uploads/productNames/'.$fileName;

            $image->move(public_path('uploads/productNames'), $fileName);
            $product->image = $filePath;
        }

        // dd($product);

        $product->save();

        // return response()->json([
        //     'status' => 'success',
        //     'message' => 'Product Updated successfully'
        // ]);

        $data = ['message'=>'Product updated successfully','status'=>true,'error'=>''];
        return redirect('/ProductNamePage')->with($data);

    }//end method














}
