<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Customers\CustomersrogercodeController;
use App\Http\Controllers\Shopping\ProvidersrogercodeController;
use App\Http\Controllers\Shopping\ProductspurchasesrogercodeController;
use App\Http\Controllers\Warehouse\CategoryrogercodeController;
use App\Http\Controllers\Warehouse\SubcategoryrogercodeController;
use App\Http\Controllers\Warehouse\ProductsrogercodeController;
use App\Http\Controllers\Warehouse\InventoryrogercodeController;
use App\Http\Controllers\Sales\QuotationsrogercodeController;
use App\Http\Controllers\Sales\SalesrogercodeController;
use App\Http\Controllers\Sales\PrinterrogercodeController;
use App\Http\Controllers\Sales\PaymentmoneyrogercodeController;
use App\Http\Controllers\Admin\AdminrogercodeController;
use App\Http\Controllers\Cash\CashrogercodeController;
use App\Http\Controllers\Cash\CashwithdrawalsrogercodeController;
use App\Http\Controllers\reportes\reporteventasrogercodeController;
use App\Http\Controllers\User\UserrogercodeController;
use App\Http\Controllers\User\RolerogercodeController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome'); //testing
    //return view('welcome_real_bendita_uno');

    //return view('auth.login');
});

Auth::routes();

Route::get('dashboard', [AdminrogercodeController::class, 'index'])->name('admin');

//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
//Route::get('/imprimir/pdf/{id}', [HomeController::class, 'imprimir'])->name('imprimir');         

Route::get('/admin/user', [UserrogercodeController::class, 'index'])->name('user.index');
Route::post('/admin/newuser', [UserrogercodeController::class, 'store'])->name('user.store');
Route::post('/admin/updatepassword', [UserrogercodeController::class, 'updatepassword'])->name('updatepassword.store');
Route::get('/showuser', [UserrogercodeController::class, 'show'])->name('user.show');
Route::get('/admin/role', [RolerogercodeController::class, 'index'])->name('role.index');
Route::post('/admin/newrole', [RolerogercodeController::class, 'store'])->name('role.store');
Route::get('/showrole', [RolerogercodeController::class, 'show'])->name('role.show');
Route::post('/showpermissionrole', [RolerogercodeController::class, 'edit'])->name('role.edit');


Route::get('/cliente', [CustomersrogercodeController::class, 'index'])->name('cliente');
Route::get('/showlistcustomers', [CustomersrogercodeController::class, 'show'])->name('showlistcustomers');
Route::post('/cliente/create', [CustomersrogercodeController::class, 'create'])->name('cliente.create');
Route::get('/cliente/getById', [CustomersrogercodeController::class, 'getById'])->name('cliente.getById');

Route::get('/provider', [ProvidersrogercodeController::class, 'index'])->name('provider');
Route::get('/showproviders', [ProvidersrogercodeController::class, 'show'])->name('showproviders');
Route::post('/provider/create', [ProvidersrogercodeController::class, 'create'])->name('provider.create');
Route::get('/provider/getById', [ProvidersrogercodeController::class, 'getById'])->name('provider.getById');
Route::get('/provider/getByIdProvider/{id}', [ProvidersrogercodeController::class, 'showByIdProvider'])->name('provider.showByIdProvider');         

Route::get('/category', [CategoryrogercodeController::class, 'index'])->name('category');
Route::get('/showcategory', [CategoryrogercodeController::class, 'show'])->name('showcategory');
Route::post('/category/create', [CategoryrogercodeController::class, 'create'])->name('category.create');
Route::get('/category/getById', [CategoryrogercodeController::class, 'getById'])->name('category.getById');

Route::get('/subcategory', [SubcategoryrogercodeController::class, 'index'])->name('subcategory');
Route::get('/showsubcategory', [SubcategoryrogercodeController::class, 'show'])->name('showsubcategory');
Route::post('/subcategory/create', [SubcategoryrogercodeController::class, 'create'])->name('subcategory.create');
Route::get('/subcategory/getById', [SubcategoryrogercodeController::class, 'getById'])->name('subcategory.getById');

Route::get('/products', [ProductsrogercodeController::class, 'index'])->name('products');
Route::get('/showproducts', [ProductsrogercodeController::class, 'show'])->name('showproducts');
Route::post('/products/create', [ProductsrogercodeController::class, 'create'])->name('products.create');
Route::get('/products/getById', [ProductsrogercodeController::class, 'getById'])->name('products.getById');

Route::get('/inventory', [InventoryrogercodeController::class, 'index'])->name('inventory');
Route::get('/showinventory', [InventoryrogercodeController::class, 'show'])->name('showinventory');

Route::get('/quotations', [QuotationsrogercodeController::class, 'index'])->name('quotations');
Route::post('/quotations/create', [QuotationsrogercodeController::class, 'create'])->name('quotations.create');
Route::get('/showquotationsproducts', [QuotationsrogercodeController::class, 'show'])->name('showquotationsproducts');
Route::post('/quotation/create_carrito', [QuotationsrogercodeController::class, 'create_carrito'])->name('quotation.create_carrito');
Route::post('/quotation/update_carrito', [QuotationsrogercodeController::class, 'update_carrito'])->name('quotation.update_carrito');
Route::post('/quotation/delete', [QuotationsrogercodeController::class, 'destroy'])->name('quotation.delete');
Route::get('/quotations/createnewquotation', [QuotationsrogercodeController::class, 'createnewquotation'])->name('quotations.createnewquotation');
Route::get('/showquotations', [QuotationsrogercodeController::class, 'showquotation'])->name('showquotation');
Route::get('/showquotation/detalle/{id}', [QuotationsrogercodeController::class, 'showdetalle'])->name('quotation.detalle');
Route::get('/quotation/print/{id}', [QuotationsrogercodeController::class, 'generatePdf'])->name('printpdf');         

