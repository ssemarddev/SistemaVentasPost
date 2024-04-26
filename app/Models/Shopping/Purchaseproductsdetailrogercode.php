<?php

namespace App\Models\Shopping;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchaseproductsdetailrogercode extends Model
{
    use HasFactory;

    protected $table = 'detalle_compras';
    protected $fillable = [
        'compra_id',
        'producto_id',
        'precio_compra',
        'precio_venta',
        'cantidad', 
        'descuento',
        'subtotal',
        'status',
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
