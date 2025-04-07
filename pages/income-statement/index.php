<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Income Statement</h3>
                    <h6 class="font-weight-normal mb-3">Generate your income statement here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <form id='frm_generate'>
                        <div class="form-group row">
                            <div class="col">
                                <label><strong>Start Date</strong></label>
                                <div>
                                    <input type="date" required class="form-control" value="<?php echo date('Y-m-01', strtotime(date("Y-m-d"))); ?>" id="start_date" name="input[start_date]">
                                </div>
                            </div>
                            <div class="col">
                                <label><strong>End Date</strong></label>
                                <div>
                                    <input type="date" required class="form-control" value="<?php echo date('Y-m-t', strtotime(date("Y-m-d"))) ?>" id="end_date" name="input[end_date]">
                                </div>
                            </div>
                            <div class="col-4">
                                <label>&nbsp;</label>
                                <div>
                                    <button type="submit" id="btn_generate" class="btn btn-warning btn-icon-text">
                                        <i class="ti-reload mr-1"></i> Generate
                                    </button>  
                                    <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries','Income-Statement-Report')">
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
                        <div class="table-responsive">
                            <center>
                            <h4 class="report-header"><span id="company_name_label"></span></h4>
                            <h6 class="report-header"><span id="company_address_label" style="word-wrap: break-word;"></span></h6>
                                <h5 class="report-header">Income Statement</h5>
                                <h6 class="report-header" id="report_date"></h6><br>
                            </center>
                            <center>
                            <table class="display table table-bordered" id="dt_entries" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Revenue</th>
                                        <th style="text-align:right;font-weight:bold;">+</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="padding-left: 100px;">Sales</td>
                                        <td style="text-align:right;"><span id="sales_total_label" class="label-item"></span></td>
                                    </tr>
                                    <tr>
                                        <td style="padding-left: 100px;">Sales Discount</td>
                                        <td style="text-align:right;">(-) <span id="discount_total_label" class="label-item"></span></td>
                                    </tr>
                                    <tr>
                                        <td style="padding-left: 100px;">Sales Return</td>
                                        <td style="text-align:right;">(-) <span id="sales_return_total_label" class="label-item"></span></td>
                                    </tr>
                                    <tr style="font-weight:bold;">
                                        <td style="text-align:right;">Subtotal</td>
                                        <td style="text-align:right;"><span id="revenue_total_label" class="label-item"></span></td>
                                    </tr>
                                </tbody>

                                <!-- <thead>
                                    <tr>
                                        <th>Cost</th>
                                        <th style="text-align:right;font-weight:bold;">-</th>
                                    </tr>
                                </thead> -->
                                <!-- <tbody>
                                    <tr>
                                        <td style="padding-left: 100px;">Purchases</td>
                                        <td style="text-align:right;"><span id="purchases_total_label" class="label-item"></span></td>
                                    </tr>
                                    <tr>
                                        <td style="padding-left: 100px;">Purchase Return</td>
                                        <td style="text-align:right;"><span id="pr_total_label" class="label-item"></span></td>
                                    </tr>
                                    <tr style="font-weight:bold;">
                                        <td style="text-align:right;">Subtotal</td>
                                        <td style="text-align:right;"><span id="cost_total_label" class="label-item"></span></td>
                                    </tr>
                                </tbody> -->
                                <tbody>
                                    <tr style="font-weight:bold;">
                                        <td>Operational Expense</td>
                                        <td style="text-align:right;"></td>
                                    </tr>
                                <tbody id="operating_list_label" class="label-item">

                                </tbody>
                                <tr style="font-weight:bold;">
                                    <td style="text-align:right;">Subtotal</td>
                                    <td style="text-align:right;"><span id="oe_total_label" class="label-item"></span></td>
                                </tr>


                                <tr style="font-weight:bold;">
                                    <td>Other Expense</td>
                                    <td style="text-align:right;"></td>
                                </tr>
                                <tbody id="other_list_label" class="label-item">

                                </tbody>
                                <tr style="font-weight:bold;">
                                    <td style="text-align:right;">Subtotal</td>
                                    <td style="text-align:right;"><span id="other_total_label" class="label-item"></span></td>
                                </tr>
                                
                                <tr style="font-weight:bold;">
                                    <td>Cost of Good Sold</td>
                                    <td style="text-align:right;font-size:15px;"><span id="cogs_total_label" class="label-item"></span></td>
                                </tr>

                                <tr style="font-weight:bold;">
                                    <td style="text-align:right;font-style: italic;font-size:15px;">Net Income</td>
                                    <td style="text-align:right;font-size:15px;"><span id="income_total_label" class="label-item"></span></td>
                                </tr>
                                </tbody>
                                <tfoot>
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


    function getReport() {
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();

        const d1 = new Date(start_date);
        let start = d1.toDateString().slice(4);

        const d2 = new Date(end_date);
        let end = d2.toDateString().slice(4);

        $("#report_date").html(start + " - " + end);

        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=" + route_settings.class_name + "&q=view",
            data: {
                input: {
                    start_date: start_date,
                    end_date: end_date
                }
            },
            success: function(data) {
                var jsonParse = JSON.parse(data);
                const json = jsonParse.data;

                $('.label-item').map(function() {
                    const id_name = this.id;
                    const new_id = id_name.replace('_label', '');
                    this.innerHTML = json[new_id];
                });
            }
        });
    }

    $(document).ready(function() {
        getReport();

        $("#company_name_label").html(company_profile.company_name);
        $("#company_address_label").html(company_profile.company_address);
    });
</script>