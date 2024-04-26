console.log("data main")
$(document).ready(function () {
    let f = new Date(),
        dia = f.getDate(),
        mes = f.getMonth() + 1,
        anio = f.getFullYear(),
        diaSemana = f.getDay();

    dia = ("0" + dia).slice(-2);
    mes = ("0" + mes).slice(-2);
    let semana = [
        "DOMINGO",
        "LUNES",
        "MARTES",
        "MIERCOLES",
        "JUEVES",
        "VIERNES",
        "SABADO",
    ];
    let showSemana = semana[diaSemana];
    $("#fechasinicio").text(`${anio}-${mes}-${dia} ${showSemana}`);
});
setInterval(() => {
    let date = new Date();
    let timeString = date.toLocaleTimeString();
    $(".tiempo").text(timeString);
}, 1000);

/****************Date now************************* */
let dateNow = new Date();
let dateProperty = {
    "day": dateNow.getDate(),
    "month": dateNow.getMonth() + 1,
    "year": dateNow.getFullYear(),
}
/**********FUNCTIION FORMAT RUT**************/
/*formatRut = (rut) => {
    const newRut = rut.replace(/\./g,'').replace(/\-/g, '').trim().toLowerCase();
    const lastDigit = newRut.substr(-1, 1);
    const rutDigit = newRut.substr(0, newRut.length-1)
    let format = '';
    for (let i = rutDigit.length; i > 0; i--) {
        const e = rutDigit.charAt(i-1);
        format = e.concat(format);
        if (i % 3 === 0){
        format = '.'.concat(format);
        }
    }
    return format.concat('-').concat(lastDigit);
}*/
/*************************/
function formatRut(rut) {
  // Add dots and dash to the RUT
  let formattedRut = rut.slice(0, -1) + "-" + rut.slice(-1);
    formattedRut = formattedRut.slice(0, -5) + "." + formattedRut.slice(-5);
  formattedRut = formattedRut.slice(0, -9) + "." + formattedRut.slice(-9);
  return formattedRut;
}

// Example usage
//var rut = "123456789";
//var rut = "81230043";
//console.log(formatRutTest(rut)); // Output: "12.345.678-9"
/**************************************************************/
/***************************************/
//var number = 159000.00;
// Se establece un formato de divisa
//console.log(new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' }).format(number));
const money = (number) => {
    let formatMoney = new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' }).format(number)
    return formatMoney;
}

const cantFormat = (cant) => {
 let formatCant = parseInt(cant);
 return formatCant;
}
//money(number);
//console.log(m);
/*******************************************/
const formatDate = (dateString) => {
  let date = new Date(dateString);
  const year = date.getFullYear();
  const month = ('0' + (date.getMonth() + 1)).slice(-2); 
  const day = ('0' + date.getDate()).slice(-2);
  return `${month}-${day}-${year}`;
}

/*******************************************/

errorMainMessage = (message) => {
    Swal.fire(
        'Error!',
        message,
        'error'
    )
};
