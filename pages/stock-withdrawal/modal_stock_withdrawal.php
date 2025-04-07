<form method='POST' id='frm_submit' class="stock-withdrawal">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 15px;">
                    <input type="hidden" id="hidden_id" name="input[withdrawal_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Reference #</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[reference_number]" maxlength="30" id="reference_number" readonly required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Date</strong></label>
                            <div>
                            <input type="date" class="form-control input-item" name="input[withdrawal_date]" id="withdrawal_date" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Delivery #</strong></label>
                            <div>
                            <select class="form-control form-control-sm select2" name="input[sales_id]" id="sales_id" required></select >
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Remarks</strong></label>
                            <div>
                            <textarea class="form-control input-item" name="input[remarks]" id="remarks" placeholder="Remarks" maxlength="255"></textarea>
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
                        <div><b>Reference:</b> <span id="reference_number_label" class="label-item"></span></div>
                        <div><b>Sales Reference:</b> <span id="sales_reference_number_label" class="label-item"></span></div>
                        <div><b>Date:</b> <span id="withdrawal_date_label" class="label-item"></span></div>
                        <span style="display: none;" id="status_label" class="label-item"></span>
                    </div>
                    <div class="col-sm-8">
                        <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a id="menu-edit-transaction" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-pencil'></i> Edit Transaction</a>
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
                    <div class="col-12">
                    <form method='POST' id='frm_release'>
                        <input type="hidden" id="hidden_id_2" name="input[withdrawal_id]">
                        <div class="table-responsive">
                            <table class="display expandable-table" id="dt_entries_2" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Remaining Qty</th>
                                        <th>Release Qty</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                        <hr>
                        <button type="submit" class="btn btn-success" id="btn_save_release" style="float: right;"><i class="ti ti-check"></i> Save</button>
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