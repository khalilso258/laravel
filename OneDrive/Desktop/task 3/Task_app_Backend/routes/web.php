<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\NoteController;

Route::middleware('api')->prefix('api')->group(function () {
    Route::get('/all_notes', [NoteController::class, 'index']);
    Route::post('/store_notes', [NoteController::class, 'store']);
});
