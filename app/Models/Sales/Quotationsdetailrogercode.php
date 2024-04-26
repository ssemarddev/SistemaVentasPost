<?php

namespace App\Models\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quotationsdetailrogercode extends Model
{
    use HasFactory;
    protected $table = 'detalles_cotizacion';
    protected $fillable = [
        'id_cotizacion',
        'id_producto',
        'precio_venta',
        'cantidad', 
        'descuento',
        'total',
        'item' 
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
