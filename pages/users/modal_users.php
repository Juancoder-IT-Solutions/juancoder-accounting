<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[user_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Fullname</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[user_fullname]" id="user_fullname" placeholder="User fullname" maxlength="100" autocomplete="off" required>
                            </div>
                        </div>
                    </div>
                    <div id="div_category" class="form-group row">
                        <div class="col">
                            <label><strong>Category</strong></label>
                            <div>
                                <select class="form-control input-item select2" name="input[user_category]" id="user_category" onchange="userCategory()" required>
                                    <option value="">&mdash; Please Select &mdash;</option>
                                    <option value="S">Staff</option>
                                    <option value="C">Cashier</option>
                                    <option value="W">Warehouse Personnel</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div id="div_warehouse" class="form-group row">
                        <div class="col">
                            <label><strong>Warehouse</strong></label>
                            <div>
                                <select class="form-control input-item select2" name="input[warehouse_id]" id="warehouse_id" required>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Username</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[username]" autocomplete="off" id="username" placeholder="Username" maxlength=15 required>
                            </div>
                        </div>
                    </div>
                    <div id="div_password" class="form-group row">
                        <div class="col">
                            <label><strong>Password</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[password]" autocomplete="off" id="password" placeholder="Password" required>
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