<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[product_category_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Name</strong></label>
                            <div>
                            <input type="text" class="form-control input-item" name="input[product_category]" id="product_category" placeholder="Category Name" maxlength="75" required>
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