<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{RamoController, CorreoController};

Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});


Route::apiResource('/ramos', RamoController::class);
Route::apiResource('/correo', CorreoController::class);

