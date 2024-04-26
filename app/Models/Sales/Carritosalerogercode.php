<?php

namespace App\Models\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Carritosalerogercode extends Model
{
    use HasFactory;
    protected $table = 'carrito_venta_temp';
    protected $fillable = [ 
        'id_user',
        'producto_id',
        'codigo',
        'nombre',
        'cantidad',
        'descipcion',
        'precio',
        'precio_menudeo',
        'precio_mayoreo',
        'precio_mayoreo2',
        'descuento',
        'tipo_unidad',
        'mayoreo_cantidad',
        'mayoreo_cantidad2',
        'total',
        'product_stock',
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
