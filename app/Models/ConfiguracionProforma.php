<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class ConfiguracionProforma extends Model
{
    use HasFactory;

    protected $table = 'configuracion_proformas';

    protected $fillable = [
        'sucursal_id',
        'nombre_empresa',
        'nit',
        'direccion',
        'telefono',
        'email',
        'logo_path',
        'titulo_documento',
        'metodo_precio',
        'valor_porcentaje',
        'tipo_porcentaje'
    ];

    public function sucursal()
    {
        return $this->belongsTo(Sucursal::class);
    }

    public function getLogoUrlAttribute()
    {
        if ($this->logo_path) {
            return Storage::disk('public')->url('logos_proforma/' . $this->logo_path);
        }
        return null; // O un default si se requiere
    }

    public function handleUploadLogo($image)
    {
        $file = $image;
        $name = time() . '_proforma_' . $file->getClientOriginalName();

        // Usar la configuración de disco 'public' (que ya soporta dinámica)
        Storage::disk('public')->putFileAs('logos_proforma', $file, $name);

        return $name;
    }
}
