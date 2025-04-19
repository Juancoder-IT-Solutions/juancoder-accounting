<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 15px;">
                    <input type="hidden" id="hidden_id" name="input[cash_additional_id]">

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
                            <label><strong>Cashier</strong></label>
                            <div>
                                <select class="form-control form-control-sm select2" name="input[user_id]" id="user_id" required></select>
                            </div>
                        </div>
                    </div>

                    <div class="form group row">
                        <div class="col">
                            <label><strong>Amount</strong></label>
                            <div>
                                <input type="number" step="0.01" class="form-control form-control-sm" name="input[amount]" id="amount" required>
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
