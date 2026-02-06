<?php

namespace App\Http\Controllers;

use App\Models\ConfiguracionProforma;
use App\Models\Sucursal;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;

class ConfiguracionProformaController extends Controller
{
    function __construct()
    {
        // Asumiendo que reutilizamos permisos de sucursal o cotización, 
        // o creamos uno nuevo. Por ahora protegemos por auth.
        $this->middleware('auth');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit()
    {
        $sucursalId = Session::get('sucursal_id');

        if (!$sucursalId) {
            return redirect()->back()->with('error', 'Seleccione una sucursal primero.');
        }

        $configuracion = ConfiguracionProforma::firstOrNew(['sucursal_id' => $sucursalId]);
        $sucursal = Sucursal::find($sucursalId);

        return view('configuracion_proforma.edit', compact('configuracion', 'sucursal'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $request->validate([
            'nombre_empresa' => 'nullable|string|max:255',
            'nit' => 'nullable|string|max:20',
            'direccion' => 'nullable|string|max:255',
            'titulo_documento' => 'nullable|string|max:50',
            'metodo_precio' => 'required|in:ninguno,manual,porcentaje',
            'valor_porcentaje' => 'required_if:metodo_precio,porcentaje|nullable|numeric|min:0.01|max:100',
            'tipo_porcentaje' => 'required_if:metodo_precio,porcentaje|nullable|in:aumento,descuento',
            'logo' => 'nullable|image|mimes:jpeg,png,jpg|max:2048'
        ]);

        try {
            DB::beginTransaction();

            $sucursalId = Session::get('sucursal_id');
            Log::info("Saving Proforma Config for Sucursal: {$sucursalId}", $request->all());

            $configuracion = ConfiguracionProforma::firstOrNew(['sucursal_id' => $sucursalId]);
            
            $logoName = $configuracion->logo_path;

            if ($request->hasFile('logo')) {
                // Eliminar anterior si existe
                if ($logoName && Storage::disk('public')->exists('logos_proforma/' . $logoName)) {
                     Storage::disk('public')->delete('logos_proforma/' . $logoName);
                }
                
                $logoName = $configuracion->handleUploadLogo($request->file('logo'));
            }

            $configuracion->fill([
                'sucursal_id' => $sucursalId,
                'nombre_empresa' => $request->nombre_empresa,
                'nit' => $request->nit,
                'direccion' => $request->direccion,
                'telefono' => $request->telefono,
                'email' => $request->email,
                'titulo_documento' => $request->titulo_documento ?? 'PROFORMA',
                'metodo_precio' => $request->metodo_precio,
                'valor_porcentaje' => $request->valor_porcentaje,
                'tipo_porcentaje' => $request->tipo_porcentaje,
                'logo_path' => $logoName
            ]);

            $configuracion->save();

            DB::commit();

            return redirect()->route('configuracion-proforma.edit')
                ->with('success', 'Configuración de proforma actualizada exitosamente');

        } catch (Exception $e) {
            DB::rollBack();
            return redirect()->back()
                ->with('error', 'Error al guardar la configuración: ' . $e->getMessage())
                ->withInput();
        }
    }
}
