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
                    <h3 class="font-weight-bold">Price List Report</h3>
                    <h6 class="font-weight-normal mb-3">Generate price list here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <form id='frm_generate'>
                        <div class="form-group row">
                            <div class="col">
                                <label><strong>Account</strong></label>
                                <div>
                                    <select class="form-control form-control-sm select2" id="product_category_id" name="input[product_category_id]">
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
                                    <button type="button" class="btn btn-primary btn-icon-text" onclick="exportTableToExcel(this,'dt_entries','Price-List-Report')">
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
                            <h5 class="report-header">Price List Report</h5>
                            <h6 class="report-header" id="report_date"></h6>
                        </center>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dt_entries" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>BARCODE</th>
                                        <th>ITEM</th>
                                        <th style="text-align:right">COST</th>
                                        <th style="text-align:right">PRICE</th>
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
        var product_category_id = $("#product_category_id").val() * 1;

        var param = product_category_id > 0 ? "product_category_id = '" + product_category_id + "'" : "product_id > 0";
        param += " ORDER BY product_name ASC";


        const d2 = new Date();
        let report_date = d2.toDateString().slice(4);
        $("#report_date").html(report_date);

        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            // "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        param: param
                    }
                },
            },
            "columns": [{
                    "data": "count"
                },
                {
                    "data": "product_barcode"
                },
                {
                    "data": "product_name"
                },
                {
                    "data": "product_cost",
                    "className": "text-right"
                },
                {
                    "data": "product_price",
                    "className": "text-right"
                },
            ]
        });
    }


    $(document).ready(function() {
        getSelectOption('ProductCategories', 'product_category_id', 'product_category', '', [], -1, 'All');
        getReport();

        $("#company_name_label").html(company_profile.company_name);
        $("#company_address_label").html(company_profile.company_address);
    });
</script>