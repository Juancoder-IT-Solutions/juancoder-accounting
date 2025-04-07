<form method='POST' id='frm_submit' class="users">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 10px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body" style="padding: 15px;">
                    <input type="hidden" id="hidden_id" name="input[discount_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Discount Name</strong></label>
                            <div>
                                <input type="text" class="form-control form-control-sm input-item" name="input[discount_name]" id="discount_name" placeholder="Discount Name" maxlength="100" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Description</strong></label>
                            <div>
                                <textarea class="form-control form-control-sm input-item" name="input[description]" id="description" placeholder="Description" maxlength="255"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" style="margin-bottom: 0px;">
                        <div class="col">
                            <div class="form-check form-check-flat form-check-primary">
                                <label class="form-check-label">
                                    <input type="radio" value="1" name="input[is_percentage]" id="is_percentage" class="form-check-input" onchange="changeDiscountType(1)" checked>
                                    Percentage Discount
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-check form-check-flat form-check-primary">
                                <label class="form-check-label">
                                    <input type="radio" value="0" name="input[is_percentage]" id="is_amount" class="form-check-input" onchange="changeDiscountType(0)">
                                    Amount Discount
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-4">
                            <label><strong>Coverage</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[coverage_type]" id="coverage_type" onchange="checkCoverage()" required>
                                    <option value="">&mdash; Select &mdash; </option>
                                    <option value="A">All Items</option>
                                    <option value="L">Selected</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-4 disc-percentage">
                            <label><strong>Discount (%)</strong></label>
                            <div>
                                <input type="number" step="0.01" class="form-control form-control-sm input-item" name="input[discount_percent]" id="discount_percent" max="100" required>
                            </div>
                        </div>
                        <div class="col-4 disc-amount" style="display: none;">
                            <label><strong>Discount (₱)</strong></label>
                            <div>
                                <input type="number" step="0.01" class="form-control form-control-sm input-item" name="input[discount_amount]" id="discount_amount" max="100">
                            </div>
                        </div>
                        <div class="col-4">
                            <label><strong>Type</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[discount_type]" id="discount_type" required>
                                    <option value="">&mdash; Select &mdash; </option>
                                    <option value="A">Automatic</option>
                                    <option value="M">Manual</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row type-manual">
                        <div class="col">
                            <label><strong>Start Date</strong></label>
                            <div>
                                <input type="date" class="form-control form-control-sm input-item" name="input[discount_start]" id="discount_start" required>
                            </div>
                        </div>
                        <div class="col">
                            <label><strong>End Date</strong></label>
                            <div>
                                <input type="date" class="form-control form-control-sm input-item" name="input[discount_end]" id="discount_end" required>
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

<div class="modal fade bd-example-modal-lg" id="modalEntry2" aria-labelledby="myModalLabel">
    <div class="modal-dialog  modal-lg" style="margin-top: 50px;" role="document">
        <div class="modal-content">
            <div class="modal-header" style="display:block;">
                <div class="row" style="font-size: small;">
                    <div class="col-sm-3">
                        <div><b>Discount:</b> <span id="discount_name_label" class="label-item"></span></div>
                        <div><b>Description:</b> <span id="description_label" class="label-item"></span></div>
                        <div><b>Coverage:</b> <span id="coverage_label" class="label-item"></span></div>
                        <span style="display: none;" id="status_label" class="label-item"></span>
                        <span style="display: none;" id="coverage_type_label" class="label-item"></span>
                    </div>
                    <div class="col-sm-3">
                        <div><b>Percentage/Amount:</b> <span id="poa_label" class="label-item"></span></div>
                        <div><b>Type:</b> <span id="type_label" class="label-item"></span></div>
                        <div><b>Effective:</b> <span id="duration_label" class="label-item"></span></div>
                    </div>
                    <div class="col-sm-6">
                        <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a id="menu-edit-transaction" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-pencil'></i> Edit Transaction</a>
                            </li>
                            <li class="nav-item">
                                <a id="menu-finish-transaction" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-check'></i> Finish Transaction</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-dismiss="modal" style="font-size: small;"><i class='ti ti-close'></i> Close</a>
                            </li>
                            <!--<li class="nav-item">
                                <a class="nav-link disabled" href="#">Disabled</a>
                            </li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-body" style="padding: 15px;">
                <div class="row">
                    <div class="col-4" id="col-item">
                        <input type="hidden" id="hidden_id_2" name="input[discount_id]">
                        <div class="form-group row">
                            <div class="col">
                                <label><strong>Category</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" name="input[product_category_id]" id="product_category_id" onchange="getEntries2()" required></select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-8" id="col-list">
                        <div class="table-responsive">
                            <table class="display expandable-table" id="dt_entries_2" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>
                                            <div class="check-all"><input type='checkbox' onchange="checkAll(this, 'dt_id_2'),checkAllDiscount()"></div>
                                        </th>
                                        <th>Product</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>