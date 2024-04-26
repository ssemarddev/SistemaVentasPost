
const formRol = document.querySelector("#formaddnewrol");
const btnAdd = document.querySelector("#btnaddrol");
const getToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const btnClose = document.querySelector('#btnformclose');
const inputName = document.querySelector('#name');
const contentform = document.querySelector("#contentDisable");
const radios = document.querySelector('.div_roles_permisos');
const inputroleId = document.querySelector('#id');

$(document).ready(function () {
    $(function () {
        $("#tableRoles").DataTable({
            paging: true,
            pageLength: 5,
            /*"lengthChange": false,*/
            autoWidth: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: "/showrole",
                type: "GET",
            },
            columns: [
                { data: 'id', name: 'id'},
                { data: "name", name: "name" },
                { data: "full-access", name: "full-access" },
                { data: "status", name: "status" },
                { data: "date", name: "date" },
                { data: "action", name: "action" },
            ],
            order: [[0, "DESC"]],
            language: {
                processing: "Procesando...",
                lengthMenu: "Mostrar _MENU_ registros",
                zeroRecords: "No se encontraron resultados",
                emptyTable: "Ningún dato disponible en esta tabla",
                sInfo: "Mostrando del _START_ al _END_ de total _TOTAL_ registros",
                infoEmpty:
                    "Mostrando registros del 0 al 0 de un total de 0 registros",
                infoFiltered: "(filtrado de un total de _MAX_ registros)",
                search: "Buscar:",
                infoThousands: ",",
                loadingRecords: "Cargando...",
                paginate: {
                    first: "Primero",
                    last: "Último",
                    next: "Siguiente",
                    previous: "Anterior",
                },
            },
        });
    });
});

const Nuevo = () => {
    if (contentform.hasAttribute("disabled")) {
        contentform.removeAttribute("disabled");
    }
    formRol.reset();
    $('#id').val(0);   
    radios.style.display = "block";
}
/*********************************************/
const getvalueradio = (value) =>{
    if (document.querySelector('input[name="full-access"]:checked')) {
        switch (value) {
           case "yes":
              radios.style.display = "none";
               break;
            case "no":
              radios.style.display = "block";
                break;
           default:
               break;
        }
    }
}

const refresh_table_roles = () => {
    var TableRefresh = $('#tableRoles').dataTable(); 
     TableRefresh.fnDraw(false);
}


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

const showRole = (role) => {
    processingData(role);
    contentform.setAttribute('disabled','disabled');
};

const processingData = (role) => {
    formRol.reset();
    let formData = new FormData();
    formData.append("id",role);
	sendAction("/showpermissionrole",formData,getToken).then(result => {
        console.log(result)
        const data = result;
        const permissions = data.permissionsAll;
        //console.log(permissions);
        //console.log(data.role)
        inputName.value = data.role.name;
        checkRadio(data.role);
        checkOptions(data.permissions);
        //cargarDato(result);
	    let detalleModal = document.getElementById('ModalRolCreate');
	    let modal = new bootstrap.Modal(detalleModal);
	    modal.show();
    });
}

const checkOptions = (permissions) => {
    console.log(permissions)
    const rolPermissions = permissions;
    const checkboxes = document.querySelectorAll(".checkInput");
    //console.log(checkboxes)
    checkboxes.forEach((checkbox) => {
        const checkedValue = checkbox.value;
        //console.log(checkedValue)
        //console.log(checkbox.id)
        rolPermissions.forEach((permi) => {
            //console.log(permi);
            if (checkedValue == permi) {
                checkbox.checked = true;
            }
        }); 
        //checkbox.disabled = true;
    });
};

const checkRadio = (role) => {
    //console.log(role)
    //console.log(role['full-access'])
    const radiocheckboxes = document.querySelectorAll(".radioAccess");
    //console.log(radiocheckboxes)
    radiocheckboxes.forEach((radio) => {
        //console.log(radio.value);
        if (radio.value == role['full-access']) {
            radio.checked = true;
        }
        
    });
    getvalueradio(role['full-access']);
}

const EditarRole = (roleId) => {
    console.log(roleId);
    if (contentform.hasAttribute("disabled")) {
        contentform.removeAttribute("disabled");
    }
    processingData(roleId);
    inputroleId.value = "";
    inputroleId.value = roleId;
}