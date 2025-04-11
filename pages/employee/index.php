<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Employee</h3>
                    <h6 class="font-weight-normal mb-3">Manage employee here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-6 col-xl-6">
                            <label>&nbsp;</label>
                            <div>
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
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Date Added</th>
                                    <th>Date Modified</th>
                                    <th>Status</th>
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
<?php include 'modal_employee.php' ?>
<script type="text/javascript">

    function getEntries() {
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data",
                "type": "POST",
            },
            "columns": [{
                "mRender": function(data, type, row) {
                    return "<input type='checkbox' value=" + row.employee_id + " class='dt_id' style='position: initial; opacity:1;'>";
                }
            },
            {
                "mRender": function(data, type, row) {
                    return "<div style='display:flex;align-items:center'><button class='btn btn-primary btn-circle mr-1' onclick='getEntryDetails("+row.employee_id+ ")' style='padding:15px';height='45px;'><span class='ti ti-pencil'></span></button></div>";
                }
            },
            {
                "data": "employee_name"
            },
            {
                "data": "employee_category"
            },
            {
                "data": "date_added"
            },
            {
                "data": "date_last_modified"
            },
            {
                "mRender": function(data, type, row) {
                    return "<span class='badge badge-success'>Active</span>";
                }
            }
            ]
        });  
    }

    $(document).ready(function() {
        getEntries();

        getSelectOption('EmployeeCategory', 'emp_category_id', 'category_name');
    });
</script>