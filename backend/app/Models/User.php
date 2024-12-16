<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'username',
        'preferred_timezone',
        'password',
        'type'
    ];

    public function appointments()
    {
        return $this->belongsToMany(Appointment::class, 'user_appointments');
    }
}

