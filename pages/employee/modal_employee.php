<form method='POST' id='frm_submit' class="employee">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[employee_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>First Name</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[emp_firstname]" id="emp_firstname" autocomplete="off" placeholder="Employee First Name" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Middle Name</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[emp_mname]" id="emp_mname" autocomplete="off" placeholder="Employee Middle Name" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>First Name</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[emp_lastname]" id="emp_lastname" autocomplete="off" placeholder="Employee Last Name" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Category</strong></label>
                            <div>
                                <select class="form-control select2" name="input[category_id]" id="category_id" required>
                                    <option value=''>&mdash; Please Select &mdash;</option>
                                </select>
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