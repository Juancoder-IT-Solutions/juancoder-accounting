<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 15px;">
                    <input type="hidden" id="hidden_id" name="input[po_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Reference #</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[reference_number]" maxlength="30" id="reference_number" readonly required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Invoice #</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[po_invoice]" maxlength="30" id="po_invoice" autocomplete="off" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Supplier</strong></label>
                            <div>
                                <select class="form-control form-control-sm select2" name="input[supplier_id]" id="supplier_id" required></select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Warehouse</strong></label>
                            <div>
                                <select class="form-control form-control-sm select2" name="input[warehouse_id]" id="warehouse_id" required></select>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Terms (days)</strong></label>
                            <div>
                                <input type="number" class="form-control input-item" name="input[po_terms]" min="0" maxlength="5" id="po_terms" autocomplete="off" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Type</strong></label>
                            <div>
                                <select class="form-control input-item select2" name="input[po_type]" id="po_type" required>
                                    <option value=''> &mdash; Please Select &mdash; </option>
                                    <option value='C'>Cash</option>
                                    <option value='H'>Charge</option>
                                </select>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Date</strong></label>
                            <div>
                                <input type="date" class="form-control input-item" name="input[po_date]" id="po_date" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Remarks</strong></label>
                            <div>
                                <textarea class="form-control input-item" name="input[po_remarks]" id="po_remarks" placeholder="Remarks" maxlength="255"></textarea>
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


<div class="modal fade bd-example-modal-lg" id="modalEntry2" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" style="margin-top: 50px;" role="document">
        <div class="modal-content">
            <div class="modal-header" style="display:block;">
                <div class="row" style="font-size: small;">
                    <div class="col-sm-3">
                        <div><b>Supplier:</b> <span id="supplier_name_label" class="label-item"></span></div>
                        <div><b>Invoice #:</b> <span id="po_invoice_label" class="label-item"></span></div>
                        <div><b>Date:</b> <span id="po_date_label" class="label-item"></span></div>
                        <div><b>Warehouse:</b> <span id="warehouse_name_label" class="label-item"></span></div>
                        <div><b>Reference:</b> <span id="reference_number_label" class="label-item"></span></div>
                    </div>
                    <div class="col-sm-3">
                        <div><b>Type:</b> <span id="po_type_name_label" class="label-item"></span></div>
                        <div><b>Terms:</b> <span id="po_terms_label" class="label-item"></span></div>
                        <div><b>Remarks:</b> <span id="po_remarks_label" class="label-item"></span></div>
                    </div>
                    <div class="col-sm-6">
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
            <div class="modal-body">
                <div class="row">
                    <div class="col-4" id="col-item">
                        <form method='POST' id='frm_submit_2'>
                            <input type="hidden" id="hidden_id_2" name="input[po_id]">

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Barcode</strong></label>
                                    <div>
                                        <input type="text" class="form-control form-control-sm product_barcode" name="input[barcode]" id="product_barcode" autocomplete="off" placeholder="Scan barcode" onchange="handleBarcodeScan()">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Product</strong></label>
                                    <div>
                                        <select class="form-control form-control-sm select2" name="input[product_id]" id="product_id" required></select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Qty</strong></label>
                                    <div>
                                        <input type="number" class="form-control form-control-sm" name="input[qty]" step=".01" min=0 id="qty" required>
                                    </div>
                                </div>
                                <div class="col">
                                    <label><strong>Price</strong></label>
                                    <div>
                                        <input type="number" class="form-control form-control-sm" name="input[supplier_price]" step=".01" min=0 id="supplier_price" required>
                                    </div>
                                </div>
                            </div>
                            <div class='btn-group'>
                                <button type="submit" class="btn btn-primary" id="btn_submit_2">Submit</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-8" id="col-list">
                        <div class="table-responsive">
                            <table class="display expandable-table" id="dt_entries_2" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th><input type='checkbox' onchange="checkAll(this, 'dt_id_2')"></th>
                                        <th>Product</th>
                                        <th>Qty</th>
                                        <th>Price</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="4" style="text-align:right">Total:</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>