<?php

namespace App\Http\Controllers;

use App\Http\Requests\StorePersonaRequest;
use App\Http\Requests\UpdateClienteRequest;
use App\Models\Cliente;
use App\Models\Documento;
use App\Models\Persona;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class clienteController extends Controller
{
    function __construct()
    {
        $this->middleware('permission:ver-cliente|crear-cliente|editar-cliente|eliminar-cliente', ['only' => ['index']]);
        $this->middleware('permission:crear-cliente', ['only' => ['create', 'store']]);
        $this->middleware('permission:editar-cliente', ['only' => ['edit', 'update']]);
        $this->middleware('permission:eliminar-cliente', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $clientes = Cliente::with('persona.documento')->get();
        return view('cliente.index', compact('clientes'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $documentos = Documento::all();
        return view('cliente.create', compact('documentos'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StorePersonaRequest $request)
    {
        try {
            DB::beginTransaction();

            \Log::info('Inicio store cliente', ['request' => $request->all()]);

            $persona = Persona::create($request->validated());
            $persona->cliente()->create([
                'persona_id' => $persona->id
            ]);
            
            \Log::info('Cliente creado exitosamente', ['cliente_id' => $persona->cliente->id]);
            
            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            \Log::error('Error en store CLIENTE: ' . $e->getMessage());
            \Log::error($e);
            return redirect()->back()->with('error', 'Error al crear cliente: ' . $e->getMessage())->withInput();
        }

        return redirect()->route('clientes.index')->with('success', 'Cliente registrado');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Cliente $cliente)
    {
        $cliente->load('persona.documento');
        $documentos = Documento::all();
        return view('cliente.edit', compact('cliente', 'documentos'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateClienteRequest $request, Cliente $cliente)
    {
        try {
            DB::beginTransaction();

             \Log::info('Inicio update cliente', ['cliente_id' => $cliente->id, 'request' => $request->all()]);


            Persona::where('id', $cliente->persona->id)
                ->update($request->validated());
            
            \Log::info('Cliente actualizado exitosamente');

            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
             \Log::error('Error en update CLIENTE: ' . $e->getMessage());
             \Log::error($e);
             return redirect()->back()->with('error', 'Error al actualizar cliente: ' . $e->getMessage())->withInput();
        }

        return redirect()->route('clientes.index')->with('success', 'Cliente editado');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $message = '';
        $persona = Persona::find($id);
        if ($persona->estado == 1) {
            Persona::where('id', $persona->id)
                ->update([
                    'estado' => 0
                ]);
            $message = 'Cliente eliminado';
        } else {
            Persona::where('id', $persona->id)
                ->update([
                    'estado' => 1
                ]);
            $message = 'Cliente restaurado';
        }

        return redirect()->route('clientes.index')->with('success', $message);
    }
}
