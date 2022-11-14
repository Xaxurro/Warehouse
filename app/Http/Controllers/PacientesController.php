<?php

namespace App\Http\Controllers;

use App\Models\Pacientes;
use Illuminate\Http\Request;

class PacientesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Pacientes::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    //php artisan make:request GuardarPacientesRequest
    public function store(Request $request)
    {
        Pacientes::create($request->all());
        return response()->json([
            'res' => true,
            'msg' => 'Paciente guardado correctamente'
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pacientes  $pacientes
     * @return \Illuminate\Http\Response
     */
    public function show(Pacientes $pacientes)
    {
        return response()->json([
            'res' => true,
            'pacientes' => $pacientes
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pacientes  $pacientes
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pacientes $pacientes)
    {
        $pacientes->update($request->all());
        return response()->json([
            'res' => true,
            'msg' => 'Paciente actualizado correctamente'
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pacientes  $pacientes
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pacientes $pacientes)
    {
        $pacientes->delete();
        return response()->json([
            'res' => true,
            'msg' => 'Paciente eliminado correctamente'
        ], 200);
    }
}
