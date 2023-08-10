<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->id();
            $table->dateTime('date_created', $precision = 0);
            $table->unsignedBigInteger('category_id');
            $table->string('title');
            $table->string('slug');
            $table->string('image');
            $table->text('content');
            $table->unsignedBigInteger('author_id');
            $table->string('source_name');
            $table->string('source_url');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('articles');
    }
};
