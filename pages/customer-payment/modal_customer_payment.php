<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 30px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 15px;">
                    <input type="hidden" id="hidden_id" name="input[cp_id]">

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
                            <label><strong>Customer</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[customer_id]" id="customer_id" onchange="getReference()" required>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Date</strong></label>
                            <div>
                                <input type="date" class="form-control form-control-sm input-item" name="input[payment_date]" id="payment_date" required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Payment Type</strong></label>
                            <div>
                                <select class="form-control form-control-sm select2  input-item" name="input[payment_type]" id="payment_type" onchange="getPaymentOption()" required>
                                    <option value="">&mdash; Please Select &mdash;</option>
                                    <option value="C"> Cash </option>
                                    <option value="H"> Check </option>
                                    <option value="O"> Online Payment </option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div id="div_payment_option" class="form-group row" style="display:none;">
                        <div class="col">
                        <label><strong>Payment Option</strong></label>
                            <div>
                                <select class="form-control form-control-sm select2  input-item" name="input[payment_option_id]" id="payment_option_id">
                                    <option value="">&mdash; Please Select &mdash;</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div id="div_check" style="display:none;">
                        <div class="form-group row">
                            <div class="col">
                                <label><strong>Bank</strong></label>
                                <div>
                                    <input type="text" class="form-control form-control-sm pay-check input-item" name="input[check_bank]" maxlength="30" id="check_bank">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col">
                                <label><strong>Check #</strong></label>
                                <div>
                                <input type="text" class="form-control form-control-sm pay-check input-item" name="input[check_number]" maxlength="30" autocomplete="off" id="check_number">
                                </div>
                            </div>
                            <div class="col">
                                <label><strong>Check Date</strong></label>
                                <div>
                                    <input type="date" class="form-control form-control-sm pay-check input-item" name="input[check_date]" id="check_date">
                                </div>
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
                    <div class="col-sm-3">
                        <div><b>Customer:</b> <span id="customer_label" class="label-item"></span></div>
                        <div><b>Payment Type:</b> <span id="paymenttype_label" class="label-item"></span></div>
                        <div><b>Date:</b> <span id="payment_date_label" class="label-item"></span></div>
                        <div><b>Reference:</b> <span id="reference_number_label" class="label-item"></span></div>
                    </div>
                    <div class="col-sm-3">
                        <div id="div_label_check">
                        <div><b>Bank:</b> <span id="check_bank_label" class="label-item"></span></div>
                        <div><b>Check Date:</b> <span id="check_date_label" class="label-item"></span></div>
                        <div><b>Check #:</b> <span id="check_number_label" class="label-item"></span></div>
                        </div>
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
            <div class="modal-body" style="padding: 15px;">
                <div class="row">
                    <div class="col-4" id="col-item">
                        <form method='POST' id='frm_submit_2'>
                            <input type="hidden" id="hidden_id_2" name="input[cp_id]">

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Reference #</strong></label>
                                    <div>
                                        <select class="form-control form-control-sm select2" name="input[ref_id]" id="ref_id" required></select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Amount</strong></label>
                                    <div>
                                        <input type="number" class="form-control form-control-sm" name="input[amount]" step=".01" min=0 id="amount" required>
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
                                        <th>Refenence</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="2" style="text-align:right">Total:</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
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