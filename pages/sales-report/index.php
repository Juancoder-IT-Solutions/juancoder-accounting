<style>
    .text-right {
        text-align: right;
    }
</style>
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Sales Report</h3>
                    <h6 class="font-weight-normal mb-3">Generate sales report here</h6>
                </div>
            </div>
            <div class="col-12 col-xl-12 card shadow mb-4">
                <ul id="tabs" class="nav nav-tabs">
                    <li class="nav-item"><a href="" data-target="#daily" data-toggle="tab" class="nav-link small text-uppercase active">Daily</a></li>
                    <li class="nav-item"><a href="" data-target="#yearly" data-toggle="tab" class="nav-link small text-uppercase">Yearly</a></li>
                    <li class="nav-item"><a href="" data-target="#cashier" data-toggle="tab" class="nav-link small text-uppercase">Per Cashier</a></li>
                    <li class="nav-item"><a href="" data-target="#customer" data-toggle="tab" class="nav-link small text-uppercase">Per Customer</a></li>
                    <li class="nav-item"><a href="" data-target="#summary" data-toggle="tab" class="nav-link small text-uppercase">Summary</a></li>
                </ul>
                <br>
                <div id="tabsContent" class="tab-content">
                    <div id="daily" class="tab-pane fade active show">
                        <h5>Daily Report</h5>
                        <div class="card-body">
                            <form id='frm_generate_daily'>
                                <div class="form-group row">
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
                                        <label><strong>Category</strong></label>
                                        <div>
                                            <select class="form-control form-control-sm select2" required id="product_category_id" name="input[product_category_id]">
                                                <option value="-1">&mdash; All &mdash; </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-0">
                                        <label>&nbsp;</label>
                                        <div>
                                            <button type="submit" id="btn_daily" class="btn btn-warning btn-icon-text">
                                                <i class="ti-reload mr-1"></i> Generate
                                            </button>  
                                            <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries_daily','Daily-Sales-Report')">
                                                <i class="ti-cloud-down mr-1"></i> Export
                                            </button>
                                            <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('daily_container')" id="btn_delete">
                                                <i class="ti-printer mr-1"></i> Print
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div id="daily_container">
                                <center>
                                    <h4 class="report-header"><span class="company_name_label"></span></h4>
                                    <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                                    <h5 class="report-header">Daily Sales Report</h5>
                                    <span id="span_daily_date"></span>
                                </center>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dt_entries_daily" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM</th>
                                                <th style="text-align:right">QTY</th>
                                                <th style="text-align:right">DISCOUNT</th>
                                                <th style="text-align:right">AMOUNT</th>
                                                <th style="text-align:right">NET AMOUNT</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="1" style="text-align:right">Total:</th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="yearly" class="tab-pane fade">
                        <h5>Yearly Report</h5>
                        <div class="card-body">
                            <form id='frm_generate_yearly'>
                                <div class="form-group row">
                                    <div class="col">
                                        <label><strong>Year</strong></label>
                                        <div>
                                            <select class="form-control select2" style="width: 100%;" id='sales_year' name='sales_year' required>
                                                <?php
                                                $year = date("Y") - 3;
                                                for ($i = 0; $i <= 4; $i++) { ?>

                                                    <option value='<?php echo $year; ?>' <?php if ($year == date("Y")) {
                                                                                                echo 'selected';
                                                                                            } ?>><?php echo $year; ?></option>;

                                                <?php
                                                    $year++;
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="row">
                                            <label><strong>Category</strong></label>
                                            <select class="form-control form-control-sm select2" required id="product_category_id_2" name="input[product_category_id_2]">
                                                <option value="-1">&mdash; All &mdash; </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-5">
                                        <label>&nbsp;</label>
                                        <div>
                                            <button type="submit" id="btn_generate" class="btn btn-warning btn-icon-text">
                                                <i class="ti-reload mr-1"></i> Generate
                                            </button>  
                                            <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_year_entries','Yearly-Sales-Report')">
                                                <i class="ti-cloud-down mr-1"></i> Export
                                            </button>
                                            <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('yearly_container')" id="btn_delete">
                                                <i class="ti-printer mr-1"></i> Print
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                       
                            <div id="yearly_container">
                                <center>
                                    <h4 class="report-header"><span class="company_name_label"></span></h4>
                                    <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                                    <h5 class="report-header">Yearly Sales Report</h5>
                                </center>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dt_year_entries" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM</th>
                                                <th style="text-align:right;">JAN</th>
                                                <th style="text-align:right;">FEB</th>
                                                <th style="text-align:right;">MAR</th>
                                                <th style="text-align:right;">APR</th>
                                                <th style="text-align:right;">MAY</th>
                                                <th style="text-align:right;">JUNE</th>
                                                <th style="text-align:right;">JULY</th>
                                                <th style="text-align:right;">AUG</th>
                                                <th style="text-align:right;">SEP</th>
                                                <th style="text-align:right;">OCT</th>
                                                <th style="text-align:right;">NOV</th>
                                                <th style="text-align:right;">DEC</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th style="text-align:right">Total:</th>
                                                <?php
                                                $count = 1;
                                                while ($count <= 12) {
                                                ?>
                                                    <th></th>
                                                <?php
                                                    $count++;
                                                } ?>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="cashier" class="tab-pane fade">
                        <h5>Per Cashier Report</h5>
                        <div class="card-body">
                            <form id='frm_generate_cashier'>
                                <div class="form-group row">
                                    <div class="col">
                                        <label><strong>Start Date</strong></label>
                                        <div>
                                            <input type="date" value="<?php echo date('Y-m-01', strtotime(date("Y-m-d"))); ?>" required class="form-control" id="c_start_date" name="input[start_date]">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label><strong>End Date</strong></label>
                                        <div>
                                            <input type="date" required class="form-control" value="<?php echo date('Y-m-t', strtotime(date("Y-m-d"))) ?>" id="c_end_date" name="input[end_date]">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label><strong>Cashier</strong></label>
                                        <div>
                                            <select class="form-control form-control-sm select2" required id="user_id" name="input[user_id]">
                                                <option value="-1">&mdash; All &mdash; </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-0">
                                        <label>&nbsp;</label>
                                        <div>
                                            <button type="submit" id="btn_cashier" class="btn btn-warning btn-icon-text">
                                                <i class="ti-reload mr-1"></i> Generate
                                            </button>  
                                            <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries_cashier','Per-Cashier-Sales-Report')">
                                                <i class="ti-cloud-down mr-1"></i> Export
                                            </button>
                                            <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('cashier_container')" id="btn_delete">
                                                <i class="ti-printer mr-1"></i> Print
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div id="cashier_container">
                                <center>
                                    <h4 class="report-header"><span class="company_name_label"></span></h4>
                                    <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                                    <h5 class="report-header">Sales Per Cashier Report</h5>
                                </center>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dt_entries_cashier" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM</th>
                                                <th style="text-align:right">QTY</th>
                                                <th style="text-align:right">AMOUNT</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="1" style="text-align:right">Total:</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="customer" class="tab-pane fade">
                        <h5>Per Customer Report</h5>
                        <div class="card-body">
                            <form id='frm_generate_customer'>
                                <div class="form-group row">
                                    <div class="col">
                                        <label><strong>Start Date</strong></label>
                                        <div>
                                            <input type="date" value="<?php echo date('Y-m-01', strtotime(date("Y-m-d"))); ?>" required class="form-control" id="cu_start_date" name="input[start_date]">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label><strong>End Date</strong></label>
                                        <div>
                                            <input type="date" required class="form-control" value="<?php echo date('Y-m-t', strtotime(date("Y-m-d"))) ?>" id="cu_end_date" name="input[end_date]">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label><strong>Customer</strong></label>
                                        <div>
                                            <select class="form-control form-control-sm select2" required id="customer_id" name="input[customer_id]">
                                                <option value="-1">&mdash; All &mdash; </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-0">
                                        <label>&nbsp;</label>
                                        <div>
                                            <button type="submit" id="btn_customer" class="btn btn-warning btn-icon-text">
                                                <i class="ti-reload mr-1"></i> Generate
                                            </button>  
                                            <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries_customer','Per-Customer-Sales-Report')">
                                                <i class="ti-cloud-down mr-1"></i> Export
                                            </button>
                                            <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('customer_container')" id="btn_delete">
                                                <i class="ti-printer mr-1"></i> Print
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        
                            <div id="customer_container">
                                <center>
                                    <h4 class="report-header"><span class="company_name_label"></span></h4>
                                    <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                                    <h5 class="report-header">Sales Per Customer Report</h5>
                                </center>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dt_entries_customer" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM</th>
                                                <th style="text-align:right">QTY</th>
                                                <th style="text-align:right">AMOUNT</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="1" style="text-align:right">Total:</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="summary" class="tab-pane fade">
                        <h5>Summary Report</h5>
                        <div class="card-body">
                            <form id='frm_generate_summary'>
                                <div class="form-group row">
                                    <div class="col">
                                        <label><strong>Start Date</strong></label>
                                        <div>
                                            <input type="date" value="<?php echo date('Y-m-01', strtotime(date("Y-m-d"))); ?>" required class="form-control" id="s_start_date" name="input[start_date]">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label><strong>End Date</strong></label>
                                        <div>
                                            <input type="date" required class="form-control" value="<?php echo date('Y-m-t', strtotime(date("Y-m-d"))) ?>" id="s_end_date" name="input[end_date]">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label><strong>Cashier</strong></label>
                                        <div>
                                            <select class="form-control form-control-sm select2" required id="user_id_2" name="input[user_id]">
                                                <option value="-1">&mdash; All &mdash; </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-0">
                                        <label>&nbsp;</label>
                                        <div>
                                            <button type="submit" id="btn_cashier2" class="btn btn-warning btn-icon-text">
                                                <i class="ti-reload mr-1"></i> Generate
                                            </button>  
                                            <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries_summary','Sales-Summary-Report')">
                                                <i class="ti-cloud-down mr-1"></i> Export
                                            </button>
                                            <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('summary_container')" id="btn_delete">
                                                <i class="ti-printer mr-1"></i> Print
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div id="summary_container">
                                <center>
                                    <h4 class="report-header"><span class="company_name_label"></span></h4>
                                    <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                                    <h5 class="report-header">Sales Summary Report</h5>
                                </center>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dt_entries_summary" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th style="text-align:right">DATE</th>
                                                <th>CASHIER</th>
                                                <th style="text-align:right">STARTING BALANCE</th>
                                                <th style="text-align:right">TOTAL SALES</th>
                                                <th style="text-align:right">TOTAL CASH SALES</th>
                                                <th style="text-align:right">TOTAL CHARGE SALES</th>
                                                <th style="text-align:right">COLLECTED</th>
                                                <th style="text-align:right">DEFICIT</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="3" style="text-align:right">Total:</th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
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
    </div>
</div>

<script type="text/javascript">
    $("#frm_generate_yearly").submit(function(e) {
        e.preventDefault();
        getReportYearly();
    });

    $("#frm_generate_daily").submit(function(e) {
        e.preventDefault();
        getReportDaily();
    });

    $("#frm_generate_cashier").submit(function(e) {
        e.preventDefault();
        getReportCashier();
    });

    $("#frm_generate_customer").submit(function(e) {
        e.preventDefault();
        getReportCustomer();
    });

    $("#frm_generate_summary").submit(function(e) {
        e.preventDefault();
        getReportSummary();
    });

    var yearly_type = "P";

    function yearlyType() {
        if ($('#typeYearly1').is(':checked')) {
            getSelectOption('Products', 'product_category_id_2', 'product_name', '', [], -1, 'All');
            yearly_type = "P";
        } else {
            getSelectOption('ProductCategories', 'product_category_id_2', 'product_category', '', [], -1, 'All');
            yearly_type = "C";
        }
    }

    function getReportYearly() {
        var sales_year = $("#sales_year").val();
        var product_category_id = $("#product_category_id_2").val();

        $("#dt_year_entries").DataTable().destroy();
        $("#dt_year_entries").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=generate_yearly",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        sales_year: sales_year,
                        product_category_id: product_category_id
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

                var count = 1;
                while (count <= 12) {
                    debitTotal = api
                        .column(count, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Update footer
                    $(api.column(count).footer()).html(
                        "&#x20B1; " + debitTotal.toLocaleString('en-US', {
                            minimumFractionDigits: 2
                        })
                    );

                    count++;
                }

            },
            "columns": [{
                    "data": "item"
                },
                {
                    "data": "1",
                    className: "text-right"
                },
                {
                    "data": "2",
                    className: "text-right"
                },
                {
                    "data": "3",
                    className: "text-right"
                },
                {
                    "data": "4",
                    className: "text-right"
                },
                {
                    "data": "5",
                    className: "text-right"
                },
                {
                    "data": "6",
                    className: "text-right"
                },
                {
                    "data": "7",
                    className: "text-right"
                },
                {
                    "data": "8",
                    className: "text-right"
                },
                {
                    "data": "9",
                    className: "text-right"
                },
                {
                    "data": "10",
                    className: "text-right"
                },
                {
                    "data": "11",
                    className: "text-right"
                },
                {
                    "data": "12",
                    className: "text-right"
                }

            ]

        });
    }

    function formatDate(dateString) {
        var date = new Date(dateString);
        var options = {
            month: 'long',
            day: 'numeric',
            year: 'numeric'
        };
        return date.toLocaleDateString('en-US', options);
    }

    function getReportDaily() {
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var product_category_id = $("#product_category_id").val();

        var formatted_start_date = formatDate(start_date);
        var formatted_end_date = formatDate(end_date);

        // Set the HTML content
        $("#span_daily_date").html(formatted_start_date + " - " + formatted_end_date);

        $("#dt_entries_daily").DataTable().destroy();
        $("#dt_entries_daily").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=generate_daily",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        start_date: start_date,
                        end_date: end_date,
                        product_category_id: product_category_id
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

                qtyTotal = api
                    .column(1, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(1).footer()).html(
                    qtyTotal.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

                discountTotal = api
                    .column(2, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(2).footer()).html(
                    "&#x20B1; " + discountTotal.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );


                amountTotal = api
                    .column(3, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(3).footer()).html(
                    "&#x20B1; " + amountTotal.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

                netTotal = api
                    .column(4, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(4).footer()).html(
                    "&#x20B1; " + netTotal.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

            },
            "columns": [{
                    "data": "item"
                },
                {
                    "data": "qty",
                    className: "text-right"
                },
                {
                    "data": "discount",
                    className: "text-right"
                },
                {
                    "data": "amount",
                    className: "text-right"
                },
                {
                    "data": "net_amount",
                    className: "text-right"
                }
            ]

        });
    }

    function getReportCashier() {
        var start_date = $("#c_start_date").val();
        var end_date = $("#c_end_date").val();
        var user_id = $("#user_id").val();

        $("#dt_entries_cashier").DataTable().destroy();
        $("#dt_entries_cashier").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=generate_cashier",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        start_date: start_date,
                        end_date: end_date,
                        user_id: user_id
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

                qtyTotal = api
                    .column(1, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(1).footer()).html(
                    qtyTotal.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

                subTotal = api
                    .column(2, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(2).footer()).html(
                    "&#x20B1; " + subTotal.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

            },
            "columns": [{
                    "data": "item"
                },
                {
                    "data": "qty",
                    className: "text-right"
                },
                {
                    "data": "amount",
                    className: "text-right"
                }

            ]

        });
    }

    function getReportCustomer() {
        var start_date = $("#cu_start_date").val();
        var end_date = $("#cu_end_date").val();
        var customer_id = $("#customer_id").val();

        $("#dt_entries_customer").DataTable().destroy();
        $("#dt_entries_customer").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=generate_customer",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        start_date: start_date,
                        end_date: end_date,
                        customer_id: customer_id
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

                qtyTotal = api
                    .column(1, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(1).footer()).html(
                    qtyTotal.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

                subTotal = api
                    .column(2, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(2).footer()).html(
                    "&#x20B1; " + subTotal.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

            },
            "columns": [{
                    "data": "item"
                },
                {
                    "data": "qty",
                    className: "text-right"
                },
                {
                    "data": "amount",
                    className: "text-right"
                }

            ]

        });
    }

    function getReportSummary() {
        var start_date = $("#s_start_date").val();
        var end_date = $("#s_end_date").val();
        var user_id = $("#user_id_2").val();

        $("#dt_entries_summary").DataTable().destroy();
        $("#dt_entries_summary").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=generate_summary",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        start_date: start_date,
                        end_date: end_date,
                        user_id: user_id
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

                total_sales = api
                    .column(3, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(3).footer()).html(
                    total_sales.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

                total_cash = api
                    .column(3, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(3).footer()).html(
                    total_sales.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

                total_charge = api
                    .column(5, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(5).footer()).html(
                    total_sales.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

                total_collected = api
                    .column(6, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(6).footer()).html(
                    "&#x20B1; " + total_collected.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

                total_deficit = api
                    .column(7, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(7).footer()).html(
                    "&#x20B1; " + total_deficit.toLocaleString('en-US', {
                        minimumFractionDigits: 2
                    })
                );

            },
            "columns": [{
                    "data": "date"
                },
                {
                    "data": "cashier"
                },
                {
                    "data": "starting_balance",
                    className: "text-right"
                },
                {
                    "data": "total_sales_amount",
                    className: "text-right"
                },
                {
                    "data": "total_sales_cash",
                    className: "text-right"
                },
                {
                    "data": "total_sales_charge",
                    className: "text-right"
                },
                {
                    "data": "total_amount_collected",
                    className: "text-right"
                },
                {
                    "data": "total_deficit",
                    className: "text-right"
                }

            ]

        });
    }

    function print_report2(container, title) {

        var printContents = document.getElementById("" + container + "").innerHTML;

        //alert(printContents);
        var mywindow = window.open('', 'PRINT', 'height=400,width=600');

        mywindow.document.write('<html><head><title>' + document.title + '</title>');
        mywindow.document.write('<link href="/css/vendor.bundle.base.css" rel="stylesheet">');
        mywindow.document.write('</head><body>');

        mywindow.document.write("<div class='container-fluid' id='print_report_header' style='margin-bottom: 20px;'></div>");
        mywindow.document.write("<div class='container-fluid' id='report_content'></div>");
        //mywindow.document.write(document.getElementById(elem).innerHTML);

        mywindow.document.write('</body></html>');

        mywindow.document.getElementById("report_content").innerHTML = printContents;

        mywindow.document.close(); // necessary for IE >= 10

        mywindow.onload = function() { // necessary if the div contain images

            mywindow.focus(); // necessary for IE >= 10
            mywindow.print();
            mywindow.close();

        }

        return true;
    }


    $("#frm_generate_daily").submit(function(e) {
        e.preventDefault();
        getReportDaily();
    });


    $(document).ready(function() {

        getSelectOption('ProductCategories', 'product_category_id', 'product_category', '', [], -1, 'All');
        getSelectOption('ProductCategories', 'product_category_id_2', 'product_category', '', [], -1, 'All', 1);
        getSelectOption('Users', 'user_id', 'user_fullname', "user_category='C'", [], -1, 'All', 1);
        getSelectOption('Users', 'user_id_2', 'user_fullname', "user_category='C'", [], -1, 'All', 1);
        getSelectOption('Customers', 'customer_id', 'customer_name', "", [], -1, 'All');
        getReportDaily();
        //getReportYearly();
        //getReportCashier();

        $(".company_name_label").html(company_profile.company_name);
        $(".company_address_label").html(company_profile.company_address);
    });
</script>