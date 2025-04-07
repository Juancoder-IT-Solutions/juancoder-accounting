<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Products</h3>
                    <h6 class="font-weight-normal mb-3">Manage products here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="pull-right py-3">
                    <!-- <a href="#" class="btn btn-primary btn-sm btn-icon-split" onclick="addModal()">
                        <span class="icon text-white-50">
                            <i class="fas fa-plus"></i>
                        </span>
                        <span class="text">Add Entry</span>
                    </a>
                    <a href="#" class="btn btn-danger btn-sm btn-icon-split" onclick='deleteEntry()' id='btn_delete'>
                        <span class="icon text-white-50">
                            <i class="fas fa-trash"></i>
                        </span>
                        <span class="text">Delete Entry</span>
                    </a> -->

                    <button type="button" class="btn btn-primary btn-icon-text" onclick="addModal()">
                        <i class="ti-plus mr-1"></i> Add Entry
                    </button>

                    <button type="button" class="btn btn-danger btn-icon-text" onclick="deleteEntry()" id="btn_delete">
                        <i class="ti-trash mr-1"></i> Delete Entry
                    </button>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="display expandable-table" id="dt_entries" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th><input type='checkbox' onchange="checkAll(this, 'dt_id')"></th>
                                    <th></th>
                                    <th></th>
                                    <th>Barcode</th>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Category</th>
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
<?php include 'modal_products.php' ?>
<?php include 'modal_barcode.php' ?>
<script type="text/javascript">
    var ClassName = 'Products';

    function getEntries() {
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + ClassName + "&q=show",
                "dataSrc": "data"
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' value=" + row.product_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return "<center><button class='btn btn-primary btn-circle' onclick='getEntryDetails(" + row.product_id + ")' style='padding:15px;height:45px;'><span class='ti ti-pencil'></span></button></center>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return row.product_barcode == '' ? "" : "<center><button class='btn btn-success btn-circle' onclick=\"openBarcodeModal('" + row.product_barcode + "')\" style='padding:15px;height:45px;'><span class='ti ti-printer'></span></button></center>";
                    }
                },
                {
                    "data": "product_barcode"
                },
                {
                    "data": "product_name"
                },
                {
                    "data": "product_price"
                },
                {
                    "data": "product_category"
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

    $("#modalEntry").on('shown.bs.modal', function(e) {
        var id = $("#hidden_id").val();
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=view",
            data: {
                input: {
                    id: id
                }
            },
            success: function(data) {
                var jsonParse = JSON.parse(data);
                const json = jsonParse.data;
                if (json.is_package == 1) {
                    $("#is_package").prop("checked", true);
                } else {
                    $("#is_package").prop("checked", false);
                }
            }
        });
    });

    function openBarcodeModal(id) {
        $("#modalBarcode").modal('show');
        $("#hidden_barcode_id").val(id);
        $("#barcode_qty").val(40);
        generateBarcode();
    }

    function generateBarcode() {
        var barcode_id = $("#hidden_barcode_id").val();
        var barcode_qty = $("#barcode_qty").val();
        $.ajax({
            type: "POST",
            url: "barcode/generate.php",
            data: {
                barcode: barcode_id,
                number: barcode_qty
            },
            success: function(barcode_data) {
                $("#barcode").html(barcode_data);
            }
        });
    }

    $(document).ready(function() {
        schema();
        getEntries();
        getSelectOption('ProductCategories', 'product_category_id', 'product_category');
    });
</script>