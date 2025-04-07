<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 20px 26px;">
                    <input type="hidden" id="hidden_id" name="input[product_id]">

                    <div class="form-group row" style="margin-bottom: 0px;">
                        <div class="col">
                            <div class="form-check form-check-flat form-check-primary">
                                <label class="form-check-label">
                                    <input type="checkbox" value="1" name="input[is_package]" id="is_package" class="form-check-input">
                                    This products is packaged (with multiple items)
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Product Code</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[product_code]" id="product_code" placeholder="Product Code" autocomplete="off" maxlength="100" required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>Barcode</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[product_barcode]" id="product_barcode" placeholder="Product Barcode" autocomplete="off" maxlength="50">
                            </div>
                        </div>
                    </div>

                    <div class="form-group row" style="margin-top: 0px;">
                        <div class="col">
                            <label><strong>Name</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[product_name]" id="product_name" placeholder="Product Name" autocomplete="off" maxlength="75" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Category</strong></label>
                            <div>
                                <select class="form-control input-item" name="input[product_category_id]" id="product_category_id" required>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Price</strong></label>
                            <div>
                                <input type="number" class="form-control input-item" name="input[product_price]" id="product_price" step=".01" min="0" autocomplete="off" required>
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