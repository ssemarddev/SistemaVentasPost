const btnaddprovider = document.querySelector("#btnAddProvider");
const formprovider = document.querySelector("#formProviders");
const getToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const btncloseformprovider = document.querySelector('#btnCloseFormProvider');

$(document).ready(function () {
    $(function() {
        $('#tableCustomers').DataTable({
            "paging": true,
            "pageLength": 5,
            /*"lengthChange": false,*/
            "autoWidth": false,
            processing: true,
            serverSide: true,
            ajax: {
                url:'/showproviders',
                type: 'GET',
            },
            columns: [
                //{ data: 'id', name: 'id'},
                { data:'nombre_empresa', name: 'nombre_empresa'},
                { data:'rut', name: 'rut'},
                { data: 'telefono', name: 'telefono'},
                { data: 'correo', name: 'correo' },
                { data:'status', name: 'status'},
                { data: 'date', name: 'date' },
                {data: 'action', name:'action'}
            ],
            order: [[0, 'ASC']],
            language:{
		        "processing": "Procesando...",
    		    "lengthMenu": "Mostrar _MENU_ registros",
    		    "zeroRecords": "No se encontraron resultados",
    		    "emptyTable": "Ningún dato disponible en esta tabla",
		        "sInfo":      "Mostrando del _START_ al _END_ de total _TOTAL_ registros",
    		    "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
    		    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
    		    "search": "Buscar:",
    		    "infoThousands": ",",
    		    "loadingRecords": "Cargando...",
		        "paginate": {
        	        "first": "Primero",
        	        "last": "Último",
        	        "next": "Siguiente",
        	        "previous": "Anterior"
    		    },
            },
        });
    });
});

function Nuevo(){
    $('#id').val(0);   
    $('#nombre_empresa').val('');
    $('#rut').val('');
    $('#telefono').val('');
    $('#vendedor').val('');
    $('#correo').val('');
    $('#direccion').val('');
    $('#nombre_banco').val('');
    $('#tipo_cuenta').val('');
    $('#numero_cuenta').val('');
    $('#estado').val('1');
}

function Editar(id) { 
    console.log(id);
    $.ajax({
        url:"/provider/getById",
        method:'GET',
        data:{id},
        dataType:'json',
        beforeSend :function(xmlHttp){ 
        xmlHttp.setRequestHeader("If-Modified-Since","0"); 
        xmlHttp.setRequestHeader("Cache-Control","no-cache");
        },
        success:function(data){ 
            console.log(data); 
            $('#id').val(data.id);   
            $('#nombre_empresa').val(data.nombre_empresa);
            $('#rut').val(data.rut);
            $('#telefono').val(data.telefono);
            $('#vendedor').val(data.vendedor);
            $('#correo').val(data.correo);
            $('#direccion').val(data.direccion);
            $('#nombre_banco').val(data.nombre_banco);
            $('#numero_cuenta').val(data.numero_cuenta); 
            if (data.estado==1) {
                $('#estado').val('1');  
            } else{ 
                $('#estado').val('0'); 
            }
            let tipoCuenta = data.tipo_cuenta;
            switch (tipoCuenta) {
                case "CORRIENTE":
                    $('#tipo_cuenta').val("CORRIENTE");
                    break;
                case "VISTA":
                    $('#tipo_cuenta').val("VISTA");
                    break;
                case "RUT":
                    $('#tipo_cuenta').val("RUT");
                    break;
                case "PREPAGO":
                    $('#tipo_cuenta').val("PREPAGO");
                    break;
                
                default:
                    break;
            }

            $('#newproveedor').modal('show');
        }
    });
}

/**********************************************/
const validateRut = (event)  => {
    console.log(event.target.value);
    let rut = event.target.value;
    let clearRut = rut.replace(/\.|-/g, '');
    let setRut = document.querySelector("#rut");
    if (typeof clearRut !== "string" || clearRut.length < 8 || clearRut.length > 9) { //the validate if correct rut
        setRut.value = "";
        return false;
    }
    /*******format url***********/
    setRut.value = "";
    setRut.value = formatRut(clearRut);
}

showDetailProvider = async (id) => {
    let providerResponse = await fetch(`/provider/getByIdProvider/${Number(id)}`);
    let dataResponseProvider = await providerResponse.json();
    console.log(dataResponseProvider);
    let status = '';
    if (dataResponseProvider.estado === 1) {
        status = "ACTIVO"
    }else{
        status = "INACTIVO"
    }
    let showDataProvider = document.querySelector(".tbodyProvider");
    showDataProvider.innerHTML = "";
    showDataProvider.innerHTML += `
        <tbody>
            <tr>
            <th scope="row">Empresa</th>
            <td>${dataResponseProvider.nombre_empresa}</td>
            </tr>
            <tr>
            <th scope="row">Rut</th>
            <td>${dataResponseProvider.rut}</td>
            </tr>
            <tr>
            <th scope="row">Telefono</th>
            <td colspan="2">${dataResponseProvider.telefono}</td>
            </tr>
            <tr>
            <th scope="row">Representante</th>
            <td colspan="2">${dataResponseProvider.vendedor}</td>
            </tr>
            <tr>
            <th scope="row">Email</th>
            <td colspan="2">${dataResponseProvider.correo}</td>
            </tr>
            <tr>
            <th scope="row">Direccion</th>
            <td colspan="2">${dataResponseProvider.direccion}</td>
            </tr>
            <tr>
            <th scope="row">Banco</th>
            <td colspan="2">${dataResponseProvider.nombre_banco}</td>
            </tr>
            <tr>
            <th scope="row">T. cuenta</th>
            <td colspan="2">${dataResponseProvider.tipo_cuenta}</td>
            </tr>
            <tr>
            <th scope="row">N. cuenta</th>
            <td colspan="2">${dataResponseProvider.numero_cuenta}</td>AA
            </tr>
            <tr>
            <th scope="row">Estado</th>
            <td colspan="2">${status}</td>
            </tr>
        </tbody>
    `;

    let myModalProvider = document.getElementById('showProviderModal');
    let modalshowProvider = new bootstrap.Modal(myModalProvider);
    modalshowProvider.show();
}


const refresh_table_provider = () => {
    var TableRefresh = $('#tableCustomers').dataTable(); 
     TableRefresh.fnDraw(false);
}