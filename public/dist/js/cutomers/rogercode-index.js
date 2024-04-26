const formaddcustomer = document.querySelector('#formAddCustomer');
const getToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const btnaddcustomer = document.querySelector('#btnAddCustomer');
const btncloseformcustomer = document.querySelector('#btnCloseFormCustomer');

$(document).ready(function () {
	/*$.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });*/
    $(function() {
        $('#tableCustomers').DataTable({
            "paging": true,
            "pageLength": 5,
            /*"lengthChange": false,*/
            "autoWidth": false,
            processing: true,
            serverSide: true,
            ajax: {
                url:'/showlistcustomers',
                type: 'GET',
            },
            columns: [
                //{ data: 'id', name: 'id'},
                { data:'nombres', name: 'nombres'},
                { data:'rut', name: 'rut'},
                { data: 'telefono', name: 'telefono'},
                { data: 'email', name: 'email' },
                { data:'status', name: 'status'},
                { data: 'date', name: 'date' },
                {data: 'action', name:'action'}
            ],
            //order: [[0, 'ASC']],
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

const Editar = (id) => {
  //console.log(id)
    $.ajax({
        url:"/cliente/getById",
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
            $('#nombres').val(data.nombres);
            $('#rut').val(data.rut);
            $('#telefono').val(data.telefono);
            $('#direccion').val(data.direccion);
            $('#email').val(data.email);
            if (data.estado==1) {
                $('#estado').val('1');  
            } else{ 
                $('#estado').val('0'); 
            }
            $('#newclient').modal('show');
        }
    });

}

function Nuevo() {
    $('#id').val(0);   
    $('#nombres').val('');
    $('#rut').val('');
    $('#telefono').val('');
    $('#direccion').val('');
    $('#email').val(''); 
    $('#estado').val('1');   
}

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

const refresh_table_customer = () => {
    var TableRefresh = $('#tableCustomers').dataTable(); 
     TableRefresh.fnDraw(false);
}