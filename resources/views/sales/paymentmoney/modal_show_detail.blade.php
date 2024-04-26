<!-- Modal -->
<div class="modal fade" id="showDetailModal" tabindex="-1" aria-labelledby="showDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="showDetailModalLabel">Detalle de venta con abono</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-7">
          <p id="nomClient">Datos cliente</p>
          </div>
          <div class="col-md-5">
          <p id="tipoComp">Tipo de comprobante</p>
          </div>
        </div>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th scope="col">Cod.</th>
              <th scope="col">Cant.</th>
              <th scope="col">Producto</th>
              <th scope="col">Unidad</th>
              <th scope="col">Total</th>
            </tr>
          </thead>
          <tbody id="detailShowPayment">
          </tbody>
        </table>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th scope="col" id="tipodeabono">Abono</th>
              <th scope="col">Por pagar</th>
              <th scope="col">Total productos</th>
              <th scope="col">Fecha abono</th>
            </tr>
          </thead>
          <tbody id="">
            <tr>
              <td id="showabono">test test</td>
              <td id="showpagar">test test</td>
              <td id="showprod">test test</td>
              <td id="showfecha"></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" disabled>Imprimir</button>
      </div>
    </div>
  </div>
</div>
