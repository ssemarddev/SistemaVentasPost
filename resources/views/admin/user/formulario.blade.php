

<div class="modal fade" id="ModalUserCreate" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="formaddnewuser"> 
            <div class="modal-header">
                <h5 class="modal-title">NUEVO USUARIO</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" id="reset-btn" aria-label="Close"></button>
            </div> 
            <div class="modal-body"> 
                @csrf
                <input type="hidden" name="id" id="id">
                <div class="">

                <div class="row g-3">
                    <div class="col-md-12"> 
                        <label for="name" class="form-label"><b>Nombre</b> </label>
                        <input type="text" name="name" id="name" class="form-control" required >
                    </div>
                    <div class="col-md-6">
                        <label for="usuario" class="form-label"><b>Usuario</b> </label>
                        <input type="text" name="usuario" id="usuario" class="form-control" required >
                    </div> 
                    <div class="col-md-6">
                        <label for="email" class="form-label"><b>Email</b></label>
                        <input type="text" name="email" id="email" class="form-control" required >
                    </div>
                    <div class="col-md-6" >
                        <label class="form-label"><b>Password</b></label>
                        <input id="npassword" type="password" class="form-control style-input" name="npassword" required placeholder="Ingresa el password"> 
                    </div> 
                    <div class="col-md-6">
                        <label class="form-label"><b>Confirmar password</b></label>
                        <input id="cpassword" type="password" class="form-control style-input" name="cpassword" required placeholder="Confirma el password">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label"><b>Seleccionar un rol para el acceso al usuario</b></label>
                        <select name="rol" id="rol" class="form-control" required>
                        <option value="">.. Seleccionar ..</option>
                        @foreach ($roles as $rol)
                        <option value="{{$rol->id}}">{{$rol->name}}</option>
                        @endforeach
                        </select> 
                    </div> 
                </div>  
                </div>  
            </div> 
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-secondary" id="btnCloseForm" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" id="btnadduser"  class="btn btn-primary">Guardar</button>
            </div>
            </form> 
        </div>
    </div>
</div>
