<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    use HasFactory;

    public $fillable = ['title', 'content', 'excerpt', 'author', 'date', 'category', 'source', 'featuredImage', 'visible'];

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
