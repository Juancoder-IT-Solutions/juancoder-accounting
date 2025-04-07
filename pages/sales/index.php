<style>
    @media print {
        center {
            text-align: center;
        }

        .div_footer {
            position: absolute;
            bottom: 0;
        }
    }
</style>
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Sales</h3>
                    <h6 class="font-weight-normal mb-3">Manage sales here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-3 col-xl-3">
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
                                    <i class="ti-reload mr-1"></i> Generate
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
                                    <th>Date</th>
                                    <th>Reference</th>
                                    <th>For Pick-up</th>
                                    <th>Customer</th>
                                    <th>Type</th>
                                    <th>Encoded by</th>
                                    <th>Status</th>
                                    <th>Total</th>
                                    <th>Date Added</th>
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
<?php include 'modal_sales.php' ?>
<?php include 'modal_stock_withdrawal.php' ?>
<?php include 'modal_print.php' ?>
<?php include 'modal_charge_slip.php' ?>
<?php include 'modal_terms.php' ?>
<script type="text/javascript">
    function getEntries() {
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var param = "AND (sales_date >= '" + start_date + "' AND sales_date <= '" + end_date + "')";
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "order": [
                [3, 'desc']
            ],
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show_data",
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
                        return row.status != 'S'  ? '' : "<input type='checkbox' value=" + row.sales_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        var charge_slip = row.sales_type == "C" ? "style='display:none;'" : "";
                        return "<div style='display:flex;align-items:center'><button class='btn btn-primary btn-circle mr-1' onclick='getEntryDetails2(" + row.sales_id + ")' style='padding:15px;height:45px;'><span class='ti ti-menu'></span></button><button onclick='printRecord(" + row.sales_id + ")' class='btn btn-warning btn-circle mr-1' style='padding:15px;height:45px;'><span class='ti ti-printer'></span></button><button onclick='chargeSlip(" + row.sales_id + ")' " + charge_slip + " class='btn btn-info btn-circle btn-sm' style='padding:15px;height:45px;'><span class='ti ti-receipt'></span></button></div>";
                    }
                },
                {
                    "data": "sales_date"
                },
                {
                    "data": "reference_number"
                },
                {
                    "mRender": function(data, type, row) {
                        return row.for_pick_up == '1' ? "<strong style='color:green;'>YES</strong>" : "";
                    }
                },
                {
                    "data": "customer"
                },
                {
                    "mRender": function(data, type, row) {
                        return row.sales_type == 'C' ? "Cash" : "Charge";
                    }
                },
                {
                    "data": "encoded_name"
                },
                {
                    "mRender": function(data, type, row) {
                        return row.status == 'F' || row.status == 'P' ? "<span class='badge badge-success'>Finish</span>" : (row.status == "R" ? "<span class='badge badge-warning'>Returned</span>" : "<span class='badge badge-danger'>Saved</span>");
                    }
                },
                {
                    "data": "total"
                },
                {
                    "data": "date_added"
                },
                {
                    "data": "date_last_modified"
                }
            ],
                "columnDefs": [
                { "orderable": false, "targets": [0, 1] }
            ]
        });
    }

    function salesWithdrawal() {
        var id = $("#hidden_id_2").val();
        $("#hidden_id_3").val(id);
        $("#modalRelease").modal("show");

        var param = "sales_id = '" + $("#hidden_id_3").val() + "'";
        $("#dt_release").DataTable().destroy();
        $("#dt_release").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
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
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' style='display:none;' value=" + row.sales_detail_id + " class='dt_id_2' style='position: initial; opacity:1;'>" + row.product;
                    }
                },
                {
                    "data": "quantity"
                },
                {
                    "mRender": function(data, type, row) {

                        return "<input id='r_" + row.sales_detail_id + "' type='number' value='0' step='.01' max='" + row.quantity + "' min='0' name='r_qty[]' class='r_qty form-control form-control-sm'><input type='hidden' name='r_id[]' value='" + row.sales_detail_id + "'><input type='hidden' name='p_id[]' value='" + row.product_id + "'>";
                    }
                }
            ]
        });
    }

    $("#frm_release").submit(function(e) {
        e.preventDefault();

        var sum = 0;
        $(".r_qty").each(function() {
            sum += parseFloat(this.value);
        });

        var sales_id = $("#hidden_id_3").val();
        var r_qty = $("input[name='r_qty[]']").map(function() {
            return $(this).val();
        }).get();
        var r_id = $("input[name='r_id[]']").map(function() {
            return $(this).val();
        }).get();
        var p_id = $("input[name='p_id[]']").map(function() {
            return $(this).val();
        }).get();

        if (sum <= 0) {
            swal("Success!", "Successfully releasssed stocks.", "success");
        } else {
            $.ajax({
                type: "POST",
                url: "controllers/sql.php?c=" + route_settings.class_name + "&q=released",
                data: {
                    input: {
                        sales_id: sales_id,
                        r_qty: r_qty,
                        r_id: r_id,
                        p_id: p_id
                    }
                },
                success: function(data) {
                    swal("Success!", "Successfully released stocks", "success");
                    $("#modalRelease").modal("hide");
                }
            });
        }
    });

    function getEntries2() {
        var params = "sales_id = '" + $("#hidden_id_2").val() + "'";
        $("#dt_entries_2").DataTable().destroy();
        $("#dt_entries_2").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show_detail",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        param: params
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
                    .column(4)
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
                $(api.column(4).footer()).html(
                    "&#x20B1;" + pageTotal + ' ( &#x20B1; ' + total + ' )'
                );
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
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' value=" + row.sales_detail_id + " class='dt_id_2' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "data": "product"
                },
                {
                    "data": "quantity"
                },
                {
                    "data": "price"
                },
                {
                    "data": "discount"
                },
                {
                    "data": "amount"
                },
            ]
        });
    }


    function fetchProductsByCategory() {
        var product_category_id = $("#product_category_id").val();

        getSelectOption('Products', 'product_id', 'product_name', "product_category_id = '" + product_category_id + "'", ['product_price']);
    }

    function changeProduct() {
        var optionSelected = $("#product_id").find('option:selected').attr('product_price');
        $("#price").val(optionSelected);
    }

    function chargeSlip(id) {
        $("#modalChargeSlip").modal("show");
        $.ajax({
            type: 'POST',
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=getHeader",
            data: {
                id: id
            },
            success: function(data) {
                console.log(data);
                var json = JSON.parse(data);

                $("#cs_details").html("");

                $(".customer_name_span").html(json.data[0].customer_name);
                $(".reference_number_span").html(json.data[0].reference_number);
                $(".sales_date_span").html(json.data[0].sales_date_mod);
                $(".remarks_span").html(json.data[0].remarks);
                $(".customer_address_span").html(json.data[0].customer_address);
                $(".total_dr").html(json.data[0].total);
                $(".terms_span").html(json.data[0].terms);
                $(".due_date_span").html(json.data[0].due_date);
                $(".customer_tin_span").html(json.data[0].customer_tin);
                $("#hidden_id_terms").val(id);
                $("#terms").val(json.data[0].terms);

                cs_details(json.data[0].sales_id);
            }
        });
    }

    for_pick_up = 0;

    $(document).ready(function() {
        getEntries();
        getSelectOption('Customers', 'customer_id', 'customer_name');
        getSelectOption('Products', 'product_id', 'product_name', "", ['product_price']);
        getSelectOption('Discounts', 'discount_id', 'discount_name', "discount_type = 'M'", [], '0', 'No Discount');
        getSelectOption('Warehouses', 'warehouse_id', 'warehouse_name', "branch_id = '" + current_branch_id + "'");

        $(".company_name_label").html(company_profile.company_name);
        $(".company_address_label").html(company_profile.company_address);
    });
</script>