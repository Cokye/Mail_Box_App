<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up(): void
    {
        Schema::create('correos', function (Blueprint $table) {
            $table->id()->primary();
            $table->string('correo_remitente', 50);
            $table->string('correo_receptor', 50);
            $table->string('paralelo', 50);
            $table->string('informacion', 50);
            $table->unsignedBigInteger('id_ramo');
            $table->foreign('id_ramo')->references('id')->on('ramos');
            $table->timestamps(); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('correos');
    }
};
