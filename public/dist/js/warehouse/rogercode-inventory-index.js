$(document).ready(function () {
    $(function () {
        $("#tableInventory").DataTable({
            paging: true,
            /*pageLength: 5,*/
            /*"lengthChange": false,*/
            autoWidth: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: "/showinventory",
                type: "GET",
            },
            columns: [
                //{ data: 'id', name: 'id'},
                { data: 'codigo', name: 'codigo'},
                { data: "nombre", name: "nombre" },
                { data: "pstock", name: "pstock" },
                { data: "pvendidos", name: "pvendidos" },
                { data: "pventa_acumulada", name: "pventa_acumulada" },
                { data: "status", name: "status" },
                //{ data: "producto_id", name: "producto_id" },
                //{ data: "action", name: "action" },
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
    $('#id').val(0);   
    $('#nombre').val('');
    $('#descripcion').val('');
    $('#codigo').val('');
    $('#precio_costo').val('');
    $('#precio_venta').val('');
    $('#stock').val('');
    $('#stock_min').val('');
    $('#estado').val(1);  
    $('#id_categ').prop('selectedIndex', 0);
    $('#id_proveedor').prop('selectedIndex', 0);
    $('#impuestos').prop('selectedIndex', 0);
    $('#maneja_inventario').prop('selectedIndex', 0);
             
}


function Editar(id) { 
    $.ajax({
        url:"/products/getById",
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
            $('#id_categ').val(data.id_categ);
            $('#id_proveedor').val(data.id_proveedor);
            $('#codigo').val(data.codigo);
            $('#nombre').val(data.nombre);
            $('#descripcion').val(data.descripcion);
            $('#impuestos').val(data.impuestos);
            $('#estado').val(data.estado);
            $('#precio_costo').val(data.precio_costo);
            $('#precio_venta').val(data.precio_venta);
            $('#stock').val(data.stock);
            $('#stock_min').val(data.stock_min);
            $('#maneja_inventario').val(data.maneja_inventario);
            // $('imagen').val('');
            $('#newproduct').modal('show');
        }
    });
}