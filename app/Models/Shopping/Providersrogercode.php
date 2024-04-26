<?php

namespace App\Models\Shopping;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Providersrogercode extends Model
{
    use HasFactory;
    protected $table = 'proveedores';
    protected $fillable = [
        'user_id',
        'nombre_empresa',
        'rut',
        'telefono',
        'vendedor',
        'correo',
        'direccion',
        'nombre_banco',
        'tipo_cuenta',
        'numero_cuenta',
        'estado' 
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
