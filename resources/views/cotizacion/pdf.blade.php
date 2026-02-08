<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cotización {{$cotizacione->numero_cotizacion}}</title>
    <style>
        body {
            font-family: 'Helvetica', 'Arial', sans-serif;
            font-size: 10px;
            color: #444;
            line-height: 1.4;
            margin: 0;
            padding: 20px;
        }

        .container {
            width: 100%;
        }

        /* Header Layout using Table logic implicitly via floats (DOMPDF reliable) */
        .header {
            width: 100%;
            border-bottom: 2px solid #eee;
            padding-bottom: 20px;
            margin-bottom: 20px;
            overflow: hidden; /* Clearfix */
        }

        .logo-container {
            float: left;
            width: 20%;
        }
        .logo-container img {
            max-height: 70px;
            max-width: 100%;
        }

        .company-details {
            float: left;
            width: 50%;
            padding-left: 20px;
        }
        .company-details h1 {
            color: #2c3e50;
            font-size: 16px;
            margin-bottom: 5px;
            text-transform: uppercase;
        }
        .company-details p {
            font-size: 9px;
            margin: 0;
            color: #555;
        }

        .doc-details {
            float: right;
            width: 25%;
            text-align: right;
        }
        .doc-title {
            font-size: 18px;
            font-weight: bold;
            color: #667eea;
            text-transform: uppercase;
            margin-bottom: 5px;
        }
        .doc-number {
            font-size: 14px;
            color: #444;
            margin-bottom: 5px;
        }
        .doc-meta {
            font-size: 10px;
            color: #777;
        }

        /* Layout Helpers */
        .row::after {
            content: "";
            clear: both;
            display: table;
        }
        .col-left { float: left; width: 60%; }
        .col-right { float: right; width: 35%; text-align: right; }

        /* Client Section */
        .client-section {
            margin-bottom: 30px;
            padding: 15px;
            background-color: #fcfcfc;
            border-radius: 8px;
            border: 1px solid #eee;
        }
        .section-title {
            font-size: 11px;
            font-weight: bold;
            color: #667eea;
            text-transform: uppercase;
            margin: 0 auto 10px auto;
            border-bottom: 1px solid #e0e0e0;
            padding-bottom: 5px;
            display: table;
        }
        .label {
            font-weight: bold;
            color: #666;
            width: 80px;
            display: inline-block;
        }
        .value {
            color: #333;
        }

        /* Table */
        .products-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 20px;
        }
        .products-table th {
            background-color: #667eea;
            color: #ffffff;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 9px;
            padding: 10px;
            text-align: left;
        }
        .products-table th:first-child { border-top-left-radius: 5px; }
        .products-table th:last-child { border-top-right-radius: 5px; }
        .products-table td {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .products-table tr:nth-child(even) { background-color: #fdfdfd; }

        /* Totals */
        .totals-container {
            float: right;
            width: 40%;
            background-color: #f8f9fa;
            border-radius: 5px;
            padding: 15px;
        }
        .total-row {
            display: table;
            width: 100%;
            margin-bottom: 5px;
        }
        .total-label { display: table-cell; font-weight: bold; color: #666; }
        .total-amount { display: table-cell; text-align: right; font-weight: bold; color: #333; }
        .grand-total { margin-top: 10px; padding-top: 10px; border-top: 2px solid #667eea; color: #667eea; font-size: 14px; }

        /* Misc */
        .text-right { text-align: right; }
        .text-center { text-align: center; }
        .font-bold { font-weight: bold; }
        
        .badge {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 9px;
            font-weight: bold;
        }
        .status-pendiente { background: #fff3cd; color: #856404; }
        .status-convertida { background: #d4edda; color: #155724; }
        .status-vencida { background: #f8d7da; color: #721c24; }
        
        .observations {
            margin-top: 30px;
            font-size: 9px;
            color: #666;
            font-style: italic;
        }
        
        .footer-msg {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 2px solid #ddd;
            text-align: center;
            font-size: 9px;
            color: #666;
        }
        
        .watermark {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-45deg);
            font-size: 80px;
            color: rgba(220, 53, 69, 0.1);
            font-weight: bold;
            z-index: -1;
        }
    </style>
</head>
<body>
    <header>
        <div class="row">
            <div class="logo-container">
                @php
                    $logoPath = public_path('storage/logos/logo.jpeg'); 
                    if (isset($configProforma) && $configProforma->logo_path) {
                        $logoPath = public_path('storage/logos_proforma/' . $configProforma->logo_path);
                    }
                @endphp

                @if(file_exists($logoPath))
                    <img src="{{ $logoPath }}" alt="Logo">
                @else
                    <div style="padding: 10px; background: #eee; text-align: center; border-radius: 5px;">LOGO</div>
                @endif
            </div>
            
            <div class="company-details">
                @if(isset($configProforma))
                    <h1>{{ $configProforma->nombre_empresa ?? $cotizacione->sucursal->nombre }}</h1>
                    <p>{{ $configProforma->direccion ?? $cotizacione->sucursal->direccion }}</p>
                    <p>
                        @if($configProforma->telefono) Tel: {{ $configProforma->telefono }} @endif
                        @if($configProforma->email) | {{ $configProforma->email }} @endif
                    </p>

                    @if($configProforma->nit)
                    <p><strong>NIT:</strong> {{ $configProforma->nit }}</p>
                    @endif
                @else
                    <h1>{{$cotizacione->sucursal->nombre}}</h1>
                    <p>{{$cotizacione->sucursal->direccion}}</p>
                    <p>Brayan Yonathán Quezada Salazar</p>

                    <p>
                        @if($cotizacione->sucursal->telefono) Tel: {{$cotizacione->sucursal->telefono}} @endif
                        @if($cotizacione->sucursal->email) | {{$cotizacione->sucursal->email}} @endif
                    </p>
                    @if($cotizacione->sucursal->nit_establecimiento)
                    <p><strong>NIT:</strong> {{$cotizacione->sucursal->nit_establecimiento}}</p>
                    @endif
                @endif
            </div>

            <div class="doc-details">
                <div class="doc-title">
                    {{ isset($configProforma) ? strtoupper($configProforma->titulo_documento) : 'COTIZACIÓN' }}
                </div>
                <div class="doc-number">{{$cotizacione->numero_cotizacion}}</div>
                <div class="doc-meta">
                    Fecha: {{ isset($fechaImpresion) ? \Carbon\Carbon::parse($fechaImpresion)->format('d/m/Y') : $cotizacione->fecha_hora->format('d/m/Y') }}<br>
                    {{-- //! Hora: {{$cotizacione->fecha_hora->format('H:i')}} --}}
                </div>
                
                {{-- //!
                @php
                    $statusClass = 'status-' . strtolower($cotizacione->estado);
                @endphp
                <div style="margin-top: 5px;">
                    <span class="badge {{$statusClass}}">
                        {{$cotizacione->obtenerEstadoTexto()}}
                    </span>v 
                </div>
                --}}
            </div>
        </div>
    </header>

    <footer>
        <div style="float: left; width: 60%;">
            <p>
                Este documento es una cotización y no constituye un comprobante de venta.<br>
                Los precios están sujetos a cambios sin previo aviso.<br>
                Validez de esta cotización: <strong>{{$cotizacione->validez_dias}} días</strong><br>
                Válida hasta: {{$cotizacione->fecha_vencimiento->format('d/m/Y')}}
            </p>
        </div>
        <div style="float: right; width: 30%; text-align: right;">
             Página <span class="page-number"></span>
        </div>
    </footer>

    <div class="container">

        <!-- @if($cotizacione->estado === 'CANCELADA')
        <div class="watermark">CANCELADA</div>
        @elseif($cotizacione->estado === 'VENCIDA')
        <div class="watermark">VENCIDA</div>
        @elseif($cotizacione->estado === 'CONVERTIDA')
        <div class="watermark">CONVERTIDA</div>
        @endif -->

        <div class="client-section">
            <div class="section-title">Información del Cliente</div>
            <div style="clear: both;"></div>
            <div class="row" style="text-align: left;">
                <div class="col-left" style="width: 100%;"> {{-- //! Adjusted width --}}
                     <div class="detail-row">
                        <span class="label">Cliente:</span>
                        <span class="value">{{$cotizacione->cliente->persona->razon_social}}</span>
                    </div>
                    <div class="detail-row">
                        <span class="label">NIT/DPI:</span>
                        <span class="value">{{$cotizacione->cliente->persona->nit ?? 'CF'}}</span>
                    </div>
                    <div class="detail-row">
                        <span class="label">Dirección:</span>
                        <span class="value">{{ Str::limit($cotizacione->cliente->persona->direccion, 50) }}</span>
                    </div>
                </div>
                {{-- //!
                <div class="col-right">
                    <div class="detail-row">
                         <span class="label">Teléfono:</span>
                        <span class="value">{{$cotizacione->cliente->persona->telefono ?? 'N/A'}}</span>
                    </div>
                    <div class="detail-row">
                        <span class="label">Vendedor:</span>
                        <span class="value">{{$cotizacione->user->name}}</span>
                    </div>
                </div>
                --}}
            </div>
        </div>

        @php
            $hasProformaPrice = isset($cotizacione->productos[0]->pivot->precio_proforma);
        @endphp

        <table class="products-table">
            <thead>
                <tr>
                    {{-- //! <th style="width: 10%;">Código</th> --}}
                    <th style="width: 65%;">Descripción</th> {{-- //! Expanded width (was 45%) --}}
                    <th style="width: 10%; text-align: center;">Cant.</th>
                    {{-- //! <th style="width: 10%;">Medida</th> --}}
                    
                    @if($hasProformaPrice)
                        <th style="width: 12%; text-align: right; background-color: #28a745;">Precio Unit.</th>
                    @else
                        <th style="width: 12%; text-align: right;">Precio Unit.</th>
                    @endif

                    <th style="width: 13%; text-align: right;">Total</th>
                </tr>
            </thead>
            <tbody>
                @foreach($cotizacione->productos as $producto)
                <tr>
                    {{-- //! <td class="product-code">{{$producto->codigo}}</td> --}}
                    <td>
                        <strong>{{$producto->nombre}}</strong>
                        <!-- @if($producto->marca || $producto->presentacione) -->
                        <!-- <br> -->
                        <!-- <span style="font-size: 8px; color: #777;"> -->
                            <!-- {{$producto->marca->caracteristica->nombre ?? ''}} -->
                            <!-- {{$producto->presentacione->caracteristica->nombre ?? ''}} -->
                        <!-- </span> -->
                        <!-- @endif -->
                    </td>
                    <td style="text-align: center;">{{$producto->pivot->cantidad}}</td>
                    {{-- //! <td>{{$producto->unidadMedida->abreviatura ?? 'Unid'}}</td> --}}
                    
                    @if($hasProformaPrice)
                         <td class="text-right font-bold" style="color: #28a745;">
                            Q {{number_format($producto->pivot->precio_proforma, 2)}}
                        </td>
                    @else
                        <td class="text-right">Q {{number_format($producto->pivot->precio_unitario, 2)}}</td>
                    @endif

                    <td class="text-right font-bold">
                        @if(isset($producto->pivot->subtotal_proforma))
                            Q {{number_format($producto->pivot->subtotal_proforma, 2)}}
                        @else
                            Q {{number_format($producto->pivot->subtotal, 2)}}
                        @endif
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <div class="row">
            <div style="float: left; width: 55%;">
                 @if($cotizacione->observaciones)
                <div class="observations">
                    <strong>OBSERVACIONES:</strong><br>
                    <p>{{$cotizacione->observaciones}}</p>
                </div>
                @endif
            </div>

            <div class="totals-container">
                {{-- Totales Standard vs Proforma --}}
                @if(isset($cotizacione->subtotal_proforma))
                     <div class="total-row grand-total">
                        <div class="total-label">TOTAL:</div>
                        <div class="total-amount">Q {{number_format($cotizacione->total_proforma, 2)}}</div>
                    </div>
                @else
                     <div class="total-row">
                        <div class="total-label">Subtotal:</div>
                        <div class="total-amount">Q {{number_format($cotizacione->subtotal, 2)}}</div>
                    </div>
                    @if($cotizacione->obtenerDescuentoTotal() > 0)
                    <div class="total-row">
                        <div class="total-label" style="color: #dc3545;">Descuento:</div>
                        <div class="total-amount" style="color: #dc3545;">- Q {{number_format($cotizacione->obtenerDescuentoTotal(), 2)}}</div>
                    </div>
                    @endif
                    <div class="total-row grand-total">
                        <div class="total-label">TOTAL:</div>
                        <div class="total-amount">Q {{number_format($cotizacione->total, 2)}}</div>
                    </div>
                @endif
            </div>
        </div>

        <div class="row" style="margin-top: 10px; border-top: 1px solid #ddd; padding-top: 5px;">
            <div style="width: 100%;">
                @php
                    $totalParaLetras = isset($cotizacione->total_proforma) ? $cotizacione->total_proforma : $cotizacione->total;
                    $letras = \App\Utils\NumeroALetras::convertir($totalParaLetras);
                @endphp
                <strong>TOTAL EN LETRAS:</strong> {{ $letras }}
            </div>
        </div>

    </div>
    
    {{-- Script para número de página con CSS counter si fuera compatible, 
         pero DOMPDF usa script PHP en el footer para eso usualmente. 
         Por simplicidad, lo dejamos estático o usamos CSS básico. --}}
    <script type="text/php">
        if (isset($pdf)) {
            $x = 750;
            $y = 570;
            $text = "Página {PAGE_NUM} de {PAGE_COUNT}";
            $font = null;
            $size = 9;
            $color = array(0.5, 0.5, 0.5);
            $word_space = 0.0;  //  default
            $char_space = 0.0;  //  default
            $angle = 0.0;   //  default
            $pdf->page_text($x, $y, $text, $font, $size, $color, $word_space, $char_space, $angle);
        }
    </script>
</body>
</html>
