<form method='POST' id='frm_submit' class="chartofaccounts">
    <div class="modal fade" id="modalEntry" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id" name="input[chart_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Code</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[chart_code]" id="chart_code" autocomplete="off" placeholder="Chart Code" required>
                            </div>
                        </div>

                        <div class="col">
                            <label><strong>Type</strong></label>
                            <div>
                                <select class="form-control" name="input[chart_type]" id="chart_type">
                                    <option value="">Select Type</option>
                                    <option value="M">Main</option>
                                    <option value="S">Sub</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Chart</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[chart_name]" id="chart_name" autocomplete="off" placeholder="Chart of Account" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row" style="display: none;" id="mainChartinput">
                        <div class="col">
                            <label><strong>Main Chart</strong></label>
                            <div>
                                <input type="text" class="form-control input-item" name="input[main_chart]" id="main_chart_id" autocomplete="off" placeholder="Main Chart" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Classification</strong></label>
                            <div>
                                <select class="form-control select2" name="input[chart_class_id]" id="chart_class_id" required>
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