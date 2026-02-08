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
        try {
            Schema::table('personas', function (Blueprint $table) {
                $table->string('nombre_comercial', 255)->nullable()->change();
            });
        } catch (\Exception $e) {
            // Fallback for when Doctrine fails or column doesn't exist to be changed via Schema
            if (Schema::hasColumn('personas', 'nombre_comercial')) {
                 DB::statement('ALTER TABLE personas MODIFY nombre_comercial VARCHAR(255) NULL');
            } else {
                 Schema::table('personas', function (Blueprint $table) {
                    $table->string('nombre_comercial', 255)->nullable();
                });
            }
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('personas', function (Blueprint $table) {
            $table->string('nombre_comercial', 100)->change();
        });
    }
};
