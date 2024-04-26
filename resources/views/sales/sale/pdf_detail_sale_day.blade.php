<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Document</title> 
         <!-- CSS only -->
        <link href="{{ public_path('theme/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    </head>
        <style>
            .borders {
                border: #b2b2b2 1px solid;
            }
            .letter{
                font-size: 13px;
                font-family: Helvetica;
                font-weight: bold;
                margin-top: 4px;
            }
            .letter2{
                font-size: 13px;
                font-family: Helvetica;
            }
            hr {
            height: 4px;
            background-color: black;
            }
            .th{
                background-color: #c9f0a2bb;
            }
        </style>
    <body>
        <div class="row">
           <!--img src="{{ public_path('images/real_bendita_uno\LOGOCOTIZACIONREALBENDITOUNO.png') }}" class="mb-1" alt="user avatar">-->
        </div>
        <div class="row" style="margin-top:3px;">
            <h3 class="text-success border-2 border-bottom  text-center" style="background-color: #c9f0a2bb;font-family: Helvetica;font-weight: bold;">REPORTE DETALLE DE VENTAS</h3>
        </div>
        <hr>
        <div class="row" >
            <p><span class="letter">Fecha: </span><span class="letter2">{{$day}}</span></p>
        </div>
        <div class="row" style="margin-top:3px;">
              <table class="table table-bordered">
                <thead class="borders">
                    <tr>
                        <th class="borders letter th" style="width: 15%">Tipo</th>
                        <th class="borders letter th" style="width: 10%">Num</th>
                        <th class="borders letter th" style="width: 15%">Cliente</th>
                        <th class="borders letter th" style="width: 10%">Cant</th>
                        <th class="borders letter th" style="width: 10%">Total</th>
                        <th class="borders letter th" style="width: 20%">Usuario</th>
                        <th class="borders letter th" style="width: 20%">Fecha</th>
                    </tr>
                </thead>
                <tbody class="borders">
                    @foreach ($data as $row)
                        <tr>
                            <td class="borders letter2">{{$row['tipo_comprobante']}}</td>
                            <td class="borders letter2">{{$row['numero_venta_manual']}}</td> 
                            <td class="borders letter2">{{$row['nombres']}}</td>
                            <td class="borders letter2">{{$row['totalProd']}}</td>
                            <td class="borders letter2">${{$row['total_venta']}}</td>
                            <td class="borders letter2">{{$row['usernom']}}</td>
                            <td class="borders letter2">{{$row['created_at']}}</td>
                        </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <th class="borders letter2">Total</th>
                        <th class="borders letter2"></th>
                        <th class="borders letter2"></th>
                        <th class="borders letter2"></th>
                        <th class="borders letter2">{{$sumSalesDay}}</th>
                        <th class="borders letter2"></th>
                        <th class="borders letter2"></th>
                    </tr>
                </tfoot>
            </table>
        </div>
     
    </body> 
</html>