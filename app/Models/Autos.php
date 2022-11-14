<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Autos extends Model
{
    use HasFactory;

    public $table = "autos";
    public $timestamps = false;
    public $primaryKey = "patente";
    public $incrementing = false;
    public $keyType = "string";

    public function marca(){
        return this->belongsTo(Marcas::class);
    }
}
