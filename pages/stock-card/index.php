<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Stock Card Report</h3>
                    <h6 class="font-weight-normal mb-3">Generate stock card here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <form id='frm_generate'>
                        <div class="form-group row" style="display: flex; flex-wrap:wrap; gap:1 rem;">
                            <div class="col">
                                <label><strong>Start Date</strong></label>
                                <div>
                                    <input type="date" required class="form-control form-control-sm" id="start_date" value="<?php echo date('Y-m-01', strtotime(date("Y-m-d"))); ?>" name="input[start_date]">
                                </div>
                            </div>
                            <div class="col">
                                <label><strong>End Date</strong></label>
                                <div>
                                    <input type="date" required class="form-control form-control-sm" id="end_date" value="<?php echo date('Y-m-t', strtotime(date("Y-m-d"))); ?>" name="input[end_date]">
                                </div>
                            </div>
                            <div class="col">
                                <label><strong>Category</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="product_category_id" name="input[product_category_id]" onchange="fetchProduct()">
                                        <option class="">&mdash; Please Select &mdash; </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <label><strong>Product</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="product_id" name="input[product_id]">
                                        <option class="">&mdash; Please Select &mdash; </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                            <label><strong>Warehouse</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[warehouse_id]" id="warehouse_id" required>
                                </select>
                            </div>
                        </div>
                        </div>
                        <div class="form-group row">
                            <div class="col" style="display: flex; flex-wrap:wrap; gap:1 rem; justify-content:end;">
                                <label>&nbsp;</label>
                                <div>
                                    <button type="submit" id="btn_generate" class="btn btn-warning btn-icon-text">
                                        <i class="ti-reload mr-1"></i> Generate
                                    </button>  
                                    <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries','Stock-Card-Report')">
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
                            <h4 class="report-header"><span id="company_name_label"></span></h4>
                            <h6 class="report-header"><span id="company_address_label" style="word-wrap: break-word;"></span></h6>
                            <h5 class="report-header">Stock Card Report</h5><br>
                        </center>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dt_entries" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>DATE</th>
                                        <th>TRANSACTION</th>
                                        <th>REFERENCE #</th>
                                        <th>UNIT COST</th>
                                        <th>QTY IN</th>
                                        <th>QTY OUT</th>
                                        <th>BALANCE QTY</th>
                                        <th>AMOUNT</th>
                                    </tr>
                                    <tr>
                                        <th style="text-align:right;" colspan="6">Balance Fowarded</th>
                                        <th><span class="label-item" id="qty_label"></span></th>
                                        <th><span class="label-item" id="amount_label"></span><input type='hidden' class='current_qty' id="bf_qty_label"><input type='hidden' class='current_amount' id="bf_amount_label"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="6" style="text-align:right">Current:</th>
                                        <th><span id="span_current_qty"></span></th>
                                        <th><span id="span_current_amount"></span></th>
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
    $("#frm_generate").submit(function(e) {
        e.preventDefault();

        getReport();
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

    function fetchProduct() {
        var product_category_id = $("#product_category_id").val();
        getSelectOption('Products', 'product_id', 'product_name', "product_category_id = '" + product_category_id + "'");
    }

    function getReport() {
        var product_category_id = $("#product_category_id").val();
        var product_id = $("#product_id").val();
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var warehouse_id = $("#warehouse_id").val();
        balance_fowarded();
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=view",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        product_category_id: product_category_id,
                        product_id: product_id,
                        start_date:start_date,
                        end_date:end_date,
                        warehouse_id:warehouse_id
                    }
                },
            },
            "columnDefs": [{
                "targets": [3, 4, 5, 6, 7],
                "render": $.fn.dataTable.render.number(',', '.', 2, ''),
                "className": 'dt-body-right'
            }],
            "columns": [{
                    "data": "date"
                },
                {
                    "data": "module"
                },
                {
                    "data": "reference_number"
                },
                {
                    "data": "cost"
                },
                {
                    "data": "qty_in"
                },
                {
                    "data": "qty_out"
                },
                {
                    "mRender": function(data, type, row) {
                        return row.qty_balance + "<input type='hidden' class='current_qty' value='" + row.qty_balance + "'>";

                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return row.amount + "<input type='hidden' class='current_amount' value='" + row.amount + "'>";

                    }
                },
            ]
        });
        
        current_qty();
    }

    function balance_fowarded() {
        var product_id = $("#product_id").val();
        var start_date = $("#start_date").val();
        var warehouse_id = $("#warehouse_id").val();
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=balance_fowarded",
            data: {
                input: {
                    product_id: product_id,
                    start_date:start_date,
                    warehouse_id:warehouse_id   
                }
            },
            success: function(data) {
                var jsonParse = JSON.parse(data);
                const json = jsonParse.data;
                $("#qty_label").html(json.qty);
                $("#amount_label").html(json.amount);
                $("#bf_qty_label").val(json.qty);
                $("#bf_amount_label").val(json.amount);
                
            }
        });
    }

    function current_qty() {

        var table = $('#dt_entries').DataTable();
        table.on('draw', function() {
            var current_qty = $(".current_qty").last().val();
            var current_amount = $(".current_amount").last().val();

            $("#span_current_qty").html(current_qty);
            $("#span_current_amount").html(current_amount);
        });

    }

    $(document).ready(function() {
        $("#company_name_label").html(company_profile.company_name);
        $("#company_address_label").html(company_profile.company_address);
        // getReport();
        getSelectOption('ProductCategories', 'product_category_id', 'product_category');
        getSelectOption('Warehouses', 'warehouse_id', 'warehouse_name', "branch_id = '" + current_branch_id + "'");
    });
</script>