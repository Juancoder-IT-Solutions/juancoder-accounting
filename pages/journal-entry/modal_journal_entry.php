<form method='POST' id='frm_submit' class="journalentry">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document" style="width: 50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[journal_entry_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Journal</strong></label>
                            <div>
                                <select class="form-control input-item select2" name="input[journal_id]" id="journal_id" onchange="generateRef()" required>
                                    <option value=''>&mdash; Please Select &mdash;</option>
                                </select>
                            </div>
                        </div>

                        <div class="col">
                            <label><strong>General Reference</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[reference_number]" id="reference_number" autocomplete="off" placeholder="General Reference" required readonly>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Date</strong></label>
                            <div>
                                <input type="date" class="form-control input-item" name="input[journal_date]" id="journal_date" autocomplete="off" placeholder="Journal Date" required>
                            </div>
                        </div>
                    </div>
                    

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Cross Reference</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[cross_reference]" id="cross_reference" autocomplete="off" placeholder="Cross Reference">
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Remarks</strong></label>
                            <div>
                                <textarea class="form-control input-item" name="input[remarks]" id="remarks" autocomplete="off" placeholder="Remarks"></textarea>
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
                    <div class="col-sm-4">
                        <div><b>General Reference:</b> <span id="general_reference" class="label-item"></span></div>
                        <div><b>Cross Reference:</b> <span id="cross_reference" class="label-item"></span></div>
                        <div><b>Branch:</b> <span id="branch_id" class="label-item"></span></div>
                        <div><b>Date:</b> <span id="journal_date" class="label-item"></span></div>
                        <div><b>Remarks:</b> <span id="remarks" class="label-item"></span></div>
                    </div>
                    <div class="col-sm-8">
                        <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a id="menu-edit-transaction" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-pencil'></i> Edit Transaction</a>
                            </li>
                            <li class="nav-item">
                                <a id="menu-delete-selected-items" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-trash'></i> Delete Selected Items</a>
                            </li>
                            <li class="nav-item">
                                <a id="menu-finish-transaction" class="nav-link" href="#" style="font-size: small;"><i class='ti ti-check'></i> Finish Transaction</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-dismiss="modal" style="font-size: small;"><i class='ti ti-close'></i> Close</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-body" style="padding: 15px;">
                <div class="row">
                    <div class="col-4" id="col-item">
                        <form method='POST' id='frm_submit_2'>
                            <input type="hidden" id="hidden_id_2" name="input[journal_entry_id]">

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Chart</strong></label>
                                    <div>
                                        <select class="form-control form-control-sm select2" name="input[chart_id]" id="chart_id" required>
                                            <option value=''>&mdash; Please Select &mdash;</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col">
                                    <label><strong>Type</strong></label>
                                    <div>
                                        <select class="form-control select2" name="input[type]" id="type" required>
                                            <option value=''>&mdash; Please Select &mdash;</option>
                                            <option value='D'>Debit</option>
                                            <option value='C'>Credit</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col">
                                    <label><strong>Amount</strong></label>
                                    <div>
                                        <input type="number" class="form-control form-control-sm input-item" name="input[amount]" id="amount" placeholder="Amount" min="0" required>
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

                            <div class='btn-group'>
                                <button type="submit" class="btn btn-primary" id="btn_submit_2">Submit</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-8" id="col-list">
                        <div class="table-responsive">
                            <table class="display expandable-table" id="dt_entries_2" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th><input type='checkbox' onchange="checkAll(this, 'dt_id_2')"></th>
                                        <th>Chart</th>
                                        <th>Description</th>
                                        <th>Debit</th>
                                        <th>Credit</th>
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