

const pagoWithTarjeta = document.querySelector("#cantPagoTarjeta");
const otroMetodoPago = document.querySelector("#otroTipoPago");
const btnAddPago = document.querySelector("#btnAddTipoPago");
let pago = document.getElementById("tipoPago");
let totalVenta = document.getElementById("total");
let totalPago = document.getElementById("apagar");
let myFormSale = document.querySelector("#my_form");
let tipocomprobante = document.querySelector('#tipoComprobante');
let numabonomanual = document.querySelector('#numeroVentaManual');
let typesale = document.querySelector('#typesale');
let tipoventa = document.querySelector('#TipoVenta');
let showtipoabono = document.querySelector('#showTipoAbono');
let showcantabono = document.querySelector('#showCantAbono');
let divshowtipoabono = document.querySelector('#divContentTipoAbono');
let divshowcantabono = document.querySelector('#divContentCantAbono');
const btnPrintEfectivo = document.querySelector('#btnPrint');
const inputVentaId = document.querySelector('#ventaId');
const divticketpdf = document.querySelector('#div-generate-ticket');

$(document).ready(function () {
    $('.select-single').select2({
        theme: "bootstrap-5",
        width: '100%',
    });
});
console.log("sasas");

$(document).ready(function () {
    $(function () {
        $("#searchProducts").DataTable({
            paging: true,
            pageLength: 5,
            autoWidth: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: "/showsalesproducts",
                type: "GET",
            },
            columns: [
                { data: 'codigo', name: 'codigo'},
                { data: "nombre", name: "nombre" },
                { data: "pstock", name: "pstock" },
                { data: "pcant", name: "pcant" },
                { data: "precioventa", name: "precioventa" },
                { data: "action", name: "action" },
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


//production const Addcar = function(id,cod,nombre,pventa) {
const Addcar = function(data) {
    console.log(data);
    console.log(data[0]);
    let dataProd = data[0];
    const add = document.querySelector("#addProd"+dataProd.id);
    add.disabled = true;
    add.innerHTML = '';
    add.innerHTML += `
        <div class="spinner-border spinner-border-sm" role="status">
        <span class="visually-hidden">Loading...</span>
        </div>
    `
    let cantidad = Number($('#cant'+dataProd.id).val());
    console.log(cantidad);
    const stockActual = Number(dataProd.stock);
    console.log(stockActual);
    if (cantidad > stockActual) {
        errorMainMessage('Error: La cantidad supera el stock del producto: ' + 'stock actual ' + stockActual);
        add.disabled = false;
        add.innerHTML = '';
        add.innerHTML += `
            <i class="bi bi-plus"></i>
        ` 
        return false;
    }
    dataProd.cantidad = cantidad;
    console.log(dataProd);
    let total= cantidad * Number(dataProd.precio_venta); 
    dataProd.total= Number(total);
    let token = $('meta[name="csrf-token"]').attr("content");
    $.ajax({
        headers: {'X-CSRF-TOKEN': token}, 
        url:"/sales/create_carrito",
        method:'POST',
        //data:{id,cod,nombre,cantidad,pventa,total},
        data:dataProd,
        dataType:'json',
        beforeSend :function(xmlHttp){ 
        xmlHttp.setRequestHeader("If-Modified-Since","0"); 
        xmlHttp.setRequestHeader("Cache-Control","no-cache");
        },
        success:function(data){   
            console.log(data);
            add.disabled = false;
            add.innerHTML = '';
            add.innerHTML += `
                <i class="bi bi-plus"></i>
            ` 
            const carData = data.car;
            cargarDato(carData);
        }
    });
}

function cargarDato(data){ 
    campo ='';
    total=0;
    data.forEach(row => {
        total = Number(total) + Number(row.total);
        let dataRow =JSON.stringify(row);
        //console.log(JSON.stringify(dataRow).toString());
        campo+=`
            <tr> 
                <td>${row.codigo}</td>
                <td> 
                <input type="text" id="cantidad${row.id}" class="form-control" size="4" onkeydown="fnInputEnter(event,${row.id},'cantidad');" data='${dataRow}' onchange="UpdateCarrito(${row.id},'cantidad');" value="${row.cantidad}"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">   
                </td>
                <td>${row.nombre}</td> 
                <td>
                <input type="text" id="precio${row.id}" class="form-control" size="5" onkeydown="fnInputEnter(event,${row.id},'precio');" onchange="UpdateCarrito(${row.id},'precio');" value="${row.precio}"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"> 
                </td> 
                <td>${money(row.total)}</td> 
                <td> 
                    <button onclick="deleteProd(${row.id});" class=" btn btn-danger btn-sm bi bi-trash"></button>
                </td>
            </tr>
        `; 
    });
    $('#tbody').html('')
    $('#tbody').append(campo);
    $('#totalp').html(money(total));
    console.log("total p :" + total);
    $('#total').val(total);
    if(tipoventa.value != "PAGAR ABONO"){
        totalPago.value = "";
        totalPago.value = total;
        console.log(tipoventa.value);
    }

} 

function UpdateCarrito(id,tipo) {
    /***************************************************************** */
    const inputCantidad = document.querySelector('#cantidad'+id);
    console.log(inputCantidad.value);
    // Using getAttribute() method
    const cantidadValue = inputCantidad.getAttribute("data");
    let prod = JSON.parse(cantidadValue);
    console.log(prod);
    let inputCurrentPrecio = document.querySelector('#precio'+id);
    let currentPrecio = inputCurrentPrecio.value;
    if (tipo == "cantidad") {
        if (Number(inputCantidad.value) == 0 || inputCantidad.value == "") {
            alert("Error : Debes de ingresar una cantidad valida")
            return false;
        }
        if ((Number(prod.tipo_unidad) == 2) && (Number(prod.mayoreo_cantidad2) != 0)) {
            if((Number(prod.tipo_unidad) == 2) && (Number(inputCantidad.value) >= Number(prod.mayoreo_cantidad)) && (Number(inputCantidad.value) < Number(prod.mayoreo_cantidad2))){
                console.log("mayoreo nivel 2"); 
                //document.querySelector('#precio'+id).value = prod.precio_mayoreo;
                inputCurrentPrecio.value = prod.precio_mayoreo;
            }else
            if ((Number(prod.tipo_unidad) == 2) && (Number(inputCantidad.value) >= Number(prod.mayoreo_cantidad2)) ) {
                console.log("mayoreo 2"); 
                //document.querySelector('#precio'+id).value = prod.precio_mayoreo2;
                inputCurrentPrecio.value = prod.precio_mayoreo2;
            }else{
                console.log("menudeo nive 2"); 
                //document.querySelector('#precio'+id).value = prod.precio_menudeo;
                inputCurrentPrecio.value = prod.precio_menudeo;
            }
        } 
        if ((Number(prod.tipo_unidad) == 2) && (Number(prod.mayoreo_cantidad2) == 0)) {
            if((Number(prod.tipo_unidad) == 2) && (Number(inputCantidad.value) >= Number(prod.mayoreo_cantidad))){
                console.log("mayoreo nivel 1"); 
                //document.querySelector('#precio'+id).value = prod.precio_mayoreo;
                inputCurrentPrecio.value = prod.precio_mayoreo;
            }else{
                console.log("menudeo nivel 1"); 
                //document.querySelector('#precio'+id).value = prod.precio_menudeo;
                inputCurrentPrecio.value = prod.precio_menudeo;
            }

        }
        if ((Number(prod.tipo_unidad) == 1)) {
            console.log("menudeo"); 
            //document.querySelector('#precio'+id).value = prod.precio_menudeo;
            inputCurrentPrecio.value = prod.precio_menudeo;
        }
    }
    /***************************************************************** */
    let currentStock = Number(prod.product_stock);
    console.log(currentStock);
    let cantidad = Number($('#cantidad'+id).val()); 
    console.log(cantidad)
    let precio=$('#precio'+id).val();   
    let token = $('meta[name="csrf-token"]').attr("content");
    if (cantidad > currentStock) {
        $('#cantidad'+id).val(prod.cantidad);
        inputCurrentPrecio.value = "";
        inputCurrentPrecio.value = currentPrecio;
        alert('Error: La cantidad supera el stock del producto: ' + 'stock actual ' + currentStock)
        return false;
    }
    /*************************************************************** */
    //console.log(cantidad)
    //console.log(precio)
    $.ajax({
        headers: {'X-CSRF-TOKEN': token}, 
        url:"/sales/update_carrito",
        method:'POST',
        data:{id,cantidad,precio,currentStock},
        dataType:'json',
        beforeSend :function(xmlHttp){ 
        xmlHttp.setRequestHeader("If-Modified-Since","0"); 
        xmlHttp.setRequestHeader("Cache-Control","no-cache");
        },
        success:function(data){   
            console.log(data);
            cargarDato(data);
        }
    });
} 


$('.select-single').select2().on('change', function(e){
    $data = $( ".select-single option:selected").attr("data");
    $row = JSON.parse($data);
    console.log($row);
    $('#rut_cliente').val($row.rut);
    $('#email_cliente').val($row.email);
});

/*const tiposDePago = {
    EFECTIVO: function () {
        alert("EFECTIVO");
    },
    TRANSFERENCIA: function () {
        alert("TRANSFERENCIA");
    },
    ["CREAR ABONO"]: function () {
        alert("CREAR ABONO");
    }
}*/


/*myFormSale.addEventListener("submit", (e) => {
    e.preventDefault();
    let tipo = pago.value;
    console.log(tipo);
});*/

/*$('#my_form').on('submit', function (e) {
    e.preventDefault(); 
     
    const seend = document.querySelector("#btnSave");
    seend.disabled = true;
    seend.innerHTML = '';
    seend.innerHTML += `
        <div class="spinner-border spinner-border-sm" role="status">
        <span class="visually-hidden">Loading...</span>
        </div>
    ` 
    $.ajax({
        url: $(this).attr('action'),
        method: 'POST',
        data: new FormData(this), 
        processData: false,
        dataType: 'json',
        contentType: false,
        beforeSend: function () {
                    
        },
        success: function (data) { 
            console.log(data);
            if (data.status === 0) {
                Swal.fire(
                    'Error!',
                    data.message,
                    'error'
                )
            }   
            if(data.status === 1){
                document.querySelector("#my_form").reset();
                $('#tbody').html('')
                $('#totalp').html('$ '+0);
                $('#numComprobante').val(data.numComp);
                $('#id_cliente').prop('selectedIndex', 0);
                $('#id_cliente').select2({
                    theme: "bootstrap-5",
                    width: '100%',
                });
                let exitventa = document.querySelector("#exitventatotal");
                exitventa.innerHTML = `${data.totalventa}`;

                let exittipopago = document.querySelector("#exittipopago");
                exittipopago.innerHTML = `${data.tipopago}`;

                let exitotrotipopago = document.querySelector("#exitotrotipopago");
                let exitotrocantidadpago = document.querySelector("#exitotrocantidadpago");
                exitotrotipopago.innerHTML = ``;
                exitotrocantidadpago.innerHTML = ``;
                let exitdinero = document.querySelector("#exitdinero");
                if (data.tipopago === "EFECTIVO") {
                    exitdinero.innerHTML = `${data.dinero}`;
                    if (data.otrotipopago != null && data.otrocantidadpago != null) {
                        exitotrotipopago.innerHTML += `${data.otrotipopago}`;
                        exitotrocantidadpago.innerHTML += `${data.otrocantidadpago}`;

                        otroMetodoPago.value = "";
                        pagoWithTarjeta.value = "";
                        pagoWithTarjeta.style.display ='none';
                        otroMetodoPago.style.display ='none';
                    }
                }else{
                    exitdinero.innerHTML = `${data.totalventa}`;
                    totalPago.disabled = false;
                    btnAddPago.disabled = false;
                }

                $('#showCambio').html("$ " + data.cambio);

                let myModalExitSale = document.getElementById('showExitSaleModal');
                let modal = new bootstrap.Modal(myModalExitSale);
                modal.show();
            }
            seend.innerHTML = '';
            seend.innerHTML += `
                <i class="bi bi-folder-plus"></i> Guardar</i>
            ` 
            seend.disabled = false;
        }
    });
});*/

function deleteProd(id){
    console.log(id)  
    let token = $('meta[name="csrf-token"]').attr("content");
    $.ajax({
        headers: {'X-CSRF-TOKEN': token}, 
        url:"/sales/delete",
        method:'POST',
        data:{id},
        dataType:'json',
        beforeSend :function(xmlHttp){ 
        xmlHttp.setRequestHeader("If-Modified-Since","0"); 
        xmlHttp.setRequestHeader("Cache-Control","no-cache");
        },
        success:function(data){   
            console.log(data);
            if (data.message == "success") {
                cargarDato(data.carrito);
            }           
        }
    });
}

const changePagos = () => {
    //if (pago.value != "EFECTIVO" && tipoventa.value === "VENTA NORMAL") {
    if (pago.value != "EFECTIVO" && tipoventa.value != "CREAR ABONO") {
        console.log(tipoventa.value); 
        if(tipoventa.value == "PAGAR ABONO"){
            let restap = Number(total) - Number(showcantabono.value);
            let faltantep = Number(restap) - Number(totalPago.value)
            console.log(faltantep);
            totalPago.value = faltantep;
        }else{
            totalPago.value = totalVenta.value;
        }
        otroMetodoPago.value = "";
        pagoWithTarjeta.value = "";
        totalPago.disabled = true;
        btnAddPago.disabled = true;
        pagoWithTarjeta.style.display ='none';
        otroMetodoPago.style.display ='none';
    }

    //if(pago.value === "EFECTIVO" && tipoventa.value === "VENTA NORMAL"){
    if(pago.value === "EFECTIVO" && tipoventa.value != "CREAR ABONO"){
        totalPago.value = "";
        totalPago.disabled = false;
        btnAddPago.disabled = false;
    }

    /*if (pago.value === "CREAR ABONO") {
        totalPago.value = "";
        totalPago.disabled = false;
        btnAddPago.disabled = true;
    }*/
}

const addPago = () => {
    pagoWithTarjeta.style.display ='block';
    otroMetodoPago.style.display ='block';

}

const changeOtroTipoPagos = () => {
    //console.log("changeOtroTipoPagos");
    //console.log(totalPago.value);
    //console.log(totalVenta.value);
    console.log(tipoventa.value); 
    if (tipoventa.value === "PAGAR ABONO")
    {
        console.log(tipoventa.value); 
        console.log(showcantabono.value); 
        let resta = total - showcantabono.value;
        let faltante = resta - totalPago.value
        pagoWithTarjeta.value = faltante;
        console.log(faltante);
    }else {
        let faltante = totalVenta.value - totalPago.value;
        pagoWithTarjeta.value = faltante;
    }
}

function fnInputEnter(event,id,tipo) {
    //console.log("enter")
    if (event.keyCode === 13) {
        console.log(tipo);
        //console.log("Input submitted: ", id);
        /*const inputCantidad = document.querySelector('#cantidad'+id);
        console.log(inputCantidad.value);
        // Using getAttribute() method
        const cantidadValue = inputCantidad.getAttribute("data");
        let prod = JSON.parse(cantidadValue);
        console.log(prod); 
        if((Number(prod.tipo_unidad) == 2) && (Number(inputCantidad.value) >= Number(prod.mayoreo_cantidad))){
            console.log("mayoreo"); 
            console.log(Number(inputCantidad.value));
            console.log(prod.mayoreo_cantidad);
            document.querySelector('#precio'+id).value = prod.precio_mayoreo;
        }else{
            console.log("menudeo"); 
            document.querySelector('#precio'+id).value = prod.precio_menudeo;
        }*/

        UpdateCarrito(id,tipo);
    }
}

