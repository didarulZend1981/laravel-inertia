<?php

namespace App\Http\Controllers;

use App\Models\Suplayer;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SuplayerController extends Controller{
    public function SuplayerPage(Request $request){
        $user_id = $request->header('id');
        $suplayers = Suplayer::where('user_id', $user_id)->get();
        return Inertia::render('SuplayerPage',['suplayers'=>$suplayers]);
    }


    public function SuplayerSavePage(Request $request){
        $user_id = $request->header('id');
        $suplayers = Suplayer::where('user_id', $user_id)->get();
        return Inertia::render('SuplayerSavePage',['suplayers'=>$suplayers]);
    }



    public function edit(Request $request){
        $suplayer = Suplayer::findOrFail($request->id);
        return Inertia::render('SuplayerSavePage',['suplayers'=>$suplayer]);
    }


    public function SuplayerCreate(Request $request){
        // dd->request->all();

        $user_id = $request->header('id');

        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'mobile' => $request->mobile,
            'companyName' => $request->companyName,
            'user_id' => $user_id
        ];


        Suplayer::create($data);
        // return response()->json([
        //     'status' => 'success',
        //     'message' => 'Category created successfully',
        //     'data'=>$data,
        // ]);

        $data = ['message'=>'SuplayerPage created successfully','status'=>true,'error'=>''];
        return redirect('/SuplayerPage')->with($data);
    }


    public function SuplayerUpdate(Request $request){
        $user_id = $request->header('id');
        $id = $request->input('id');
        Suplayer::where('id', $id)->where('user_id', $user_id)->update([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'mobile' => $request->input('mobile'),
            'companyName' => $request->input('companyName'),
        ]);
        // return response()->json([
        //     'status' => 'success',
        //     'message' => 'Suplayer Updaetd successfully'
        // ]);
        $data = ['message'=>'Suplayer updated successfully','status'=>true,'error'=>''];
        return redirect('/SuplayerPage')->with($data);
    }


     public function SuplayerDelete(Request $request,$id){
        $user_id = $request->header('id');
        Suplayer::where('user_id', $user_id)->where('id', $id)->delete();
        // return response()->json([
        //     'status' => 'success',
        //     'message' => 'Customer Deleted successfully'
        // ]);
        $data = ['message'=>'Suplayer Deleted successfully','status'=>true,'error'=>''];
        return redirect('/SuplayerPage')->with($data);
    }


}
