<!-- Modal -->
<div class="modal fade" id="openCaja" tabindex="-1" aria-labelledby="openCajaLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="openCajaLabel">Retiro de efectivo</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="form_save_cashwithdrawals" >
          <div class="container">
            <div class="row">
              <div class="col-md-12 " >
                <label for="">Caja abierta</label>
                <div class="input-group mb-3">
                  <select class="form-select" name="apertura" id="apertura">
                    <option value="">Seleccionar usuario</option>
                    @foreach($getApertura as $item)
                      <option value="{{ $item->id }}">{{ $item->name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-md-12 ">
                <label for="">Cantidad</label>
                <div class="input-group mb-3 mt-1">
                  <span class="input-group-text" id="basic-addon1">$</span>
                  <input type="number" name="cash" class="form-control" placeholder="00.00" aria-describedby="basic-addon1">
                </div>
              </div>
              <div class="col-md-12 ">
                <label for="exampleFormControlTextarea1" class="form-label">Concepto</label>
                <textarea name="concepto" class="form-control" id="exampleFormControlTextarea1" rows="2"></textarea>
              </div>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="btnclosecash" data-bs-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnAddRegister" >Guardar</button>
      </div>
    </div>
  </div>
</div>