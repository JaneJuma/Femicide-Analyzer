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
        Schema::create(
            'victims',
            function (Blueprint $table) {
                $table->id();
                $table->string('victim_name')->nullable();
                $table->integer('victim_age')->nullable();
                // $table->string('gender', 10)->default('Female');
                $table->string('victim_occupation')->nullable();
                $table->string('victim_marital_status', 100)->nullable();
                $table->string('victim_education_level', 100)->nullable();
                $table->timestamps();
            }
        );
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('victims');
    }
};
