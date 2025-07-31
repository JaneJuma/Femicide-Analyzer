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
                $table->string('full_name')->nullable();
                $table->integer('age')->nullable();
                // $table->string('gender', 10)->default('Female');
                $table->string('occupation')->nullable();
                $table->string('marital_status', 50)->nullable();
                // $table->string('nationality', 100)->nullable();
                $table->string('education_level', 100)->nullable();
                // $table->string('socio_economic_status', 100)->nullable();
                // $table->date('date_of_birth')->nullable();
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
