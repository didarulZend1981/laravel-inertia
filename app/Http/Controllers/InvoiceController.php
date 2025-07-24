<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Invoice;
use App\Models\Invoice_product;
use App\Models\Product;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class InvoiceController extends Controller
{

    public function InvoiceListPage(Request $request){
        $user_id = request()->header('id');
        $list = Invoice::where('user_id', $user_id)
            ->with('customer','Invoice_product.product')->get();
        return Inertia::render('InvoiceListPage', ['list' => $list]);

        // return $list;
    }




    public function InvoiceCreate(Request $request){
        // dd($request->all());
        DB::beginTransaction();
        try {
            $user_id = $request->header('id');

            $data = [
                    'user_id' => $user_id,
                    'customer_id' => $request->customer_id,
                    'total' => $request->total,
                    'vat' => $request->vat,
                    'Payable' => $request->payable,
                    'discount' => $request->discount
            ];




            $invoice = Invoice::create($data);

            $products = $request->input('products');

            foreach($products as $product){
                $existUnit = Product::where('id', $product['id'])->first();

                if(!$existUnit){
                    return response()->json([
                        'status' => 'failed',
                        'message' => "Product with ID {$product['id']} not found"
                    ]);
                }

                if($existUnit->unit < $product['unit']){
                    return response()->json([
                        'status' => 'failed',
                        'message' => "Only {$existUnit->unit} units available in stock for product id {$product['unit']}"
                    ]);
                }
                Invoice_product::create([
                    'invoice_id' => $invoice->id,
                    'product_id' => $product['id'],
                    'user_id' => $user_id,
                    'qty' => $product['unit'],
                    'sale_price' => $product['price']
                ]);
                Product::where('id', $product['id'])->update([
                    'unit' => $existUnit->unit - $product['unit']
                ]);
            }//end foreach

            DB::commit();
            // return response()->json([
            //     'status' => 'success',
            //     'message' => 'Invoice created successfully'
            // ]);

            $data = ['message'=>'Invoice created successfully','status'=>true,'error'=>''];
            return redirect('/InvoiceListPage')->with($data);


        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 'failed',
                'message' => "Something went wrong"
            ]);

            $data = ['message'=>'Something went wrong','status'=>false,'error'=>$e->getMessage()];
            return redirect()->back()->with($data);

        }
    }//end method

    public function InvoiceList(){
        $user_id = request()->header('id');
        $invoices = Invoice::with('customer')->where('user_id', $user_id)->get();
        return $invoices;
    }


    public function InvoiceDetails(Request $request){
        $user_id = request()->header('id');

        $customerDetails = Customer::where('user_id', $user_id)->where('id', $request->customer_id)->first();

        $invoiceDetails = Invoice::where('user_id', $user_id)->where('id', $request->invoice_id)->first();
        $invoiceProduct = Invoice_product::where('invoice_id', $request->invoice_id)
            ->where('user_id',$user_id)->with('product')
            ->get();

        return [
            'customer' => $customerDetails,
            'invoice' => $invoiceDetails,
            'product' => $invoiceProduct
        ];
    }

    public function InvoiceDelete(Request $request, $id){
        DB::beginTransaction();
        try {
            $user_id = request()->header('id');
            Invoice_product::where('invoice_id', $id)
                ->where('user_id', $user_id)
                ->delete();

            Invoice::where('id', $id)
                ->where('user_id', $user_id)
                ->delete();

            DB::commit();
            // return response()->json([
            //     'status' => 'success',
            //     'message' => 'Invoice deleted successfully'
            // ]);

             $data = ['message'=>'Invoice deleted successfully','status'=>true,'error'=>''];
            return redirect()->back()->with($data);

        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 'failed',
                'message' => "Something went wrong"
            ]);

            $data = ['message'=>'Something went wrong','status'=>false,'error'=>$e->getMessage()];
            return redirect()->back()->with($data);

        }
    }


























}
