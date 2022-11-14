<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class GuardarPacientesRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'nombres' => 'required',
            'apellidos' => 'required',
            'edad' => 'required',
            'sexo' => 'required',
            'rut' => 'required|unique:pacientes,rut',
            'sangre' => 'required',
            'correo' => 'required',
            'direccion' => 'required'
        ];
    }
}
