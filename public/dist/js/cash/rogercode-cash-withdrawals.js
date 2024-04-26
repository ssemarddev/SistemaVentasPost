    import { saveForm,loadingEnd,loadingStart } from "../exportModule/core/rogercode-core.js";
    import { errorMessage, toastSuccessMessage } from "../exportModule/messages/rogercode-message.js";

    btnAdd.addEventListener("click", (e) =>{
        e.preventDefault();
        let url = '/savecashwithdrawals';
        loadingStart(btnAdd);
	    saveForm(url,formsaveretiro,token).then(result => {
		    console.log(result);
		    if (result.status === 1) {
                toastSuccessMessage(result.message)
                refresh_table_cash_withdwawals();
                formsaveretiro.reset();
                btnCloseCash.click();
		    }
        	if (result.status === 0) {
                errorMessage(result.message);
        	}
		    loadingEnd(btnAdd,"bi bi-folder-plus","Guardar");
	    });
        /*let url = '/savecashwithdrawals';
        cashRegister(url,formsaveretiro).then(result => {
            console.log(result);
            if (result.status === 1) {
                refresh_table_cash_withdwawals();
                btnCloseCash.click();
            }
            if (result.status === 0) {
            alert(result.message);
            console.log(result);  
            }
        });*/
    });