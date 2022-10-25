<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Autos extends Model
{
    use HasFactory;

    protected $table = "autos";
    public $timestamps = false;
    protected $primaryKey = "patente";
    protected $incrementing = false;
    protected $keyType = "string";

    public function marca(){
        return this->belongsTo(Marcas::class);
    }
}
