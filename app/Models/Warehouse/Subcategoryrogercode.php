<?php

namespace App\Models\Warehouse;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subcategoryrogercode extends Model
{
    use HasFactory;
    protected $table = 'subcategorias';
    protected $fillable = [ 
        'nombre',
        'estado'
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