Route::get('/sales', [SalesrogercodeController::class, 'index'])->name('sales.index');
Route::get('/sales/create', [SalesrogercodeController::class, 'create'])->name('sales.create');
Route::get('/showsalesproducts', [SalesrogercodeController::class, 'show'])->name('showsalesproducts');
Route::post('/sales/create_carrito', [SalesrogercodeController::class, 'create_carrito'])->name('sales.create_carrito');
Route::post('/sales/update_carrito', [SalesrogercodeController::class, 'update_carrito'])->name('sales.update_carrito');
Route::post('/sales/delete', [SalesrogercodeController::class, 'destroy'])->name('sales.delete');
Route::post('/sales/createventa', [SalesrogercodeController::class, 'createventa'])->name('sales.createventa');
Route::post('/sales/createabonoventa', [SalesrogercodeController::class, 'createVentaWithAbono'])->name('sales.createabonoventa');
Route::get('/showsales', [SalesrogercodeController::class, 'showsales'])->name('showsales');
Route::get('/showsale/detalle/{id}', [SalesrogercodeController::class, 'showdetalle'])->name('sales.detalle');
//Route::post('/sales/print', [PrinterrogercodeController::class, 'store'])->name('salestore.store');
Route::get('/salesticket/print/{id}', [PrinterrogercodeController::class, 'generatePdf'])->name('sales.printpdf');         
Route::post('/sales/detailpdfsale', [SalesrogercodeController::class, 'generatePdfDay'])->name('sales.printpdf.detail.day');         


Route::get('/paymentmoney', [PaymentmoneyrogercodeController::class, 'index'])->name('paymentmoney.index');
Route::post('/paymentmoney/create', [PaymentmoneyrogercodeController::class, 'store'])->name('paymentmoney.store');
Route::get('/showpaymentsmoney', [PaymentmoneyrogercodeController::class, 'show'])->name('showpaymentsmoney');
Route::get('/getpaymentmoney/{id}', [PaymentmoneyrogercodeController::class, 'get_reg_abono'])->name('getpaymentmoney');
Route::get('/getpaymentmoneydetail/{id}', [PaymentmoneyrogercodeController::class, 'get_detail_abono'])->name('getpaymentmoney.get_detail');

Route::get('/cashregister', [CashrogercodeController::class, 'index'])->name('cashregister.index');
Route::post('/saveapertura', [CashrogercodeController::class, 'store'])->name('cashregister.store');
Route::post('/closecash', [CashrogercodeController::class, 'closecash'])->name('cashregister.closecash');
Route::get('/showlistcashregister', [CashrogercodeController::class, 'show'])->name('cashregister.show');
Route::get('/getdatacashregister/{id}', [CashrogercodeController::class, 'getdetalle'])->name('cashregister.getdata');
Route::get('/cashregister/print/{id}', [CashrogercodeController::class, 'generateCashDetailPdf'])->name('cashregister.printpdf');         

Route::get('/productpurchases', [ProductspurchasesrogercodeController::class, 'index'])->name('productpurchase.index');
Route::get('/productpurchases/create', [ProductspurchasesrogercodeController::class, 'create'])->name('productpurchase.create');
Route::post('/carrito/add', [ProductspurchasesrogercodeController::class, 'carrito'])->name('productpurchase.carrito');
Route::post('/productpurchases/store', [ProductspurchasesrogercodeController::class, 'store'])->name('productpurchase.store');
Route::post('/purchase/update_carrito', [ProductspurchasesrogercodeController::class, 'update_carrito'])->name('productpurchase.update_carrito');
Route::get('/showproductpurchases', [ProductspurchasesrogercodeController::class, 'showprductspurchases'])->name('productpurchase.showprductspurchases');
Route::get('/showproductpurchases/detalle/{id}', [ProductspurchasesrogercodeController::class, 'showdetalle'])->name('productpurchase.detalle');
Route::post('/productpurchases/delete', [ProductspurchasesrogercodeController::class, 'destroy'])->name('productpurchase.delete');

/**reportes*/
Route::get('/reportes/ventas', [reporteventasrogercodeController::class, 'index'])->name('reporteVentas.index');
Route::post('/report/sale', [reporteventasrogercodeController::class, 'show'])->name('reporteVentas.show');
Route::get('/reportventas/print/{start}/{end}', [reporteventasrogercodeController::class, 'generateReportPdf'])->name('reporteVentas.printpdf');         

Route::get('/cashwithdrawals', [CashwithdrawalsrogercodeController::class, 'index'])->name('cashwithdrawals.index');
Route::post('/savecashwithdrawals', [CashwithdrawalsrogercodeController::class, 'store'])->name('cashwithdrawals.store');
Route::get('/showlistcashwithdrawals', [CashwithdrawalsrogercodeController::class, 'show'])->name('cashwithdrawals.show');

