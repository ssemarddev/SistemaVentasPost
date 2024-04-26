<!-- Button trigger modal -->
<!--button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#showExitquotationModal">
  Launch demo modal
</button>-->
<!-- Modal -->
<div class="modal fade" id="showExitquotationModal" tabindex="-1" aria-labelledby="showExitquotationModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="showExitquotationModalLabel"><b>Cotizacion</b></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container">
          <div class="row">
            <div class="col-md-6 border border-1"><b>Total venta</b></div>
            <div class="col-md-6 border border-1" id="divtotal"></div>
          </div>
          <div class="row">
            <div class="col-md-6 border border-1"><b>Abono</b></div>
            <div class="col-md-6 border border-1" id="divabono"></div>
          </div>
          <div class="row">
            <div class="col-md-6 border border-1"><b>A pagar</b></div>
            <div class="col-md-6 border border-1" id="divapagar"></div>
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-md-8">
            <input type="text" class="form-control" id="showemail" readonly>
          </div>
          <div class="col-md-4">
            <div class="d-grid gap-2">
              <button class="btn btn-success" disabled>Enviar</button>
            </div>
          </div>
        </div>
        <div class="row mt-1">
          <div class="col-md-8">
            <input type="text" class="form-control" id="showphone" readonly >
          </div>
          <div class="col-md-4">
            <div class="d-grid gap-2" >
              <button class="btn btn-success" disabled>Enviar</button>
            </div>
          </div>
        </div>
        <div class="row mt-1">
          <div class="col-md-8">
            <input type="text" class="form-control" id="showcod" readonly >
          </div>
          <div class="col-md-4">
            <div class="d-grid gap-2" id="btn-generate-pdf">
            </div>
          </div>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>