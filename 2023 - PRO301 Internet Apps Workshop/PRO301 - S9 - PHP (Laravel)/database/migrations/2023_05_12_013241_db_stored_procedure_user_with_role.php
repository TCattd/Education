<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Create a stored procedure to get single user with their role
        DB::unprepared('
            DROP PROCEDURE IF EXISTS get_user_with_role;
            CREATE PROCEDURE get_user_with_role()
            BEGIN
                SELECT
                    users.id,
                    users.name,
                    users.email,
                    users.role,
                    roles.name AS role_name
                FROM users
                INNER JOIN roles ON users.role = roles.id;
            END
        ');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Drop stored procedure
        DB::unprepared('DROP PROCEDURE IF EXISTS get_user_with_role;');
    }
};
