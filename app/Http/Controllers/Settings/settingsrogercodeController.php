<?php

namespace App\Http\Controllers\Settings;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use NumberFormatter;

class settingsrogercodeController extends Controller
{
    public function company()
    {
        $dataCompany = [
            "nombre" => "Importadora y Distribuidora Bendito Emporio uno spa",
            "direccion" => "COLON 989 - CURICO",
            "telefono" => "",
            "email" => "lmillao@hotmail.com",
        ];

        return $dataCompany;
    }

    public function getAccessRolUser($id)
    {
        $tipo_user = DB::table('users')
        ->join('role_user', 'users.id', '=', 'role_user.user_id')
        ->join('roles', 'role_user.role_id', '=', 'roles.id')
        ->select('users.*', 'roles.name AS role_name', 'roles.full-access as access')
        ->where([
            ['users.id', '=', $id],
            ['users.status', '=', true]
        ])
        ->get();

        return $tipo_user[0]->access;

    }

    public function formattedNumber($value)
    {
        $locale = 'es_CL';
        $style = NumberFormatter::DECIMAL;
        $precision = 0;
        $groupingUsed = true;
        //$currencyCode = 'USD';
        $formatter = new NumberFormatter($locale, $style);
        $formatter->setAttribute(NumberFormatter::FRACTION_DIGITS, $precision);
        $formatter->setAttribute(NumberFormatter::GROUPING_USED, $groupingUsed);
        /*if ($style == NumberFormatter::CURRENCY) {
            $formatter->setTextAttribute(NumberFormatter::CURRENCY_CODE, $currencyCode);
        }*/
        return $formatter->format($value);
    }
}
