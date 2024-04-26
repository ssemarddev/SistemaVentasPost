<?php

namespace App\Models\Cash;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cash_courtrogercode extends Model
{
    use HasFactory;
    protected $table='corte_cajero_dia';

    protected $fillable = [
        "apertura_id",
        "total_acumulado",
        "seriefolio",
        'ventaefectivo',
        'ventatransferencia',
        'ventatdebito',
        'ventatcredito',
        'abonoefectivo',
        'abonotransferencia',
        'abonotdebito',
        'abonotcredito',
        'abono',
        "numfolio",
        "status",
    ]; 

    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
