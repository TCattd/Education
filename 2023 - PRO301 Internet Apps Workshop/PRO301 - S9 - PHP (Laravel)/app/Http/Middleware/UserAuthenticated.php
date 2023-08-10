<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class UserAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if( Auth::check() )
        {
            /** @var User $user */
            $user = Auth::user();

            // allow user to proceed with request
            if ( $user->hasRole('user') ) {
                return $next($request);
            }
        }

        abort(403);  // permission denied error
        //return $next($request);
    }
}