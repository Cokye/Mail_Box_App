<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Correo extends Model
{
    use HasFactory;

    protected $table = 'correos';

    protected $fillable = [
        'correo_remitente',
        'correo_receptor',
        'paralelo',
        'informacion',
        'id_ramo',
    ];

    public function ramo()
    {
        return $this->belongsTo(Ramo::class, 'id_ramo');
    }
}
