<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Users</h3>
                    <h6 class="font-weight-normal mb-3">Manage users here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="pull-right py-3">
                    <button type="button" class="btn btn-primary btn-icon-text" onclick="addUser()">
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
                                    <th>Fullname</th>
                                    <th>Category</th>
                                    <th>Username</th>
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

<?php require_once 'modal_users.php'; ?>
<?php require_once 'modal_privileges.php'; ?>
<?php require_once 'modal_warehouse.php'; ?>
<script type="text/javascript">
    function addUser() {
        $("#div_password").show();
        addModal();
        $("#div_category").show();
        $("#user_category").prop("required",true);
    }

    function getUserDetails(id) {
        $("#div_password").hide();
        getEntryDetails(id);
    }

    function getUserPrivileges(id) {
        $("#priv_user_id").val(id);
        $("#modalPrivileges").modal('show');

        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=UserPrivileges&q=lists",
            data: {
                input: {
                    id: id
                }
            },
            success: function(data) {
                var json = JSON.parse(data),
                    text_masterdata = '',
                    text_transaction = '',
                    text_report = '';

                if (json.data.masterdata.length > 0) {
                    for (let mIndex = 0; mIndex < json.data.masterdata.length; mIndex++) {
                        const rowData = json.data.masterdata[mIndex];
                        text_masterdata += skin_privilege(rowData.name, rowData.status, rowData.url);
                    }
                }
                $("#master_data_column").html(text_masterdata);

                if (json.data.transaction.length > 0) {
                    for (let mIndex = 0; mIndex < json.data.transaction.length; mIndex++) {
                        const rowData = json.data.transaction[mIndex];
                        text_transaction += skin_privilege(rowData.name, rowData.status, rowData.url);
                    }
                }
                $("#transaction_column").html(text_transaction);

                if (json.data.report.length > 0) {
                    for (let mIndex = 0; mIndex < json.data.report.length; mIndex++) {
                        const rowData = json.data.report[mIndex];
                        text_report += skin_privilege(rowData.name, rowData.status, rowData.url);
                    }
                }
                $("#report_column").html(text_report);
            }
        });
    }

    function skin_privilege(item_name, status, url) {
        var check_input = status == 1 ? "checked" : '';
        return '<li>' +
            '<div class="form-check">' +
            '<label class="form-check-label">' +
            '<input class="checkbox" name="input[' + url + ']" value="1" type="checkbox" ' + check_input + '>' + item_name + '<i class="input-helper"></i></label>' +
            '</div>' +
            '</li>';
    }


    $("#frm_privileges_submit").submit(function(e) {
        e.preventDefault();

        $("#btn_submit_priv").prop('disabled', true);
        $("#btn_submit_priv").html("<span class='fa fa-spinner fa-spin'></span> Submitting ...");

        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=UserPrivileges&q=add",
            data: $("#frm_privileges_submit").serialize(),
            success: function(data) {
                var json = JSON.parse(data);
                if (json.data) {
                    success_update();
                }
                $("#btn_submit_priv").prop('disabled', false);
                $("#btn_submit_priv").html("<span class='fa fa-check-circle'></span> Submit");
            }
        });
    });

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
                        return row.user_category == "A" ? "" : "<input type='checkbox' value=" + row.user_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return row.user_category == 'A' ? '' : "<center><button class='btn btn-success btn-circle' onclick='getUserPrivileges(" + row.user_id + ")'><span class='ti ti-key'></span></button></center>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return "<div style='display:flex;align-items:center'><button class='btn btn-primary btn-circle mr-2' onclick='getUserDetails(" + row.user_id + ")' style='padding:15px;height:45px;'><span class='ti ti-pencil'></span></button><button class='btn btn-warning btn-circle' onclick='assignWarehouse(" + row.user_id + ")' style='padding:15px;height:45px;'><span class='ti-location-pin'></span></button></div>";
                    }
                },
                {
                    "data": "user_fullname"
                },
                {
                    "data": "category"
                },
                {
                    "data": "username"
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

    function assignWarehouse(id){
        $("#modalEntry2").modal("show");
        $("#hidden_id_2").val(id);
    }

    $(document).ready(function() {
        getEntries();
        getSelectOption('Warehouses', 'warehouse_id', 'warehouse_name', "branch_id = '" + current_branch_id + "'");
    });
</script>