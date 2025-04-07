<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Logs</h3>
                    <h6 class="font-weight-normal mb-3">View your logs here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <form id='frm_generate'>
                        <div class="form-group row">
                            <div class="col">
                                <label><strong>Month</strong></label>
                                <div>
                                    <input type="month" name="month_date" id="month_date" class="form-control form-control-sm">
                                </div>
                            </div>
                            <div class="col">
                                <label>&nbsp;</label>
                                <div>
                                    <div class="btn-group pull-right">
                                        <button type="submit" id="btn_generate" class="btn btn-primary btn-sm btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-plus"></i>
                                            </span>
                                            <span class="text">Generate</span>
                                        </button>
                                        <button type="button" onclick="exportTableToExcel(this,'dt_entries','Inventroy-Report')" class="btn btn-success btn-sm btn-icon-split">
                                            <span class="icon">
                                                <i class="ti ti-cloud-down"></i>
                                            </span>
                                            <span class="text"> Export</span>
                                        </button>
                                        <button type="button" onclick="print_report('report_container')" class="btn btn-info btn-sm btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-trash"></i>
                                            </span>
                                            <span class="text">Print</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div id="report_container">
                        <div class="table-responsive">
                            <center>
                                <h4 class="report-header"><span id="company_name_label"></span></h4>
                                <h6 class="report-header"><span id="company_address_label" style="word-wrap: break-word;"></span></h6>
                                <h5 class="report-header">Logs Report</h5><br>
                            </center>
                            <table class="display expandable-table" id="dt_entries" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Action</th>
                                        <th>Module</th>
                                        <th>Date</th>
                                        <th>Encoder</th>
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
</div>
<script type="text/javascript">
    $("#frm_generate").submit(function(e) {
        e.preventDefault();

        getReport();
    });

    function getReport() {
        var month_date = $("#month_date").val();
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=view",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        month_date: month_date
                    }
                },
            },
            "columns": [{
                    "data": "count"
                }, {
                    "data": "action"
                },
                {
                    "data": "module"
                },
                {
                    "data": "date"
                },
                {
                    "data": "user"
                },
            ]
        });
    }

    $(document).ready(function() {

        getReport();
        $("#company_name_label").html(company_profile.company_name);
        $("#company_address_label").html(company_profile.company_address);
    });
</script>