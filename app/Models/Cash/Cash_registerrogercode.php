<?php

namespace App\Models\Cash;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cash_registerrogercode extends Model
{
    use HasFactory;
    protected $table = 'aperturacajas';
    protected $fillable = [ 
        "user_id",
        "cantidad_inicial",
        "cantidad_final",
        "status_apertura",
        "status",
        "fecha_hora_cierre",
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
