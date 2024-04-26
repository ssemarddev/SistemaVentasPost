<?php

namespace App\Models\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Carritorogercode extends Model
{
    use HasFactory;
    protected $table = 'carrito';
    protected $fillable = [ 
        'producto_id',
        'cod',
        'id_user',
        'nombre',
        'cantidad',
        'descipcion',
        'precio',
        'descuento',
        'total'
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
