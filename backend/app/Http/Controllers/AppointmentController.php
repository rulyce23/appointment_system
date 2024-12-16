<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Appointment;
use App\Models\UserAppointment;
use App\Models\User;
use Carbon\Carbon;

class AppointmentController extends Controller
{
    public function index($userId)
    {
        // Fetch appointments for the given user
        $appointments = Appointment::whereHas('users', function ($query) use ($userId) {
            $query->where('user_id', $userId);
        })->get();

        // Now we will map the appointments and fetch the invited users
        $appointmentsWithUsers = $appointments->map(function ($appointment) {
            // Decode the invited_user_id (assuming it's stored as a JSON array in the 'invited_user_id' column)
            $invitedUserIds = json_decode($appointment->invited_user_id);

            // Fetch user details based on invited user ids
            if ($invitedUserIds) {
                $invitedUsers = User::whereIn('id', $invitedUserIds)->get();
                // Add the invited users to the appointment object
                $appointment->invited_users = $invitedUsers;
            } else {
                $appointment->invited_users = [];
            }

            return $appointment;
        });

        return response()->json($appointmentsWithUsers);
    }


    public function store(Request $request)
    {

        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'start' => 'required|date_format:Y-m-d\TH:i',
            'end' => 'required|date_format:Y-m-d\TH:i|after:start',
            'creator_id' => 'required|exists:users,id',
            'invited_user_id' => 'array',
            'invited_user_id.*' => 'exists:users,id',
        ]);

        $user = User::find($request->creator_id);

        if (!$user) {
            return response()->json(['error' => 'Creator user not found.'], 404);
        }
        $userTimezone = $user->timezone; // e.g., 'America/New_York'

        // Convert the start and end times to the user's timezone
        $start = Carbon::createFromFormat('Y-m-d\TH:i', $request->start, $userTimezone);
        $end = Carbon::createFromFormat('Y-m-d\TH:i', $request->end, $userTimezone);

        // Validate that the times are within working hours (8 AM - 5 PM)
        if ($start->hour < 8 || $start->hour >= 17 || $end->hour < 8 || $end->hour >= 17) {
            return response()->json(['error' => 'The appointment must be within working hours (8 AM - 5 PM).'], 400);
        }

        // Convert the times to UTC before saving them to the database
        $startUTC = $start->setTimezone('UTC');
        $endUTC = $end->setTimezone('UTC');

        $appointment = Appointment::create([
            'title' => $request->title,
            'start' => $startUTC,
            'end' => $endUTC,
            'creator_id' => $request->creator_id,
            'invited_user_id' => json_encode($request->invited_users),
            'updated_at' => now(),
            'created_at' => now(),
        ]);

        $userAppointment = UserAppointment::create([
            'user_id' => $request->creator_id,
            'appointment_id' => $appointment->id,
        ]);

        return response()->json($appointment, 201);
    }

}
