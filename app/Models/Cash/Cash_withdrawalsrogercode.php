<?php

namespace App\Models\Cash;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cash_withdrawalsrogercode extends Model
{
    use HasFactory;
    protected $table = 'cash_withdrawals';
    protected $fillable = [ 
        "user_id",
        "aperturacaja_id",
        "cantidad",
        "concepto",
        "fecha",
        "hora",
        "status",
    ];
    public $timestamps = true;
    protected $guarded = ['id'];
    protected $hidden = ['created_at', 'updated_at'];
}
