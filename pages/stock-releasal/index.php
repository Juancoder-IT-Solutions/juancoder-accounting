<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="col-md-12 grid-margin">
                <div class="row">
                    <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                        <h3 class="font-weight-bold">Stock Releasal Report</h3>
                        <h6 class="font-weight-normal mb-3">Generate stock releasal here</h6>
                    </div>
                </div>
                <div class="card shadow mb-4">
                    <ul id="tabs" class="nav nav-tabs">
                        <li class="nav-item"><a href="" data-target="#per_transaction" data-toggle="tab" class="nav-link small text-uppercase active">Per Transaction</a></li>
                        <li class="nav-item"><a href="" data-target="#per_item" data-toggle="tab" class="nav-link small text-uppercase">Per Item</a></li>
                        <li class="nav-item"><a href="" data-target="#daily_released" data-toggle="tab" class="nav-link small text-uppercase">Daily Report</a></li>
                    </ul>
                    <br>
                    <div id="tabsContent" class="tab-content">
                        <div id="per_transaction" class="tab-pane fade active show">
                            <h5>Per Transaction Report</h5>

                            <div class="card-body">
                                <form id='frm_generate'>
                                    <div class="form-group row">
                                        <div class="col">
                                            <label><strong>Start Date</strong></label>
                                            <div>
                                                <input type="date" value="<?php echo date('Y-m-d'); ?>" required class="form-control" id="start_date" name="input[start_date]">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label><strong>End Date</strong></label>
                                            <div>
                                                <input type="date" required class="form-control" value="<?php echo date('Y-m-d'); ?>" id="end_date" name="input[end_date]">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label><strong>Customer</strong></label>
                                            <div>
                                                <select class="form-control form-control-sm select2" id="customer_id" name="input[customer_id]">
                                                    <option class="-1">&mdash; All &mdash; </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label><strong>Product</strong></label>
                                            <div>
                                                <select class="form-control form-control-sm select2" id="product_id" name="input[product_id]">
                                                    <option class="-1">&mdash; All &mdash; </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col" style="display: flex; justify-content: flex-end;">
                                            <label>&nbsp;</label>
                                            <div>
                                                <button type="submit" id="btn_generate" class="btn btn-warning btn-icon-text">
                                                    <i class="ti-reload mr-1"></i> Generate
                                                </button>
                                                <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries','Stock-Releasal-Report')">
                                                    <i class="ti-cloud-down mr-1"></i> Export
                                                </button>
                                                <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('report_container')">
                                                    <i class="ti-printer mr-1"></i> Print
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div id="report_container">
                                    <center>
                                        <h4 class="report-header"><span class="company_name_label"></span></h4>
                                        <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                                        <h5 class="report-header">Stock Releasal Report</h5><br>
                                    </center>
                                    <div class="table-responsive" id="dt_entries">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="per_item" class="tab-pane fade">
                            <h5>Per Item Stock Releasal Report</h5>
                            <div class="card-body">
                                <form id='frm_generate_item'>
                                    <div class="form-group row">
                                        <div class="col">
                                            <label><strong>Start Date</strong></label>
                                            <div>
                                                <input type="date" value="<?php echo date('Y-m-d'); ?>" required class="form-control" id="i_start_date" name="input[start_date]">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label><strong>End Date</strong></label>
                                            <div>
                                                <input type="date" required class="form-control" id="i_end_date" value="<?php echo date('Y-m-d'); ?>" name="input[end_date]">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label><strong>Product</strong></label>
                                            <div>
                                                <select class="form-control form-control-sm select2" id="product_id_2" name="input[product_id_2]">
                                                    <option class="-1">&mdash; All &mdash; </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-0">
                                        <label>&nbsp;</label>
                                        <div  style="display: flex; justify-content: flex-end;">
                                            <button type="submit" id="btn_generate" class="btn btn-warning btn-icon-text">
                                                <i class="ti-reload mr-1"></i> Generate
                                            </button>
                                            <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries_item','Per-Item-Stock-Releasal-Report')">
                                                <i class="ti-cloud-down mr-1"></i> Export
                                            </button>
                                            <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('report_container_item')">
                                                <i class="ti-printer mr-1"></i> Print
                                            </button>
                                        </div>
                                    </div>
                            </div>
                            </form>

                            <div id="report_container_item">
                                <center>
                                    <h4 class="report-header"><span class="company_name_label"></span></h4>
                                    <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                                    <h5 class="report-header">Stock Releasal Report</h5><br>
                                </center>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dt_entries_item" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM</th>
                                                <th style="text-align:right">ON HAND</th>
                                                <th style="text-align:right">FOR WITHDRAWAL</th>
                                                <th style="text-align:right">TOTAL RELEASED</th>
                                                <th style="text-align:right">AVAILABLE</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <!-- <tr>
                                                    <th colspan="1" style="text-align:right">Total:</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr> -->
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="daily_released" class="tab-pane fade">
                            <h5>Daily Releasal Report</h5>
                            <div class="card-body">
                                <form id='frm_generate_daily'>
                                    <div class="col-0">
                                        <label>&nbsp;</label>
                                        <div  style="display: flex; justify-content: flex-end;">
                                            <button type="submit" id="btn_generate" class="btn btn-warning btn-icon-text">
                                                <i class="ti-reload mr-1"></i> Generate
                                            </button>
                                            <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries_daily','Daily-Stock-Releasal-Report')">
                                                <i class="ti-cloud-down mr-1"></i> Export
                                            </button>
                                            <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('report_container_item')">
                                                <i class="ti-printer mr-1"></i> Print
                                            </button>
                                        </div>
                                    </div>
                            </div>
                            </form>

                            <div id="report_container_daily">
                                <center>
                                    <h4 class="report-header"><span class="company_name_label"></span></h4>
                                    <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                                    <h5 class="report-header">Daily Stock Releasal Report</h5><br>
                                </center>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dt_entries_daily" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM</th>
                                                <th style="text-align:right">Released Qty</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <!-- <tr>
                                                    <th colspan="1" style="text-align:right">Total:</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr> -->
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
    $("#frm_generate").submit(function(e) {
        e.preventDefault();

        getReport();
    });

    $("#frm_generate_item").submit(function(e) {
        e.preventDefault();

        getReportItem();
    });

    $("#frm_generate_daily").submit(function(e) {
        e.preventDefault();

        getReportDaily();
    });

    function print_report(container, title) {

        var printContents = document.getElementById("" + container + "").innerHTML;

        //alert(printContents);
        var mywindow = window.open('', 'PRINT', 'height=400,width=600');

        mywindow.document.write('<html><head><title>' + document.title + '</title>');
        mywindow.document.write('<link href="../assets/css/bootstrap.min.css" rel="stylesheet">');
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


    function getReport() {
        var customer_id = $("#customer_id").val();
        var product_id = $("#product_id").val();
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();


        $("#dt_entries").html("<center><h3><span class='fa fa-spinner fa-spin'></span> Loading ...</h3></center>");

        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=view",
            data: {
                input: {
                    customer_id: customer_id,
                    product_id: product_id,
                    start_date: start_date,
                    end_date: end_date
                }
            },
            success: function(data) {
                $("#dt_entries").html(data.replace('{"data":null}', ''));
            }
        });
    }

    // function getReportItem() {
    //     var product_id = $("#product_id").val();

    //     $("#dt_entries_item").html("<center><h3><span class='fa fa-spinner fa-spin'></span> Loading ...</h3></center>");

    //     $.ajax({
    //         type: "POST",
    //         url: "controllers/sql.php?c=" + route_settings.class_name + "&q=per_item",
    //         data: {
    //             input: {
    //                 product_id: product_id
    //             }
    //         },
    //         success: function(data) {
    //             $("#dt_entries_item").html(data.replace('{"data":null}', ''));
    //         }
    //     });
    // }

    function getReportItem() {
        var product_id = $("#product_id_2").val();
        var start_date = $("#i_start_date").val();
        var end_date = $("#i_end_date").val();

        $("#dt_entries_item").DataTable().destroy();
        $("#dt_entries_item").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=per_item",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        product_id: product_id,
                        start_date: start_date,
                        end_date: end_date
                    }
                },
            },
            "footerCallback": function(row, data, start, end, display) {
                var api = this.api();

            },
            "columns": [{
                    "data": "item"
                },
                {
                    "data": "on_hand",
                    className: "text-right"
                },
                {
                    "data": "for_withdrawal",
                    className: "text-right"
                },
                {
                    "data": "total_released",
                    className: "text-right"
                },
                {
                    "data": "available",
                    className: "text-right"
                },
            ]

        });
    }

    function getReportDaily() {

        $("#dt_entries_daily").DataTable().destroy();
        $("#dt_entries_daily").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=per_day",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    // input: {
                    //     product_id: product_id,
                    //     start_date: start_date,
                    //     end_date: end_date
                    // }
                },
            },
            "footerCallback": function(row, data, start, end, display) {
                var api = this.api();

            },
            "columns": [{
                    "data": "item"
                },
                {
                    "data": "qty",
                    className: "text-right"
                },
            ]

        });
    }

    $(document).ready(function() {
        $(".company_name_label").html(company_profile.company_name);
        $(".company_address_label").html(company_profile.company_address);
        getSelectOption('Products', 'product_id', 'product_name', '', [], -1, 'All');
        getSelectOption('Products', 'product_id_2', 'product_name', '', [], -1, 'All', 1);
        getSelectOption('Customers', 'customer_id', 'customer_name', '', [], -1, 'All');
    });
</script>