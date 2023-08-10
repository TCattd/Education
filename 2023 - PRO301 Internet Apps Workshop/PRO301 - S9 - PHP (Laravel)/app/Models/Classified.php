<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Classified extends Model
{
    use HasFactory;

    public $fillable = ['title', 'content', 'date', 'category', 'image', 'visible', 'name', 'email', 'phone', 'price'];

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
