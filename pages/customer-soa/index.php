<style>
    @media print {
        center {
            text-align: center;
        }

        .div_footer {
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        .left-column,
        .right-column {
            display: inline-block;
            width: 48%;
            /* Adjust the width as needed */
            vertical-align: top;
            /* Align columns to the top */
        }
    }
</style>
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Customer Statement of Accounts</h3>
                    <h6 class="font-weight-normal mb-3">Generate report here</h6>
                    <br>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <form id='frm_generate'>
                        <div class="form-group row">
                            <div class="col">
                                <label><strong>Account</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="customer_id" name="input[customer_id]">
                                        <option value="-1">&mdash; All &mdash; </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <label>&nbsp;</label>
                                <div>
                                    <div class="btn-group pull-right">
                                        <button type="submit" id="btn_generate" class="btn btn-warning btn-icon-split">
                                            <span class="icon">
                                                <i class="ti ti-reload"></i>
                                            </span>
                                            <span class="text"> Generate</span>
                                        </button>
                                        <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries','Customer-Statement-of-Accounts')">
                                            <i class="ti-cloud-down"></i> Export
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </form>

                    <div id="report_container">
                        <center>
                            <h4 class="report-header"><span id="company_name_label"></span></h4>
                            <h6 class="report-header"><span id="company_address_label" style="word-wrap: break-word;"></span></h6>
                            <h5>Receivable Report</h5><br>
                        </center>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dt_entries" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>ACCOUNT</th>
                                        <th style="text-align:right">BALANCE</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="2" style="text-align:right">Total:</th>
                                        <th></th>
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
<?php include 'modal_soa.php' ?>
<script type="text/javascript">
    $("#frm_generate").submit(function(e) {
        e.preventDefault();
        getReport();
    });

    function getReport() {
        var customer_id = $("#customer_id").val();
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
                        customer_id: customer_id
                    }
                },
            },
            "footerCallback": function(row, data, start, end, display) {
                var api = this.api();

                var intVal = function(i) {
                    return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                        i : 0;
                };

                total = api
                    .column(2)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(2).footer()).html(
                    '&#x20B1; ' + this.fnSettings().fnFormatNumber(parseFloat(parseFloat(total).toFixed(2)))
                );
            },
            "columns": [{
                    "data": "count"
                },
                {
                    "data": "customer_name"
                },
                {
                    "data": "balance",
                    className: "text-right"
                },
                {
                    "mRender": function(data, type, row) {
                        return "<center><button onclick=printRecord(" + row.customer_id + ",'" + row.total + "') class='btn btn-lg btn-warning'><span class='ti ti-printer'></span></button></center>";
                    }
                },
            ]
        });
    }


    function printRecord(id, total) {
        $("#modalSoaSlip").modal("show");


        $.ajax({
            type: 'POST',
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=getSoa",
            data: {
                id: id,
                total: total
            },
            success: function(data) {
                var json = JSON.parse(data);

                $("#cs_details").html("");

                $(".customer_name_span").html(json.data[0].customer_name);
                $(".today_span").html(json.data[0].today);
                $(".customer_terms_span").html(json.data[0].terms);
                $(".customer_address_span").html(json.data[0].customer_address);
                $(".amount_to_word").html(json.data[0].amount_to_words);
                $(".total").html(json.data[0].total);
                $(".terms_span").html(json.data[0].terms);
                $(".customer_tin_span").html(json.data[0].customer_tin);
                $("#hidden_id_terms").val(id);
                $("#terms").val(json.data[0].terms);
                unpaid_details(json.data[0].customer_id, json.data[0].customer_terms);
                soa_aging(json.data[0].customer_id);
            }
        });
    }



    $(document).ready(function() {
        getSelectOption('Customers', 'customer_id', 'customer_name', '', [], -1, 'All');
        // getReport();

        $(".company_name_label").html(company_profile.company_name);
        $(".company_address_label").html(company_profile.company_address);
    });
</script>