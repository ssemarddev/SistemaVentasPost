
<div class="modal fade" id="newproduct" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="formAddProduct" action="{{route('products.create')}}" method="POST" enctype="multipart/form-data"> 
            <div class="modal-header">
                <h5 class="modal-title">NUEVO PRODUCTO</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" id="reset-btn" aria-label="Close"></button>
            </div> 
            <div class="modal-body"> 
                <div class="">
                    <div class="">    
                        @csrf
                        @include('sales.components.addproduct') 
                        <!--ul class="nav nav-tabs nav-primary mb-0" role="tablist">
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
                                <a class="nav-link" data-bs-toggle="tab" href="#precios" role="tab" aria-selected="false">
                                    <div class="d-flex align-items-center">
                                        <div class="tab-icon"><i class='bx bx-bookmark-alt font-18 me-1'></i>
                                        </div>
                                        <div class="tab-title"> PRECIOS Y STOCK</div>
                                    </div>
                                </a>
                            </li> 
                        </ul>
                        <div class="tab-content pt-3">
                            <input type="hidden" name="id" id="id">  
                            <div class="tab-pane fade show active" id="primaryhome" role="tabpanel"> 
                                <div class="row g-3">
                                    <div class="col-md-4"> 
                                        <label for="codigo" class="form-label"><b>CODIGO</b></label>
                                        <input type="text" name="codigo" id="codigo" class="form-control" required>
                                    </div>
                                    <div class="col-md-8">
                                        <label for="nombre" class="form-label"><b>NOMBRE</b> </label>
                                        <input type="text" name="nombre" id="nombre" class="form-control" required>
                                    </div> 
                                    <div class="col-md-12"> 
                                        <label class="form-label"><b>DESCRIPCIÓN</b></label>
                                        <textarea class="form-control" name="descripcion" id="descripcion" cols="30" rows="3" placeholder="..."></textarea>
                                    </div>
                                    <div class="col-md-6"> 
                                        <label class="form-label"><b>CATEGORIA</b> </label>
                                        <select name="id_categ" id="id_categ" class="form-control" required>
                                            <option selected disabled value="">Seleccionar...</option>
                                            @foreach ($categ as $row) 
                                            <option value="{{$row->id}}">{{$row->nombre}}</option> 
                                            @endforeach
                                        </select> 
                                    </div>
                                    <div class="col-md-6"> 
                                        <label class="form-label"><b>SUB-CATEGORIA</b></label>
                                        <select name="id_subcateg" id="id_subcateg" class="form-control" required>
                                            @foreach ($subcateg as $row) 
                                            <option value="{{$row->id}}">{{$row->nombre}}</option> 
                                            @endforeach
                                        </select> 
                                    </div>
                                    <div class="col-md-6"> 
                                        <label class="form-label"><b>PROVEEDOR</b> </label>
                                        <select name="id_proveedor" id="id_proveedor" class="form-control" required>
                                            <option selected disabled value="">Seleccionar...</option>
                                            @foreach ($proveedor as $row) 
                                            <option value="{{$row->id}}">{{$row->nombre_empresa}}</option> 
                                            @endforeach
                                        </select> 
                                    </div>   
                                    <div class="col-md-6">
                                        <label class="form-label"><b>ESTADO</b> </label>
                                        <select name="estado" id="estado" class="form-control" required>
                                            <option value="1">ACTIVO</option>
                                            <option value="0">INACTIVO</option>
                                        </select> 
                                    </div>
                                    <br>
                                </div>  
                            </div>
                            <div class="tab-pane fade" id="precios" role="tabpanel"> 
                                <div class="row g-3">
                                    <div class="col-md-6"> 
                                        <label for="precio_costo" class="form-label"><b>PRECIO COSTO</b></label>
                                        <input type="number" name="precio_costo" id="precio_costo" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="precio_venta" class="form-label"><b>PRECIO VENTA</b></label>
                                        <input type="number" name="precio_venta" id="precio_venta" class="form-control" required>
                                    </div> 
                                    <div class="col-md-6">
                                        <label for="stock" class="form-label"><b>STOCK</b></label>
                                        <input type="number" name="stock" id="stock" class="form-control"  required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="stock_min" class="form-label"><b>STOCK MINIMO</b></label>
                                        <input type="number" name="stock_min" id="stock_min" class="form-control" required>
                                    </div>  
                                    <br>
                                    <div class="text-center" >
                                        <button type="button" class="btn btn-secondary" id="btnCloseProd" data-bs-dismiss="modal">Cerrar</button>
                                        <button type="submit" class="btn btn-primary">Guardar</button>
                                    </div> 
                                </div>  
                            </div>
                        </div-->  
                    </div>
                </div>
            </div> 
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="btnCloseProd" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" id="btnAddProducto" class="btn btn-primary">Guardar</button>
            </div>
            </form> 
        </div>
    </div>
</div>

<!--div class="col-md-6">
    <label class="form-label"><b>IMPUESTOS</b></label>
    <select name="impuestos" id="impuestos" class="form-control" required>
        <option selected disabled value="">Seleccionar...</option>
        <option value="No Mostrar">No Mostrar</option>
        <option value="Incluido">Incluido</option>
        <option value="No Incluido">No Incluido</option>
    </select> 
</div-->

<!--div class="col-md-4">
    <label for="maneja_inventario" class="form-label"><b>INVENTARIO</b></label>
    <select name="maneja_inventario" id="maneja_inventario" class="form-control" required>
        <option value="1">Si</option>
        <option value="0">No</option>
    </select> 
</div>
<div class="col-md-12" >
    <div class="mb-3">
        <label class="form-label"><b>CARGAR IMAGEN:</b> (Opcional)</label>
        <input type="file" class="form-control" name="image" id="image">
    </div>
</div>-->  