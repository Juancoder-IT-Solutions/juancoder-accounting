<form method='POST' id='frm_submit' class="banks">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[bank_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Bank Name</strong></label>
                            <div>
                            <input type="text" class="form-control input-item" name="input[bank_name]" id="bank_name" autocomplete="off" placeholder="Bank Name" maxlength="100" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Branch</strong></label>
                            <div>
                            <textarea class="form-control input-item" name="input[bank_branch]" id="bank_branch" autocomplete="off" placeholder="Bank Branch" maxlength="255" required></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Account Name</strong></label>
                            <div>
                            <input type="text" class="form-control input-item" name="input[bank_account_name]" autocomplete="off" id="bank_account_name" placeholder="Account Name" maxlength=50 required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Account #</strong></label>
                            <div>
                            <input type="text" class="form-control input-item" name="input[bank_account_number]" autocomplete="off" id="bank_account_number" placeholder="Account No." maxlength=20 required>
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