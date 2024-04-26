
let showefectivo = document.querySelector("#showefectivo");
let showtransfer = document.querySelector("#showtransfer");
let showdebito = document.querySelector("#showdebito");
let showcredito = document.querySelector("#showcredito");
let showtotalprod = document.querySelector("#showtotalprod");
let showfecha = document.querySelector("#showfecha");

$(document).ready(function () {
    $(function () {
        $("#salesList").DataTable({
            paging: true,
            pageLength: 5,
            /*"lengthChange": false,*/
            autoWidth: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: "/showproductpurchases",
                type: "GET",
            },
            columns: [
                { data: "id", name: "id" },
                { data: "tipo_comprobante", name: "tipo_comprobante" },
                { data: "numero_compra_manual", name: "numero_compra_manual" },
                { data: "nombres", name: "nombres" },
                { data: "sumTotal", name: "sumTotal" },
                //{ data: "num_comprobante", name: "num_comprobante" },
                { data: 'totalcompra', name: 'totalcompra'},
                //{ data: "tipo_pago", name: "tipo_pago" },
                { data: "usernom", name: "usernom" },
                { data: "status", name: "status" },
                { data: "date", name: "date" },
                { data: "action", name: "action" },
            ],
            columnDefs: [
            {
                target: 0,
                visible: false,
                searchable: false,
            }
            ],
            order: [[0, "DESC"]],
            language: {
                processing: "Procesando...",
                lengthMenu: "Mostrar _MENU_ registros",
                zeroRecords: "No se encontraron resultados",
                emptyTable: "Ningún dato disponible en esta tabla",
                sInfo: "Mostrando del _START_ al _END_ de total _TOTAL_ registros",
                infoEmpty:
                    "Mostrando registros del 0 al 0 de un total de 0 registros",
                infoFiltered: "(filtrado de un total de _MAX_ registros)",
                search: "Buscar:",
                infoThousands: ",",
                loadingRecords: "Cargando...",
                paginate: {
                    first: "Primero",
                    last: "Último",
                    next: "Siguiente",
                    previous: "Anterior",
                },
            },
        });
    });
});

const verCompra = async (id) => {
  console.log(id);
	try {
	    let response = await fetch(`/showproductpurchases/detalle/${id}`);
      let detalleCompra = await response.json();
	    console.log(detalleCompra)
	    //console.log(detalleVenta.venta.nombres);
	    document.querySelector("#nomClient").innerHTML = `<b>Nombre proveedor :</b><br> ${detalleCompra.compra.nombre_empresa}`
      document.querySelector("#tipoComp").innerHTML = `<b>Tipo de comprobante :</b><br>${ detalleCompra.compra.num_comprobante} / ${detalleCompra.compra.tipo_comprobante} ${detalleCompra.compra.numero_compra_manual}`
	    document.querySelector("#showfecha").innerHTML = `${formatDate(detalleCompra.compra.fechacompra)}`;
	    let detalles = detalleCompra.detalle;
	    console.log(detalles)
	    const showReg = document.querySelector("#tbodyTable");
	    showReg.innerHTML = "";
        let cantArt = 0;
	    detalles.forEach((element,indice) => {
	        showReg.innerHTML += `
    	        <tr>
      	        <td>${element.codigo}</td>
      	        <td>${cantFormat(element.cantidad)}</td>
      	        <td>${element.nombre}</td>
      	        <td>${money(element.precio_compra)}</td>
      	        <td>${money(element.subtotal)}</td>
    	        </tr>
	        `;
            cantArt = cantArt + Number(element.cantidad);
	    });
        showReg.innerHTML += `
         <tr>
            <td colspan="3"></td>
            <td class="text-center"><b>Total</b></td>
            <td><b>${money(detalleCompra.compra.total_compra)}</b></td>
        </tr>
        `;

        document.querySelector("#showefectivo").innerHTML = `${money(detalleCompra.compra.efectivo)}`;
        document.querySelector("#showtransfer").innerHTML = `${money(detalleCompra.compra.transferencia)}`;
        document.querySelector("#showdebito").innerHTML = `${money(detalleCompra.compra.tdebito)}`;
        document.querySelector("#showcredito").innerHTML = `${money(detalleCompra.compra.tcredito)}`;
        //document.querySelector("#showabono").innerHTML = `${money(detalleVenta.venta.abono)}`;
        /*if(detalleVenta.venta.tipo_abono != null){
            document.querySelector("#tipodeabono").innerHTML = `${detalleVenta.venta.tipo_abono}`;
        }else{
            document.querySelector("#tipodeabono").innerHTML = `Abono`;
        }*/

        document.querySelector("#showtotalprod").innerHTML = `${cantFormat(cantArt)}`;
	    let detalleModal = document.getElementById('detalleCompraModal');
	    let modal = new bootstrap.Modal(detalleModal);
	    modal.show();
	} catch(err) {
        console.log(err);
    }

}

/*const showTipoPago = (tipoPago,detalleVenta) => {
    console.log(tipoPago);
    switch (tipoPago) {
        case "EFECTIVO":
            showefectivo.innerHTML = "";
            showefectivo.innerHTML = `${detalleVenta.venta.total_venta}`
        break;
        case "TRANSFERENCIA":
            showtransfer.innerHTML = "";
            showtransfer.innerHTML = `${detalleVenta.venta.total_venta}`
            
        break;
        case "T.DEBITO":
            showdebito.innerHTML = "";
            showdebito.innerHTML = `${detalleVenta.venta.total_venta}`
        break;
        case "T.CREDITO":
            showcredito.innerHTML = "";
            showcredito.innerHTML = `${detalleVenta.venta.total_venta}`
        break;
    
        default:
            break;
    }
//}*/