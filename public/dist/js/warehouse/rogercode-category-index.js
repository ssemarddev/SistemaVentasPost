const btnaddcategory = document.querySelector('#btnAddCategory');
const formcategory = document.querySelector('#formCategory');
const getToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const btncloseformcategory = document.querySelector('#btnCloseFormCategory');

$(document).ready(function () {
    $(function () {
        $("#tableCategory").DataTable({
            paging: true,
            pageLength: 5,
            /*"lengthChange": false,*/
            autoWidth: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: "/showcategory",
                type: "GET",
            },
            columns: [
                //{ data: 'id', name: 'id'},
                { data: "nombre", name: "nombre" },
                //{ data: "descripcion", name: "descripcion" },
                { data: "status", name: "status" },
                { data: "date", name: "date" },
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

function Nuevo() {
    $("#id").val(0);
    $("#nombre").val("");
    //$("#descripcion").val("");
    $("#estado").val("ACTIVO");
}

function Editar(id) { 
    $.ajax({
        url:"/category/getById",
        method:'GET',
        data:{id},
        dataType:'json',
        beforeSend :function(xmlHttp){ 
        xmlHttp.setRequestHeader("If-Modified-Since","0"); 
        xmlHttp.setRequestHeader("Cache-Control","no-cache");
        },
        success:function(data){  
            console.log(data)
            $('#id').val(data.id);   
            $('#nombre').val(data.nombre); 
            //$('#descripcion').val(data.descripcion); 
            if (data.estado==1) {
                $('#estado').val('1');  
            } else{ 
                $('#estado').val('0'); 
            }
            $('#newcategory').modal('show');
        }
    });
}

const refresh_table_category = () => {
    var TableRefresh = $('#tableCategory').dataTable(); 
     TableRefresh.fnDraw(false);
}