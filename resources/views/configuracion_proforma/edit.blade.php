@extends('layouts.app')

@section('template_title')
    Configuración de Proforma
@endsection

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <span id="card_title">
                            {{ __('Configuración de Proforma') }} ({{ $sucursal->nombre }})
                        </span>
                    </div>
                </div>
                <div class="card-body">
                    <form method="POST" action="{{ route('configuracion-proforma.update') }}" role="form" enctype="multipart/form-data">
                        @csrf
                        @method('POST')

                        <div class="box box-info padding-1">
                            <div class="box-body">
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nombre_empresa">Nombre Empresa (Para Proforma)</label>
                                            <input type="text" class="form-control" name="nombre_empresa" id="nombre_empresa" value="{{ $configuracion->nombre_empresa }}" placeholder="Nombre Alternativo">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nit">NIT (Para Proforma)</label>
                                            <input type="text" class="form-control" name="nit" id="nit" value="{{ $configuracion->nit }}" placeholder="NIT Alternativo">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="titulo_documento">Título del Documento</label>
                                            <input type="text" class="form-control" name="titulo_documento" id="titulo_documento" value="{{ $configuracion->titulo_documento ?? 'PROFORMA' }}" placeholder="PROFORMA">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="logo">Logo (Para Proforma)</label>
                                            <input type="file" class="form-control" name="logo" id="logo">
                                            @if($configuracion->logo_path)
                                                <div class="mt-2">
                                                    <small>Logo actual:</small><br>
                                                    <img src="{{ Storage::disk('public')->url('logos_proforma/' . $configuracion->logo_path) }}" alt="Logo" style="max-height: 100px;">
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <hr>
                                        <h5>Configuración de Precio</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Método de Precio</label>
                                            <select class="form-control" name="metodo_precio" id="metodo_precio" onchange="togglePorcentaje()">
                                                <option value="ninguno" {{ old('metodo_precio', $configuracion->metodo_precio) == 'ninguno' ? 'selected' : '' }}>Ninguno (Precio Original)</option>
                                                <option value="manual" {{ old('metodo_precio', $configuracion->metodo_precio) == 'manual' ? 'selected' : '' }}>Manual (Definir al Imprimir)</option>
                                                <option value="porcentaje" {{ old('metodo_precio', $configuracion->metodo_precio) == 'porcentaje' ? 'selected' : '' }}>Porcentaje (Automático)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4" id="div_tipo_porcentaje" style="display: none;">
                                        <div class="form-group">
                                            <label>Tipo de Ajuste</label>
                                            <select class="form-control" name="tipo_porcentaje">
                                                <option value="aumento" {{ old('tipo_porcentaje', $configuracion->tipo_porcentaje) == 'aumento' ? 'selected' : '' }}>Aumento (+)</option>
                                                <option value="descuento" {{ old('tipo_porcentaje', $configuracion->tipo_porcentaje) == 'descuento' ? 'selected' : '' }}>Descuento (-)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4" id="div_valor_porcentaje" style="display: none;">
                                        <div class="form-group">
                                            <label>Porcentaje (%)</label>
                                            <input type="number" step="0.01" class="form-control" name="valor_porcentaje" value="{{ old('valor_porcentaje', $configuracion->valor_porcentaje) }}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="direccion">Dirección</label>
                                            <input type="text" class="form-control" name="direccion" id="direccion" value="{{ $configuracion->direccion }}" placeholder="Dirección Alternativa">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="telefono">Teléfono</label>
                                            <input type="text" class="form-control" name="telefono" id="telefono" value="{{ $configuracion->telefono }}" placeholder="Teléfono">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="text" class="form-control" name="email" id="email" value="{{ $configuracion->email }}" placeholder="Email">
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="box-footer mt-4">
                                <button type="submit" class="btn btn-primary">Guardar Configuración</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script>
    function togglePorcentaje() {
        var metodo = document.getElementById('metodo_precio').value;
        var divTipo = document.getElementById('div_tipo_porcentaje');
        var divValor = document.getElementById('div_valor_porcentaje');

        if (metodo === 'porcentaje') {
            divTipo.style.display = 'block';
            divValor.style.display = 'block';
        } else {
            divTipo.style.display = 'none';
            divValor.style.display = 'none';
        }
    }
    // Ejecutar al cargar
    document.addEventListener('DOMContentLoaded', function() {
        togglePorcentaje();
    });
</script>
@endpush
