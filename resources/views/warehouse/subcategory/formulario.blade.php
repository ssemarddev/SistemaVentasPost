
<div class="modal fade" id="newsubcategory" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{{route('subcategory.create')}}" method="POST"> 
            <div class="modal-header">
                <h5 class="modal-title">NUEVA SUB CATEGORIA</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" id="reset-btn" aria-label="Close"></button>
            </div> 
            <div class="modal-body"> 
               <div class="">
                    <div class="">  
                            @csrf
                            <input type="hidden" name="id" id="id">  
                            <div class="row g-3">
                                <div class="col-md-12"> 
                                    <label for="nombre" class="form-label"><b>NOMBRE SUB CATEGORIA</b></label>
                                    <input type="text" name="nombre" id="nombre" class="form-control" required >
                                </div> 
                                <div class="col-md-6">
                                    <label for="estado" class="form-label" ><b>ESTADO</b></label> 
                                    <select name="estado" id="estado" class="form-control" required>
                                        <option value="1">ACTIVO</option>
                                        <option value="0">INACTIVO</option>
                                    </select> 
                                </div> 
                            </div>  
                    </div>
                </div>
            </div> 
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
            </form> 
        </div>
    </div>
</div>

