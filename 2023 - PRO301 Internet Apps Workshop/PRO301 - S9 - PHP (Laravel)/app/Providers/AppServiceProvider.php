<?php

namespace App\Providers;

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Because: https://laracasts.com/discuss/channels/general-discussion/syntax-error-or-access-violation-1071-specified-key-was-too-long?page=1&replyId=311208
        Schema::defaultStringLength(191);
    }
}
