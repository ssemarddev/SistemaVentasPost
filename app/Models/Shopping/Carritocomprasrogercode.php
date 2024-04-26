<?php

namespace App\Models\Shopping;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Carritocomprasrogercode extends Model
{
    use HasFactory;
    protected $table = 'carrito_compras_temp';
    protected $fillable = [ 
        'id_user',
        'producto_id',
        'codigo',
        'nombre',
        'cantidad',
        'descipcion',
        'precio_costo',
        'precio_venta',
        'descuento',
        'total'
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
