
@extends("layouts.app")
@section("content")
<meta name="csrf-token" content="{{ csrf_token() }}">
<section class="">
  <div class="container-fluid bg-primary">
    <a class="navbar-brand text-white" href="#"><h4>USUARIOS</h4> </a>
  </div>

<!-- Recent Sales -->
            <div class="col-12">
              <div class="card overflow-auto">
		<div class="card-header border-0">
			<div style="float:right; margin-right: 6px;">
				<button type="button" onclick="Nuevo();" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#ModalUserCreate">
          				<i class="bi bi-person"></i> Agregar cliente
				</button>
			</div>
		</div>
                <div class="card-body">
                  <!--h5 class="card-title">Recent Sales <span>| Today</span></h5>-->
		  <div class="table-responsive">
                  <table class="table table-striped table-bordered" id="tableUser">
                    <thead>
                      <tr>
                            <th>#</th> 
                            <th>Nombre</th> 
                            <th>Usuario</th> 
                            <th>Email</th> 
                            <th>Rol</th> 
                            <th>Acceso completo</th>
                            <th>Estado</th> 
                            <th><i class="bi bi-gear"></i></th> 
                      </tr>
                    </thead>
                    
                  </table>
		  </div>
                </div>

              </div>
            </div><!-- End Recent Sales -->
</section>
<section>
	@include('admin.user.formulario') 
	@include('admin.user.modalChangePassword') 
</section>
@endsection

@section("script")
  <script src="{{asset('dist/js/user/rogercode-user-index.js')}}"></script>
  <script src="{{asset('dist/js/user/rogercode-user.js')}}" type="module"></script>
@endsection