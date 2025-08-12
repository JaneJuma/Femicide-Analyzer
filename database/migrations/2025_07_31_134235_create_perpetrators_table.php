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
            'perpetrators',
            function (Blueprint $table) {
                $table->id();
                // $table->uuid('case_id');
                // $table->foreignId('case_id')->constrained('cases')->onDelete('cascade');
                $table->string('perpetrator_name')->nullable();
                // $table->string('last_name')->nullable();
                $table->integer('perpetrator_age')->nullable();
                // $table->string('gender', 10)->nullable();
                $table->string('relationship_to_victim', 100)->nullable();
                $table->text('perpetrator_occupation')->nullable();
                $table->text('known_to_victim')->nullable();
                $table->text('perpetrator_status')->nullable();
                $table->timestamps();
            }
        );
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('perpetrators');
    }
};
