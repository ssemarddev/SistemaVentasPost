<?php

namespace App\Models\Shopping;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchaseproductsrogercode extends Model
{
    use HasFactory;
    protected $table = 'compras';
    protected $fillable = [
        'user_id',
        'proveedor_id',
        'aperturacaja_id',
        'tipo_comprobante',
        'num_comprobante',
        'numero_compra_manual',
        'tipo_pago',
        'efectivo',
        'transferencia',
        'tdebito',
        'tcredito',
        'abono',
        'tipo_abono',
        'total_compra',
        'status',
    ];

    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
