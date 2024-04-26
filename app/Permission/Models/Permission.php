<?php

namespace App\Permission\Models;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $fillable = [
       'section', 'name', 'slug', 'description', 'status',
    ];

    public function roles(){
        return $this->belongsToMany('App\Permission\Models\Role')->withTimesTamps();
    }
}
