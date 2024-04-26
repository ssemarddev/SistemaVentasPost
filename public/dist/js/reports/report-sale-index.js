console.log("added");
import {saveForm, loadingStart, loadingEnd} from "../exportModule/core/rogercode-core.js";
import {errorMessage} from '../exportModule/messages/rogercode-message.js';

let form_date = document.querySelector("#get-date-form");
let btn_graph = document.querySelector("#btn-send-date");
let showDataTbody = document.querySelector("#tbody");
let tfoot = document.querySelector("#tfoot");

let getToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

btn_graph.addEventListener("click", (e) =>{
	e.preventDefault();
    console.log("test");
	let url = "/report/sale";

	loadingStart(btn_graph);
	saveForm(url,form_date,getToken).then(result => {
		console.log(result);
		console.log(result.reg);
		if (result.status === 1) {
			let dataReg = result.reg;
			showDataTbody.innerHTML = "";
			dataReg.forEach(element => {
				console.log(element)
				showDataTbody.innerHTML += `
				<tr>
					<td></td>
					<td>${money(element.ventaefectivo)}</td>
					<td>${money(element.ventatcredito)}</td>
					<td>${money(element.ventatdebito)}</td>
					<td>${money(element.ventatransferencia)}</td>
					<td>${money(element.abono)}</td>
					<td>${money(element.abonoefectivo)}</td>
					<td>${money(element.abonotcredito)}</td>
					<td>${money(element.abonotdebito)}</td>
					<td>${money(element.abonotransferencia)}</td>
				</tr>
				`;
			
			});
			let dataTfoot = result.total;
			tfoot.innerHTML = "";
			dataTfoot.forEach(element => {
				console.log(element)
				let sumGlobal = Number(element.sumVentaEfectivo) + 
				Number(element.sumVentaCredito) + Number(element.sumVentaDebito)+
				Number(element.sumVentaTransferencia) + Number(element.sumAbono)+
				Number(element.sumAbonoEfectivo) + Number(element.sumAbonoCredito)+
				Number(element.sumAbonoDebito) + Number(element.sumAbonoTransferencia);

				tfoot.innerHTML += `
              	<tr>
                	<th>Totales</th>
                	<th>${money(element.sumVentaEfectivo) ?? 0}</th>
                	<th>${money(element.sumVentaCredito) ?? 0}</th>
                	<th>${money(element.sumVentaDebito) ?? 0}</th>
                	<th>${money(element.sumVentaTransferencia) ?? 0}</th>
                	<th>${money(element.sumAbono) ?? 0}</th>
                	<th>${money(element.sumAbonoEfectivo) ?? 0}</th>
                	<th>${money(element.sumAbonoCredito) ?? 0}</th>
                	<th>${money(element.sumAbonoDebito) ?? 0}</th>
	            	<th>${money(element.sumAbonoTransferencia) ?? 0}</th>
              	</tr>
              	<tr>
                	<th colspan="6"></th>
                	<th><a href="/reportventas/print/${result.dateStart}/${result.dateEnd}" target="_blank" class="btn btn-success">Imprimir</a></th>
					<td colspan="2" class="text-center"><strong>Total Global</strong></td>
	            	<th>${money(sumGlobal)}</th>
              	</tr>
				`;

			});
		}
        if (result.status === 0) {
			errorMessage(result.message);
        }

		loadingEnd(btn_graph,"bi bi-folder-plus","Aceptar");

		/*if (result.status === 1) {
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
			errorMessage(result.message);
        	}

		loadingEnd(btnSaveCompra,"bi bi-folder-plus","Guardar");*/

	});
})