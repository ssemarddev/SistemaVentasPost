
const btnpdf = document.querySelector("#btn-generate-pdf");
const divtotal = document.querySelector("#divtotal");
const divabono = document.querySelector("#divabono");
const divapagar = document.querySelector("#divapagar");
const showcod = document.querySelector("#showcod");
const showemail = document.querySelector("#showemail");
const showphone = document.querySelector("#showphone");
const inputserie = document.querySelector("#serie");

$(document).ready(function () {
    $('.select-single').select2({
        theme: "bootstrap-5",
        width: '100%',
    });
});

$(document).ready(function () {
    $(function () {
        $("#searchProducts").DataTable({
            paging: true,
            pageLength: 5,
            /*"lengthChange": false,*/
            autoWidth: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: "/showquotationsproducts",
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
            order: [[0, "ASC"]],
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

function Addcar(id,cod,nombre,costo) {
    const add = document.querySelector("#addProd"+id);
    add.innerHTML = '';
    add.innerHTML += `
        <div class="spinner-border spinner-border-sm" role="status">
        <span class="visually-hidden">Loading...</span>
        </div>
    ` 
    console.log(id)
    console.log(cod)
    console.log(nombre)
    console.log(costo)
    let cantidad= $('#cant'+id).val();
    console.log("cantidad :" +cantidad);
    let total= cantidad*costo; 
    let token = $('meta[name="csrf-token"]').attr("content");
    $.ajax({
        headers: {'X-CSRF-TOKEN': token}, 
        url:"/quotation/create_carrito",
        method:'POST',
        data:{id,cod,nombre,cantidad,costo,total},
        dataType:'json',
        beforeSend :function(xmlHttp){ 
        xmlHttp.setRequestHeader("If-Modified-Since","0"); 
        xmlHttp.setRequestHeader("Cache-Control","no-cache");
        },
        success:function(data){   
            console.log(data);
            add.innerHTML = '';
            add.innerHTML += `
                <i class="bi bi-plus"></i>
            ` 
            cargarDato(data);
        }
    });
}

function cargarDato(data){ 
    campo ='';
    total=0;
    data.forEach(row => {
        total+=row.total;
        campo+=`
            <tr> 
                <td>${row.cod}</td>
                <td> 
                <input type="text" id="cantidad${row.id}" class="form-control" size="4" onkeydown="fnInputEnter(event,${row.id});"  onchange="UpdateCarrito(${row.id});" value="${row.cantidad}"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">   
                </td>
                <td>${row.nombre}</td> 
                <td>
                <input type="text" id="precio${row.id}" class="form-control" size="5" onkeydown="fnInputEnter(event,${row.id});" onchange="UpdateCarrito(${row.id});" value="${row.precio}"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"> 
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
    $('#total').val(total);
} 

function UpdateCarrito(id) {
    console.log(id) 
    let cantidad=$('#cantidad'+id).val(); 
    let precio=$('#precio'+id).val();   
    let token = $('meta[name="csrf-token"]').attr("content");
    $.ajax({
        headers: {'X-CSRF-TOKEN': token}, 
        url:"/quotation/update_carrito",
        method:'POST',
        data:{id,cantidad,precio},
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
    $('#celular_cliente').val($row.telefono);
    $('#email_cliente').val($row.email);
});

/* SAVE THE DATA */
$('#my_form').on('submit', function (e) {
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
                $('#n_cotizacion').val(data.cod);
                $('#id_cliente').prop('selectedIndex', 0);
                $('#id_cliente').select2({
                    theme: "bootstrap-5",
                    width: '100%',
                });
                inputserie.value = "";
                inputserie.value = data.newserie;
                document.querySelector("#total").value = "";
                divtotal.innerHTML = "";
                divtotal.innerHTML += `${money(data.totalcotizacion)}`;
                divabono.innerHTML = "";
                divabono.innerHTML += `${money(data.abonocotizacion)}`;
                divapagar.innerHTML = "";
                divapagar.innerHTML += `${money(data.apagarcotizacion)}`;
                showcod.value = "";
                showcod.value = data.numcotizacion;
                let datacustomer = data.datacustomer[0];
                showemail.value = "";
                showemail.value = datacustomer.email;
                showphone.value = "";
                showphone.value = datacustomer.telefono;
                //console.log(datacustomer);
                btnpdf.innerHTML = "";
                btnpdf.innerHTML += `
                    <a href="/quotation/print/${data.id}" type="button" class="btn btn-success">Imprimir</a>
                `
                let myModalExitquotation = document.getElementById('showExitquotationModal');
                let modal = new bootstrap.Modal(myModalExitquotation);
                modal.show();
                //alert("La cotizacion se realizo con exito");
                //let link= `{{url('imprimir/pdf')}}/`+data.id;
                //$('#linkpdf').attr('href',`${link}`);
                //$('#modalcotizacion').modal('show');
            }
            seend.innerHTML = '';
            seend.innerHTML += `
                <i class="bi bi-folder-plus"></i> Guardar</i>
            ` 
            seend.disabled = false;
        }
    });
});

function deleteProd(id){
    console.log(id)  
    let token = $('meta[name="csrf-token"]').attr("content");
    $.ajax({
        headers: {'X-CSRF-TOKEN': token}, 
        url:"/quotation/delete",
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

const cotiAbono = document.querySelector("#abono");
cotiAbono.addEventListener("keyup", event =>{
    console.log(cotiAbono.value)
    const  aPagar = document.querySelector("#apagar");
    const  venTotal = document.querySelector("#total");
    const cantAbono = Number(cotiAbono.value);
    //const totalreplace = venTotal.value.replace(/\s+/g, '');
    //const vtotal = Number.parseFloat(totalreplace);
    const totalNum = Number(venTotal.value);
    
    if (venTotal.value != "") {
        let operacion = totalNum - cantAbono;
        aPagar.value = operacion;
    }
    //console.log(Number(totalreplace));
});


function fnInputEnter(event,id) {
    console.log("enter")
    if (event.keyCode === 13) {
        console.log("Input submitted: ", id);
        UpdateCarrito(id);
    }
}