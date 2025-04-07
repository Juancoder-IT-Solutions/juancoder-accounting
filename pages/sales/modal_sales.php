<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 10px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 15px;">
                    <input type="hidden" id="hidden_id" name="input[sales_id]">

                    <div class="form-group row" style="margin-bottom: 0px;">
                        <div class="col">
                            <div class="form-check form-check-flat form-check-primary" style="float:right;margin-bottom: 0px;">
                                <label class="form-check-label">
                                    <input type="checkbox" class="input-item" name="input[for_pick_up]" id="for_pick_up" value="1">
                                    For Pick-up
                                    <i class="input-helper"></i></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Reference</strong></label>
                            <div>
                                <input type="text" class="form-control form-control-sm input-item" name="input[reference_number]" maxlength="30" id="reference_number" readonly required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Warehouse</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[warehouse_id]" id="warehouse_id" required>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Customer</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[customer_id]" id="customer_id" required>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Date</strong></label>
                            <div>
                                <input type="date" class="form-control form-control-sm input-item" name="input[sales_date]" id="sales_date" required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Sales Type</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[sales_type]" id="sales_type" required>
                                    <option value="">&mdash; Please Select &mdash;</option>
                                    <option value="C"> Cash </option>
                                    <option value="H"> Charge </option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Discount</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[discount_id]" id="discount_id" required>
                                    <option value="">&mdash; Please Select &mdash;</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Remarks</strong></label>
                            <div>
                                <textarea class="form-control form-control-sm input-item" name="input[remarks]" id="remarks" placeholder="Remarks" maxlength="255"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class='btn-group'>
                        <button type="submit" class="btn btn-primary" id="btn_submit">Submit</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>


<div class="modal fade bd-example-modal-lg" id="modalEntry2" aria-labelledby="myModalLabel">
    <div class="modal-dialog  modal-lg" style="margin-top: 50px;" role="document">
        <div class="modal-content">
            <div class="modal-header" style="display:block;">
                <div class="row" style="font-size: small;">
                    <div class="col-sm-4">
                        <div><b>Customer:</b> <span id="customer_name_label" class="label-item"></span></div>
                        <div><b>Sales Type:</b> <span id="salestype_label" class="label-item"></span></div>
                        <div><b>Date:</b> <span id="sales_date_label" class="label-item"></span></div>
                        <div><b>Warehouse:</b> <span id="warehouse_name_label" class="label-item"></span></div>
                        <div><b>Reference:</b> <span id="reference_number_label" class="label-item"></span></div>
                        <div><span class="badge badge-success" style="display:none;" id="for_pick_up_label">For pick-up</span></div>
                    </div>
                    <div class="col-sm-8">
                        <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a id="menu-edit-transaction" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-pencil'></i> Edit Sales</a>
                            </li>
                            <li class="nav-item">
                                <a id="menu-delete-selected-items" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-trash'></i> Delete Selected Items</a>
                            </li>
                            <li class="nav-item">
                                <a id="menu-finish-transaction" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-check'></i> Finish Transaction</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-dismiss="modal" style="font-size: small;"><i class='ti ti-close'></i> Close</a>
                            </li>
                            <!--<li class="nav-item">
                                <a class="nav-link disabled" href="#">Disabled</a>
                            </li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-body" style="padding: 15px;">
                <div class="row">
                    <div class="col-4" id="col-item">
                        <form method='POST' id='frm_submit_2'>
                            <input type="hidden" id="hidden_id_2" name="input[sales_id]">

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Product</strong></label>
                                    <div>
                                        <select class="form-control form-control-sm select2" name="input[product_id]" id="product_id" onchange="changeProduct()" required></select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Qty</strong></label>
                                    <div>
                                        <input type="number" class="form-control form-control-sm" name="input[quantity]" step=".01" min=0 id="quantity" required>
                                    </div>
                                </div>
                                <div class="col">
                                    <label><strong>Price</strong></label>
                                    <div>
                                        <input type="number" class="form-control form-control-sm" name="input[price]" step=".01" min=0 id="price" readonly required>
                                    </div>
                                </div>
                            </div>

                            <div class='btn-group'>
                                <button type="submit" class="btn btn-primary" id="btn_submit_2">Submit</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-8" id="col-list">
                        <form>
                            <div class="table-responsive">
                                <table class="display expandable-table" id="dt_entries_2" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th><input type='checkbox' onchange="checkAll(this, 'dt_id_2')"></th>
                                            <th>Product</th>
                                            <th>Qty</th>
                                            <th>Price</th>
                                            <th>Discount</th>
                                            <th>Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th colspan="5" style="text-align:right">Total:</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!--        <div class="modal-footer">
                <div class='btn-group'>
                    <button type="button" class="btn btn-primary btn-sm" id="btn_finish">Finish</button>
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div> -->
        </div>
    </div>
</div>