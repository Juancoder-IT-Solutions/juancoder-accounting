<style>
    .text-right {
        text-align: right;
    }
</style>
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Bank Due Date</h3>
                    <h6 class="font-weight-normal mb-3">Generate Bank due date report here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <form id='frm_generate'>
                        <div class="form-group row">
                            <div class="col">
                                <label><strong>Bank</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="bank_id" name="input[bank_id]">
                                        <option value="-1">&mdash; All &mdash; </option>
                                    </select>
                                </div>
                            </div>

                            <div class="col">
                                <label>&nbsp;</label>
                                <div>

                                    <button type="submit" id="btn_generate" class="btn btn-warning btn-icon-text">
                                        <i class="ti-reload mr-1"></i> Generate
                                    </button>  
                                    <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries','Bank-Due-Report')">
                                        <i class="ti-cloud-down"></i> Export
                                    </button>
                                    <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('report_container')">
                                        <i class="ti-printer mr-1"></i> Print
                                    </button>

                                </div>
                            </div>
                        </div>
                    </form>
                
                    <div id="report_container">
                        <center>
                            <h4 class="report-header"><span id="company_name_label"></span></h4>
                            <h6 class="report-header"><span id="company_address_label" style="word-wrap: break-word;"></span></h6>
                            <h5 class="report-header"><strong>Bank Due Report</strong></h5>
                        </center>
                        <br>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dt_entries" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>#</th>
                                        <th>Bank</th>
                                        <th>Reference</th>
                                        <th>Check #</th>
                                        <th>Check Date</th>
                                        <th style="text-align:right">Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="6" style="text-align:right">Total:</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
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
        getEntries();
    });

    function getEntries() {
        var bank_id = $("#bank_id").val();
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "order": [
                [5, 'asc']
            ],
            "searching": false,
            "paging": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=view",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        bank_id: bank_id
                    }
                },
            },
            "footerCallback": function(row, data, start, end, display) {
                var api = this.api();

                // Remove the formatting to get integer data for summation
                var intVal = function(i) {
                    return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                        i : 0;
                };

                // Total over all pages
                total = api
                    .column(6)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(6).footer()).html(
                    '&#x20B1; ' + total + ''
                );
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<center><button class='btn btn-success btn-circle btn-sm' onclick='confirmCheck(" + row.sp_id + ")'><span class='ti ti-check'></span></button></center>";
                    }
                },
                {
                    "data": "count"
                },
                {
                    "data": "bank"
                },
                {
                    "data": "reference"
                },
                {
                    "data": "check_number"
                },
                {
                    "data": "check_date"
                },
                {
                    "data": "amount",
                    className: "text-right"
                },
            ]
        });
    }

    function confirmCheck(id) {
        swal({
                title: "Are you sure?",
                text: "This check will be finished!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-info",
                confirmButtonText: "Yes, finish it!",
                cancelButtonText: "No, cancel!",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function(isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        type: "POST",
                        url: "controllers/sql.php?c=" + route_settings.class_name + "&q=cleared",
                        data: {
                            input: {
                                id: id
                            }
                        },
                        success: function(data) {
                            getEntries();
                            var json = JSON.parse(data);
                            if (json.data == 1) {
                                success_update();
                                getEntries();
                            } else {
                                failed_query(json);
                            }
                        }
                    });
                } else {
                    swal("Cancelled", "Entries are safe :)", "error");
                }
            });
    }


    $(document).ready(function() {
        getSelectOption('Banks', 'bank_id', 'bank_name', '', [], -1, 'All');
        getEntries();
        
        $("#company_name_label").html(company_profile.company_name);
        $("#company_address_label").html(company_profile.company_address);
    });
</script>