<!-- Modal -->
<div class="modal fade" id="detalleQuotationModal" tabindex="-1" aria-labelledby="detalleQuotationModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detalleQuotationLabel">Detalle de la cotizacion</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-5">
          <p id="nomClient"></p>
          </div>
          <!--div class="col-md-3">
          <p id="tipoComp">tipo comprobante</p>
          </div>-->
          <div class="col-md-3">
          <p id="numComp"></p>
          </div>
          <div class="col-md-4">
          <p id="totalVent"></p>
          </div>
        </div>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th scope="col">Nombre</th>
              <th scope="col">Cantidad</th>
              <th scope="col">Unidad</th>
              <th scope="col">Total</th>
            </tr>
          </thead>
          <tbody id="tbodyTable">
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>