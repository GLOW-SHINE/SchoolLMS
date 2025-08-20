<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;

Route::get('admin/login', [AdminController::class, 'index'])->name('admin.login');
Route::post('admin/login', [AdminController::class, 'authenticate'])->name('admin.authenticate');
Route::get('admin/logout', [AdminController::class, 'logout'])->name('admin.logout');

Route::group(['middleware' => ['admin.check', 'session.timeout']], function () {
    Route::get('/admin/dashboard', [AdminController::class, 'dashboard'])->name('admin.dashboard');        
    Route::get('admin/register', [AdminController::class, 'register'])->name('admin.register');
    Route::get('admin/table', [AdminController::class, 'table'])->name('admin.table');
    Route::get('admin/general', [AdminController::class, 'general'])->name('admin.general');
});
