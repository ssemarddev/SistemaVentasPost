import { registerNewProduct,msgSuccessMising,fnValidateUnidad } from '../exportModule/rogercode-products.js'
import { registerNewSale } from '../exportModule/sale/rogercode-sales.js'
import { errorMessage,successMessage, toastSuccessMessage } from '../exportModule/messages/rogercode-message.js';
import { sendData, loadingStart, loadingEnd } from '../exportModule/core/rogercode-core.js';

const abonototal = document.querySelector("#abonoTotal");
const abonoPago = document.querySelector("#abonoPago");
const abonoapagar = document.querySelector("#abonoApagar");
const abonocodigo = document.querySelector("#abonoCodigo");

let getToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

const btncloseaddproduct = document.querySelector("#btnCloseProduct");
const formProd = document.querySelector("#saveProduct");
const btnprodsave = document.querySelector("#saveNewProduct");

btnprodsave.addEventListener("click", (e) => {
    e.preventDefault();
    loadingStart(btnprodsave);
    let url = "/products/create";
    const selectProdUnidad = Number(selectElement.value);
    console.log(selectProdUnidad);
    if (selectProdUnidad == 2) { //unidad mayoreo
        let getAction = fnValidateUnidad();
        console.log(getAction);
        if (getAction.action == false) {
            errorMessage(getAction.msgErrorUnidad);
            loadingEnd(btnprodsave,"","Guardar");
            return false;
        }
    }
    registerNewProduct(url,formProd,getToken).then(result => {
        console.log(result);
        if (result.status === 1) {
            btncloseaddproduct.click();
            formProd.reset();
            divMayMen1Element.style.display = "none";
            divMayMen2Element.style.display = "none";
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
		loadingEnd(btnprodsave,"","Guardar");
    });
});


const tiposDeVenta = {
    /*EFECTIVO: function () {
        let url = "/sales/createventa";
        let tipoReg = "venta";
        sendDataForm(url,tipoReg);
    },
    TRANSFERENCIA: function () {
        let url = "/sales/createventa";
        let tipoReg = "venta";
        sendDataForm(url,tipoReg);
    },
    ["T.DEBITO"]: function () {
        let url = "/sales/createventa";
        let tipoReg = "venta";
        sendDataForm(url,tipoReg);
    },
    ["T.CREDITO"]: function () {
        let url = "/sales/createventa";
        let tipoReg = "venta";
        sendDataForm(url,tipoReg);
    },
    ["CREAR ABONO"]: function () {
        let url = "/paymentmoney/create";
        let tipoReg = "abono";
        sendDataForm(url,tipoReg);
    },
    ["PAGAR ABONO"]: function () {
        $('.select-single').prop('disabled', false);
        tipocomprobante.disabled = false;
        numabonomanual.disabled = false;
        pago.disabled = false;
        totalPago.disabled = false;
        let url = "/sales/createventa";
        let tipoReg = "ventaAbono";
        sendDataForm(url,tipoReg);
    },*/
    ["VENTA NORMAL"]: function () {
        let url = "/sales/createventa";
        let tipoReg = "venta";
        sendDataForm(url,tipoReg);
        console.log("venta normal");
    },
    ["CREAR ABONO"]: function () {
        let url = "/paymentmoney/create";
        let tipoReg = "abono";
        sendDataForm(url,tipoReg);
        console.log("crear un abono");
    },
    ["PAGAR ABONO"]: function () {
        $('.select-single').prop('disabled', false);
        tipocomprobante.disabled = false;
        numabonomanual.disabled = false;
        pago.disabled = false;
        totalPago.disabled = false;

        showtipoabono.disabled = false;
        showcantabono.disabled = false;

        let url = "/sales/createabonoventa";
        let tipoReg = "ventaAbono";
        sendDataForm(url,tipoReg);
    },

}

const sendDataForm = (url,tipoReg) => {
    const seend = document.querySelector("#btnSave");
    seend.disabled = true;
    seend.innerHTML = '';
    seend.innerHTML += `
        <div class="spinner-border spinner-border-sm" role="status">
        <span class="visually-hidden">Loading...</span>
        </div>
    ` 
    registerNewSale(url,myFormSale,getToken).then(result => {
        console.log(result);
        if (result.status === 1) {
            document.querySelector("#my_form").reset();
            $('#tbody').html('')
            $('#totalp').html('$ '+0);
            $('#numComprobante').val(result.numComp);
            $('#id_cliente').prop('selectedIndex', 0);
            $('#id_cliente').select2({
                theme: "bootstrap-5",
                width: '100%',
            });

            typesale.value = "";
            typesale.value = "Sale";
            document.querySelectorAll("#TipoVenta option").forEach(opt => {
                if (opt.value == "PAGAR ABONO") {
                    opt.disabled = true;
                }
            });

            if (tipoReg === "venta") {
                showModalExitSale(result);
            }

            if (tipoReg === "abono") {
                showModalAbono(result);
            }

            if (tipoReg === "ventaAbono") {
                showModalSaleAbono(result);
            }
        }
        if (result.status === 0 && tipoReg === "venta") {
            errorMessage(result.message);
        }
        if (result.status === 0 && tipoReg === "abono") {
            $('.select-single').prop('disabled', true);
            errorMessage(result.message);
        }
        if (result.status === 0 && tipoReg === "ventaAbono") {
            $('.select-single').prop('disabled', true);
            pago.disabled = false;
            btnAddPago.disabled = false;
            totalPago.disabled = false;
            showtipoabono.disabled = true;
            showcantabono.disabled = true;
            errorMessage(result.message);
        }
        seend.innerHTML = '';
        seend.innerHTML += `
            <i class="bi bi-folder-plus"></i> Guardar</i>
        `
        seend.disabled = false;
    });
}

const showModalAbono = (result) => {
    let contentabono = document.querySelector("#contentAbono");
    contentabono.innerHTML = "";
    contentabono.innerHTML =`
		<div class="col-md-6 border border-1">TOTAL VENTA</div>
		<div class="col-md-6 border border-1" id="abonoTotal">${money(result.totalAbono)}</div>
		<div class="col-md-6 border border-1">ABONO ${result.tipoAbonoPago}</div>
		<div class="col-md-6 border border-1" id="abonoPago">${money(result.abono)}</div>
		<div class="col-md-6 border border-1">A PAGAR</div>
		<div class="col-md-6 border border-1" id="abonoApagar">${money(result.apagar)}</div>
		<div class="col-md-6 border border-1">CODIGO ABONO</div>
		<div class="col-md-6 border border-1" id="abonoCodigo">${result.codabono}</div>
    `;

    btnAddPago.disabled = false;
    let myModalAbono = document.getElementById('salePaymentModal');
    let modal = new bootstrap.Modal(myModalAbono);
    modal.show();
}

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
    /*inputVentaId.value = "";testing
    inputVentaId.value = result.ventaId;*///testing
    divticketpdf.innerHTML = ``;
    divticketpdf.innerHTML += `
        <a class="btn btn-primary" href="/salesticket/print/${result.ventaId}" target="_blank">Imprimir</a>
    `;
    let myModalExitSale = document.getElementById('showExitSaleModal');
    let modal = new bootstrap.Modal(myModalExitSale);
    modal.show();
}

