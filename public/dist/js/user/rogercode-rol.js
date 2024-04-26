
import { saveForm } from "../exportModule/core/rogercode-core.js";
import { errorMessage,successMessage } from "../exportModule/messages/rogercode-message.js";

btnAdd.addEventListener("click", (e) =>{
	saveForm("/admin/newrole",formRol,getToken).then(result => {
		console.log(result);
        if (result.status === 1) {
            btnClose.click();
            formRol.reset();
            successMessage(result.message);
            refresh_table_roles();
        }
        if (result.status === 0) {
            let error = "";
            const mensaje_validacion_user = result.message;
            mensaje_validacion_user.forEach(element => {
                error += "<li>" + element + "</li>";
            });
            errorMessage(error);
        }
    });
});
