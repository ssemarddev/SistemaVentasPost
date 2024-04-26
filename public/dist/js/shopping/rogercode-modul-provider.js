import { saveForm } from "../exportModule/core/rogercode-core.js";
import { loadingEnd,loadingStart } from "../exportModule/core/rogercode-core.js";
import { errorMessage,successMessage } from "../exportModule/messages/rogercode-message.js";

btnaddprovider.addEventListener("click",(e) => {
    e.preventDefault();
	loadingStart(btnaddprovider);
	let url = "/provider/create";
	saveForm(url,formprovider,getToken).then(result =>{
        console.log(result)
        if (result.status === 1) {
            btncloseformprovider.click();
			refresh_table_provider();
           formprovider.reset();
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
		loadingEnd(btnaddprovider,"","Guardar");
    });
});
