<?php

namespace App\Models\Warehouse;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Productsrogercode extends Model
{
    use HasFactory;
    protected $table = 'productos';
    protected $fillable = [
        'user_id',
        'id_categ',
        'id_proveedor',
        'id_subcateg',
        'tipounidad_id',
        'codigo',
        'nombre',
        'descripcion',
        'impuestos',
        'estado',
        'precio_costo',
        'precio_venta',
        'stock',
        'stock_min',
        'mayoreo_cantidad',
        'mayoreo_pventa',
        'mayoreo_cantidad2',
        'mayoreo_pventa2',
        'maneja_inventario',
        'imagen'
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
