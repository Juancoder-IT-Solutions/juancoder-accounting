<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Chart of Accounts</h3>
                    <h6 class="font-weight-normal mb-3">Manage chart of accounts here</h6>
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
                                    <th>Code</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Main Chart</th>
                                    <th>Chart Class</th>
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
<?php include 'modal_chart_of_accounts.php' ?>
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
                    return "<input type='checkbox' value=" + row.chart_id + " class='dt_id' style='position: initial; opacity:1;'>";
                }
            },
            {
                "mRender": function(data, type, row) {
                    return "<div style='display:flex;align-items:center'><button class='btn btn-primary btn-circle mr-1' onclick='getEntryDetails("+row.chart_id+ ")' style='padding:15px';height='45px;'><span class='ti ti-pencil'></span></button></div>";
                }
            },
            {
                "data": "chart_code"
            },
            {
                "data": "chart_name"
            },
            {
                "data": "chart_type"
            },
            {
                "data": "main_chart_name"
            },
            {
                "data": "classification_name"
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

    function changeChart(){
        if ($("#chart_type").val() == "S") {
            $("#classificationdiv").hide();
            $("#mainchartdiv").show();
            $("#chart_class_id").prop("required", false);
           
        } else {
            $("#classificationdiv").show();
            $("#mainchartdiv").hide();

            $("#chart_name").val("");
            $("#chart_class_id").val("");
            $("#main_chart_id").val("");
            
            $("#main_chart_id").prop("required", false);
            $("#chart_class_id").prop("required", true);
        }
    }

    function chartVal() {
        var chart_type = $("#chart_type").val();

        if (chart_type == "S") {
            var optionSelected = $("#main_chart_id").find('option:selected').attr('chart_name');
            chart_name = optionSelected;
            $("#chart_name").val(chart_name + " - ");
        } else {
            $("#chart_name").val("");
        }

    }

    $(document).ready(function() {

        getEntries();

        getSelectOption('ChartClassification', 'chart_class_id', 'chart_class_name');
        
        getSelectOption('ChartOfAccounts', 'main_chart_id', "chart_name", "chart_type = 'M'", ['chart_name']);
    });
</script>