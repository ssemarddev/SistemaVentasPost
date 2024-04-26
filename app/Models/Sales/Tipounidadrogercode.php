<?php

namespace App\Models\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tipounidadrogercode extends Model
{
    use HasFactory;
    protected $table = 'tipo_unidad';
    protected $fillable = [
        'nombre',
        'status',
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
