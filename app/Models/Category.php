<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model{
    protected $fillable = [
        'name',
        'user_id'
    ];
    public function user(){
        return $this->belongsTo(User::class);
    }
    public function products(){
        return $this->hasMany(Product::class);
    }
    public function ProductNames(){
        return $this->hasMany(ProductName::class);
    }


}
