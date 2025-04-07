<form method='POST' id='frm_submit_2' class="warehouse">
    <div class="modal fade" id="modalEntry2" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Add Entry</h4>
                </div>
                <div class="modal-body">
                    <input class="input-item" type="hidden" id="hidden_id_2" name="input[branch_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Warehouse Name</strong></label>
                            <div>
                                <select class="form-control form-control-sm input-item select2" name="input[warehouse_id]" id="warehouse_id" required>
                                </select>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="table-responsive">
                        <table class="display expandable-table" id="dt_entries_2" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Warehouse</th>
                                    <th>Date Added</th>
                                    <th>Date Modified</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class='btn-group'>
                        <button type="submit" class="btn btn-primary" id="btn_submit2">Submit</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script>

function getEntries2() {
        var hidden_id_2 = $("#hidden_id_2").val();
        var param = "branch_id = '" + hidden_id_2 + "'";
        $("#dt_entries_2").DataTable().destroy();
        $("#dt_entries_2").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=Warehouses&q=show",
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
                        return "<div style='display:flex;align-items:center'>" +
                            "<button type='button' class='btn btn-primary btn-circle btn-sm mr-2' onclick='updateWarehouse(" + row.warehouse_id + ", \"" + row.warehouse_name + "\")' style='padding:15px;height:45px;'>" +
                            "<span class='ti ti-pencil'></span>" +
                            "</button>" +
                            "<button type='button' class='btn btn-danger btn-circle btn-sm' onclick='removeWarehouse(" + row.warehouse_id + ")' style='padding:15px;height:45px;'>" +
                            "<span class='ti ti-trash'></span>" +
                            "</button>" +
                            "</div>";
                    }
                },
                {
                    "data": "warehouse_name"
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
</script>