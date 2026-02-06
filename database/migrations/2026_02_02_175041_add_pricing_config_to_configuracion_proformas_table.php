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
        Schema::table('configuracion_proformas', function (Blueprint $table) {
            $table->enum('metodo_precio', ['ninguno', 'manual', 'porcentaje'])->default('ninguno')->after('titulo_documento');
            $table->decimal('valor_porcentaje', 5, 2)->nullable()->after('metodo_precio');
            $table->enum('tipo_porcentaje', ['aumento', 'descuento'])->default('aumento')->after('valor_porcentaje');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('configuracion_proformas', function (Blueprint $table) {
            $table->dropColumn(['metodo_precio', 'valor_porcentaje', 'tipo_porcentaje']);
        });
    }
};
