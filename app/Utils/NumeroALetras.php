<?php

namespace App\Utils;

class NumeroALetras
{
    private static $UNIDADES = [
        '',
        'UN ',
        'DOS ',
        'TRES ',
        'CUATRO ',
        'CINCO ',
        'SEIS ',
        'SIETE ',
        'OCHO ',
        'NUEVE ',
        'DIEZ ',
        'ONCE ',
        'DOCE ',
        'TRECE ',
        'CATORCE ',
        'QUINCE ',
        'DIECISEIS ',
        'DIECISIETE ',
        'DIECIOCHO ',
        'DIECINUEVE ',
        'VEINTE '
    ];

    private static $DECENAS = [
        'VENTI',
        'TREINTA ',
        'CUARENTA ',
        'CINCUENTA ',
        'SESENTA ',
        'SETENTA ',
        'OCHENTA ',
        'NOVENTA ',
        'CIEN '
    ];

    private static $CENTENAS = [
        'CIENTO ',
        'DOSCIENTOS ',
        'TRESCIENTOS ',
        'CUATROCIENTOS ',
        'QUINIENTOS ',
        'SEISCIENTOS ',
        'SETECIENTOS ',
        'OCHOCIENTOS ',
        'NOVECIENTOS '
    ];

    public static function convertir($number, $moneda = 'QUETZALES', $centimos = 'CENTAVOS')
    {
        $converted = '';
        $decimales = '';

        if (($number < 0) || ($number > 999999999)) {
            return 'No es posible convertir el numero a letras en este rango';
        }

        $div_decimales = explode('.', $number);

        if (count($div_decimales) > 1) {
            $number = $div_decimales[0];
            $decNumberStr = (string) $div_decimales[1];
            if (strlen($decNumberStr) == 2) {
                $decNumberStrFill = str_pad($decNumberStr, 2, '0', STR_PAD_LEFT);
                $decSeconds = $decNumberStrFill;
            } else {
                $decSeconds = substr($decNumberStr, 0, 2);
            }
            $decimales = sprintf('%02d', $decSeconds);
        } else {
            $decimales = '00';
        }

        $number = (int) $number;

        if ($number == 0) {
            return 'CERO ' . $moneda . ' ' . $decimales . '/100 ' . $centimos;
        }

        $millones = floor($number / 1000000);
        $number -= $millones * 1000000;

        $miles = floor($number / 1000);
        $number -= $miles * 1000;

        $cientos = $number;

        if ($millones > 0) {
            if ($millones == 1) {
                $converted .= 'UN MILLON ';
            } else {
                $converted .= self::convertGroup($millones) . ' MILLONES ';
            }
        }

        if ($miles > 0) {
            if ($miles == 1) {
                $converted .= 'MIL ';
            } else {
                $converted .= self::convertGroup($miles) . ' MIL ';
            }
        }

        if ($cientos > 0) {
            if ($cientos == 100) {
                $converted .= 'CIEN ';
            } else {
                $converted .= self::convertGroup($cientos);
            }
        }

        return trim($converted) . ' ' . $moneda . ' ' . $decimales . '/100';
    }

    private static function convertGroup($n)
    {
        $output = '';

        if ($n == 100) {
            return 'CIEN ';
        }

        if ($n > 100) {
            $output .= self::$CENTENAS[floor($n / 100) - 1];
            $n = $n % 100;
        }

        if ($n == 0) {
            return $output;
        }
        
        if ($n <= 20) {
            $output .= self::$UNIDADES[$n];
        } elseif ($n > 20 && $n < 30) {
            $output .= self::$DECENAS[0] . self::$UNIDADES[$n - 20];
        } else {
            $output .= self::$DECENAS[floor($n / 10) - 2];
            if (($n % 10) > 0) {
                $output .= 'Y ' . self::$UNIDADES[$n % 10];
            }
        }

        return $output;
    }
}
