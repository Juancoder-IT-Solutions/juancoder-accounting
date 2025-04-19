<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Cash Additionals</h3>
                    <h6 class="font-weight-normal mb-3">Manage cash here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-3 col-xl-3">
                            <label><strong>Start Date</strong></label>
                            <div>
                                <input type="date" required class="form-control form-control-sm" id="start_date"
                                    value="<?php echo date('Y-m-01', strtotime(date(" Y-m-d"))); ?>"
                                    name="input[start_date]">
                            </div>
                        </div>
                        <div class="col-3 col-xl-3">
                            <label><strong>End Date</strong></label>
                            <div>
                                <input type="date" required class="form-control form-control-sm" id="end_date"
                                    value="<?php echo date('Y-m-t', strtotime(date(" Y-m-d"))) ?>"
                                    name="input[end_date]">
                            </div>
                        </div>
                        <div class="col-6 col-xl-6">
                            <label>&nbsp;</label>
                            <div>
                                <button type="button" class="btn btn-warning btn-icon-text" onclick="getEntries()">
                                    <i class="ti-reload mr-1"></i> Generate Entry
                                </button>
                                <button type="button" class="btn btn-primary btn-icon-text" onclick="addModal()">
                                    <i class="ti-plus mr-1"></i> Add Entry
                                </button>
                                <button type="button" class="btn btn-danger btn-icon-text" onclick="deleteEntry()" id="btn_delete">
                                    <i class="ti-trash mr-1"></i> Delete Entry
                                </button>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="table-responsive">
                        <table class="display expandable-table" id="dt_entries" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th><input type='checkbox' onchange="checkAll(this, 'dt_id')"></th>
                                    <!-- <th></th> -->
                                    <th>Reference #</th>
                                    <th>Cashier</th>
                                    <th>Warehouse</th>
                                    <th>Amount</th>
                                    <th>Date Added</th>
                                    <th>Encoded By</th>
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
<?php include 'modal_cash_additionals.php' ?>
<script type="text/javascript">
    function getEntries() {
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var param = "(date_added >= '" + start_date + "' AND date_added <= '" + end_date + "')";
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "order": [[3, 'desc']],
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data",
                "type": "POST",
                "data": {
                    input: {
                        param: param
                    }
                }
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return row.summary_id > 0 ? "" : "<input type='checkbox' value=" + row.cash_additional_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                // {
                //     "mRender": function(data, type, row) {
                //         return "<div style='display:flex;align-items:center'><button class='btn btn-primary btn-circle mr-1' onclick='getEntryDetails(" + row.cash_additional_id + ")' style='padding:15px';height='45px;'><span class='ti ti-pencil'></span></button></div>";
                //     }
                // },
                {
                    "data": "reference_number"
                },
                {
                    "data": "cashier_name"
                },
                {
                    "data": "warehouse_name"
                },
                {
                    "data": "amount",
                },
                {
                    "data": "date_added"
                },
                {
                    "data": "encoded_by",
                }
            ]
        });
    }

    $(document).ready(function() {
        getEntries();
        getSelectOption('Users', 'user_id', 'user_fullname', "user_category = 'C'");
    });
</script>