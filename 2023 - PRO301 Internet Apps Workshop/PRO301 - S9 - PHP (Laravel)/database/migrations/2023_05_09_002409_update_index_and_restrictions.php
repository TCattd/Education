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
        Schema::table('articles', function (Blueprint $table) {
            // category_id references categories.id
            $table->foreign('category_id')->references('id')->on('categories')->nullable(false)->change();
            // author_id references users.id
            $table->foreign('author_id')->references('id')->on('users')->nullable(false)->change();
            // title can't be null
            $table->string('title')->nullable(false)->change();
            // content can't be null
            $table->text('content')->nullable(false)->change();
            // image can't be null
            $table->string('image')->nullable(false)->change();
            // title must be unique
            $table->unique('title')->change();
            // slug must be unique
            $table->unique('slug')->change();
        });

        Schema::table('classifieds', function (Blueprint $table) {
            // category_id refereces classifieds_categories.id
            $table->foreign('category_id')->references('id')->on('classifieds_categories')->nullable(false)->change();
            // author_id references users.id
            $table->foreign('author_id')->references('id')->on('users')->nullable(false)->change();
            // title can't be null
            $table->string('title')->nullable(false)->change();
            // details can't be null
            $table->text('details')->nullable(false)->change();
            // phone can't be null
            $table->string('phone')->nullable(false)->change();
            // slug must be unique
            $table->unique('slug')->change();
            // image can't be null
            $table->string('image')->nullable(false)->change();
            // price can't be null
            $table->string('price')->nullable(false)->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('articles', function (Blueprint $table) {
            // Reverse changes
            $table->dropForeign(['category_id'])->nullable()->change();
            $table->dropForeign(['author_id'])->nullable()->change();
            $table->string('title')->nullable()->change();
            $table->text('content')->nullable()->change();
            $table->string('image')->nullable()->change();
            $table->dropUnique(['title'])->change();
            $table->dropUnique(['slug'])->change();
        });

        Schema::table('classifieds', function (Blueprint $table) {
            // Reverse changes
            $table->dropForeign(['category_id'])->nullable()->change();
            $table->dropForeign(['author_id'])->nullable()->change();
            $table->string('title')->nullable()->change();
            $table->text('details')->nullable()->change();
            $table->string('phone')->nullable()->change();
            $table->dropUnique(['slug'])->change();
            $table->string('image')->nullable()->change();
            $table->string('price')->nullable()->change();
        });
    }
};
