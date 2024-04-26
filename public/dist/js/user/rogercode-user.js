import { saveForm } from "../exportModule/core/rogercode-core.js";
import { errorMessage,successMessage } from "../exportModule/messages/rogercode-message.js";

btnAdd.addEventListener("click", (e) =>{
	saveForm("/admin/newuser",formUser,getToken).then(result => {
		console.log(result);
        if (result.status === 1) {
            btncloseform.click();
            formUser.reset();
            refresh_table_users();
            successMessage(result.message);
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

btnchangepassword.addEventListener("click", (e) =>{
    e.preventDefault();
	saveForm("/admin/updatepassword",formPassword,getToken).then(result => {
		console.log(result);
        if (result.status === 1) {
            btnclosepassword.click();
            formPassword.reset();
            refresh_table_users();
            successMessage(result.message);
        }
        if (result.status === 0) {
            let error = "";
            const mensaje_password = result.message;
            mensaje_password.forEach(element => {
                error += "<li>" + element + "</li>";
            });
            errorMessage(error);
        }
    });
});