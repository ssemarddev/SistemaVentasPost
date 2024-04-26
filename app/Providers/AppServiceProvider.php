<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\User;
use Illuminate\Support\Facades\Gate;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $accessMenu = false;
        //$this->registerPolicies();
        Gate::define('hasAccess', function (User $user, $permission) {
            return $user->havePermission($permission);
        });

        Gate::define('view-menu', function ($user) {
            // Implement the logic to check if the user is allowed to view the menu
            // For example:
            // return $user->hasPermissionTo('view-menu');
        });
    }
}
