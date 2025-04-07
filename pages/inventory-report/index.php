<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Inventory Report</h3>
                    <h6 class="font-weight-normal mb-3">Generate your inventory here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <form id='frm_generate'>
                        <div class="form-group row">
                            <div class="col">
                                <label><strong>Category</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="product_category_id" name="input[product_category_id]">
                                        <option class="">&mdash; Please Select &mdash; </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <label><strong>Warehouse</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="warehouse_id" name="input[warehouse_id]">
                                        <option class="">&mdash; Please Select &mdash; </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-5">
                                <label>&nbsp;</label>
                                <div>

                                    <button type="submit" id="btn_generate" class="btn btn-warning btn-icon-text">
                                        <i class="ti-reload mr-1"></i> Generate
                                    </button>
                                    <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries','Inventroy-Report')">
                                        <i class="ti-cloud-down mr-1"></i> Export
                                    </button>
                                    <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('report_container')" id="btn_delete">
                                        <i class="ti-printer mr-1"></i> Print
                                    </button>


                                    <!-- <div class="btn-group pull-right">
                                        <button type="submit" id="btn_generate" class="btn btn-primary btn-sm btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-plus"></i>
                                            </span>
                                            <span class="text">Generate</span>
                                        </button>
                                        <button type="button" onclick="exportTableToExcel(this,'dt_entries','Inventroy-Report')" class="btn btn-success btn-sm btn-icon-split">
                                            <span class="icon">
                                                <i class="ti ti-cloud-down"></i>
                                            </span>
                                            <span class="text"> Export</span>
                                        </button>
                                        <button type="button" onclick="print_report('report_container')" class="btn btn-info btn-sm btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-trash"></i>
                                            </span>
                                            <span class="text">Print</span>
                                        </button>
                                    </div> -->


                                </div>
                            </div>
                        </div>
                    </form>

                    <div id="report_container" class="card-body">
                        <div class="table-responsive">
                            <center>
                                <h4 class="report-header"><span id="company_name_label"></span></h4>
                                <h6 class="report-header"><span id="company_address_label" style="word-wrap: break-word;"></span></h6>
                                <h5 class="report-header">Inventory Report</h5>
                                <h6><span id="con_date"></span></h6><br>
                            </center>
                            <table class="display expandable-table" id="dt_entries" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Product Code</th>
                                        <th>Product</th>
                                        <th>In Stock</th>
                                        <th>For Pick-up</th>
                                        <th>Available</th>
                                        <th>Cost</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="2" style="text-align:right">Total:</th>
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

<?php include 'modal_pickup.php' ?>
<script type="text/javascript">
    $("#frm_generate").submit(function(e) {
        e.preventDefault();

        getReport();
    });

    function getReport() {
        const currentDate = new Date();
        const formattedDate = currentDate.toLocaleString('en-US', {
            month: 'long',
            day: '2-digit',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit',
            hour12: true
        }).replace(' at ', ' ');
        $("#con_date").html(formattedDate);

        var product_category_id = $("#product_category_id").val();
        var warehouse_id = $("#warehouse_id").val();
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
                        warehouse_id: warehouse_id
                    }
                },
            },
            "columnDefs": [{
                "targets": [2, 3, 4],
                "render": $.fn.dataTable.render.number(',', '.', 2, ''),
                "className": 'dt-body-right'
            }],
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
                total_qty = api
                    .column(4)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(4).footer()).html(
                    this.fnSettings().fnFormatNumber(parseFloat(parseFloat(total_qty).toFixed(2)))
                );

                // in stock over all pages
                stock_qty = api
                    .column(2, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(2).footer()).html(
                    this.fnSettings().fnFormatNumber(parseFloat(parseFloat(stock_qty).toFixed(2)))
                );


                // in stock over all pages
                pickup_qty = api
                    .column(3, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(3).footer()).html(
                    this.fnSettings().fnFormatNumber(parseFloat(parseFloat(pickup_qty).toFixed(2)))
                );
            },
            "columns": [{
                    "data": "product_code"
                },
                {
                    "data": "product_name"
                },
                {
                    "data": "in_stock"
                },
                {
                    "data": "for_pickup",
                    "render": function(data, type, row) {
                        return `<a href="#" title="Click to view details" class="show-modal" data-name="${row.product_name}" onclick="pickupDetails('${row.product_id}','${row.product_name}')">${data}</a>
`;
                    }
                },
                {
                    "data": "product_qty"
                },
                {
                    "data": "product_cost"
                },
                {
                    "data": "amount"
                },
            ]
        });
    }

    function pickupDetails(product_id, product_name) {
        $('#pickupModal').modal('show');
        $("#product_name_label").text(product_name);
        getPickupEntries(product_id);
    }

    function getPickupEntries(product_id) {
        var product_id = product_id;
        var warehouse_id = $("#warehouse_id").val();

        $("#dt_entries_2").DataTable().destroy();
        $("#dt_entries_2").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show_pickup",
                "dataSrc": function(json) {
                    return json.data ? json.data : [];
                },
                "method": "POST",
                "data": {
                    input: {
                        product_id: product_id,
                        warehouse_id: warehouse_id
                    }
                }
            },
            "columnDefs": [{
                "targets": [2, 3, 4],
                "render": $.fn.dataTable.render.number(',', '.', 2, ''),
                "className": 'dt-body-right'
            }],
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
                    .column(5)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Total over this page
                pageTotal = api
                    .column(5, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(5).footer()).html(
                    "&#x20B1; " + this.fnSettings().fnFormatNumber(parseFloat(parseFloat(total).toFixed(2)))
                );
            },
            "columns": [{
                    "data": "reference_number"
                },
                {
                    "data": "sales_date"
                },
                {
                    "data": "customer_name"
                },
                {
                    "data": "qty"
                },
                {
                    "data": "released_qty"
                },
                {
                    "data": "remaining_qty"
                },
            ]
        });
    }

    $(document).ready(function() {

        getReport();
        getSelectOption('ProductCategories', 'product_category_id', 'product_category', '', [], -1, 'All');
        getSelectOption('Warehouses', 'warehouse_id', 'warehouse_name', "branch_id ='" + current_branch_id + "'", [], -1, 'All');

        $("#company_name_label").html(company_profile.company_name);
        $("#company_address_label").html(company_profile.company_address);
    });
</script>