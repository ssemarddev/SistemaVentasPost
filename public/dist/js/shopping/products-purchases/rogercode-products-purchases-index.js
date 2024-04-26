console.log("The execute providers");
let getToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
let rutProveedor = document.querySelector('#rut_proveedor');
let emailProveedor = document.querySelector('#email_proveedor');
let showTotalp = document.querySelector('#totalp');
let compraTotal = document.querySelector('#total');
let tbody = document.querySelector('#tbody');
let btnSaveCompra = document.querySelector('#btnSave');
let myFormCompra = document.querySelector('#my_form');
const pagoWithTarjeta = document.querySelector("#cantPagoTarjeta");
const otroMetodoPago = document.querySelector("#otroTipoPago");
let pago = document.getElementById("tipoPago");
let totalPago = document.getElementById("apagar");
let totalVenta = document.getElementById("total");
const btnAddPago = document.querySelector("#btnAddTipoPago");

$(document).ready(function () {
    $('.select-single').select2({
        theme: "bootstrap-5",
        width: '100%',
    });
});


//const Addcar = async (id,cod,nombre,pventa,pcosto) => {
const Addcar = async (data) => {
    console.log(data);
    console.log(data[0]);
    let dataProd = data[0];
    const add = document.querySelector("#addProd"+dataProd.id);
    add.innerHTML = '';
    add.innerHTML += `
        <div class="spinner-border spinner-border-sm" role="status">
        <span class="visually-hidden">Loading...</span>
        </div>
    `
    let cantidad = document.querySelector('#cant'+dataProd.id).value;
    dataProd.cantidad = Number(cantidad);
    let total= cantidad*dataProd.precio_costo;
    dataProd.total= Number(total);
    //let total= cantidad*pcosto; 
    let formData = new FormData();
    formData.append("id",dataProd.id);
    formData.append("cod",dataProd.codigo);
    formData.append("nombre",dataProd.nombre);
    formData.append("cantidad",dataProd.cantidad);
    formData.append("pcosto",dataProd.precio_costo);
    formData.append("pventa",dataProd.precio_venta);
    formData.append("total",dataProd.total);

	//sendAction("/carrito/add",formData,getToken).then(result => {
	sendAction("/carrito/add",formData,getToken).then(result => {
        add.innerHTML = '';
        add.innerHTML += `
            <i class="bi bi-plus"></i>
        ` 
        cargarDato(result);
    });
}

const cargarDato = (data) => {
    let campo = '';
    let total = 0;
    data.forEach(row => {
        //total+=row.total;
        total = Number(total) + Number(row.total);
        campo+=`
            <tr> 
                <td>${row.codigo}</td>
                <td> 
                <input type="text" id="cantidad${row.id}" class="form-control" size="4" onkeydown="fnInputEnter(event,${row.id});" onchange="UpdateCarrito(${row.id});" value="${row.cantidad}"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">   
                </td>
                <td>${row.nombre}</td> 
                <td>
                <input type="text" id="precio${row.id}" class="form-control" size="5" onkeydown="fnInputEnter(event,${row.id});" onchange="UpdateCarrito(${row.id});" value="${row.precio_costo}"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"> 
                </td> 
                <td>${money(row.total)}</td> 
                <td> 
                    <button onclick="deleteProd(${row.id});" class=" btn btn-danger btn-sm bi bi-trash"></button>
                </td>
            </tr>
        `; 
    });
    tbody.innerHTML = "";
    tbody.innerHTML += campo;
    showTotalp.innerHTML = money(total);
    compraTotal.value = total;
}


$('.select-single').select2().on('change', function(e){
    $data = $( ".select-single option:selected").attr("data");
    let row = JSON.parse($data);
    //console.log(row);
    rutProveedor.value =row.rut;
    emailProveedor.value =row.correo;
});

const sendAction = async (url,form,token) => {
    try {
        let response = await fetch(url, {
        headers: {
            'X-CSRF-TOKEN': token
        },
        method: 'POST',
        body: form
        });
        let data = await response.json();
        return data;
    } catch (error) {
        console.log(error);
    }
}

function UpdateCarrito(id) {
    //console.log(id)  
    let cantidad = document.querySelector('#cantidad'+id).value; 
    let precio = document.querySelector('#precio'+id).value; 
    //console.log(cantidad)
    //console.log(precio)
    let formData = new FormData();
    formData.append("id",id );
    formData.append("cantidad",cantidad);
    formData.append("precio",precio);
	sendAction("/purchase/update_carrito",formData,getToken).then(result => {
        //console.log(result)
        cargarDato(result);
    });
} 

const fnInputEnter = (event,id) => {
    //console.log("enter")
    if (event.keyCode === 13) {
        //console.log("Input submitted: ", id);
        UpdateCarrito(id);
    }
}

const addPago = () => {
    pagoWithTarjeta.style.display ='block';
    otroMetodoPago.style.display ='block';

}

const changePagos = () => {
    if (pago.value != "EFECTIVO") {
        console.log(pago.value); 
        totalPago.value = totalVenta.value;
        
        otroMetodoPago.value = "";
        pagoWithTarjeta.value = "";
        totalPago.disabled = true;
        btnAddPago.disabled = true;
        pagoWithTarjeta.style.display ='none';
        otroMetodoPago.style.display ='none';
    }

    if(pago.value === "EFECTIVO"){
        totalPago.value = "";
        totalPago.disabled = false;
        btnAddPago.disabled = false;
    }

}


const changeOtroTipoPagos = () => {
    //console.log("changeOtroTipoPagos");
    //console.log(totalPago.value);
    //console.log(totalVenta.value);
    let faltante = totalVenta.value - totalPago.value;
    pagoWithTarjeta.value = faltante;
}

const deleteProd = (id) => {
    //console.log(id)  
    let formData = new FormData();
    formData.append("id",id );
	sendAction("/productpurchases/delete",formData,getToken).then(result => {
        //console.log(result)
        cargarDato(result.carrito);
    });
}