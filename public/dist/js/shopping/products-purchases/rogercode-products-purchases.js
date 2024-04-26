console.log("Starting")
import {saveForm,loadingStart,loadingEnd } from "../../exportModule/core/rogercode-core.js";
import { errorMessage,successMessage } from '../../exportModule/messages/rogercode-message.js';

btnSaveCompra.addEventListener("click", (e) =>{
	e.preventDefault();
	let url = "/productpurchases/store";

	loadingStart(btnSaveCompra);
	saveForm(url,myFormCompra,getToken).then(result => {
		//console.log(result);
		if (result.status === 1) {
			myFormCompra.reset();
			tbody.innerHTML = "";
			showTotalp.innerHTML = "$ "+0;
			$('#numComprobante').val(result.numComp);
            		$('#id_proveedor').prop('selectedIndex', 0);
            		$('#id_proveedor').select2({
                		theme: "bootstrap-5",
                		width: '100%',
            		});
			showModalExitSale(result);
		}
        	if (result.status === 0) {
			//$('.select-single').prop('disabled', true);
			errorMessage(result.message);
        	}

		loadingEnd(btnSaveCompra,"bi bi-folder-plus","Guardar");

	});
})


const showModalExitSale = (result) => {
    let contentsale = document.querySelector("#contentSaleExit");
    contentsale.innerHTML = "";
    contentsale.innerHTML = `
        <div class="row">
        <div class="col-md-6 border border-1">TOTAL VENTA</div>
        <div class="col-md-6 border border-1">${money(result.totalventa)}</div>
        <div class="col-md-6 border border-1">${result.tipopago}</div>
        <div class="col-md-6 border border-1" id="exitdinero"></div>
        </div>
    `;

    let exitdinero = document.querySelector("#exitdinero");
    if (result.tipopago === "EFECTIVO") {
        exitdinero.innerHTML = `${money(result.dinero)}`;
        if (result.otrotipopago != null && result.otrocantidadpago != null) {
            contentsale.innerHTML +=`
                <div class="row">
                <div class="col-md-6 border border-1">${result.otrotipopago}</div>
                <div class="col-md-6 border border-1">${money(result.otrocantidadpago)}</div>
                </div>
            `;     
            otroMetodoPago.value = "";
            pagoWithTarjeta.value = "";
            pagoWithTarjeta.style.display ='none';
            otroMetodoPago.style.display ='none';
        }
    }else{
        exitdinero.innerHTML = `${money(result.totalventa)}`;
        totalPago.disabled = false;
        btnAddPago.disabled = false;
    }

    contentsale.innerHTML += `
        <div class="container text-center mt-3">
        <h5 ><b>VUELTO</b></h5>
        <h5>${money(result.cambio)}</h5>
        </div>
    `;
    
    let myModalExitSale = document.getElementById('showExitSaleModal');
    let modal = new bootstrap.Modal(myModalExitSale);
    modal.show();
}