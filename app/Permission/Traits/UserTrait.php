<?php
namespace App\Permission\Traits;
trait UserTrait {
    //es: desde aqui
    //en: from here 
    public function roles(){
        return $this->belongsToMany('App\Permission\Models\Role')->withTimesTamps();
    }

    public function havePermission($permission)
    {
        foreach($this->roles as $role){
            if($role['full-access'] == "yes"){
                return true; //return if user has full access
            }
            foreach ($role->permissions as $perm) {
                if($perm->slug == $permission){
                    return true; //return if user has permission
                }
            }
        }
        return false;//return false if user not has permission
    }
}