<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customers\Customersrogercode;
use App\Models\Sales\Quotationsrogercode;
use App\Models\Shopping\Providersrogercode;
use App\Models\Sales\Salesrogercode;
use App\Http\Controllers\Settings\settingsrogercodeController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AdminrogercodeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $id_user = Auth::user()->id;
        $getAccessUser = new settingsrogercodeController();
        $access = $getAccessUser->getAccessRolUser($id_user);
        if ($access == 'yes') {
            $quotations = Quotationsrogercode::count();
            $cutomers = Customersrogercode::count();
            $providers = Providersrogercode::count();
            $sales = Salesrogercode::count();
            $lastSales = Salesrogercode::select()->latest()->take(4)->get();
        }
        if ($access == 'no') {
            $quotations = Quotationsrogercode::where('id_user',$id_user)->count();
            $cutomers = Customersrogercode::count();
            $providers = Providersrogercode::count();
            $sales = Salesrogercode::where('user_id',$id_user)->count();
            $lastSales = Salesrogercode::select()->where('user_id',$id_user)->latest()->take(4)->get();
        }

        //dd($lastSales);
        return view('admin.admin.index',["customers"=>$cutomers,"quotations"=>$quotations, "providers"=>$providers, "sales"=>$sales,"lastsale"=>$lastSales]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
