<?php

namespace App\Models\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Paymentmoneyrogercode extends Model
{
    use HasFactory;
    protected $table = 'abonos';
    protected $fillable = [
        'user_id',
        'cliente_id',
        'aperturacaja_id',
        'tipo_comprobante',
        'num_comprobante',
        'numero_abono_manual',
        'tipo_pago',
        'efectivo',
        'transferencia',
        'tdebito',
        'tcredito',
        'total',
        'total_abono',
        'status_abono',
        'status',
    ];

    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
