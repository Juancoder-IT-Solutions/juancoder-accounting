<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Product Categories</h3>
                    <h6 class="font-weight-normal mb-3">Manage product categories here</h6>
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
                                    <th>Product Category</th>
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
<?php include 'modal_category.php' ?>
<script type="text/javascript">
    var ClassName = 'ProductCategories';

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
                        return "<input type='checkbox' value=" + row.product_category_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return "<center><button class='btn btn-primary btn-circle' onclick='getEntryDetails(" + row.product_category_id + ")' style='padding:15px;height:45px;'><span class='ti ti-pencil'></span></button></center>";
                    }
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
    $(document).ready(function() {
        getEntries();
    });
</script>