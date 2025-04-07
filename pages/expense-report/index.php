<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Expense Report</h3>
                    <h6 class="font-weight-normal mb-3">Generate expense report here</h6>
                </div>
            </div>
            <div id="daily" class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <form id='frm_generate'>
                        <div class="row mb-3">
                            <div class="col">
                                <label><strong>Start Date</strong></label>
                                <div>
                                    <input type="date" value="<?php echo date('Y-m-01', strtotime(date("Y-m-d"))); ?>" required class="form-control" id="start_date" name="input[start_date]">
                                </div>
                            </div>
                            <div class="col">
                                <label><strong>End Date</strong></label>
                                <div>
                                    <input type="date" required class="form-control" value="<?php echo date('Y-m-t', strtotime(date("Y-m-d"))) ?>" id="end_date" name="input[end_date]">
                                </div>
                            </div>
                            <div class="col">
                                <label><strong>Type</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" required id="expense_type" name="input[expense_type]" onchange="getCategory()">
                                        <option value="-1">All</option>
                                        <option value='OE'>Operational Expense</option>
                                        <option value='O'>Other Expense</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <label><strong>Category</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" required id="expense_category_id" name="input[expense_category_id]">
                                        <option value="-1">All</option>
                                    </select>
                                </div>
                            </div>
                            
                        </div>
                        <div class="row mb-3" style="display: flex; justify-content: flex-end;">
                            <label>&nbsp;</label>
                            <div>

                                <button type="submit" id="btn_daily" class="btn btn-warning btn-icon-text">
                                    <i class="ti-reload mr-1"></i> Generate
                                </button>  
                                <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries','Expense-Report')">
                                    <i class="ti-cloud-down"></i> Export
                                </button>
                                <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('daily_container')">
                                    <i class="ti-printer mr-1"></i> Print
                                </button>
                            </div>
                        </div>
                    </form>
                
                    <div id="daily_container">
                        <center>
                            <h4 class="report-header"><span id="company_name_label"></span></h4>
                            <h6 class="report-header"><span id="company_address_label" style="word-wrap: break-word;"></span></h6>
                            <h6 class="report-header" id="report_date"></h6>
                            <h6 class="report-header">Type: <span id="type_span"></span></h6>
                            <h6 class="report-header">Category: <span id="category_span"></span></h6>
                        </center>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dt_entries" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>DATE</th>
                                        <th>CATEGORY</th>
                                        <th>REFERENCE #</th>
                                        <th>SUPPLIER</th>
                                        <th style="text-align:right">AMOUNT</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="4" style="text-align:right">Total:</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        getEntries();
        
        $("#company_name_label").html(company_profile.company_name);
        $("#company_address_label").html(company_profile.company_address);
    });

    function getCategory(){
        var expense_type = $("#expense_type").val();
        getSelectOption('ExpenseCategories', 'expense_category_id', 'expense_category', "expense_type = '"+expense_type+"'", [], -1, 'All');
    }

    $("#frm_generate").submit(function(e) {
        e.preventDefault();
        getEntries();
    });

    function expenseType() {
        var expense_type = $("#expense_type").val();
        var str = $("#expense_type option[value="+expense_type+"]").text();
        $("#type_span").html(str);

        var expense_category_id = $("#expense_category_id").val();
        var str = $("#expense_category_id option[value="+expense_category_id+"]").text();
        $("#category_span").html(str);
    }

    function getEntries() {
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var expense_type = $("#expense_type").val();
        var expense_category_id = $("#expense_category_id").val();

        const d1 = new Date(start_date);
        let start = d1.toDateString().slice(4);

        const d2 = new Date(end_date);
        let end = d2.toDateString().slice(4);
        expenseType();
        $("#report_date").html(start + " - " + end);

        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        start_date: start_date,
                        end_date: end_date,
                        expense_type: expense_type,
                        expense_category_id:expense_category_id
                    }
                },
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

                subTotal = api
                    .column(4, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(4).footer()).html(
                    "&#x20B1; " + subTotal.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

            },
            "columns": [{
                    "data": "expense_date"
                },
                {
                    "data": "expense",
                },
                {
                    "data": "reference_number",
                },
                {
                    "data": "supplier",
                },
                {
                    "data": "amount",
                    className: "text-right"
                }

            ]

        });
    }
</script>