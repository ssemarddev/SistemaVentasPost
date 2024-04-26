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
                url: "/showsales",
                type: "GET",
            },
            columns: [
                { data: "id", name: "id" },
                { data: "tipo_comprobante", name: "tipo_comprobante" },
                { data: "numero_venta_manual", name: "numero_venta_manual" },
                { data: "nombres", name: "nombres" },
                { data: "sumTotal", name: "sumTotal" },
                //{ data: "num_comprobante", name: "num_comprobante" },
                { data: 'totalventa', name: 'totalventa'},
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

const verVenta = async (id) => {
	try {
	    let response = await fetch(`/showsale/detalle/${id}`);
        let detalleVenta = await response.json();
	    console.log(detalleVenta)
	    //console.log(detalleVenta.venta.nombres);
	    document.querySelector("#nomClient").innerHTML = `<b>Nombre cliente :</b><br> ${detalleVenta.venta.nombres}`
        document.querySelector("#tipoComp").innerHTML = `<b>Tipo de comprobante :</b><br>${ detalleVenta.venta.num_comprobante} / ${detalleVenta.venta.tipo_comprobante} ${detalleVenta.venta.numero_venta_manual}`
	    document.querySelector("#showfecha").innerHTML = `${formatDate(detalleVenta.venta.fechaventa)}`;
	    let detalles = detalleVenta.detalle;
	    //console.log(detalles)
	    const showReg = document.querySelector("#tbodyTable");
	    showReg.innerHTML = "";
        let cantArt = 0;
	    detalles.forEach((element,indice) => {
	        showReg.innerHTML += `
    	        <tr>
      	        <td>${element.codigo}</td>
      	        <td>${cantFormat(element.cantidad)}</td>
      	        <td>${element.nombre}</td>
      	        <td>${money(element.precio_venta)}</td>
      	        <td>${money(element.subtotal)}</td>
    	        </tr>
	        `;
            cantArt = cantArt + Number(element.cantidad);
	    });
        showReg.innerHTML += `
         <tr>
            <td colspan="3"></td>
            <td class="text-center"><b>Total</b></td>
            <td><b>${money(detalleVenta.venta.total_venta)}</b></td>
        </tr>
        `;

        document.querySelector("#showefectivo").innerHTML = `${money(detalleVenta.venta.efectivo)}`;
        document.querySelector("#showtransfer").innerHTML = `${money(detalleVenta.venta.transferencia)}`;
        document.querySelector("#showdebito").innerHTML = `${money(detalleVenta.venta.tdebito)}`;
        document.querySelector("#showcredito").innerHTML = `${money(detalleVenta.venta.tcredito)}`;
        document.querySelector("#showabono").innerHTML = `${money(detalleVenta.venta.abono)}`;
        if(detalleVenta.venta.tipo_abono != null){
            document.querySelector("#tipodeabono").innerHTML = `${detalleVenta.venta.tipo_abono}`;
        }else{
            document.querySelector("#tipodeabono").innerHTML = `Abono`;
        }

        document.querySelector("#showtotalprod").innerHTML = `${cantFormat(cantArt)}`;
        //let tipoPago = detalleVenta.venta.tipo_pago;
        //showTipoPago(tipoPago,detalleVenta);
	    let detalleModal = document.getElementById('detalleSaleModal');
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