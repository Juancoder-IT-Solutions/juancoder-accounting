<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Journal Entry</h3>
                    <h6 class="font-weight-normal mb-3">Manage journal entry here</h6>
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
                                    <th>General Reference</th>
                                    <th>Cross Reference</th>
                                    <th>Journal</th>
                                    <th>Branch</th>
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
<?php include 'modal_journal_entry.php' ?>
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
                    return "<input type='checkbox' value=" + row.journal_entry_id + " class='dt_id' style='position: initial; opacity:1;'>";
                }
            },
            {
                "mRender": function(data, type, row) {
                    return "<div style='display:flex;align-items:center'><button class='btn btn-primary btn-circle mr-1' onclick='getEntryDetails2("+row.journal_entry_id+ ")' style='padding:15px';height='45px;'><span class='ti ti-menu'></span></button></div>";
                }
            },
            {
                "data": "general_reference"
            },
            {
                "data": "cross_reference"
            },
            {
                "data": "journal"
            },
            {
                "data": "branch"
            },
            {
                "mRender": function(data, type, row) {
                    return row.status == 'F' ? "<span class='badge badge-success'>Finish</span>" : "<span class='badge badge-warning'>Saved</span>";
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
        var hidden_id_2 = $("#hidden_id_2").val();
        var param = "journal_entry_id = '" + hidden_id_2 + "'";

        $("#dt_entries_2").DataTable().destroy();
        $("#dt_entries_2").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show_detail",
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
                    return "<input type='checkbox' value=" + row.journal_entry_detail_id + " class='dt_id_2' style='position: initial; opacity:1;'>";
                }
                },
                {
                    "data": "chart"
                },
                {
                    "data": "description"
                },
                {
                    "data": "debit"
                },
                {
                    "data": "credit"
                },
            ]
        });
    }

    function generateRef() {
        var refnum = $("#reference_number").val();
        var optionSelected = $("#journal_id").find('option:selected').attr('journal_code');
        var newStr = refnum.split("-");

        $("#reference_number").val(optionSelected+"-"+newStr[1]);
    }

    $(document).ready(function() {

        getEntries();
        // getSelectOption('Branches', 'branch_id_entry', 'branch_name');
        getSelectOption('Journals', 'journal_id', 'journal_name', '', ['journal_code']);
        getSelectOption('ChartOfAccounts', 'chart_id', 'chart_name');
    });
</script>