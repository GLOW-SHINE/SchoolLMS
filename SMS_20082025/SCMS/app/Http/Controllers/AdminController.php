<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AdminController extends Controller
{
    public function index()
    {
        return view('admin.login');
    }

    public function authenticate(Request $request)
    {
        $request->validate([
            'email'    => 'required|email',
            'password' => 'required'
        ]);

        if (Auth::guard('admin')->attempt([
            'email'    => $request->email,
            'password' => $request->password
        ])) 
        {
            if(Auth::guard('admin')->user()->role != 'admin')
            {
                Auth::guard('admin')->logout();
                return redirect()->route('admin.login')->with('error', 'Unautherised User . Access Denied.!');
            }
            return redirect()->route('admin.dashboard');
            
        } else {
            return redirect()->route('admin.login')->with('error', 'Login failed. Please check your credentials.');
        }
    }

    public function dashboard()
    {
        return view('admin.dashboard');
    }

    public function register()
    {
        // $user = new User();
        // $user->name = 'Admin';
        // $user->role = 'admin';
        // $user->email = 'admin@gmail.com';
        // $user->password = Hash::make('admin');
        // $user->save();

        $user = new User();
        $user->name  = 'Uma';
        $user->role = 'student';
        $user->email = 'uma@gmail.com';
        $user->password = Hash::make('umakayal'); // password hash
       
        $user->save();


        return redirect()->route('admin.login')->with('success', 'Your data has been saved successfully.');
    }


    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login')->with('success', 'Logged Out Successful.');
    }







}

