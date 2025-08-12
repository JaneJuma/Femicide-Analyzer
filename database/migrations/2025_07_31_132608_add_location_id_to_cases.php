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
        if (!Schema::hasColumn('cases', 'location_id')) {
            Schema::table('cases', function (Blueprint $table) {
                $table->unsignedBigInteger('location_id')->after('perpetrator_id');
                $table->foreign('location_id')->references('id')->on('locations')->onDelete('cascade');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('cases', function (Blueprint $table) {
            $table->dropColumn('location_id');
        });
    }
};
