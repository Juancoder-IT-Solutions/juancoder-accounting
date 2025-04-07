<form method='POST' id='frm_submit' class="jobOrder">
    <div class="modal fade" id="modalEntry" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 15px;">
                    <input type="hidden" id="hidden_id" name="input[job_order_id]">
                    <input type="hidden" id="hidden_warehouse_id" name="input[warehouse_id]">

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
                            <label><strong>Product</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[product_id]" id="product_id" required>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Date</strong></label>
                            <div>
                                <input type="date" class="form-control form-control-sm input-item" name="input[job_order_date]" id="job_order_date" required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>No. of batches</strong></label>
                            <div>
                                <input type="text" class="form-control form-control-sm input-item" autocomplete="off" name="input[no_of_batches]" id="no_of_batches" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Remarks</strong></label>
                            <div>
                                <textarea class="form-control form-control-sm input-item" name="input[remarks]" id="remarks" autocomplete="off" placeholder="Remarks" maxlength="255"></textarea>
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
                        <div><b>Product:</b> <span id="product_label" class="label-item"></span></div>
                        <div><b>No. of batches:</b> <span id="no_of_batches_label" class="label-item"></span></div>
                        <div><b>Date:</b> <span id="job_order_date_label" class="label-item"></span></div>
                        <div><b>Reference:</b> <span id="reference_number_label" class="label-item"></span></div>
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
                            <input type="hidden" id="hidden_id_2" name="input[job_order_id]">

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Product</strong></label>
                                    <div>
                                        <select class="form-control form-control-sm select2" name="input[product_id]" id="product_id_2" onchange="getProductCost()" required></select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Qty</strong></label>
                                    <div>
                                        <input type="number" class="form-control form-control-sm input-item" autocomplete="off" name="input[qty]" id="qty" required>
                                    </div>
                                </div>
                                <div class="col">
                                    <label><strong>Cost</strong></label>
                                    <div>
                                        <input type="number" step="0.01" class="form-control form-control-sm input-item" autocomplete="off" readonly name="input[cost]" id="cost" required>
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
                                        <th>Cost</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>