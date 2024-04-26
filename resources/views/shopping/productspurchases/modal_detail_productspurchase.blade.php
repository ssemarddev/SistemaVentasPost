<!-- Modal -->
<div class="modal fade" id="detalleCompraModal" tabindex="-1" aria-labelledby="detalleCompraModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detalleCompraLabel">Detalle de la compra</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-6">
          <p id="nomClient">Nombre cliente</p>
          </div>
          <div class="col-md-6">
          <p id="tipoComp">Tipo de comprobante</p>
          </div>
          <!--div class="col-md-4">
          <p id="totalVent">total venta</p>
          </div>-->
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
          <tbody id="tbodyTable">
          </tbody>
        </table>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th scope="col">Efectivo</th>
              <th scope="col">Transferencia</th>
              <th scope="col">T. debito</th>
              <th scope="col">T. credito</th>
              <!--th scope="col" id="tipodeabono"></th>-->
              <th scope="col">Total prod.</th>
              <th scope="col">Fecha compra</th>
            </tr>
          </thead>
          <tbody id="">
            <tr>
              <td id="showefectivo">test test</td>
              <td id="showtransfer">test test</td>
              <td id="showdebito">test test</td>
              <td id="showcredito">test test</td>
              <!--td id="showabono">test test</td>-->
              <td id="showtotalprod">test test</td>
              <td id="showfecha"></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>