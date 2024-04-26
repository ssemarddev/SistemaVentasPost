const inputApertura  = document.querySelector("#pertId");
const insertCash = document.querySelector("#cantapertura"); 
const inputCantEnd = document.querySelector("#cantclose"); 
const showDateNow = document.querySelector(".showdate");
const btncloseape = document.querySelector("#btncloseapertura");
const btncerrarmodal = document.querySelector("#btncerrarmodal");
const contentPrint = document.querySelector("#content-print");

let formatDateNow = dateProperty.month +"-"+ dateProperty.day+"-"+dateProperty.year;
showDateNow.innerHTML = `${formatDateNow}`;
insertCash.value = 0;

/*********************** */
$(document).ready(function () {
	$.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $(function() {
        $('#tableCash').DataTable({
            "paging": true,
            "pageLength": 5,
            /*"lengthChange": false,*/
            "autoWidth": false,
            processing: true,
            serverSide: true,
            ajax: {
                url:'/showlistcashregister',
                type: 'GET',
            },
            columns: [
                { data:'name', name: 'name'},
                { data: 'date', name: 'date' },
                { data: 'hour', name: 'hour'},
                { data:'abierta', name: 'abierta'},
                { data:'end_hour', name: 'end_hour'},
                { data:'close', name: 'close'},
                { data:'ventas', name: 'ventas'},
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

const formsavecash = document.querySelector("#form_save_apertura");
/*SAVE APERTURA BOX*/
const savedata = document.querySelector("#btnsaveapertura");
savedata.addEventListener("click", (e) =>{
    e.preventDefault();
    if (insertCash.value === '') {
        return false;
    }
    let url = '/saveapertura';
    cash(url,formsavecash).then(result => {
        if (result.status === 1) {
            btncloseape.click();
            refresh_table_cash();
            Swal.fire(
                'Exito!',
                result.message,
                'success'
            )
        }
        if (result.status === 0) {
            Swal.fire(
                'Exito!',
                result.message,
                'error'
            )
        }
    });

});

const cash = async (url,form) => {
    try {
        const dataform = new FormData(form);
	    let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
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
        
}

getdata = async (ruta,id) => {
    try {
        let response = await fetch(ruta+id); 
        let data = await response.json();
        return data;
    } catch (error) {
        console.log(error)    
    }
}


const refresh_table_cash = () => {
    var TableRefresh = $('#tableCash').dataTable(); 
     TableRefresh.fnDraw(false);
}

/*const Nuevo = () => {
    insertCash.value = '';
}*/

const formClosecash = document.querySelector('#form_close_cash');
//CLOSE CASH
const btnCloseCash = document.querySelector('#btnCloseCash');
btnCloseCash.addEventListener('click', (e) => {
    e.preventDefault();
    if (inputCantEnd.value === '') {
        return false;
    }
    let url = '/closecash';
    cash(url,formClosecash).then(result => {
        if (result.status === 1) {
            btncerrarmodal.click();
            refresh_table_cash();
            Swal.fire(
                'Exito!',
                result.message,
                'success'
            )
        }
        if (result.status === 0) {
            Swal.fire(
                'Error!',
                result.message,
                'error'
            )
        }
    });

});

/**
 * 
 * @param {*} aperturaId 
 */
const editCash = (aperturaId) => {
    getdata('/getdatacashregister/',aperturaId).then(result => {
        let div = document.querySelector("#detailCloseCash");

        template(result,div,inputCantEnd);
        let myModalcloseCash = document.getElementById('closeCashModal');
        let modal = new bootstrap.Modal(myModalcloseCash);
        modal.show();
        //data-bs-toggle="modal" data-bs-target="#"
    });   

    inputApertura.value = "";
    inputApertura.value = Number(aperturaId); 
}

const verCash = (aperturaId) => {
    getdata('/getdatacashregister/',aperturaId).then(result => {
        console.log(result);

        let div = document.querySelector("#detailVerCash");
        template(result,div,null);
        let myModalverCash = document.getElementById('verCashModal');
        let modal = new bootstrap.Modal(myModalverCash);
        modal.show();
    });
}

const template = (resp, div, inputShow) => {
    let getdata = resp.data[0];
    console.log(getdata);
    let retiros = Number(resp.sumaRetiros)
    console.log(retiros);
    let moneytotal = Number(getdata.cantidad_inicial)+Number(getdata.ventaefectivo)+Number(getdata.ventatransferencia)+Number(getdata.ventatdebito)+Number(getdata.ventatcredito)+Number(getdata.abono);
    let onlytotal = Number(getdata.ventaefectivo)+Number(getdata.ventatransferencia)+Number(getdata.ventatdebito)+Number(getdata.ventatcredito)+Number(getdata.abono);
    div.innerHTML = "";
    div.innerHTML += `
        <div class="row">
        <div class="col-md-6 border border-1">
            Fecha
        </div>
        <div class="col-md-6 border border-1">
        ${formatDate(getdata.created_at)}
        </div>
        </div>
        <div class="text-center mt-2">
            <h4>Detalle</h4>
        </div>
        <div class="row">
        <div class="col-md-8 border border-1">
            Fondo
        </div>
        <div class="col-md-4 border border-1">
            ${money(getdata.cantidad_inicial)}
        </div>
        <div class="col-md-5 border border-1">
            Efectivo 
        </div>
        <div class="col-md-3 border border-1">
            ${resp.countsaleefectivo}
        </div>
        <div class="col-md-4 border border-1">
            ${money(getdata.ventaefectivo)}
        </div>
        <div class="col-md-5 border border-1">
            Retiros 
        </div>
        <div class="col-md-3 border border-1">
            ${resp.countRetiros}
        </div>
        <div class="col-md-4 border border-1">
            ${money(retiros)}
        </div>
        <div class="col-md-5 border border-1">
            Transferencia
        </div>
        <div class="col-md-3 border border-1">
           ${resp.countsaletransferencia}
        </div>
        <div class="col-md-4 border border-1">
            ${money(getdata.ventatransferencia)}
        </div>
        <div class="col-md-5 border border-1">
            Debito
        </div>
        <div class="col-md-3 border border-1">
            ${resp.countsaletdebito}
        </div>
        <div class="col-md-4 border border-1">
            ${money(getdata.ventatdebito)}
        </div>
        <div class="col-md-5 border border-1">
            Credito
        </div>
        <div class="col-md-3 border border-1">
            ${resp.countsaletcredito}
        </div>
        <div class="col-md-4 border border-1 ">
            ${money(getdata.ventatcredito)}
        </div>
        <div class="col-md-5 border border-1">
            Abono efectivo
        </div>
        <div class="col-md-3 border border-1">
            ${resp.countabonoefectivo}
        </div>
        <div class="col-md-4 border border-1 ">
            ${money(getdata.abonoefectivo)}
        </div>
        <div class="col-md-5 border border-1">
            Abono transferencia 
        </div>
        <div class="col-md-3 border border-1">
            ${resp.countabonotransferencia}
        </div>
        <div class="col-md-4 border border-1 ">
            ${money(getdata.abonotransferencia)}
        </div>
        <div class="col-md-5 border border-1">
            Abono debito
        </div>
        <div class="col-md-3 border border-1">
            ${resp.countabonotdebito}
        </div>
        <div class="col-md-4 border border-1 ">
            ${money(getdata.abonotdebito)}
        </div>
        <div class="col-md-5 border border-1">
            Abono credito
        </div>
        <div class="col-md-3 border border-1">
            ${resp.countabonotcredito}
        </div>
        <div class="col-md-4 border border-1 ">
            ${money(getdata.abonotcredito)}
        </div>
        </div>
        <div class="row mt-2">
        <div class="col-md-8 border border-1">
            Total 
        </div>
        <div class="col-md-4 border border-1 ">
            ${money(moneytotal)}
        </div>
        </div>
        <div class="text-center mt-2">
            <h4>Ventas</h4>
            <h5><b>${money(onlytotal)}</b></h5>
        </div>
    `; 
    if (inputShow !== null) {
        inputShow.value = '';
        inputShow.value = onlytotal;
    }
    /****************************** */
    contentPrint.innerHTML = "";
    contentPrint.innerHTML =`
        <a class="btn btn-success" id="btnGeneratePdf" target="_blank" href="/cashregister/print/${getdata.aperturaId}" >Imprimir</a>
    `;
}


/*SHOW AND HIDE CASH REGISTER*/
const divReg = document.querySelector('.cantregister');
const getvalueradio = (value) =>{
    if (document.querySelector('input[name="radiocash"]:checked')) {
        switch (value) {
           case "yes":
                divReg.style.display = "block";
                insertCash.value = '';
               break;
            case "no":
                divReg.style.display = "none";
                insertCash.value = 0;
                break;
           default:
               break;
        }
    }
}



