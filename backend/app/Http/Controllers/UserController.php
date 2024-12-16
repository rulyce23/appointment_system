<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash; // Import Hash facade

class UserController extends Controller
{
    public function login(Request $request)
    {
        // Validate the request data
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ]);

        // Check if the user exists by username
        $user = User::where('username', $request->username)->first();

        // If user not found, return error
        if (!$user) {
            return response()->json(['message' => 'Invalid username or username not found'], 401);
        }

        // Verify the provided password with the stored hashed password
        if (!Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Invalid password'], 401);
        }

        // If login is successful, return user_id and a success message
        return response()->json([
            'message' => 'Login successful',
            'user_id' => $user->id,
        ]);
    }

    // Register method (example)
    public function register(Request $request)
    {
        // Validate the request to ensure the required fields are provided
        $request->validate([
            'name' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:users',
            'password' => 'required|string|confirmed|min:8',
            'type' => 'required|in:manager,staff',
            'preferred_timezone' => 'required|string',  // Add the timezone validation
        ]);

        // Create the new user and store in the database
        $user = User::create([
            'name' => $request->name,
            'username' => $request->username,
            'password' => bcrypt($request->password),
            'type' => $request->type,
            'preferred_timezone' => $request->preferred_timezone, // Include preferred_timezone
        ]);

        // Return response with success message
        return response()->json(['message' => 'Registration successful! Please log in.'], 201);

    }

    public function getUsers()
{
    return response()->json(User::all(['id', 'name'])); // Return only necessary fields (id, name)
}
public function getUserById($userId)
{
    $user = User::find($userId);

    if (!$user) {
        return response()->json(['error' => 'User not found'], 404);
    }

    return response()->json([
        'id' => $user->id,
        'name' => $user->name,
    ]);
}

}


