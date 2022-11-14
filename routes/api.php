<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MarcasController;
use App\Http\Controllers\AutosController;
use App\Http\Controllers\PacientesController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get("/marcas",[MarcasController::class, "index"]);
Route::get("/autos",[AutosController::class, "index"]);
Route::get("/pacientes",[PacientesController::class, "index"]);
Route::get("/pacientes/{pacientes}",[PacientesController::class, "show"]);
Route::put("/pacientes/{pacientes}",[PacientesController::class, "update"]);
Route::post("/pacientes",[PacientesController::class, "store"]);
Route::delete("/pacientes/{pacientes}",[PacientesController::class, "destroy"]);