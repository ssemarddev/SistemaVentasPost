import { saveForm} from "../exportModule/core/rogercode-core.js";
import { loadingEnd, loadingStart } from "../exportModule/core/rogercode-core.js";
import  { errorMessage, successMessage } from '../exportModule/messages/rogercode-message.js';

btnaddcustomer.addEventListener("click",(e) => {
    e.preventDefault();
    console.log("Modul customer")
	loadingStart(btnaddcustomer);
	let url = "/cliente/create";
	saveForm(url,formaddcustomer,getToken).then(result =>{
        console.log(result)
        if (result.status === 1) {
            btncloseformcustomer.click();
			refresh_table_customer();
           formaddcustomer.reset();
           successMessage(result.message);
        }
        if (result.status === 0) {
            let error = "";
            const mensaje_validacion_customer = result.errores;
            mensaje_validacion_customer.forEach(element => {
                error += "<li>" + element + "</li>";
            });
            errorMessage(error);
        }
		loadingEnd(btnaddcustomer,"","Guardar");
    });
});