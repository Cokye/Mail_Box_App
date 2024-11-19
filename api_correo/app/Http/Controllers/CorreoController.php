<?php

namespace App\Http\Controllers;

use App\Models\Correo;
use Illuminate\Http\Request;

class CorreoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
         $correo =   Correo::all();
         foreach($correo as $correos){
            $correo->load('ramo');
        }
        return $correo;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $correo = new Correo();
        $correo->correo_remitente = $request->correo_remitente;
        $correo->correo_receptor = $request->correo_receptor;
        $correo->paralelo = $request->paralelo;
        $correo->informacion = $request->informacion;
        $correo->id_ramo= $request->id_ramo;
        $correo->save();
        return $correo;
    }

    /**
     * Display the specified resource.
     */
    public function show(Correo $correo)
    {
        $correo->load('ramo');
        return $correo;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Correo $correo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Correo $correo)
    {
        $correo->correo_remitente = $request->correo_remitente;
        $correo->correo_receptor = $request->correo_receptor;
        $correo->paralelo = $request->paralelo;
        $correo->informacion = $request->informacion;
        $correo->id_ramo= $request->id_ramo;
        $correo->save();
        return $correo;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Correo $correo)
    {
        $correo->delete();
    }
}
