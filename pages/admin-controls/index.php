<div class="content-wrapper">
    <div class="row">
        <div class="col-12 col-xl-12 mb-4 mb-xl-0">
            <h3 class="font-weight-bold">Admin Controls</h3>
            <h6 class="font-weight-normal mb-3">Fix inventory cost and quantity.</h6>
        </div>
    </div>
    <br>
    <div class="col-12 col-xl-12 card shadow mb-4">
        <ul id="tabs" class="nav nav-tabs">
            <li class="nav-item"><a href="" data-target="#fixer-product" data-toggle="tab" class="nav-link small text-uppercase active">Inventory Fixer by Product</a></li>
            <li class="nav-item"><a href="" data-target="#fixer-prod-category" data-toggle="tab" class="nav-link small text-uppercase">Inventory Fixer by Warehouse</a></li>
            <!-- <li class="nav-item"><a href="" data-target="#backup" data-toggle="tab" class="nav-link small text-uppercase">Backup Database</a></li> -->
            <!-- <li class="nav-item"><a href="" data-target="#version-update" data-toggle="tab" class="nav-link small text-uppercase">Version Update</a></li> -->
        </ul>
        <br>
        <div id="tabsContent" class="tab-content">
            <div id="fixer-product" class="tab-pane fade active show">
                <form class="forms-sample" id="frm_inv_fixer">
                    <div class="row">
                        <div class="col-12">
                            <h4 class="card-title">Quantity Inventory Fixer by Product</h4>
                            <p class="card-description">
                                Manage and correct inventory quantity discrepancies here.
                            </p>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label><strong>Branch</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="branch_id_2" name="input[branch_id]" required>
                                        <option value="" disabled selected>&mdash; Please Select &mdash;</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label><strong>Warehouse</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="warehouse_id_2" name="input[warehouse_id]" required>
                                        <option value="" disabled selected>&mdash; Please Select &mdash;</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label><strong>Product</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="product_id" name="input[product_id]" required>
                                        <option value="" disabled selected>&mdash; Please Select &mdash;</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                    </div>
                    <button type="submit" class="btn btn-primary mr-2" id="btn_submit_inv"><span class="fa fa-check-circle"></span> Submit</button>
                </form>
            </div>

            <div id="fixer-prod-category" class="tab-pane fade">
                <form class="forms-sample" id="frm_inv_fixer_category">
                    <div class="row">
                        <div class="col-12">
                            <h4 class="card-title">Quantity Inventory Fixer by Product Category</h4>
                            <p class="card-description">
                                Manage and correct inventory quantity discrepancies here.
                            </p>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label><strong>Branch</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="branch_id_w" onchange="getWarehouses('warehouse')" name="input[branch_id]" required>
                                        <option value="" disabled selected>&mdash; Please Select &mdash;</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label><strong>Warehouse</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="warehouse_id_w" name="input[warehouse_id]" required>
                                        <option value="" disabled selected>&mdash; Please Select &mdash;</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label><strong>Category</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="product_category_id" name="input[product_category_id]" required>
                                        <option value="" disabled selected>&mdash; Please Select &mdash;</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        

                    </div>
                    <button type="submit" class="btn btn-primary mr-2" id="btn_inv_category"><span class="fa fa-check-circle"></span> Submit</button>
                </form>
            </div>

        </div>
    </div>

</div>
<script>
    $(document).ready(function() {
        getSelectOption('Branches', 'branch_id_2', 'branch_name', "", [], '', 'Please Select', 1);
        getSelectOption('Branches', 'branch_id_w', 'branch_name', "", [], '', 'Please Select', 1);
        // getSelectOption('Warehouses', 'warehouse_id', 'warehouse_name', "branch_id = '" + current_branch_id + "'");
        getSelectOption('Products', 'product_id', 'product_name');
        getSelectOption('ProductCategories', 'product_category_id', 'product_category');
    });

    $("#branch_id_2").change(function() {
        getWarehouses('product');
    });

    function getWarehouses(type) {
        if (type == "product") {
            var branch_id = $("#branch_id_2").val();
            getSelectOption('Warehouses', 'warehouse_id_2', 'warehouse_name', "branch_id = '" + branch_id + "'",[], '', 'Please Select', 1);
        } else {
            var branch_id = $("#branch_id_w").val();
            getSelectOption('Warehouses', 'warehouse_id_w', 'warehouse_name', "branch_id = '" + branch_id + "'",[], '', 'Please Select', 1);
        }
    }

    $("#frm_inv_fixer_category").submit(function(e) {
        e.preventDefault();

        $("#btn_inv_category").prop("disabled", true);
        $("#btn_inv_category").html("<span class='fa fa-spin fa-spinner'></span> Loading");

        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=InventoryReport&q=inventory_fixer_category",
            data: $("#frm_inv_fixer_category").serialize(),
            success: function(data) {
                var json = JSON.parse(data);
                if (json.data > 0) {
                    success_update();
                } else {
                    failed_query(json);
                }

                $("#btn_inv_category").prop('disabled', false);
                $("#btn_inv_category").html("<span class='fa fa-check-circle'></span> Submit");
            },
            error: function(jqXHR, textStatus, errorThrown) {
                errorLogger('Error:', textStatus, errorThrown);
            }
        });
    });

    $("#frm_inv_fixer").submit(function(e) {
        e.preventDefault();

        $("#btn_submit_inv").prop("disabled", true);
        $("#btn_submit_inv").html("<span class='fa fa-spin fa-spinner'></span> Loading");

        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=InventoryReport&q=inventory_fixer",
            data: $("#frm_inv_fixer").serialize(),
            success: function(data) {
                var json = JSON.parse(data);
                if (json.data > 0) {
                    success_update();
                } else {
                    failed_query(json);
                }

                $("#btn_submit_inv").prop('disabled', false);
                $("#btn_submit_inv").html("<span class='fa fa-check-circle'></span> Submit");
            },
            error: function(jqXHR, textStatus, errorThrown) {
                errorLogger('Error:', textStatus, errorThrown);
            }
        });
    });
</script>