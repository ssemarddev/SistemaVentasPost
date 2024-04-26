$(document).ready(function () {
    $(function () {
        $("#paymentMoney").DataTable({
            paging: true,
            pageLength: 5,
            autoWidth: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: "/showpaymentsmoney",
                type: "GET",
            },
            columns: [
                { data: "id", name: "id" },
                { data: "num_comprobante", name: "num_comprobante" },
                { data: "nombres", name: "nombres" },
                { data: "sumTotal", name: "sumTotal" },
                { data: 'totalgeneral', name: 'totalgeneral'},
                { data: 'totalabono', name: 'totalabono'},
                { data: "apagar", name: "apagar" },
                { data: "statusAbono", name: "statusAbono" },
                { data: "usernom", name: "usernom" },
                { data: "date", name: "date" },
                //{ data: "action", name: "action" },
                {
                    title:"<i class='bi bi-gear'></i>",
                    render: function (data, type, row) {
                        return `
                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots-vertical"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                <li><a class="dropdown-item" type="button" onclick="showDetailPayment(${row.id});"><i class="bi bi-eye"></i>Ver</a></li>
                            </ul>
                        `;
                    }
                }
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

getdata = async (ruta,id) => {
    try {
        let response = await fetch(ruta+id); 
        let data = await response.json();
        return data;
    } catch (error) {
        console.log(error)    
    }
}

function showDetailPayment(id) {
    getdata("/getpaymentmoneydetail/",id).then((result) => {
        //console.log(result);
        let div = document.querySelector("#detailShowPayment");
        template(result,div);
        let myModalverCash = document.getElementById('showDetailModal');
        let modal = new bootstrap.Modal(myModalverCash);
        modal.show();
    });

    
}

const template = (result,div) => {
    let getDetail = result.regabono;
    console.log(getDetail);

	document.querySelector("#nomClient").innerHTML = `
    <b>Datos cliente :
    </b><br>
    ${getDetail.nombres}
    </b><br>
    ${getDetail.telefono}
    </b><br>
    ${getDetail.direccion}
    </b><br>
    ${getDetail.email}
    `
    document.querySelector("#tipoComp").innerHTML = `<b>Tipo de comprobante :</b><br>${getDetail.num_comprobante} / ${getDetail.tipo_comprobante} ${getDetail.numero_abono_manual}`
	//document.querySelector("#showfecha").innerHTML = `${detalleVenta.venta.fechaventa}`;
    let detalles = result.detalle;
	const showReg = document.querySelector("#detailShowPayment");
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
        <td><b>${money(getDetail.total)}</b></td>
    </tr>
    `;
    let tipoDeAbono = "";
    if(getDetail.efectivo != 0)
        tipoDeAbono = "Efectivo";
    if(getDetail.tdebito != 0)
        tipoDeAbono = "Debito";
    if(getDetail.tcredito != 0)
        tipoDeAbono = "Credito";
    if(getDetail.transferencia != 0)
        tipoDeAbono = "Transferencia";

    let tipodeabono = document.querySelector("#tipodeabono").textContent = `Abono ${tipoDeAbono}`;

    
    let porPagar = getDetail.total - getDetail.total_abono;

    document.querySelector("#showabono").innerHTML = ` ${money(getDetail.total_abono)}`;
    document.querySelector("#showpagar").innerHTML = `${money(porPagar)}`;
    document.querySelector("#showprod").innerHTML = `${cantArt}`;
    document.querySelector("#showfecha").innerHTML = `${formatDate(getDetail.fechaabono)}`;
}
