import { saveForm } from "../exportModule/core/rogercode-core.js";
import { loadingEnd, loadingStart } from "../exportModule/core/rogercode-core.js";
import { errorMessage, successMessage } from "../exportModule/messages/rogercode-message.js";

console.log("Starting category");
btnaddcategory.addEventListener("click", (e) => {
    e.preventDefault();
	loadingStart(btnaddcategory);
	let url = "/category/create";
	saveForm(url,formcategory,getToken).then(result =>{
        console.log(result)
        if (result.status === 1) {
            btncloseformcategory.click();
			refresh_table_category();
           formcategory.reset();
           successMessage(result.message);
        }
        if (result.status === 0) {
            let error = "";
            const mensaje_validacion_category = result.errores;
            mensaje_validacion_category.forEach(element => {
                error += "<li>" + element + "</li>";
            });
            errorMessage(error);
        }
		loadingEnd(btnaddcategory,"","Guardar");
    });
});
