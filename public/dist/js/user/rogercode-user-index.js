const formUser = document.querySelector("#formaddnewuser");
const btnAdd = document.querySelector("#btnadduser");
const getToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const btncloseform = document.querySelector('#btnCloseForm');
const btnchangepassword = document.querySelector('#btnChangePassword');
const formPassword = document.querySelector('#form-update-password');
const inputuserId = document.querySelector("#id_user_now");
const btnclosepassword = document.querySelector('#btnClosePassword');

$(document).ready(function () {
    $(function () {
        $("#tableUser").DataTable({
            paging: true,
            pageLength: 5,
            /*"lengthChange": false,*/
            autoWidth: false,
            processing: true,
            serverSide: true,
            ajax: {
                url: "/showuser",
                type: "GET",
            },
            columns: [
                { data: 'id', name: 'id'},
                { data: "name", name: "name" },
                { data: "usuario", name: "usuario" },
                { data: "email", name: "email" },
                { data: "rolename", name: "rolename" },
                { data: "useraccess", name: "useraccess" },
                { data: "status", name: "status" },
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

}

const refresh_table_users = () => {
    var TableRefresh = $('#tableUser').dataTable(); 
    TableRefresh.fnDraw(false);
}

const changePassword = (userId) => {
    console.log(userId);
    inputuserId.value = ""; 
    inputuserId.value = userId
    let myModalPassword = document.getElementById('changePasswordModal');
    let modalshowPassword = new bootstrap.Modal(myModalPassword);
    modalshowPassword.show();
}