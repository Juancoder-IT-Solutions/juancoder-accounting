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
                    <h3 class="font-weight-bold">Purchase Report</h3>
                    <h6 class="font-weight-normal mb-3">Generate purchase report here</h6>
                </div>
            </div>
            <div class="col-12 col-xl-12 card shadow">
                <ul id="tabs" class="nav nav-tabs">
                    <li class="nav-item active"><a href="" data-target="#supplier" data-toggle="tab" class="nav-link small text-uppercase">Per Supplier</a></li>
                </ul>
                <br>
                <div id="tabsContent" class="tab-content">
                    <div id="supplier" class="tab-pane active">
                        <div class="card-body">
                            <form id='frm_generate_supplier'>
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
                                        <label><strong>Supplier</strong></label>
                                        <div>
                                            <select class="form-control form-control-sm select2" required id="supplier_id" name="input[supplier_id]">
                                                <option value="-1">&mdash; All &mdash; </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-0">
                                        <label>&nbsp;</label>
                                        <div>
                                            <button type="submit" id="btn_supplier" class="btn btn-warning btn-icon-text">
                                                <i class="ti-reload mr-1"></i> Generate
                                            </button>  
                                            <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries_supplier','Purchase-Report')">
                                                <i class="ti-cloud-down mr-1"></i> Export
                                            </button>
                                            <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('supplier_container')" id="btn_delete">
                                                <i class="ti-printer mr-1"></i> Print
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div id="supplier_container">
                                <center>
                                    <h4 class="report-header"><span class="company_name_label"></span></h4>
                                    <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                                    <h5 class="report-header">Purchase Report Per Supplier</h5>
                                </center>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dt_entries_supplier" width="100%" cellspacing="0">
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
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#frm_generate_supplier").submit(function(e) {
        e.preventDefault();
        getReportSupplier();
    });

    function getReportSupplier() {
        var start_date = $("#cu_start_date").val();
        var end_date = $("#cu_end_date").val();
        var supplier_id = $("#supplier_id").val();

        $("#dt_entries_supplier").DataTable().destroy();
        $("#dt_entries_supplier").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=generate_supplier",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        start_date: start_date,
                        end_date: end_date,
                        supplier_id: supplier_id
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


    $(document).ready(function() {
        getSelectOption('Suppliers', 'supplier_id', 'supplier_name', "", [], -1, 'All');
        getReportSupplier();
        //getReportYearly();
        //getReportCashier();

        $(".company_name_label").html(company_profile.company_name);
        $(".company_address_label").html(company_profile.company_address);
    });
</script>