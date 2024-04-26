
export const registerNewProduct = async (url,form,token) => {
    try {
        const dataform = new FormData(form);
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

export const msgSuccessMising = (message) => {
	const Toast = Swal.mixin({
	toast: true,
	position: 'top-end',
	showConfirmButton: false,
	timer: 3000,
	timerProgressBar: true,
	didOpen: (toast) => {
	toast.addEventListener('mouseenter', Swal.stopTimer)
	toast.addEventListener('mouseleave', Swal.resumeTimer)
	}
	})

	Toast.fire({
	icon: 'success',
	title: message
	})
}


export const refresh_table_prod = () => {
    var TableRefresh = $('#tableProducts').dataTable(); 
     TableRefresh.fnDraw(false);
}
export const obj = {
	data: function () {
		alert('hi');

	}
	
}


export const fnValidateUnidad = () => {
    const inputPv1 = Number(inputMay1PVenta.value);
    const inputCant1 = Number(inputMay1Cantidad.value);
    const inputPv2 = Number(inputMay2PVenta.value);
    const inputCant2 = Number(inputMay2Cantidad.value);
    let action = true;
    let msgErrorUnidad = "";
    if (inputPv1 == "" || inputPv1 == 0 || inputCant1 == "" || inputCant1 == 0) {
        msgErrorUnidad = "Error: ingresa las cantidades para Vent.unid 1";
        action = false;
    }
    if(inputCant2 != "" && inputPv2 == ""){
        console.log("falta el precio de venta")
        msgErrorUnidad = "falta el precio de venta";
        action = false;
    }
    if(inputCant2 == "" && inputPv2 != ""){
        console.log("falta La cantidad de venta")
        msgErrorUnidad = "falta La cantidad de venta";
        action = false;
    }
    if(inputCant2 != "" && inputPv2 != ""){
        if (inputCant2 <= inputCant1) {
            console.log("Error: La cantidad de precio de venta 2 es menor que el precio de venta 1");
            msgErrorUnidad = "Error: La cantidad de precio de venta 2 es menor que el precio de venta 1";
            action = false;
        }
    }

    return {
        action,
        msgErrorUnidad,
    }
}