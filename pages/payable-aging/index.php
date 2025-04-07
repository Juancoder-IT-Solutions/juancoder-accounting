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
                    <h3 class="font-weight-bold">Aging of Accounts Payable </h3>
                    <h6 class="font-weight-normal mb-3">Generate aging of accounts here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <form id='frm_generate'>
                        <div class="form-group row">
                            <div class="col">
                                <label><strong>Account</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" required id="supplier_id" name="input[supplier_id]">
                                        <option class="">&mdash; All &mdash; </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <label>&nbsp;</label>
                                <div>
                                    <button type="submit" id="btn_generate" class="btn btn-warning btn-icon-text">
                                        <i class="ti-reload mr-1"></i> Generate
                                    </button>  
                                    <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries','Aging-of-Accounts-Receivable')">
                                        <i class="ti-cloud-down mr-1"></i> Export
                                    </button>
                                    <button type="button" class="btn btn-success btn-icon-text" onclick="print_report('report_container')" id="btn_delete">
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
                            <h5>Aging of Accounts Payable</h5><br>
                        </center>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dt_entries" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>DATE</th>
                                        <th>REFERENCE #</th>
                                        <th style="text-align:right">NET AMOUNT</th>
                                        <th style="text-align:right">AMOUNT PAID</th>
                                        <th style="text-align:right">0 to 7 days</th>
                                        <th style="text-align:right">8 to 15 days</th>
                                        <th style="text-align:right">16 to 30 days</th>
                                        <th style="text-align:right">31 to 60 days</th>
                                        <th style="text-align:right">61 to 90 days</th>
                                        <th style="text-align:right">91 to 120 days</th>
                                        <th style="text-align:right">120+ days</th>
                                        <th style="text-align:right">BALANCE</th>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align:right"><strong>Account:</strong></td>
                                        <td colspan="11"><span id="span_supplier"></span></td>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="12" style="text-align:right">Total:</th>
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
        getReport();
    });

    function getAccount() {
        var optionSelected = $("#supplier_id").find('option:selected').attr('supplier_name');
        $("#span_supplier").html(optionSelected);
    }

    function getReport() {
        var supplier_id = $("#supplier_id").val();
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
                        supplier_id: supplier_id
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

                creditTotal = api
                    .column(12, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(12).footer()).html(
                    "&#x20B1; " + creditTotal.toLocaleString('en-US', {minimumFractionDigits: 2})
                );

            },
            "columns": [
                {
                    "data": "count"
                },
                {
                    "data": "date"
                },
                {
                    "data": "reference_number"
                },
                {
                    "data": "net_amount", className: "text-right"
                },
                {
                    "data": "amount_paid", className: "text-right"
                },
                {
                    "data": "days1", className: "text-right"
                },
                {
                    "data": "days2", className: "text-right"
                },
                {
                    "data": "days3", className: "text-right"
                },
                {
                    "data": "days4", className: "text-right"
                },
                {
                    "data": "days5", className: "text-right"
                },
                {
                    "data": "days6", className: "text-right"
                },
                {
                    "data": "days7", className: "text-right"
                },
                {
                    "data": "balance", className: "text-right"
                },
            ]

        });

        getAccount();
    }

    $(document).ready(function() {
        getSelectOption('Suppliers', 'supplier_id', 'supplier_name', "", ['supplier_name']);

        $("#company_name_label").html(company_profile.company_name);
        $("#company_address_label").html(company_profile.company_address);
    });
</script>
