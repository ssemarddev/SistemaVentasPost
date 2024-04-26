
<div class="modal fade" id="newproveedor" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form action="{{route('provider.create')}}" method="POST" id="formProviders"> 
            <div class="modal-header">
                <h5 class="modal-title">NUEVO PROVEEDOR</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" id="reset-btn" aria-label="Close"></button>
            </div> 
            <div class="modal-body"> 
                <div class="">
                    <div class="">   
                            @csrf
                            <input type="hidden" name="id" id="id">   
                            <ul class="nav nav-tabs nav-primary mb-0" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link active" data-bs-toggle="tab" href="#primaryhome" role="tab" aria-selected="true">
                                        <div class="d-flex align-items-center">
                                            <div class="tab-icon"><i class='bx bx-comment-detail font-18 me-1'></i>
                                            </div>
                                            <div class="tab-title"> DATOS</div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link" data-bs-toggle="tab" href="#primaryprofile" role="tab" aria-selected="false">
                                        <div class="d-flex align-items-center">
                                            <div class="tab-icon"><i class='bx bx-bookmark-alt font-18 me-1'></i>
                                            </div>
                                            <div class="tab-title">CUENTA</div>
                                        </div>
                                    </a>
                                </li> 
                            </ul>
                            <div class="tab-content pt-3">
                                <div class="tab-pane fade show active" id="primaryhome" role="tabpanel"> 
                                    <div class="row g-3">
                                        <div class="col-md-12"> 
                                            <label for="nombre_empresa" class="form-label"><b>Nombre empresa</b></label>
                                            <input type="text" name="nombre_empresa" id="nombre_empresa" class="form-control" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="rut" class="form-label"><b>Rut</b></label>
                                            <input type="text" name="rut" id="rut" class="form-control" onchange="validateRut(event);" required>
                                        </div> 
                                        <div class="col-md-6">
                                            <label for="telefono" class="form-label"><b>Telefono</b></label>
                                            <input type="number" name="telefono" id="telefono" class="form-control" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="vendedor" class="form-label"><b>Representante</b> </label>
                                            <input type="text" name="vendedor" id="vendedor" class="form-control" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="correo" class="form-label"><b>Email</b></label>
                                            <input type="text" name="correo" id="correo" class="form-control" required>
                                            </div>  
                                        <div class="col-md-12" >
                                            <div class="mb-3">
                                                <label class="form-label"><b>Direccion</b></label>
                                                <textarea class="form-control" name="direccion" id="direccion" cols="5" rows="2" placeholder="..." required></textarea>
                                            </div>
                                        </div>   
                                    </div>  
                                </div>
                                <div class="tab-pane fade mb-3" id="primaryprofile" role="tabpanel"> 
                                    <div class="row g-3">
                                        <div class="col-md-6"> 
                                            <label for="nombre_banco" class="form-label"><b>Banco</b></label>
                                            <input type="text" name="nombre_banco" id="nombre_banco" class="form-control" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="tipo_cuenta" class="form-label"><b>Tipo de cuenta</b></label>
                                            <select name="tipo_cuenta" id="tipo_cuenta" class="form-select" required>
                                            <option value="">Seleccionar</option>
                                            <option value="CORRIENTE">CORRIENTE</option>
                                            <option value="VISTA">VISTA</option>
                                            <option value="RUT">RUT</option>
                                            <option value="PREPAGO">PREPAGO</option>
                                            </select>
                                        </div> 
                                        <div class="col-md-6">
                                            <label for="numero_cuenta" class="form-label"><b>Numero cuenta</b></label>
                                            <input type="number"  name="numero_cuenta" id="numero_cuenta" class="form-control" required>
                                        </div>  
                                        <div class="col-md-6">
                                            <label for="tipo_cuenta" class="form-label"><b>Estado</b></label>
                                            <select name="estado" id="estado" class="form-control" required>
                                                <option value="1">ACTIVO</option>
                                                <option value="0">INACTIVO</option>
                                            </select> 
                                        </div> 
                                    </div>  
                                </div> 
                            </div>
                            <div class="" >
                                <div class="text-center"> 
                                    <button type="button" class="btn btn-secondary" id="btnCloseFormProvider" data-bs-dismiss="modal">Cerrar</button>
                                    <button type="submit" id="btnAddProvider" class="btn btn-primary">Guardar</button>
                                </div>
                            </div> 
                    </div>
                </div>
            </div> 
            </form> 
        </div>
    </div>
</div>

