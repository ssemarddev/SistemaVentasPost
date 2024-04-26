<!-- Modal -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="changePasswordModalLabel">Cambiar contraseña</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="" id="form-update-password">
            <input type="number" name="id_user_now" id="id_user_now" hidden="true">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Nuevo password</label>
                <input type="password" class="form-control" id="upassword" name="upassword" placeholder="Ingresa las credenciales">
            </div>
            <!--div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div-->
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="btnClosePassword" data-bs-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnChangePassword">Guardar</button>
      </div>
    </div>
  </div>
</div>