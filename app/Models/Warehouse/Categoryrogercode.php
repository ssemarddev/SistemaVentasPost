<?php

namespace App\Models\Warehouse;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categoryrogercode extends Model
{
    use HasFactory;
    protected $table = 'categorias';
    protected $fillable = [ 
        'nombre',
        'descripcion',
        'estado'
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
