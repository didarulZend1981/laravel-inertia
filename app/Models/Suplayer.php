<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Suplayer extends Model{

    protected $fillable = [
        'name',
        'email',
        'mobile',
        'companyName',
        'user_id'
    ];
    public function suplayer(){
        return $this->belongsTo(Suplayer::class);
    }
}
