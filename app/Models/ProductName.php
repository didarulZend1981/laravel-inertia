<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductName extends Model{
    //
     protected $fillable = [
        'user_id',
        'category_id',
        'name',
        'type',
        'image',
    ];

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }



}
