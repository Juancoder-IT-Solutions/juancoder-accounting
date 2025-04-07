<form method='POST' id='frm_submit' class="beginning-balance">
    <div class="modal fade" id="modalEntry" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 25px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 15px;">
                    <input type="hidden" id="hidden_id" name="input[bb_id]">

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Reference</strong></label>
                            <div>
                                <input type="text" class="form-control form-control-sm input-item" name="input[reference_number]" maxlength="30" id="reference_number" readonly required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Date</strong></label>
                            <div>
                                <input type="date" class="form-control form-control-sm input-item" name="input[bb_date]" id="bb_date" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label><strong>Module</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[bb_module]" id="bb_module" onchange="checkModule()" required>
                                    <option value=''>&mdash; Please Select &mdash;</option>
                                    <option value='AP'>Accounts Payable</option>
                                    <option value='AR'>Accounts Receivable</option>
                                    <option value='INV'>Inventory</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label><strong>Account</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[bb_ref_id]" id="bb_ref_id" required>
                                    <option value=''>&mdash; Pleasesd Select &mdash;</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col" id="div_inv" style="display: none;">
                            <label><strong>Qty</strong></label>
                            <div>
                                <input type="number" step="0.01" class="form-control form-control-sm input-item" name="input[bb_qty]" id="bb_qty" required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Amount</strong></label>
                            <div>
                                <input type="number" step="0.01" class="form-control form-control-sm input-item" name="input[bb_amount]" id="bb_amount" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Warehouse</strong></label>
                            <div>
                                <select class="form-control form-control-sm select2" id="warehouse_id" name="input[warehouse_id]">
                                    <option class="">&mdash; Please Select &mdash; </option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Remarks</strong></label>
                            <div>
                                <textarea class="form-control form-control-sm input-item" name="input[bb_remarks]" id="bb_remarks" placeholder="Remarks" maxlength="255"></textarea>
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
