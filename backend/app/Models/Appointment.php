<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Appointment extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'creator_id',
        'invited_user_id',
        'start',
        'end',
    ];

    public function creator()
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function Inviter()
    {
        return $this->belongsTo(User::class, 'invited_user_id');
    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'user_appointments');
    }
}
