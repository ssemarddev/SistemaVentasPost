<!-- Modal -->
<!--div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="addProductModalLabel">Nuevo producto</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="saveProduct"--> 
        <input type="hidden" name="id" id="id" value="0">  
        <div class="mb-1 row">
          <label for="codigo" class="col-sm-3 col-form-label text-end bg-light">Codigo</label>
          <div class="col-sm-9">
            <input type="text" name="codigo" id="codigo" class="form-control form-control-sm" required>
          </div>
        </div>
        <div class="mb-1 row">
          <label for="nombre" class="col-sm-3 col-form-label text-end bg-light">Nombre</label>
          <div class="col-sm-9">
            <input type="text" name="nombre" id="nombre" class="form-control form-control-sm" required>
          </div>
        </div>
        <div class="mb-2 row">
          <label for="descripcion" class="col-sm-3 col-form-label text-end bg-light">Descripcion</label>
          <div class="col-sm-9">
          <textarea class="form-control form-control-sm" name="descripcion" id="descripcion" rows="1" placeholder="..."></textarea>
          </div>
        </div>
        <div class="mb-1 row">
          <label for="id_categ" class="col-sm-3 col-form-label text-end bg-light">Categoria</label>
          <div class="col-sm-9">
            <select name="id_categ" id="id_categ" class="form-control form-control-sm" required >
              <option selected disabled value="">-- Seleccionar --</option>
              @foreach ($categ as $row) 
              <option value="{{$row->id}}">{{$row->nombre}}</option> 
              @endforeach
            </select>
          </div>
        </div>
        <div class="mb-1 row">
          <label for="id_subcateg" class="col-sm-3 col-form-label text-end bg-light">Subcategoria</label>
          <div class="col-sm-9">
            <select name="id_subcateg" id="id_subcateg" class="form-control form-control-sm" required >
              @foreach ($subcateg as $row) 
              <option value="{{$row->id}}">{{$row->nombre}}</option> 
              @endforeach
            </select>
          </div>
        </div>
        <div class="mb-1 row">
          <label for="id_proveedor" class="col-sm-3 col-form-label text-end bg-light">Proveedor</label>
          <div class="col-sm-9">
            <select name="id_proveedor" id="id_proveedor" class="form-control form-control-sm" required >
              <option selected disabled value="">-- Seleccionar --</option>
                @foreach ($proveedor as $row) 
                <option value="{{$row->id}}">{{$row->nombre_empresa}}</option> 
                @endforeach
            </select>
          </div>
        </div>
        <div class="mb-1 row">
          <label for="tipoUnidad" class="col-sm-3 col-form-label text-end bg-light">Unidad</label>
          <div class="col-sm-9">
            <select name="tipoUnidad" id="tipoUnidad" class="form-control form-control-sm" required >
                @foreach ($tipoUnidad as $row) 
                <option value="{{$row->id}}">{{$row->nombre}}</option> 
                @endforeach
            </select>
          </div>
        </div>
        <div class="mayoreoMenudeo1" style="display:none;">
          <div class="mb-1 row" >
            <label for="precio_costo" class="col-sm-3 col-form-label text-end bg-light">Vent. unid 1</label>
            <div class="col-sm-9">
              <div class="input-group">
                <input type="number" name="mayoreoPrecioVenta" value="0" min="1" id="mayoreoPrecioVenta" placeholder="Precio venta x unidad" class="form-control form-control-sm">
                <input type="number" name="mayoreoCantidad" value="0" min="1" id="mayoreoCantidad" placeholder="A partir (Cantidad)" class="form-control form-control-sm">
              </div>
            </div>
          </div>
        </div>

        <div class="mayoreoMenudeo2" style="display:none;">
          <div class="mb-1 row" >
            <label for="precio_costo" class="col-sm-3 col-form-label text-end bg-light">Vent. unid 2</label>
            <div class="col-sm-9">
              <div class="input-group">
                <input type="number" name="mayoreoPrecioVenta2" value="0" id="mayoreoPrecioVenta2" placeholder="Precio venta x unidad" class="form-control form-control-sm">
                <input type="number" name="mayoreoCantidad2" value="0" id="mayoreoCantidad2" placeholder="A partir (Cantidad)" class="form-control form-control-sm">
              </div>
            </div>
          </div>

        </div>
        <div class="mb-1 row">
          <label for="precio_costo" class="col-sm-3 col-form-label text-end bg-light">Precio costo</label>
          <div class="col-sm-9">
          <input type="number" name="precio_costo" id="precio_costo" class="form-control form-control-sm" required>
          </div>
        </div>
        <div class="mb-1 row">
          <label for="precio_venta" class="col-sm-3 col-form-label text-end bg-light">Precio venta</label>
          <div class="col-sm-9">
          <input type="number" name="precio_venta" id="precio_venta" class="form-control form-control-sm" required>
          </div>
        </div>
        <div class="mb-1 row">
          <label for="stock" class="col-sm-3 col-form-label text-end bg-light">Stock</label>
          <div class="col-sm-9">
          <input type="number" name="stock" id="stock" class="form-control form-control-sm" required>
          </div>
        </div>
        <div class="row">
          <label for="stock_min" class="col-sm-3 col-form-label text-end bg-light">Stock minim</label>
          <div class="col-sm-9">
          <input type="number" name="stock_min" id="stock_min" class="form-control form-control-sm" required>
          </div>
        </div>
        <!--/form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="btnCloseProduct" data-bs-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary" id="saveNewProduct">Guardar</button>
      </div>
    </div>
  </div>
</div-->
<script>
  console.log("Product")
  const inputMay1PVenta = document.getElementById("mayoreoPrecioVenta");
  const inputMay1Cantidad = document.getElementById("mayoreoCantidad");

  const inputMay2PVenta = document.getElementById("mayoreoPrecioVenta2");
  const inputMay2Cantidad = document.getElementById("mayoreoCantidad2");

  const divMayMen1Element = document.querySelector(".mayoreoMenudeo1");
  const divMayMen2Element = document.querySelector(".mayoreoMenudeo2");
  const selectElement = document.getElementById("tipoUnidad");
  selectElement.onchange = function() {
    const selectedTipoValue = selectElement.value;
    console.log("Selected value: " + selectedTipoValue);
    if(Number(selectedTipoValue) == Number(1)){
      console.log("Selected value: " + selectedTipoValue)
      inputMay1PVenta.value = 0;
      inputMay1Cantidad.value = 0;
      inputMay2PVenta.value = 0;
      inputMay2Cantidad.value = 0;
      divMayMen1Element.style.display = "none";
      divMayMen2Element.style.display = "none";
    }
    if(Number(selectedTipoValue) == Number(2)){
      console.log("Selected value: " + selectedTipoValue)
      inputMay1PVenta.value = "";
      inputMay1Cantidad.value = "";
      inputMay2PVenta.value = "";
      inputMay2Cantidad.value = "";
      divMayMen1Element.style.display = "block";
      divMayMen2Element.style.display = "block";
    }
    // Call a function or perform other actions based on the selected value
    // ...
  };
</script>