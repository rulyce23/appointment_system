<?php

// routes/api.php
use App\Http\Controllers\UserController;
use App\Http\Controllers\AppointmentController;
use Illuminate\Support\Facades\Route;

Route::post('login', [UserController::class, 'login']);
Route::post('register', [UserController::class, 'register']);
Route::post('/appointments', [AppointmentController::class, 'store']);
Route::get('/appointments/{userId}', [AppointmentController::class, 'index']);

// In routes/api.php
Route::get('/user/{userId}', [UserController::class, 'getUserById']);
Route::get('/user', [UserController::class, 'getUsers']);
Route::get('/user', [UserController::class, 'getUsers']); // Returns all users
Route::get('/user/{userId}', [UserController::class, 'getUserById']); // Returns a specific user by ID
