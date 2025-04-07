<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Discounts</h3>
                    <h6 class="font-weight-normal mb-3">Manage discounts here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="pull-right py-3">
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
                                    <th>Discount</th>
                                    <th>Description</th>
                                    <th>Coverage</th>
                                    <th>Less</th>
                                    <th>Type</th>
                                    <th>Status</th>
                                    <th>Effective</th>
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
<?php include 'modal_discounts.php' ?>
<script type="text/javascript">
    function getEntries() {
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data"
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return row.status == 'F' ? '' : "<input type='checkbox' value=" + row.discount_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        var view_icon = row.status == 'F' ? "ti-menu" : "ti-pencil";
                        var view_btn = row.status == 'F' ? "btn-info" : "btn-primary";
                        return "<center><button class='btn " + view_btn + " btn-circle' onclick='getEntryDetails2(" + row.discount_id + ")' style='padding:15px;height:45px;'><span class='ti " + view_icon + "'></span></button></center>";
                    }
                },
                {
                    "data": "discount_name"
                },
                {
                    "data": "description"
                },
                {
                    "mRender": function(data, type, row) {
                        return row.coverage_type == 'A' ? "All Items" : "Selected Items";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return row.is_percentage == 1 ? (row.discount_percent * 1) + "% Off" : "₱" + row.discount_amount;
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return row.discount_type == 'A' ? "Automatic" : "Manual";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return row.status == 'F' ? "<span class='badge badge-success'>Finish</span>" : "<span class='badge badge-danger'>Saved</span>";
                    }
                },
                {
                    "data": "duration"
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
        var discount_id = $("#hidden_id_2").val();
        var product_category_id = $("#product_category_id").val();
        var visibility = $("#status_label").html() == 'F' ? false : true;
        var coverage_all = $("#coverage_type_label").html() == 'A' ? true : false;
        if ($("#status_label").html() == 'F') {
            $(".check-all").hide();
            var params = "discount_id = '" + discount_id + "'";
        } else {
            $(".check-all").show();
            var params = product_category_id > 0 ? "product_category_id = '" + product_category_id + "'" : '';
        }
        $("#dt_entries_2").DataTable().destroy();
        $("#dt_entries_2").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show_detail",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        param: params,
                        discount_id: discount_id
                    }
                }
            },
            "columns": [{
                "width": "5%"
            }, null],
            "columns": [{
                    "mRender": function(data, type, row) {
                        var text_coverage_all = coverage_all == true ? "<input type='checkbox' checked  class='dt_id_2' style='position: initial; opacity:1;' disabled>" : "<input type='checkbox' onchange='addItemDiscount(" + row.product_id + ",this)' value=" + row.product_id + " " + row.is_checked + " class='dt_id_2' style='position: initial; opacity:1;'>";

                        return visibility == true ? text_coverage_all : row.count;
                    }
                },
                {
                    "data": "product_name"
                },
            ]
        });
    }

    function checkCoverage() {
        // var coverage_type = $("#coverage_type").val();
        // if (coverage_type == 'A') {
        //     $(".cover-all").show();
        //     $("#discount_percent").prop('required', true);
        // } else {
        //     $(".cover-all").hide();
        //     $("#discount_percent").val(0).prop('required', false);
        // }
    }

    function checkType() {
        var discount_type = $("#discount_type").val();
        if (discount_type == 'M') {
            $(".type-manual").show();
        } else {
            $(".type-manual").hide();
        }
    }

    function checkAllDiscount() {
        var checkedValues = $("input[class='dt_id_2']:checked").map(function() {
            return this.value;
        }).get();

        var product_id = checkedValues != '' ? checkedValues : [];
        var discount_id = $("#hidden_id_2").val();
        var product_category_id = $("#product_category_id").val();
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=add_item_discount",
            data: {
                input: {
                    product_id: product_id,
                    discount_id: discount_id,
                    all_item: 1,
                    product_category_id: product_category_id
                }
            },
            success: function(data) {
                var json = JSON.parse(data);
                console.log(json);
            }
        });
    }

    function addItemDiscount(product_id, elem) {
        var discount_id = $("#hidden_id_2").val();
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=add_item_discount",
            data: {
                input: {
                    product_id: product_id,
                    is_checked: elem.checked,
                    discount_id: discount_id,
                    all_item: 0
                }
            },
            success: function(data) {
                var json = JSON.parse(data);
                console.log(json);
            }
        });
    }

    function changeDiscountType(is_percentage) {
        if (is_percentage == 1) {
            $(".disc-percentage").show();
            $(".disc-amount").hide();
            $("#discount_percent").prop('required', true);
            $("#discount_amount").prop('required', false);
        } else {
            $(".disc-percentage").hide();
            $(".disc-amount").show();
            $("#discount_amount").prop('required', true);
            $("#discount_percent").prop('required', false);
        }
    }

    $(document).ready(function() {
        schema();
        getEntries();
        checkCoverage();
        getSelectOption('ProductCategories', 'product_category_id', 'product_category', '', [], '', 'All Categories');
    });
</script>