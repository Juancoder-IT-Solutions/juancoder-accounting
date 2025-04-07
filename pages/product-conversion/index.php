<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Product Conversion</h3>
                    <h6 class="font-weight-normal mb-3">Convert your product here</h6>
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
                                    <th>Reference</th>
                                    <th>Conversion Date</th>
                                    <th>Warehouse</th>
                                    <th>Remarks</th>
                                    <th>Status</th>
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
<?php require_once 'modal_product_conversion.php' ?>
<?php require_once 'modal_print.php'; ?>

<script type="text/javascript">
    function handleBarcodeScanOriginal() {
        var product_barcode = $("#product_barcode").val();
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=Products&q=view_by_barcode",
            data: {
                input: {
                    product_barcode: product_barcode
                }
            },
            success: function(data) {
                var json = JSON.parse(data);
                if (json.data && json.data.product_id) {
                    $("#original_product_id").val(json.data.product_id).trigger('change');
                    console.log("Product", json.data);
                    $("#product_barcode_2").focus();
                } else {
                    $("#original_product_id").val('').trigger('change');
                    console.log("Product not found");
                    $("#product_barcode").focus();
                }
            }
        });
    }

    function handleBarcodeScanConverted() {
        var product_barcode = $("#product_barcode_2").val();
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=Products&q=view_by_barcode",
            data: {
                input: {
                    product_barcode: product_barcode
                }
            },
            success: function(data) {
                var json = JSON.parse(data);
                if (json.data && json.data.product_id) {
                    $("#converted_product_id").val(json.data.product_id).trigger('change');
                    console.log("Product", json.data);
                    $("#original_qty").focus();
                } else {
                    $("#converted_product_id").val('').trigger('change');
                    console.log("Product not found");
                    $("#product_barcode_2").focus();
                }
            }
        });
    }

    function getEntries() {
        var branch_id = "<?= $_SESSION['branch_id'] ?>";

        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var warehouse_id = $("#warehouse_id").val();
        var param = "(conversion_date >= '" + start_date + "' AND conversion_date <= '" + end_date + "') AND branch_id = '" + branch_id + "'";

        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
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
                        return row.status == 'F' ? "" : "<input type='checkbox' value=" + row.conversion_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return "<div style='display:flex;align-items:center'><button class='btn btn-primary btn-circle mr-1' onclick='getEntryDetails2(" + row.conversion_id + ")' style='padding:15px';height='45px;'><span class='ti ti-menu'></span></button><button onclick='printRecord(" + row.conversion_id + ")' class='btn btn-warning btn-circle' style='padding:15px';height='45px;'><span class='ti ti-printer'></span></button></div>";
                    }
                },
                {
                    "data": "reference_number"
                },
                {
                    "data": "conversion_date"
                },
                {
                    "data": "warehouse_name"
                },
                {
                    "data": "remarks"
                },
                {
                    "mRender": function(data, type, row) {
                        return row.status == 'F' ? "<label class='badge badge-success'> Finish</label>" : "<label class='badge badge-danger'> Saved</label>";
                    }
                },
                {
                    "data": "date_added"
                },
                {
                    "data": "date_last_modified"
                }
            ]
        });
    }


    function getEntries2() {
        var params = "conversion_id = '" + $("#hidden_id_2").val() + "'";
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
                "targets": [2, 4],
                "render": $.fn.dataTable.render.number(',', '.', 2, ''),
                "className": 'dt-body-right'
            }],
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' value=" + row.conversion_detail_id + " class='dt_id_2' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "data": "original_product"
                },
                {
                    "data": "original_qty"
                },
                {
                    "data": "converted_product"
                },
                {
                    "data": "converted_qty"
                },
            ]
        });
    }

    function copyProductSelect() {
        var product_select = $("#product_id").html();
        $("#original_product_id").html(product_select);
        $("#converted_product_id").html(product_select);
    }

    $(document).ready(function() {
        // schema();
        getSelectOption('Warehouses', 'warehouse_id', 'warehouse_name', "branch_id = '" + current_branch_id + "'");
        getSelectOption('Products', 'product_id', 'product_name', 'product_id > 0 ORDER BY product_name ASC');
        getEntries();
        myTimeout = setTimeout(copyProductSelect, 1000);
    });
</script>