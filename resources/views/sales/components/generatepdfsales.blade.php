<!-- Modal -->
<div class="modal fade" id="generatepdfModal" tabindex="-1" aria-labelledby="generatepdfModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <form action="{{ route('sales.printpdf.detail.day') }}" method="post">
        @csrf
        <div class="modal-header">
            <h5 class="modal-title" id="generatepdfModalLabel">Generar reporte</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Fecha del reporte</label>
                <input type="date" class="form-control" id="dateday" name="dateday" required>
                @error('dateday') <span class="error text-danger">{{ $message }}</span> @enderror
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-primary">Generar</button>
        </div>
        </form>
    </div>
  </div>
</div>
