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
        Schema::create('cases', function (Blueprint $table) {
            $table->id(); // default BIGINT UNSIGNED PK
            $table->foreignId('victim_id')->constrained()->onDelete('cascade');
            $table->foreignId('perpetrator_id')->nullable()->constrained('perpetrators')->onDelete('set null');
            $table->foreignId('location_id')->constrained()->onDelete('cascade');
            $table->date('date');
            $table->string('method');
            $table->text('description')->nullable();
            $table->string('ob_number')->nullable();
            // $table->string('county')->nullable();
            // $table->string('location_type')->nullable();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            // $table->boolean('verified')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cases');
    }
};
