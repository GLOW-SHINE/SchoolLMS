<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class SessionTimeout

{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $timeout = 60; // (60 X 1 মিনিট)
        if(!Session::has('lastActivityTime'))
        {
            Session::put('lastActivityTime', now());
        }
      //  elseif (now()->diffInSeconds(Session::get('lastActivityTime')) > $timeout)
        elseif (now()->diffInSeconds(\Carbon\Carbon::parse(Session::get('lastActivityTime'))) > $timeout)

        {
            Auth::logout();
            Session::flush();
            return redirect()->route('admin.login')->with('error', 'Session expired. Please login again.');
        }

        Session::put('lastActivityTime', now());

        return $next($request);
    }
}
