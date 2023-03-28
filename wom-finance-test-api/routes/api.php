<?php

use App\Http\Controllers\Api\JWTAuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\TransactionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

 
Route::post('register', [JWTAuthController::class, 'register']);
Route::post('login', [JWTAuthController::class, 'login']);
Route::get('products', [ProductController::class, 'index']);
  
Route::group(['middleware' => 'auth.jwt'], function () {
    Route::post('logout', [JWTAuthController::class, 'logout']);
    Route::get('user', [JWTAuthController::class, 'getUser']);
    Route::get('transactions', [TransactionController::class, 'index']);
    Route::post('transaction/create', [TransactionController::class, 'create']);
});

