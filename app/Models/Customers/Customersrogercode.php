<?php

namespace App\Models\Customers;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customersrogercode extends Model
{
    use HasFactory;
    protected $table = 'clientes';
    protected $fillable = [ 
        'user_id',
        'nombres',
        'rut',
        'telefono',
        'direccion',
        'email',
        'estado', 
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['updated_at'];
}
