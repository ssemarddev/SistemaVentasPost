<!-- Modal -->
<div class="modal fade" id="openCaja" tabindex="-1" aria-labelledby="openCajaLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="openCajaLabel">Abrir caja</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="form_save_apertura" >
          <div class="container">
            <div class="row">
              <div class="col-md-6 border border-1">
                Usuario
              </div>
              <div class="col-md-6 border border-1">
                {{substr(Auth::user()->name,0,10)}}
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 border border-1">
                Fecha
              </div>
              <div class="col-md-6 border border-1 showdate">
              </div>
            </div>
            <div class="text-center mt-2">
              <h4>Fondo</h4>
            </div>
            <div class="row">
              <div class="col-md-6 text-center">
                <div class="form-check form-check-inline border border-1 rounded-2">
                  <input class="form-check-input" type="radio" name="radiocash" id="flexRadioDefault2" onclick="getvalueradio(this.value);" value="no" checked>
                  <label class="form-check-label" for="flexRadioDefault2">
                    Sin fondo de caja
                  </label>
                </div>
              </div>
              <div class="col-md-6  text-center">
                <div class="form-check form-check-inline border border-1 rounded">
                  <input class="form-check-input" type="radio" name="radiocash" id="flexRadioDefault1" onclick="getvalueradio(this.value);" value="yes">
                  <label class="form-check-label" for="flexRadioDefault1">
                    Con fondo de caja
                  </label>
                </div>
              </div>
            </div>
            <div class="col-auto mt-3 cantregister" style="display: none;">
              <div class="input-group">
                <div class="input-group-text"><b>$</b></div>
                <input type="number" class="form-control" id="cantapertura" name="cantapertura" min="0" step="0.00" placeholder="Ingresar cantidad" required>
              </div>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="btncloseapertura" data-bs-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnsaveapertura" >Guardar</button>
      </div>
    </div>
  </div>
</div>