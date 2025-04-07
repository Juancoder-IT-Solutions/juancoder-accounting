<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[customer_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Name</strong></label>
                            <div>
                            <input type="text" class="form-control input-item" name="input[customer_name]" id="customer_name" autocomplete="off" placeholder="Customer Name" maxlength="100" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Address</strong></label>
                            <div>
                            <textarea class="form-control input-item" name="input[customer_address]" id="customer_address" autocomplete="off" placeholder="Address" maxlength="255" required></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>TIN</strong></label>
                            <div>
                            <input type="text" class="form-control input-item" name="input[customer_tin]" autocomplete="off" id="customer_tin" placeholder="Customer TIN" maxlength=30 required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Contact #</strong></label>
                            <div>
                            <input type="text" class="form-control input-item" name="input[customer_contact_number]" autocomplete="off" id="customer_contact_number" placeholder="Contact No." maxlength=15 required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Terms</strong></label>
                            <div>
                            <input type="number" class="form-control input-item" name="input[customer_terms]" autocomplete="off" id="customer_terms" placeholder="Terms" maxlength=6 required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Suki Card #</strong></label>
                            <div>
                            <input type="text" class="form-control input-item" name="input[suki_card_number]" autocomplete="off" id="suki_card_number" placeholder="Suki card number" maxlength=12 required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Remarks</strong></label>
                            <div>
                            <textarea class="form-control input-item" name="input[remarks]" id="remarks" placeholder="Remarks" autocomplete="off" maxlength="255"></textarea>
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