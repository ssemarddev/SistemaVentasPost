<!-- Modal -->
<div class="modal fade" id="closeCashModal" tabindex="-1" aria-labelledby="closeCashModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="closeCashModalLabel">Cerrar la caja</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="form_close_cash">
            <input type="number" name="pertId" id="pertId" hidden="true">
            <div class="container">
              <div class="row">
                <div class="col-md-6 border border-1">
                  Usuario
                </div>
                <div class="col-md-6 border border-1">
                  {{substr(Auth::user()->name,0,10)}}
                </div>
              </div>
              <div id="detailCloseCash">

              </div>
              <div class="col-auto" style="display: none;">
                <div class="input-group">
                    <div class="input-group-text"><b>$</b></div>
                    <input type="number" class="form-control" id="cantclose" name="cantclose" min="0" step="0.00" placeholder="Ingresar cantidad">
                </div>
              </div>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="btncerrarmodal" data-bs-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnCloseCash">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!--------THE MODAL SHOW----------->
<div class="modal fade" id="verCashModal" tabindex="-1" aria-labelledby="verCashModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verCashModalLabel">Ver detalle caja</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="form_close_cash">
            <div class="container">
              <div class="row">
                <div class="col-md-6 border border-1">
                  Usuario
                </div>
                <div class="col-md-6 border border-1">
                  {{substr(Auth::user()->name,0,10)}}
                </div>
              </div>
              <div id="detailVerCash">

              </div>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="" data-bs-dismiss="modal">Cerrar</button>
        <div id="content-print">
        </div>
      </div>
    </div>
  </div>
</div>
