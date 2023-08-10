<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Mail;

class Contact extends Model
{
    use HasFactory;

    public $fillable = ['name', 'subject', 'email', 'message'];

    /**
     * Boot the model.
     *
     * @return response()
     */
    public static function boot() {

        parent::boot();

        static::created(function ($item) {
            // Extra model logic here
        });

    }
}
