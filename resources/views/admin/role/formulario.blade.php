
<style>
    .check{
        margin-left:13px;
    }
</style>
<div class="modal fade" id="ModalRolCreate" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <fieldset id="contentDisable" >
            <form id="formaddnewrol"> 
            <div class="modal-header">
                <h5 class="modal-title">NUEVO ROL</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" id="reset-btn" aria-label="Close"></button>
            </div> 
            <div class="modal-body"> 
                @csrf
                <input type="hidden" name="id" id="id">
                <div class="">
                    <div class="row g-3">
                        <div class="col-md-12"> 
                            <label for="name" class="form-label"><b>Nombre</b> </label>
                            <input type="text" name="name" id="name" class="form-control" required >
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12 text-center">
                            <p><b>Acceso completo</b></p>
                            <div class="form-check form-check-inline">
                            <input class="form-check-input radioAccess" type="radio" name="full-access" id="fullaccessyes" onclick="getvalueradio(this.value);" value="yes">
                            <label class="form-check-label" for="inlineRadio1">Si</label>
                            </div>
                            <div class="form-check form-check-inline">
                            <input class="form-check-input radioAccess" type="radio" name="full-access" id="fullaccessno" onclick="getvalueradio(this.value);" value="no" checked>
                            <label class="form-check-label" for="inlineRadio2">No</label>
                            </div>
                        </div>
                    </div>  
                    <div class="div_roles_permisos mt-3">
                        <div class="card-group">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Caja</h5>
                                    <div>
                                        <div class="form-check">
                                        <input class="form-check-input checkInput" type="checkbox" id="permission_{{$modul_caja[0]->id}}" value="{{$modul_caja[0]->id}}" name="permission[]">
                                        <label class="form-check-label" for="permission_{{$modul_caja[0]->id}}">
                                            {{ $modul_caja[0]->name }}
                                        </label>
                                        </div>
                                    </div>
                                    @foreach ($permission_caja as $caja)
                                    <div class="form-check check">
                                    <input class="form-check-input checkInput" type="checkbox" id="permission_{{$caja->id}}" value="{{$caja->id}}" name="permission[]">
                                    <label class="form-check-label" for="permission_{{$caja->id}}">
                                        {{ $caja->name }}
                                    </label>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Productos</h5>
                                    <div>
                                        <div class="form-check">
                                        <input class="form-check-input checkInput" type="checkbox" id="permission_{{$modul_products[0]->id}}" value="{{$modul_products[0]->id}}" name="permission[]">
                                        <label class="form-check-label" for="permission_{{$modul_products[0]->id}}">
                                            {{ $modul_products[0]->name }}
                                        </label>
                                        </div>
                                    </div>
                                    @foreach ($permission_products as $products)
                                    <div class="form-check check">
                                    <input class="form-check-input checkInput" type="checkbox" id="permission_{{$products->id}}" value="{{$products->id}}" name="permission[]">
                                    <label class="form-check-label" for="permission_{{$products->id}}">
                                        {{ $products->name }}
                                    </label>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Cotizacion</h5>
                                    <div>
                                        <div class="form-check">
                                        <input class="form-check-input checkInput" type="checkbox" id="permission_{{$modul_cotizacion[0]->id}}" value="{{$modul_cotizacion[0]->id}}" name="permission[]">
                                        <label class="form-check-label" for="permission_{{$modul_cotizacion[0]->id}}">
                                            {{ $modul_cotizacion[0]->name }}
                                        </label>
                                        </div>
                                    </div>
                                    @foreach ($permission_cotizacion as $cotizacion)
                                    <div class="form-check check">
                                    <input class="form-check-input checkInput" type="checkbox" id="permission_{{$cotizacion->id}}" value="{{$cotizacion->id}}" name="permission[]">
                                    <label class="form-check-label" for="permission_{{$cotizacion->id}}">
                                        {{ $cotizacion->name }}
                                    </label>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <div class="card-group">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Ventas</h5>
                                    <div>
                                        <div class="form-check">
                                        <input class="form-check-input checkInput" type="checkbox" id="permission_{{$modul_ventas[0]->id}}" value="{{$modul_ventas[0]->id}}" name="permission[]">
                                        <label class="form-check-label" for="permission_{{$modul_ventas[0]->id}}">
                                            {{ $modul_ventas[0]->name }}
                                        </label>
                                        </div>
                                    </div>
                                    @foreach ($permission_ventas as $sales)
                                    <div class="form-check check">
                                    <input class="form-check-input checkInput" type="checkbox" id="permission_{{$sales->id}}" value="{{$sales->id}}" name="permission[]">
                                    <label class="form-check-label" for="permission_{{$sales->id}}">
                                        {{ $sales->name }}
                                    </label>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Compras</h5>
                                    <div>
                                        <div class="form-check">
                                        <input class="form-check-input checkInput" type="checkbox" id="permission_{{$modul_compras[0]->id}}" value="{{$modul_compras[0]->id}}" name="permission[]">
                                        <label class="form-check-label" for="permission_{{$modul_compras[0]->id}}">
                                            {{ $modul_compras[0]->name }}
                                        </label>
                                        </div>
                                    </div>
                                    @foreach ($permission_compras as $compras)
                                    <div class="form-check check">
                                    <input class="form-check-input checkInput" type="checkbox" id="permission_{{$compras->id}}" value="{{$compras->id}}" name="permission[]">
                                    <label class="form-check-label" for="permission_{{$compras->id}}">
                                        {{ $compras->name }}
                                    </label>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Usuarios</h5>
                                    <div>
                                        <div class="form-check">
                                        <input class="form-check-input checkInput" type="checkbox" id="permission_{{$modul_usuarios[0]->id}}" value="{{$modul_usuarios[0]->id}}" name="permission[]">
                                        <label class="form-check-label" for="permission_{{$modul_usuarios[0]->id}}">
                                            {{ $modul_usuarios[0]->name }}
                                        </label>
                                        </div>
                                    </div>
                                    @foreach ($permission_usuarios as $user)
                                    <div class="form-check check">
                                    <input class="form-check-input checkInput" type="checkbox" id="permission_{{$user->id}}" value="{{$user->id}}" name="permission[]">
                                    <label class="form-check-label" for="permission_{{$user->id}}">
                                        {{ $user->name }}
                                    </label>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <div class="card-group">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Reportes</h5>
                                    <div>
                                        <div class="form-check">
                                        <input class="form-check-input checkInput" type="checkbox" id="permission_{{$modul_reportes[0]->id}}" value="{{$modul_reportes[0]->id}}" name="permission[]">
                                        <label class="form-check-label" for="permission_{{$modul_reportes[0]->id}}">
                                            {{ $modul_reportes[0]->name }}
                                        </label>
                                        </div>
                                    </div>
                                    @foreach ($permission_reportes as $report)
                                    <div class="form-check check">
                                    <input class="form-check-input checkInput" type="checkbox" id="permission_{{$report->id}}" value="{{$report->id}}" name="permission[]">
                                    <label class="form-check-label" for="permission_{{$report->id}}">
                                        {{ $report->name }}
                                    </label>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Clientes</h5>
                                    @foreach ($permission_clientes as $customer)
                                    <div class="form-check">
                                    <input class="form-check-input checkInput" type="checkbox" id="permission_{{$customer->id}}" value="{{$customer->id}}" name="permission[]">
                                    <label class="form-check-label" for="permission_{{$customer->id}}">
                                        {{ $customer->name }}
                                    </label>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Proveedores</h5>
                                    @foreach ($permission_proveedores as $provider)
                                    <div class="form-check">
                                    <input class="form-check-input checkInput" type="checkbox" id="permission_{{$provider->id}}" value="{{$provider->id}}" name="permission[]">
                                    <label class="form-check-label" for="permission_{{$provider->id}}">
                                        {{ $provider->name }}
                                    </label>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>

                        <div class="row ">
                            <div class="col">
                                <div class="card ">
                                <div class="card-body">
                                    <h5 class="card-title">Configuracion</h5>
                                    @foreach ($permission_configuracion as $setting)
                                    <div class="form-check">
                                    <input class="form-check-input checkInput" type="checkbox" id="permission_{{$setting->id}}" value="{{$setting->id}}" name="permission[]">
                                    <label class="form-check-label" for="permission_{{$setting->id}}">
                                        {{ $setting->name }}
                                    </label>
                                    </div>
                                    @endforeach
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  
            </div> 
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-secondary" id="btnformclose" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" id="btnaddrol"  class="btn btn-primary">Guardar</button>
            </div>
            </form> 
            </fieldset>
        </div>
    </div>
</div>
