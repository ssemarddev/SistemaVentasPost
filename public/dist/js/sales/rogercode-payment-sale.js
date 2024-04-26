import {getdata} from '../exportModule/sale/rogercode-sales.js';
let btncloseabono = document.querySelector("#btnClosemodalAbono"); 


$(document).ready(function () {
    $(function () {
        $("#paymentMoneyList").DataTable({
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
                { data: "sumTotal", name: "sumTotal" },
                { data: "nombres", name: "nombres" },
                { data: 'totalgeneral', name: 'totalgeneral'},
                { data: 'totalabono', name: 'totalabono'},
                { data: "apagar", name: "apagar" },
                { data: "statusAbono", name: "statusAbono" },
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


document.querySelector("#paymentMoneyList tbody").addEventListener("click", (e) => {
    //console.log('Row clicked');
    //console.log(e.target);
    let element = e.target;
    if (element.name === 'btnAddAbono') {
        //console.log(element);
        let id = element.getAttribute('data-id');
        //console.log(id);
        let url = "/getpaymentmoney/";
        let btnId = element.getAttribute("id");
        //console.log(btnId);
        const load = document.querySelector(`#${btnId}`);
        load.disabled = true;
        load.innerHTML = '';
        load.innerHTML += `
            <div class="spinner-border spinner-border-sm" role="status">
            <span class="visually-hidden">Loading...</span>
            </div>
        `
        getdata(url,Number(id)).then((response) => {
            if (response.status === 1) {
                console.log(response);
                btncloseabono.click();

                document.querySelectorAll("#TipoVenta option").forEach(opt => {
                    if (opt.value == "PAGAR ABONO") {
                        opt.disabled = false;
                    }
                });

                tipoventa.value = "PAGAR ABONO";
                tipoventa.disabled = true;

                let listProduct = response.reg;
                cargarDato(listProduct);
                typesale.value = "";
                typesale.value = response.typeSale;
                let client = response.regabono.clienteId;
                //console.log(client);
                $('.select-single').val(client).trigger('change');
                $('.select-single').prop('disabled', true);
                //let comprobante = response.regabono.tipo_comprobante;
                //tipocomprobante.value = comprobante;
                //tipocomprobante.disabled = true;
                //numabonomanual.value = response.regabono.numero_abono_manual
                //numabonomanual.disabled = true;

                showtipoabono.value = "ABONO " + response.regabono.tipo_pago;
                showtipoabono.disabled = true;
                divshowtipoabono.style.display = "block";
                showcantabono.value = cantFormat(response.regabono.total_abono);
                showcantabono.disabled = true;
                divContentCantAbono.style.display = "block";

                /*document.querySelectorAll("#tipoPago option").forEach(opt => {
                    if (opt.value == "PAGAR ABONO") {
                        opt.disabled = false;
                    }
                });*/
                
                //pago.value = "PAGAR ABONO";
                //pago.disabled = true;
                btnAddPago.disabled = false;
                //let totalabono = cantFormat(response.regabono.total_abono);
                //console.log(totalabono);
                //totalPago.value = totalabono;
                //totalPago.disabled = true;

                load.innerHTML = '';
                load.innerHTML += `
                    Agregado
                ` 
            }
        });

    }
});


/*$('#paymentMoneyList tbody').on('click', 'tr', function (e) {
    console.log('Row clicked');
    console.log(e.target);
    let element = e.target;

    if (element.name === 'btnAddAbono') {
        console.log('btnAddAbono');
        let id = element.getAttribute('data-id');
        console.log(id);
    }
    
});*/
