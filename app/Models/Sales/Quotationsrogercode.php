<?php

namespace App\Models\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quotationsrogercode extends Model
{
    use HasFactory;
    protected $table = 'cotizaciones';
    protected $fillable = [
        'id_user',
        'id_cliente',
        'cod',
        'serie',
        'factura',
        'tipo_pago',
        'validez',
        'total',
        'abono',
        'servicio',
        'numero_cotizacion_manual',
        'estado',
        'tipo_registro'
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
