
$(document).ready(function () {
    $(function () {
        $("#quotationsList").DataTable({
            paging: true,
            pageLength: 5,
            /*"lengthChange": false,*/
            autoWidth: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: "/showquotations",
                type: "GET",
            },
            columns: [
                { data: "idcotizacion", name: "idcotizacion" },
                { data: "seriecotizacion", name: "seriecotizacion" },
                { data: "date", name: "date" },
                { data: "nomcliente", name: "nomcliente" },
                { data: 'nomuser', name: 'nomuser'},
                { data: "status", name: "status" },
                { data: "cotizaciontotal", name: "cotizaciontotal" },
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

const verCotizacion = async (id) => {
	try {
	  let response = await fetch(`/showquotation/detalle/${id}`);
	  let detalleCotizacion = await response.json();
	  //console.log(detalleCotizacion)
      let cotizacion = detalleCotizacion.cotizacion[0];
      //console.log(cotizacion);
	  document.querySelector("#nomClient").innerHTML = `<b>Nombre cliente :</b><br> ${cotizacion.nomcliente}`;
	  //document.querySelector("#tipoComp").innerHTML = `<b>Fecha :</b> ${cotizacion.fechacotizacion}`
      if (cotizacion.numero_cotizacion_manual == null) {
        document.querySelector("#numComp").innerHTML = `<b>Comprobante :</b><br> ${cotizacion.cod} - ${cotizacion.seriecotizacion} / `;
      }else{
        document.querySelector("#numComp").innerHTML = `<b>Comprobante :</b><br> ${cotizacion.cod} - ${cotizacion.seriecotizacion} / ${cotizacion.numero_cotizacion_manual}`;
      }
	  document.querySelector("#totalVent").innerHTML = `<b>Total cotizacion :</b><br> ${money(cotizacion.totalcotizacion)}`;
      let aPagar = cotizacion.totalcotizacion - cotizacion.abono;
	  let detalles = detalleCotizacion.detalle;
	  //console.log(detalles)

	  const showReg = document.querySelector("#tbodyTable");
	  showReg.innerHTML = "";
	  detalles.forEach(element => {
	  //console.log(element);
	  showReg.innerHTML += `
    	<tr>
      	<td>${element.nombre}</td>
      	<td>${element.cantidad}</td>
      	<td>${money(element.precio_venta)}</td>
      	<td>${money(element.total)}</td>
    	</tr>
	  `;
	  });
      showReg.innerHTML += `
        <tr>
          <td colspan="2"></td>
          <td class="text-center"><b>Total</b></td>
          <td><b>${money(cotizacion.totalcotizacion)}</b></td>
        </tr>
        <tr>
          <td colspan="2"></td>
          <td class="text-center"><b>Abono</b></td>
          <td><b>${money(cotizacion.abono)}</b></td>
        </tr>
        <tr>
          <td colspan="2"></td>
          <td class="text-center"><b>A pagar</b></td>
          <td><b>${money(aPagar)}</b></td>
        </tr>
      `;
	  let detalleModal = document.getElementById('detalleQuotationModal');
	  let modal = new bootstrap.Modal(detalleModal);
	  modal.show();
	} catch(err) {
        console.log(err);
    }

}