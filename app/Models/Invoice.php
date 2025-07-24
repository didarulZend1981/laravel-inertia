<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{


    protected $fillable = [
        'user_id',
        'customer_id',
        'total',
        'discount',
        'vat',
        'Payable',
    ];



    public function user(){
        return $this->belongsTo(User::class);
    }
    public function customer(){
        return $this->belongsTo(Customer::class);
    }
     public function Invoice_product(){
        return $this->hasMany(Invoice_product::class);
    }
}