const showModalSaleAbono = (result) => {

    let contentsale = document.querySelector("#contentSaleExit");
    contentsale.innerHTML = "";
    contentsale.innerHTML = `
        <div class="row">
        <div class="col-md-6 border border-1">TOTAL VENTA</div>
        <div class="col-md-6 border border-1">${money(result.totalventa)}</div>
        <div class="col-md-6 border border-1">ABONO</div>
        <div class="col-md-6 border border-1">${money(result.cantAbono)}</div>
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
        exitdinero.innerHTML = `${money(result.dinero)}`;
        totalPago.disabled = false;
        btnAddPago.disabled = false;
    }

    contentsale.innerHTML += `
        <div class="container text-center mt-3">
        <h5 ><b>VUELTO</b></h5>
        <h5>${money(result.cambio)}</h5>
        </div>
    `;
    /**************************** */
    showtipoabono.value = "";
    showtipoabono.disabled = false;
    divshowtipoabono.style.display = "none";
    showcantabono.value = "";
    showcantabono.disabled = false;
    divContentCantAbono.style.display = "none";
    tipoventa.disabled = false;
    /************* ***********/
    let myModalExitSale = document.getElementById('showExitSaleModal');
    let modal = new bootstrap.Modal(myModalExitSale);
    modal.show();

    //console.log(result);
    /*let contentsale = document.querySelector("#contentSaleExit");
    contentsale.innerHTML = "";
    contentsale.innerHTML = `
        <div class="row">
        <div class="col-md-6 border border-1">TOTAL VENTA</div>
        <div class="col-md-6 border border-1">${money(result.totalventa)}</div>
        <div class="col-md-6 border border-1">${result.serieAbono}</div>
        <div class="col-md-6 border border-1" >${money(result.dinero)}</div>
        <div class="col-md-6 border border-1">${result.otrotipopago}</div>
        <div class="col-md-6 border border-1" >${money(result.otrocantidadpago)}</div>
        </div>
    `;
    
    otroMetodoPago.value = "";
    pagoWithTarjeta.value = "";
    pagoWithTarjeta.style.display ='none';
    otroMetodoPago.style.display ='none';

    let myModalExitSale = document.getElementById('showExitSaleModal');
    let modal = new bootstrap.Modal(myModalExitSale);
    modal.show();*/
    
}

myFormSale.addEventListener("submit", (e) => {
    e.preventDefault();
    //let tipo = pago.value;
    //console.log(tipo);
    //tiposDePago[tipo]();
    console.log(tipoventa.value);
    let tipo = tipoventa.value;
    tiposDeVenta[tipo]();
});

tipoventa.addEventListener("change", (e) => {//CHANGE TYPE PAGO
    console.log(tipoventa.value);
    if (tipoventa.value === "CREAR ABONO") {
        btnAddPago.disabled = true;
        totalPago.disabled = false;
    }

    if (tipoventa.value  !== "CREAR ABONO") {
        btnAddPago.disabled = false;
    }
    
});

btnPrintEfectivo.addEventListener("click", (e) => {//the function is the testing for the moment
    e.preventDefault();
    btnPrintEfectivo.disabled = true;
    const dataform = new FormData();
    dataform.append("ventaId", inputVentaId.value);
    sendData("/sales/print",dataform,getToken).then((result) => {
        console.log(result);
        if (result.status === 1) {
            toastSuccessMessage(result.message);
        }
        if (result.status === 0) {
            errorMessage(result.message);
        }
        btnPrintEfectivo.disabled = false;
    });
});
