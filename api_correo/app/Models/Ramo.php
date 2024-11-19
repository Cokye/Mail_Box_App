<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ramo extends Model
{
    use HasFactory;
    
    protected $table = 'ramos';

    protected $fillable = [
        'nombre_ramo',
        'codigo_ramo',
    ];

    public function correos()
    {
        return $this->hasMany(Correo::class, 'id_ramo');
    }
}
