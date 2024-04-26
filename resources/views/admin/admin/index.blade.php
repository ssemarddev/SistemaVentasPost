@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row">
        <!-- Sales Card -->
        <div class="col-xxl-4 col-md-3">
            <div class="card info-card sales-card">
            <div class="card-body">
                <h5 class="card-title"></h5>
                <div class="d-flex align-items-center">
                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-clipboard-data"></i>

                </div>
                <div class="ps-3">
                    <h6>{{$sales}}</h6>
                    <span class="text-muted small pt-2 ps-1">Ventas</span>
                </div>
                </div>
            </div>
            </div>
        </div><!-- End Sales Card -->
         <!-- Sales Card -->
        <div class="col-xxl-4 col-md-3">
            <div class="card info-card sales-card">
            <div class="card-body">
                <h5 class="card-title"></h5>
                <div class="d-flex align-items-center">
                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-cash-coin"></i>
                </div>
                <div class="ps-3">
                    <h6>{{$quotations}}</h6>
                    <span class="text-muted small pt-2 ps-1">Cotizaciones</span>
                </div>
                </div>
            </div>

            </div>
        </div><!-- End Sales Card -->
        <!-- Sales Card -->
        <div class="col-xxl-4 col-md-3">
            <div class="card info-card sales-card">
            <div class="card-body">
                <h5 class="card-title"></h5>
                <div class="d-flex align-items-center">
                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-bag-check"></i>
                </div>
                <div class="ps-3">
                    <h6>{{$providers}}</h6>
                    <span class="text-muted small pt-2 ps-1">Proveedores</span>
                </div>
                </div>
            </div>
            </div>
        </div><!-- End Sales Card -->
        <!-- Sales Card -->
        <div class="col-xxl-4 col-md-3">
            <div class="card info-card sales-card">
            <div class="card-body">
                <h5 class="card-title"></h5>
                <div class="d-flex align-items-center">
                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-people"></i>
                </div>
                <div class="ps-3">
                    <h6>{{$customers}}</h6>
                    <span class="text-muted small pt-2 ps-1">Clientes</span>
                </div>
                </div>
            </div>

            </div>
        </div><!-- End Sales Card -->
    </div>
    <div class="row">
        <div class="col-md-7">
            <div class="card info-card m-0">
                <!-- LOGO -->
                <!--img class="card-img-top" id="img-home-admin" height="300">-->
            </div>
        </div>
        <div class="col-md-5">
            <div class="card info-card">
                <div class="card-header">
                    Ultimas Ventas
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                    <thead>
                        <tr>
                        <th scope="col">Tickets</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Monto</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($lastsale as $row)
                            <tr>
                            <td>{{$row->num_comprobante}}</td>
                            <td>{{$row->created_at->toDateString()}}</td>
                            <td>{{$row->total_venta}}</td>
                            </tr>
                        @endforeach
                    </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
@endsection
