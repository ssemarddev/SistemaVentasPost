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
           <img src="{{ public_path('images/real_bendita_uno\LOGOCOTIZACIONREALBENDITOUNO.png') }}" class="mb-1" alt="user avatar">
        </div>
        <div class="row" style="margin-top:3px;">
            <h3 class="text-success border-2 border-bottom  text-center" style="background-color: #c9f0a2bb;font-family: Helvetica;font-weight: bold;">REPORTE DE VENTAS</h3>
        </div>
        <hr>
        <div class="row" >
            <p><span class="letter">Fecha inicio: </span><span class="letter2">{{$date_start}}</span></label> <span class="letter">Fecha final: </span><span class="letter2">{{$date_end}}</span></p>
        </div>
        <div class="row" style="margin-top:3px;">
              <table class="table table-bordered">
                <thead class="borders">
                    <tr >
                        <th class="borders letter th" style="width: 20%">Venta efectivo</th>
                        <th class="borders letter th" style="width: 10%">Venta credito</th>
                        <th class="borders letter th" style="width: 10%">Venta debito</th>
                        <th class="borders letter th" style="width: 10%">Venta ransferencia</th>
                        <th class="borders letter th" style="width: 10%">Abono</th>
                        <th class="borders letter th" style="width: 10%">Abono efectivo</th>
                        <th class="borders letter th" style="width: 10%">Abono credito</th>
                        <th class="borders letter th" style="width: 10%">Abono debito</th>
                        <th class="borders letter th" style="width: 10%">Abono ransferencia</th>
                    </tr>
                </thead>
                <tbody class="borders">
                    @foreach ($data as $row)
                        <tr>
                            <td class="borders text-center letter2">{{$row['ventaefectivo']}}</td>
                            <td class="borders text-center letter2">{{$row['ventatcredito']}}</td>
                            <td class="borders text-center letter2">{{$row['ventatdebito']}}</td> 
                            <td class="borders text-center letter2">${{$row['ventatransferencia']}}</td>
                            <td class="borders text-center letter2">${{$row['abono']}}</td>
                            <td class="borders text-center letter2">${{$row['abonoefectivo']}}</td>
                            <td class="borders text-center letter2">${{$row['abonotransferencia']}}</td>
                            <td class="borders text-center letter2">${{$row['abonotdebito']}}</td>
                            <td class="borders text-center letter2">${{$row['abonotcredito']}}</td>
                        </tr>
                    @endforeach
                </tbody>
                <tfoot class="borders">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    @foreach ($totales as $total)
                    <tr>
                        <td class="borders text-center letter2"><b>${{$total['sumVentaEfectivo']}}</b></td>
                        <td class="borders text-center letter2"><b>${{$total['sumVentaCredito']}}</b></td>
                        <td class="borders text-center letter2"><b>${{$total['sumVentaDebito']}}</b></td>
                        <td class="borders text-center letter2"><b>${{$total['sumVentaTransferencia']}}</b></td>
                        <td class="borders text-center letter2"><b>${{$total['sumAbono']}}</b></td>
                        <td class="borders text-center letter2"><b>${{$total['sumAbonoEfectivo']}}</b></td>
                        <td class="borders text-center letter2"><b>${{$total['sumAbonoCredito']}}</b></td>
                        <td class="borders text-center letter2"><b>${{$total['sumAbonoDebito']}}</b></td>
                        <td class="borders text-center letter2"><b>${{$total['sumAbonoTransferencia']}}</b></td>

                    </tr> 
                    @endforeach
                </tfoot>
            </table>
        </div>
     
    </body> 
</html>