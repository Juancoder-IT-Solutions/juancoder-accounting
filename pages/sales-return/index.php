<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Sales Return</h3>
                    <h6 class="font-weight-normal mb-3">Manage sales return here</h6>
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
                    <div class="table-responsive">
                        <table class="display expandable-table" id="dt_entries" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th><input type='checkbox' onchange="checkAll(this, 'dt_id')"></th>
                                    <th></th>
                                    <th>Date</th>
                                    <th>Reference</th>
                                    <th>Sales Reference</th>
                                    <th>Encoded by</th>
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
<?php include 'modal_sales_return.php' ?>
<script type="text/javascript">
    function getEntries() {
        var  start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var param = "AND (return_date >= '"+start_date+"' AND return_date <= '"+end_date+"')";

        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "order": [[ 3, 'desc' ]],
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
                        return row.status == 'F' ? '' : "<input type='checkbox' value=" + row.sales_return_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return "<center><button class='btn btn-primary btn-circle btn-sm' onclick='getEntryDetails2(" + row.sales_return_id + ")' style='padding:15px;height:45px;'><span class='ti ti-menu'></span></button></center>";
                    }
                },
                {
                    "data": "return_date"
                },
                {
                    "data": "reference_number"
                },
                {
                    "data": "sales_reference_number"
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

    function getEntries2() {
        var params = "sales_return_id = '" + $("#hidden_id_2").val() + "'";
        var visibility = $("#status_label").html() == 'F' ? false : true;
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
                "targets": [4, 5],
                "visible": visibility
            }],
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' value=" + row.return_detail_id + " class='dt_id_2' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "data": "product"
                },
                {
                    "data": "quantity"
                },
                {
                    "data": "quantity_return"
                },
                {
                    "mRender": function(data, type, row) {
                        return "<input id='return-" + row.return_detail_id + "' type='number' value='0' step='.01' class='form-control form-control-sm'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return "<button type='button' class='btn btn-success btn-circle btn-sm' onclick='addReturn(" + row.return_detail_id + ")' style='padding:15px;height:45px;'><span class='ti ti-plus'></span></button>";
                    }
                },
            ]
        });
    }

    function addReturn(id) {
        var qty = $("#return-" + id).val() * 1;
        if (qty > 0) {
            $.ajax({
                type: "POST",
                url: "controllers/sql.php?c=" + route_settings.class_name + "&q=add_detail",
                data: {
                    input: {
                        quantity_return: qty,
                        return_detail_id: id
                    }
                },
                success: function(data) {
                    var json = JSON.parse(data);
                    getEntries2();
                    if (json.data == 1) {
                        success_add();
                    } else if (json.data == 2) {
                        amount_is_greater();
                    } else {
                        failed_query(json);
                    }
                }
            });
        }
    }

    function checkSalesReference() {
        var sales_reference_number = $("#sales_reference_number").val();
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=Sales&q=pk_by_name_branch",
            data: {
                input: {
                    reference_number: sales_reference_number
                }
            },
            success: function(data) {
                var json = JSON.parse(data);
                if (json.data > 0) {
                    $("#btn_submit").prop('disabled', false);
                } else {
                    $("#btn_submit").prop('disabled', true);
                }
            }
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

    $(document).ready(function() {
        schema();
        getEntries();
        getSelectOption('Customers', 'customer_id', 'customer_name');
        getSelectOption('ProductCategories', 'product_category_id', 'product_category');
    });
</script>