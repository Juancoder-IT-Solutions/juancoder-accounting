<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[expense_category_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Code</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[expense_category_code]" autocomplete="off" id="expense_category_code" placeholder="Category Code" maxlength="10" required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Type</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[expense_type]" id="expense_type" required>
                                    <option value=''>&mdash; Please Select &mdash;</option>
                                    <option value='OE'>Operational Expense</option>
                                    <option value='O'>Other Expense</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Name</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[expense_category]" id="expense_category" autocomplete="off" placeholder="Category Name" maxlength="75" required>
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