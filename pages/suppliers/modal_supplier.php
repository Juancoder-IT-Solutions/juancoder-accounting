<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;"  role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[supplier_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Name</strong></label>
                            <div>
                            <input type="text" class="form-control input-item" name="input[supplier_name]" id="supplier_name" placeholder="Supplier Name" maxlength="100" autocomplete="off" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Address</strong></label>
                            <div>
                            <textarea type="text" class="form-control input-item" name="input[supplier_address]" id="supplier_address" placeholder="Address" maxlength="255" autocomplete="off" required></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Contact #</strong></label>
                            <div>
                            <input type="text" class="form-control input-item" name="input[contact_number]" autocomplete="off" id="contact_number" placeholder="Contact No." maxlength=15 required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Remarks</strong></label>
                            <div>
                            <textarea class="form-control input-item" name="input[remarks]" id="remarks" autocomplete="off" placeholder="Remarks" maxlength="255"></textarea>
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