<?php

namespace App\Models\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Salesrogercode extends Model
{
    use HasFactory;
    protected $table = 'ventas';
    protected $fillable = [
        'user_id',
        'cliente_id',
        'aperturacaja_id',
        'tipo_comprobante',
        'num_comprobante',
        'numero_venta_manual',
        'tipo_pago',
        'efectivo',
        'transferencia',
        'tdebito',
        'tcredito',
        'abono',
        'tipo_abono',
        'total_venta',
        'cambio',
        'recibido',
        'status',
    ];

    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
