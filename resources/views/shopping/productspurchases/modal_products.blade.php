 
<div class="modal fade" id="search_products" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">BUSCAR PRODUCTOS</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" id="reset-btn" aria-label="Close"></button>
            </div> 
            <div class="modal-body"> 
                <div class="">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered" id="searchProducts">
                            <thead>
                            <tr>
                                <th>COD</th> 
                                <th>PRODUCTO</th> 
                                <th>STOCK</th> 
                                <th>CANT</th> 
                                <th>PRECIO PROVEEDOR</th> 
                                <th><i class="bi bi-gear"></i></th> 
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>  
            </div> 
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

@section("showProd")
<script type="text/javascript">
    console.log('executing js here..')
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
                    { data: "preciocosto", name: "preciocosto" },
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

</script>
@endsection