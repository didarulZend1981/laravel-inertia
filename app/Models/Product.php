<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'user_id',
        'category_id',
        'name',
        'price',
        'unit',
        'image',
    ];
    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }
     public function Invoice_product(){
        return $this->hasMany(Invoice_product::class);
    }

}
