<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Document</title> 
         <!-- CSS only -->
        <link href="{{asset('css/bootstrap.min.css')}}" rel="stylesheet">
    </head>
        <style>
            .borders {
                border: #b2b2b2 1px solid;
            }
        </style>
    <body>
        <div class="row">
           <img src="{{asset('images/logofactura.png')}}" class="mb-1" alt="user avatar">
        </div>
        <h1 class="text-success border-2 border-bottom  text-center" style="background-color: #c9f0a2bb">COTIZACIÓN</h1>
        <div class="row">
            <table>
                <tbody>
                    <tr>
                        @foreach ($ventas as $row) 
                        @php
                            $user=$row->nomuser;
                            $pago=$row->tipo_pago;
                            $total=$row->total;
                            $servicio=$row->servicio;
                        @endphp
                             <td  style="text-align: left;"> 
                                 <label><span class="h4">CLIENTE: </span><span>{{$row->nombres}}</span></label><br>
                                 <label><span class="h4">FECHA: </span><span>{{$row->created_at}}</span></label><br>
                                 <label><span class="h4">DIRECCIÓN: </span><span>{{$row->direccion}}</span></label><br>
                                 <label><span class="h4">TELEFONO: </span><span>{{$row->telefono}}</span></label><br>
                                 <label><span class="h4">EMAIL: </span><a>{{$row->email}}</a></label> 
                             </td>
                             <td style="text-align: center;">
                                 <h1 class="text-secundary borders" >{{$row->cod}}-{{$row->serie}}</h1>
                                 <h4>Validez: {{$row->validez}}</h4>
                             </td>
                         @endforeach
                    </tr>
                </tbody>
            </table> 
        </div>   
         <hr>
        <div class="contenido"> 
            <label><span class="h4">VENDEDOR: </span><span>{{$user}}</span></label> <br>
            <label><span class="h4">PAGO: </span><span>{{$pago}}</span></label> <br>
            <label><span class="h4">SERVICIO: </span><span class="h3">{{$servicio}}</span></label> 
            <table class="table table-bordered">
                <thead class="borders">
                    <tr >
                        <th class="borders" style="width: 5%">CODIGO</th>
                        <th class="borders" style="width: 25%">PRODUCTO</th>
                        <th class="borders" style="width: 5%">CANTIDA</th>
                        <th class="borders" style="width: 13%">P. UNITARIO</th>
                        <th class="borders" style="width: 10%">DESCUENTO</th>
                        <th class="borders" style="width: 12%">TOTAL</th>
                    </tr>
                </thead>
                <tbody class="borders">
                    @foreach ($detalle as $row)
                        <tr>
                            <td class="borders text-center" >{{$row->codigo}}</td>
                            <td class="borders">{{$row->nombre}}</td>
                            <td class="borders text-center">{{$row->cantidad}}</td> 
                            <td class="borders text-center">{{$row->precio_venta}}</td>
                            <td class="borders text-center">{{$row->descuento}}</td>
                            <td class="borders text-center">{{$row->total}}</td>
                        </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td> 
                        <td></td>
                        <td class="p-3 text-center"> <h4>TOTAL:</h4></td>
                        <td class="borders p-3 text-center"> <h4>{{$total}}</h4> </td>
                    </tr> 
                </tfoot>
            </table>
            <br>
        </div>
        <p>VALOR INCLUYE INSTALACION</p>
        <p>VALOR INCLUYE IVA</p>
        <p>DISPONIBILIDAD INMEDIATA</p>
    </body> 
</html>