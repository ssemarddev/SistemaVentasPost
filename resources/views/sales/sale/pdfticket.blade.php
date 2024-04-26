<!DOCTYPE html>
<html>
<head>
    <title>Sales Ticket</title>
    <style>
    
        body {
            font-family: Arial, sans-serif;
            /*margin: 0;
            padding: 0;*/
            
        }
        .ticket1 {
            width: 300px;
            /*margin: 20px auto;*/
            margin-left:0px;
            background-color: #FFF;
            border: 1px solid #000;
            /*padding: 10px;*/
            padding: 0px;
        }
        .ticket-header {
            text-align: center;
            margin-bottom: 0px;
            /*height: 50px;*/
        }
        .ticket-header h1 {
            font-size: 18px;
            margin: 0;
        }
        .ticket-info {
            margin-bottom: 10px;
            /*border: 1px solid #000;*/
        }
        .ticket-items {
            margin-bottom: 10px;
        }
        .ticket-items table {
            width: 100%;
        }
        .ticket-items th, .ticket-items td {
            /*padding: 5px;*/
            border-bottom: 1px solid #000;
        }
        .ticket-total {
            text-align: right;
        }
        .margin-between {
            margin-top: -10px; /* Adjust the value as per your requirement */
        }
        .size {
            font-size: 13px;
        }

    </style>
</head>
<body>
    <div class="ticket">
        <div class="ticket-header">
            <h5>{{$dataEmpresa['nombre']}}</h5>
        </div>
        <div class="ticket-info">
            <p class="margin-between size"><strong>Direccion:</strong> {{$dataEmpresa['direccion']}}</p>
            <p class="margin-between size" ><strong>Telefono:</strong> {{$dataEmpresa['telefono']}}</p>
            <p class="margin-between size"><strong>Email:</strong> {{$dataEmpresa['email']}}</p>
            <p class="margin-between size"><strong>Comprobante:</strong> {{$dataEmpresa['tipocomprobante']}} {{$dataEmpresa['numcomprobante']}}</p>
            <p class="margin-between size"><strong>Fecha:</strong> {{$dataEmpresa['fecha']}}</p>
            <p class="margin-between size"><strong>Cliente:</strong> {{$dataEmpresa['cliente']}}</p>
        </div>
        <div class="ticket-items">
            <table>
                <thead>
                    <tr>
                        <th class="size">Cant.</th>
                        <th class="size">Nombre</th>
                        <th class="size">Precio</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($detalles as $item)
                        <tr>
                            <td class="size" style="text-align: center;">{{ $item->cantidad }}</td>
                            <td class="size">{{ $item->nombre }}</td>
                            <td class="size" style="text-align: right;">{{ $item->subtotal }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="ticket-total">
            <p class="size"><strong>Total:</strong> {{$totales['totalventa']}}</p>
            <p class="margin-between size"><strong>Recibido:</strong> {{$totales['recibido']}}</p>
            <p class="margin-between size"><strong>Vuelto:</strong> {{$totales['cambio']}}</p>
        </div>
        <div class="ticket-items">
            <table>
                <thead>
                    <tr>
                        <th class="size">Efectivo</th>
                        <th class="size">Transf</th>
                        <th class="size">Debito</th>
                        <th class="size">Credito</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="size">{{$totales['efectivo']}}</td>
                        <td class="size">{{$totales['transferencia']}}</td>
                        <td class="size">{{$totales['tdebito']}}</td>
                        <td class="size">{{$totales['tcredito']}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
