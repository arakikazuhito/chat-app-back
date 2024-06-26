<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ChatController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
/*
Route::get('/', function () {
    return view('welcome');
});
*/
Route::get('/', [ChatController::class, 'index']);
Route::get('/chat', [ChatController::class, 'show']);
Route::post('/chat', [ChatController::class, 'submit']);
Route::get('/get-csrf-token', function () {
    return response()->json(['csrf_token' => csrf_token()]);
});