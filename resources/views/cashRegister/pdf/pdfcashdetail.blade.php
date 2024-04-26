<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
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
    .nametdposition {
        text-align: left;
    }
    .canttdposition {
        text-align: right;
    }
    /******************************* */
    .container{
        display: flex;
    }
    .div-content{
        display: inline-block;
        /*border: 1px solid;*/
        width: 48%;
    }
    .div-content p{
        margin-top: 0px;
        border-bottom: 1px solid #000;
    }
    .detalle{
        /*border: 1px solid;*/
        text-align: center;
        margin-top: -10px;
    }
    .detalle p{
        margin-top: 0px;
    }
    .header{
    }
    .header h1{
        font-size: 18px;
        margin: 15px;
    }
    .total-global{
        text-align: center;
        margin-top: -5px;
    }
</style>
<body>
    <div class="detailCash">
        <div class="ticket-header">
            <h5>DETALLE DE CAJA</h5>
        </div>
        <div class="info">
            <div class="container">
                <div class="div-content">
                    <p class="size">Usuario</p>
                    <p class="size">Fecha</p>
                </div>
                <div class="div-content">
                    <p class="size">{{$totales[0]['usernamecash']}}</p>
                    <p class="size">{{$totales[0]['created_at']}}</p>
                </div>
            </div>
            <div class="detalle">
                <p>Detalle</p>
            </div>
        </div>
        <div class="ticket-items">
            <table>
                <thead>
                    <!--tr>
                        <th class="size">Cant.</th>
                        <th class="size">Nombre</th>
                        <th class="size">Precio</th>
                    </tr>-->
                </thead>
                <tbody>
                    <tr>
                        <td class="size nametdposition" >Fondo</td>
                        <td class="size"></td>
                        <td class="size canttdposition" >${{$totales[0]['cantidad_inicial']}}</td>
                    </tr>
                    <tr>
                        <td class="size nametdposition" >Efectivo</td>
                        <td class="size">{{$showTotales['countSaleEfectivo']}}</td>
                        <td class="size canttdposition" >${{$totales[0]['ventaefectivo']}}</td>
                    </tr>
                    <tr>
                        <td class="size nametdposition" >Retiros</td>
                        <td class="size">{{$showTotales['countRetiros']}}</td>
                        <td class="size canttdposition" >${{$sumRetiros}}</td>
                    </tr>
                    <tr>
                        <td class="size nametdposition" >Transferencia</td>
                        <td class="size">{{$showTotales['countSaleTransferencia']}}</td>
                        <td class="size canttdposition" >${{$totales[0]['ventatransferencia']}}</td>
                    </tr>
                    <tr>
                        <td class="size nametdposition" >Debito</td>
                        <td class="size">{{$showTotales['countSaleTdebito']}}</td>
                        <td class="size canttdposition" >${{$totales[0]['ventatdebito']}}</td>
                    </tr>
                    <tr>
                        <td class="size nametdposition" >Credito</td>
                        <td class="size">{{$showTotales['countSaleTcredito']}}</td>
                        <td class="size canttdposition" >${{$totales[0]['ventatcredito']}}</td>
                    </tr>
                    <tr>
                        <td class="size nametdposition" >Abono efectivo</td>
                        <td class="size">{{$showTotales['countAbonoEfectivo']}}</td>
                        <td class="size canttdposition" >${{$totales[0]['abonoefectivo']}}</td>
                    </tr>
                    <tr>
                        <td class="size nametdposition" >Abono transferencia</td>
                        <td class="size">{{$showTotales['countAbonoTransferencia']}}</td>
                        <td class="size canttdposition" >${{$totales[0]['abonotransferencia']}}</td>
                    </tr>
                    <tr>
                        <td class="size nametdposition" >Abono debito</td>
                        <td class="size">{{$showTotales['countAbonoTdebito']}}</td>
                        <td class="size canttdposition" >${{$totales[0]['abonotdebito']}}</td>
                    </tr>
                    <tr>
                        <td class="size nametdposition" >Abono credito</td>
                        <td class="size">{{$showTotales['countAbonoTcredito']}}</td>
                        <td class="size canttdposition" >${{$totales[0]['abonotcredito']}}</td>
                    </tr>
                    <tr>
                        <td class="size nametdposition" ><b>Total</b></td>
                        <td class="size"></td>
                        <td class="size canttdposition"><b>${{$totales[0]['moneyTotal']}}</b></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="total-global">
            <p><b>Ventas</b></p>
            <p><b>${{$totales[0]['onlytotal']}}</b></p>

        </div>
    </div>
    
</body>
</html>