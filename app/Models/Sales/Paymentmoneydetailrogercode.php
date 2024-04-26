<?php

namespace App\Models\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Paymentmoneydetailrogercode extends Model
{
    use HasFactory;
    protected $table = 'detalle_abonos';
    protected $fillable = [
        'abono_id',
        'producto_id',
        'aperturacaja_id',
        'precio_venta',
        'cantidad', 
        'descuento',
        'subtotal',
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
