<?php

namespace App\Http\Controllers\Metodosgenerales;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class metodosrogercodeController extends Controller
{
    public function format_cantidad($cantidad)
    {
        //return number_format($cantidad, 0, ',', '');
        return number_format($cantidad, 0, ',', '.');
    }
}
