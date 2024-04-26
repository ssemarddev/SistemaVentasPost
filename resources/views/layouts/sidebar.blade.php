 <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="{{url('/dashboard')}}">
          <i class="bi bi-grid"></i>
          <span>Inicio</span>
        </a>
      </li><!-- End Dashboard Nav -->
      @can('hasAccess', 'cliente.index')  
      <li class="nav-item">
        <a class="nav-link collapsed" href="{{url('/cliente')}}">
          <i class="bi bi-person"></i>
          <span>Clientes</span>
        </a>
      </li><!-- customers -->
      @endcan
      @can('hasAccess', 'proveedor.index')  
      <li class="nav-item">
        <a class="nav-link collapsed" href="{{url('/provider')}}">
          <i class="bi bi-people"></i>
          <span>Proveedores</span>
        </a>
      </li><!-- providers -->
      @endcan

      @can('hasAccess', 'modulo_caja')  
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#caja-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journals"></i><span>Caja</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="caja-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          @can('hasAccess', 'caja_abrir.index')  
          <li>
            <a href="{{url('/cashregister')}}">
              <i class="bi bi-circle"></i><span>Abrir o cerrar</span>
            </a>
          </li>
          @endcan
          @can('hasAccess', 'caja_retiros.index')  
          <li>
            <a href="{{url('/cashwithdrawals')}}" >
              <i class="bi bi-circle"></i><span>Retiros</span>
            </a>
          </li>
          @endcan
        </ul>
      </li><!-- cash -->
      @endcan

      @can('hasAccess', 'modulo_producto')  
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>Productos</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          @can('hasAccess', 'categoria.index')  
          <li>
            <a href="{{url('/category')}}">
              <i class="bi bi-circle"></i><span>Categoria</span>
            </a>
          </li>
          @endcan
          @can('hasAccess', 'subcategoria.index')  
          <li>
            <a href="{{url('/subcategory')}}">
              <i class="bi bi-circle"></i><span>Sub categoria</span>
            </a>
          </li>
          @endcan
          @can('hasAccess', 'producto.index')  
          <li>
            <a href="{{url('/products')}}">
              <i class="bi bi-circle"></i><span>Productos</span>
            </a>
          </li>
          @endcan
          @can('hasAccess', 'inventario.index')  
          <li>
            <a href="{{url('/inventory')}}">
              <i class="bi bi-circle"></i><span>Inventario</span>
            </a>
          </li>
          @endcan
        </ul>
      </li><!-- products -->
      @endcan

      @can('hasAccess', 'modulo_cotizacion')  
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Cotizacion</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          @can('hasAccess', 'cotizacion.index')  
          <li>
            <a href="{{url('/quotations/createnewquotation')}}">
              <i class="bi bi-circle"></i><span>Nueva cotizacion</span>
            </a>
          </li>
          @endcan
          @can('hasAccess', 'cotizacion_lista.index')  
          <li>
            <a href="{{url('/quotations')}}">
              <i class="bi bi-circle"></i><span>Lista de cotizacion</span>
            </a>
          </li>
          @endcan
        </ul>
      </li><!-- cotizacion -->
      @endcan

      @can('hasAccess', 'modulo_venta')  
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>Ventas</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          @can('hasAccess', 'venta.index')  
          <li>
            <a href="{{url('/sales/create')}}">
              <i class="bi bi-circle"></i><span>Nueva venta</span>
            </a>
          </li>
          @endcan
          @can('hasAccess', 'venta_lista.index')  
          <li>
            <a href="{{url('/sales')}}">
              <i class="bi bi-circle"></i><span>Listado de ventas</span>
            </a>
          </li>
          @endcan
          @can('hasAccess', 'venta_abono.index')  
          <li>
            <a href="{{url('/paymentmoney')}}">
              <i class="bi bi-circle"></i><span>Ventas con abono</span>
            </a>
          </li>
          @endcan
        </ul>
      </li><!-- Sales -->
      @endcan

      @can('hasAccess', 'modulo_compra')  
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>Compras</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          @can('hasAccess', 'compra.index')  
          <li>
            <a href="{{url('/productpurchases/create')}}">
              <i class="bi bi-circle"></i><span>Nueva compra</span>
            </a>
          </li>
          @endcan
          @can('hasAccess', 'compra_lista.index')  
          <li>
            <a href="{{url('/productpurchases')}}">
              <i class="bi bi-circle"></i><span>Lista de compras</span>
            </a>
          </li>
          @endcan
        </ul>
      </li><!-- compras -->
      @endcan

      @can('hasAccess', 'modulo_usuario')  
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-person-check-fill"></i><span>Usuarios</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          @can('hasAccess', 'role.index')  
          <li>
            <a href="{{url('/admin/role')}}">
              <i class="bi bi-circle"></i><span>Roles</span>
            </a>
          </li>
          @endcan
          @can('hasAccess', 'usuario.index')  
          <li>
            <a href="{{url('/admin/user')}}">
              <i class="bi bi-circle"></i><span>Usuarios</span>
            </a>
          </li>
          @endcan
        </ul>
      </li><!-- usuario -->
      @endcan

      @can('hasAccess', 'modulo_reporte')  
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#reporte-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journals"></i><span>Reportes</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="reporte-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          @can('hasAccess', 'reporte_venta.index')  
          <li>
            <a href="{{url('/reportes/ventas')}}">
              <i class="bi bi-circle"></i><span>Reporte de Ventas</span>
            </a>
          </li>
          @endcan
          <!--li>
            <a href="icons-remix.html">
              <i class="bi bi-circle"></i><span>Reporte de Compras</span>
            </a>
          </li>
          <li>
            <a href="icons-remix.html">
              <i class="bi bi-circle"></i><span>Reporte de Financiero</span>
            </a>
          </li>-->
        </ul>
      </li><!-- Reports -->
      @endcan

      @can('hasAccess', 'configuracion.index')  
      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-register.html">
          <i class="bi bi-gear"></i>
          <span>Configuracion</span>
        </a>
      </li><!-- End Register Page Nav -->
      @endcan

    </ul>

  </aside>