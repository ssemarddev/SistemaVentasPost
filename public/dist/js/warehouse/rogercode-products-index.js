let getToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const divMayMen = document.querySelector(".mayoreoMenudeo1");
const btnaddproducto = document.querySelector("#btnAddProducto");
const selectTipoUnidad = document.querySelector("#tipoUnidad");

$(document).ready(function () {
    $(function () {
        $("#tableProducts").DataTable({
            paging: true,
            pageLength: 5,
            /*"lengthChange": false,*/
            autoWidth: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: "/showproducts",
                type: "GET",
            },
            columns: [
                { data: 'codigo', name: 'codigo'},
                { data: "nombre", name: "nombre" },
                { data: "pstock", name: "pstock" },
                { data: "costo", name: "costo" },
                { data: "venta", name: "venta" },
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
    $('#id').val(0);   
    $('#nombre').val('');
    $('#descripcion').val('');
    $('#codigo').val('');
    $('#precio_costo').val('');
    $('#precio_venta').val('');
    $('#stock').val('');
    $('#stock_min').val('');
    $('#estado').val(1);  
    $('#mayoreoPrecioVenta').val(0);
    $('#mayoreoCantidad').val(0);
    $('#mayoreoPrecioVenta2').val(0);
    $('#mayoreoCantidad2').val(0);
    $('#tipoUnidad').prop('selectedIndex', 0);
    $('#id_categ').prop('selectedIndex', 0);
    $('#id_subcateg').prop('selectedIndex', 0);
    $('#id_proveedor').prop('selectedIndex', 0);
    //$('#impuestos').prop('selectedIndex', 0);
    $('#maneja_inventario').prop('selectedIndex', 0);
    divMayMen.style.display = "none";
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
            //console.log(data);
            $('#id').val(data.id);
            $('#id_categ').val(data.id_categ);
            $('#id_subcateg').val(data.id_subcateg);
            $('#id_proveedor').val(data.id_proveedor);
            $('#codigo').val(data.codigo);
            $('#nombre').val(data.nombre);
            $('#descripcion').val(data.descripcion);
            $('#tipoUnidad').val(data.tipounidad_id);
            $('#mayoreoPrecioVenta').val(data.mayoreo_pventa);
            $('#mayoreoCantidad').val(data.mayoreo_cantidad);
            $('#mayoreoPrecioVenta2').val(data.mayoreo_pventa2);
            $('#mayoreoCantidad2').val(data.mayoreo_cantidad2);
            //$('#impuestos').val(data.impuestos);
            //$('#estado').val(data.estado);
            $('#precio_costo').val(data.precio_costo);
            $('#precio_venta').val(data.precio_venta);
            $('#stock').val(data.stock);
            $('#stock_min').val(data.stock_min);
            //$('#maneja_inventario').val(data.maneja_inventario);
            // $('imagen').val('');
            if (data.tipounidad_id == 2) {
                divMayMen1Element.style.display = "block";
                divMayMen2Element.style.display = "block";
            }
            if (data.tipounidad_id == 1) {
                divMayMen.style.display = "none";
            }
            $('#newproduct').modal('show');
        }
    });
}