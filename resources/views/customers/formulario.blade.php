
<div class="modal fade" id="newclient" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="formAddCustomer"> 
            <div class="modal-header">
                <h5 class="modal-title">NUEVO CLIENTE</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" id="reset-btn" aria-label="Close"></button>
            </div> 
            <div class="modal-body"> 
                @csrf
                <input type="hidden" name="id" id="id">
                <div class="">

                <div class="row g-3">
                    <div class="col-md-12"> 
                        <label for="nombres" class="form-label"><b>Nombres</b> </label>
                        <input type="text" name="nombres" id="nombres" class="form-control" required >
                    </div>
                    <div class="col-md-6">
                        <label for="rut" class="form-label"><b>Rut</b> </label>
                        <input type="text" name="rut" id="rut" class="form-control" onchange="validateRut(event);" required >
                    </div> 
                    <div class="col-md-6">
                        <label for="telefono" class="form-label"><b>Telefono</b> </label>
                        <input type="text" name="telefono" id="telefono" class="form-control" required >
                    </div>
                    <div class="col-md-12" >
                        <label class="form-label"><b>Direccion</b></label>
                        <textarea class="form-control" required name="direccion" id="direccion" cols="30" rows="3" placeholder="..."></textarea>
                    </div> 
                    <div class="col-md-6">
                        <label class="form-label"><b>Email</b></label>
                        <input type="text" name="email" id="email" class="form-control" required >
                    </div>
                    <div class="col-md-6">
                        <label class="form-label"><b>Estado</b></label>
                        <select name="estado" id="estado" class="form-control" required>
                            <option value="1">ACTIVO</option>
                            <option value="0">INACTIVO</option>
                        </select> 
                    </div> 
                </div>  
                </div>  
            </div> 
            <div class="modal-footer justify-content-center">
                <button type="button" id="btnCloseFormCustomer" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" id="btnAddCustomer"  class="btn btn-primary">Guardar</button>
            </div>
            </form> 
        </div>
    </div>
</div>

<!--div class="modal fade" id="newclient" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title">Large Modal</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">

                @csrf
                <input type="hidden" name="id" id="id">
                <div class="">

                <div class="row">
                    <div class="col-md-12"> 
                        <div class="input-group input-group-sm mb-3"> <span class="input-group-text" id="inputGroup-sizing-sm">NOMBRES:</span>
                            <input type="text" name="nombres" id="nombres" class="form-control" required aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                        </div> 
                    </div>
                    <div class="col-md-6">
                        <div class="input-group input-group-sm mb-3"> <span class="input-group-text" id="inputGroup-sizing-sm">RUT:</span>
                            <input type="number" name="rut" id="rut" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                        </div>  
                    </div> 
                    <div class="col-md-6">
                        <div class="input-group input-group-sm mb-3"> <span class="input-group-text" id="inputGroup-sizing-sm">TELEFONO:</span>
                            <input type="text" name="telefono" id="telefono" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                        </div>  
                    </div>
                    <div class="col-md-12" >
                        <div class="mb-3">
                            <label class="form-label">DIRECCIÓN:</label>
                            <textarea class="form-control" name="direccion" id="direccion" cols="30" rows="3" placeholder="..."></textarea>
                        </div>
                    </div> 
                    <div class="col-md-6">
                        <div class="input-group input-group-sm mb-3"> <span class="input-group-text" id="inputGroup-sizing-sm">EMAIL:</span>
                            <input type="text" name="email" id="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                        </div>  
                    </div>
                    <div class="col-md-6">
                        <div class="input-group input-group-sm mb-3"> <span class="input-group-text" id="inputGroup-sizing-sm">ESTADO:</span>
                            <select name="estado" id="estado" class="form-control">
                                <option value="ACTIVO">ACTIVO</option>
                                <option value="INACTIVO">INACTIVO</option>
                            </select> 
                        </div>
                    </div> 
                </div>  
                </div>  
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
        </div>
        </div>
    </div>
</div> --><!-- End Large Modal-->