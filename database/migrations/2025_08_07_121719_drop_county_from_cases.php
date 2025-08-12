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
        Schema::table('cases', function (Blueprint $table) {
            // drop multiple columns:
            $table->dropColumn(['county', 'location_type']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('cases', function (Blueprint $table) {
            // $table->string('column_name')->nullable(); // Example: adjust data type and nullability as needed
            $table->dropColumn(['county', 'location_type'])->nullable();
        });
    }
};
