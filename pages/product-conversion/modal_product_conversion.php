<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 20px 26px;">
                    <input type="hidden" id="hidden_id" name="input[product_conversion_id]">

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Reference</strong></label>
                            <div>
                                <input type="text" class="form-control form-control-sm input-item" name="input[reference_number]" maxlength="30" id="reference_number" readonly required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
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
                            <label><strong>Date</strong></label>
                            <div>
                                <input type="date" class="form-control form-control-sm input-item" name="input[conversion_date]" id="conversion_date" required>
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
                        <div><b>Date:</b> <span id="conversion_date_label" class="label-item"></span></div>
                        <div><b>Reference:</b> <span id="reference_number_label" class="label-item"></span></div>
                        <div><b>Warehouse:</b> <span id="warehouse_name_label" class="label-item"></span></div>
                        <div><b>Remarks:</b> <span id="remarks_label" class="label-item"></span></div>
                    </div>
                    <div class="col-sm-8">
                        <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a id="menu-edit-transaction" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-pencil'></i> Edit Transaction</a>
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
                        <div class="form-group row" style="display: none;">
                            <div class="col">
                                <label><strong>Original Item Hidden</strong></label>
                                <div>
                                    <select class="form-control input-item select2" name="input[product_id]" id="product_id" required>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <form method='POST' id='frm_submit_2'>
                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Original Item Barcode</strong></label>
                                    <div>
                                        <input type="text" class="form-control form-control-sm" name="input[barcode]" id="product_barcode" autocomplete="off" placeholder="Scan barcode" onchange="handleBarcodeScanOriginal()">
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" id="hidden_id_2" name="input[conversion_id]">
                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Original Item</strong></label>
                                    <div>
                                        <select class="form-control input-item select2" name="input[original_product_id]" id="original_product_id" required>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Converted Item Barcode</strong></label>
                                    <div>
                                        <input type="text" class="form-control form-control-sm" name="input[barcode]" id="product_barcode_2" autocomplete="off" placeholder="Scan barcode" onchange="handleBarcodeScanConverted()">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Converted Item</strong></label>
                                    <div>
                                        <select class="form-control input-item select2" name="input[converted_product_id]" id="converted_product_id" required>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Original Quantity</strong></label>
                                    <div>
                                        <input type="number" class="form-control input-item" name="input[original_qty]" id="original_qty" min="0" required>
                                    </div>
                                </div>
                                <div class="col">
                                    <label><strong>Converted Quantity</strong></label>
                                    <div>
                                        <input type="number" class="form-control input-item" name="input[converted_qty]" id="converted_qty" min="0" required>
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
                                            <th>Original Item</th>
                                            <th>Original Qty</th>
                                            <th>Converted Item</th>
                                            <th>Converted Qty</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
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