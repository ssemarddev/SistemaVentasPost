import { registerNewProduct,msgSuccessMising,refresh_table_prod, fnValidateUnidad } from '../exportModule/rogercode-products.js'
import { loadingStart, loadingEnd } from '../exportModule/core/rogercode-core.js';
import  { errorMessage} from '../exportModule/messages/rogercode-message.js';

let formAddProd = document.querySelector('#formAddProduct');
let btncloseaddproduct = document.querySelector('#btnCloseProd');

btnaddproducto.addEventListener('click', (e) => {
	e.preventDefault();
	loadingStart(btnaddproducto);
	let url = "/products/create";
    console.log(selectElement.value);
    console.log(inputMay1PVenta.value);
    const selectProdUnidad = Number(selectElement.value);
    if (selectProdUnidad == 2) { //unidad mayoreo
        let getAction = fnValidateUnidad();
        console.log(getAction);
        if (getAction.action == false) {
            errorMessage(getAction.msgErrorUnidad);
            loadingEnd(btnaddproducto,"","Guardar");
            return false;
        }
    }
    //console.log("paso el testing product");
	registerNewProduct(url,formAddProd,getToken).then(result =>{
		console.log(result);
        if (result.status === 1) {
            btncloseaddproduct.click();
			refresh_table_prod();
            formAddProd.reset();
            msgSuccessMising(result.message);
        }
        if (result.status === 0) {
            let error = "";
            const mensaje_validacion_product= result.errores;
            mensaje_validacion_product.forEach(element => {
                error += "<li>" + element + "</li>";
            });
            errorMessage(error);
        }
		loadingEnd(btnaddproducto,"","Guardar");
	});
	
});



