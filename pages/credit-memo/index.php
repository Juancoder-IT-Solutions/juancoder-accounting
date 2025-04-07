<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Credit Memo</h3>
                    <h6 class="font-weight-normal mb-2">Manage credit memo here.</h6>
                    <h6 class="font-weight-bold mb-3" style="color:red;font-weight:500px;">NOTE: Use this module to encode customer discounts, supplier's interests, and other transactions related to debit in Accounts Payable and credit in Accounts Receivable.</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-3 col-xl-3  ">
                            <label><strong>Start Date</strong></label>
                            <div>
                                <input type="date" required class="form-control form-control-sm" id="start_date" value="<?php echo date('Y-m-01', strtotime(date("Y-m-d"))); ?>" name="input[start_date]">
                            </div>
                        </div>
                        <div class="col-3 col-xl-3">
                            <label><strong>End Date</strong></label>
                            <div>
                                <input type="date" required class="form-control form-control-sm" id="end_date" value="<?php echo date('Y-m-t', strtotime(date("Y-m-d"))) ?>" name="input[end_date]">
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
                                    <th></th>
                                    <th>Reference #</th>
                                    <th>Account</th>
                                    <th>Amount</th>
                                    <th>Encoded by</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Date Modified</th>
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
<?php require_once 'modal_credit_memo.php'; ?>
<?php require_once 'modal_print.php'; ?>
<script type="text/javascript">
    
    function addModalPO() {
        document.getElementById("frm_submit").reset();

        generateReference(route_settings.class_name);

        $("#hidden_id").val(0);
        $("#modalLabel").html("<span class='fa fa-pen'></span> Add Entry");
        $("#modalEntry").modal('show');
    }

   
    function getEntries() {
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var param = "(memo_date >= '"+start_date+"' AND memo_date <= '"+end_date+"')";
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "order": [[ 2, 'desc' ]],
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data",
                "type": "POST",
                "data": {
                    input: {
                        param:param
                    }
                }
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return row.status != 'F' ? "<input type='checkbox' value=" + row.cm_id + " class='dt_id' style='position: initial; opacity:1;'>" : "";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return "<center><button class='btn btn-primary btn-circle btn-sm' onclick='getEntryDetails2(" + row.cm_id + ")'><span class='ti ti-list'></span></button><button onclick='printRecord("+ row.cm_id +")' class='btn btn-secondary btn-circle btn-sm'><span class='ti ti-printer'></span></button></center>";
                    }
                },
                {
                    "data": "reference_number"
                },
                {
                    "data": "account"
                },
                {
                    "data": "total"
                },
                {
                    "data": "encoded_name"
                },
                {
                    "mRender": function(data, type, row) {
                        return row.status == 'F' ? "<span class='badge badge-success'>Finish</span>" : "<span class='badge badge-danger'>Saved</span>";
                    }   
                },
                {
                    "data": "memo_date"
                },
                {
                    "data": "date_last_modified"
                }
            ]
        });
    }

    function getEntries2() {
        var hidden_id_2 = $("#hidden_id_2").val();
        var param = "cm_id = '" + hidden_id_2 + "'";
        $("#dt_entries_2").DataTable().destroy();
        $("#dt_entries_2").DataTable({
            "processing": true,
            "order": [[ 3, 'desc' ]],
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show_detail",
                "dataSrc": "data",
                "type": "POST",
                "data": {
                    input: {
                        param: param
                    }
                }
            },
            "footerCallback": function(row, data, start, end, display) {
                var api = this.api();

                // Remove the formatting to get integer data for summation
                var intVal = function(i) {
                    return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                        i : 0;
                };

                // Total over all pages
                total = api
                    .column(3)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Total over this page
                pageTotal = api
                    .column(3, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(3).footer()).html(
                    "&#x20B1; " + this.fnSettings().fnFormatNumber(parseFloat(parseFloat(total).toFixed(2)))
                );
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' value=" + row.cmd_id + " class='dt_id_2' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "data": "reference"
                },
                {
                    "data": "description"
                },
                {
                    "data": "amount"
                },
            ]
        });
    }

    function referenceCounter() {
        var reference_id = $("#reference_id").val();
        var id = $("#hidden_id_2").val();
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=CreditMemo&q=ref_checker",
            data: {
                input: {
                    reference_id: reference_id,
                    id:id
                }
            },
            success: function(data) {
                var json = JSON.parse(data);
                if (json.data > 0) {
                    $("#btn_submit_2").prop('disabled', false);
                } else {
                    $("#btn_submit_2").prop('disabled', true);
                }
            }
        });
    }

    function getAccount(){
        var memo_type = $("#memo_type").val();
        if(memo_type == "AP"){
            getSelectMutiID('Suppliers', 'account_id', 'supplier_name', '', [], 'supplier_id');
        }else{
            getSelectMutiID('Customers', 'account_id', 'customer_name', '', [], 'customer_id');
        }
    }

    $(document).ready(function() {
        schema();
        getEntries();
    });

</script>