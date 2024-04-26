const btnAdd = document.querySelector("#btnAddRegister");
const formsaveretiro = document.querySelector("#form_save_cashwithdrawals");
let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const btnCloseCash = document.querySelector("#btnclosecash");

$(document).ready(function () {
    $(function() {
        $('#tableCashWithdrawals').DataTable({
            "paging": true,
            "pageLength": 5,
            /*"lengthChange": false,*/
            "autoWidth": false,
            processing: true,
            serverSide: true,
            ajax: {
                url:'/showlistcashwithdrawals',
                type: 'GET',
            },
            columns: [
                { data: 'id', name: 'id'},
                { data:'showcantidad', name: 'showcantidad'},
                { data:'fecha', name: 'fecha'},
                { data: 'hora', name: 'hora'},
            ],
            order: [[0, 'DESC']],
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


/*const cashRegister = async (url,form) => {
    try {
        const dataform = new FormData(form);
        let response = await fetch(url, {
        headers: {
            'X-CSRF-TOKEN': token
        },
        method: 'POST',
        body: dataform
        });
        let data = await response.json();
        return data;
    } catch (error) {
        console.log(error);
    }
        
}*/

const refresh_table_cash_withdwawals = () => {
    var TableRefresh = $('#tableCashWithdrawals').dataTable(); 
     TableRefresh.fnDraw(false);
}