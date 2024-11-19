<?php

namespace App\Http\Controllers;

use App\Models\Ramo;
use Illuminate\Http\Request;

class RamoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $ramo = Ramo::all();
        return $ramo;
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
        $ramo = new Ramo();
        $ramo->nombre_ramo = $request->nombre;
        $ramo->codigo_ramo = $request->nombre;
        $ramo->save();
        return $ramo;
    }

    /**
     * Display the specified resource.
     */
    public function show(Ramo $ramo)
    {
        return $ramo;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Ramo $ramo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Ramo $ramo)
    {
        $ramo->nombre_ramo = $request->nombre;
        $ramo->codigo_ramo = $request->nombre;
        $ramo->save();
        return $ramo;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Ramo $ramo)
    {
        $ramo->delete();
    }
}
