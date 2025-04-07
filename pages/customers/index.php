<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Customers</h3>
                    <h6 class="font-weight-normal mb-3">Manage customers here</h6>
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
                                    <th>Customer Name</th>
                                    <th>Address</th>
                                    <th>Contact #</th>
                                    <th>Suki Card #</th>
                                    <th>Remarks</th>
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
<?php require_once 'modal_customer.php'; ?>
<script type="text/javascript">
    var ClassName = 'Customers';

    function getEntries() {
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + ClassName + "&q=show",
                "dataSrc": "data",
                "type": "POST"
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        if (row.customer_id == 0) {
                            return "";
                        } else {
                            return "<input type='checkbox' value=" + row.customer_id + " class='dt_id' style='position: initial; opacity:1;'>";

                        }
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return row.customer_id == 0 ? "" : "<center><button class='btn btn-primary btn-circle' onclick='getEntryDetails(" + row.customer_id + ")' style='padding:15px;height:45px;'><span class='ti ti-pencil'></span></button></center>";
                    }
                },
                {
                    "data": "customer_name"
                },
                {
                    "data": "customer_address"
                },
                {
                    "data": "customer_contact_number"
                },
                {
                    "data": "suki_card_number"
                },
                {
                    "data": "remarks"
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