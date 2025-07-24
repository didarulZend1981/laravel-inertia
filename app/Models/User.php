<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'otp',
        'password',
        'mobile',
    ];

    public function categories(){
        return $this->hasMany(Category::class);
    }//end method

    public function products(){
        return $this->hasMany(Product::class);
    }

    public function customers(){
        return $this->hasMany(Customer::class);
    }

    public function suplayers(){
        return $this->hasMany(Suplayer::class);
    }
    public function ProductNames(){
        return $this->hasMany(ProductName::class);
    }
    public function invoices(){
        return $this->hasMany(Invoice::class);
    }

    public function Invoice_product(){
        return $this->hasMany(Invoice_product::class);
    }

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            // 'password' => 'hashed',
        ];
    }
}
