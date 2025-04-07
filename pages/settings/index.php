<div class="content-wrapper">
    <div class="row">
        <div class="col-12 col-xl-12 mb-4 mb-xl-0">
            <h3 class="font-weight-bold">Settings</h3>
            <h6 class="font-weight-normal mb-3">Update company settings here.</h6>
        </div>
    </div>
    <br>
    <div class="col-12 col-xl-12 card shadow mb-4">
        <ul id="tabs" class="nav nav-tabs">
            <li class="nav-item"><a href="" data-target="#company-profile" data-toggle="tab" class="nav-link small text-uppercase active">Company Profile</a></li>
            <li class="nav-item"><a href="" data-target="#access-codes" data-toggle="tab" class="nav-link small text-uppercase">Access Codes</a></li>
            <li class="nav-item"><a href="" data-target="#backup" data-toggle="tab" class="nav-link small text-uppercase">Backup Database</a></li>
            <!-- <li class="nav-item"><a href="" data-target="#version-update" data-toggle="tab" class="nav-link small text-uppercase">Version Update</a></li> -->
        </ul>
        <br>
        <div id="tabsContent" class="tab-content">
            <div id="company-profile" class="tab-pane fade active show">

                <form class="forms-sample" id="frm_submit_profile">
                    <div class="row">
                        <div class="col-6">
                            <h4 class="card-title">Company Profile</h4>
                            <p class="card-description">
                                Set your company profile here.
                            </p>
                            <div class="form-group">
                                <label for="company_name">Company Name</label>
                                <textarea name="input[company_name]" class="form-control input-item" id="company_name"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company_address">Company Address</label>
                                <textarea name="input[company_address]" class="form-control input-item" id="company_address"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="print_header">Customize Header Text (POS Print)</label>
                                <textarea name="input[print_header]" class="form-control input-item" id="print_header"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="print_footer">Customize Footer Text (POS Print)</label>
                                <textarea name="input[print_footer]" class="form-control input-item" id="print_footer"></textarea>
                            </div>
                        </div>
                        <div class="col-6">
                            <p class="card-description">
                                Set your rewards points value.
                            </p>
                            <div class="form-group">
                                <label for="print_header">Amount for every one point e.g., <mark class="bg-success text-white">P 1000 = +1 point</mark></label>
                                <input type="number" name="input[rewards_point_factor]" class="form-control input-item" id="rewards_point_factor" required>
                            </div>
                            <hr>
                            <p class="card-description">
                                Set Warehouse Checking.
                            </p>
                            <div class="list-wrapper px-3" style="height: auto;overflow: hidden;">
                                <ul class="d-flex flex-column" id="report_column">
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox check-items" name="input[allows][]" id="has_warehouse_checker" value="has_warehouse_checker" type="checkbox">Enable Warehouse Personnel Checking<i class="input-helper"></i>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <hr>
                            <p class="card-description">
                                Set POS printer settings.
                            </p>
                            <div class="list-wrapper px-3" style="overflow: auto;">
                                <ul class="d-flex flex-column" id="report_column">
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox check-items" name="input[allows][]" id="duplicate_order_slip" value="duplicate_order_slip" type="checkbox">Allow Cashier's Copy in Order Slip<i class="input-helper"></i>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox check-items" name="input[allows][]" id="duplicate_withdrawal_slip" value="duplicate_withdrawal_slip" type="checkbox">Allow Cashier's Copy in Withdrawal Slip<i class="input-helper"></i>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox check-items" name="input[allows][]" id="duplicate_claim_slip" value="duplicate_claim_slip" type="checkbox">Allow Cashier's Copy in Claim Slip<i class="input-helper"></i>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox check-items" name="input[allows][]" id="duplicate_payment_slip" value="duplicate_payment_slip" type="checkbox">Allow Cashier's Copy in Payment Slip<i class="input-helper"></i>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2" id="btn_submit_2">Submit</button>
                </form>
            </div>

            <div id="access-codes" class="tab-pane fade">
                <form class="forms-sample" id="frm_submit">
                    <div class="col-12">
                        <h4 class="card-title">Access Codes</h4>
                        <p class="card-description">
                            Set access codes for each module.
                        </p>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <input type="hidden" id="hidden_id">
                            <div class="form-group">
                                <label for="module_discount">Discount</label>
                                <input name="input[module_discount]" type="password" class="form-control input-item" id="module_discount" placeholder="Discount Module">
                            </div>
                            <div class="form-group">
                                <label for="module_cancel">Cancel</label>
                                <input name="input[module_cancel]" type="password" class="form-control input-item" id="module_cancel" placeholder="Cancelling Module">
                            </div>
                            <div class="form-group">
                                <label for="module_delete">Delete</label>
                                <input name="input[module_delete]" type="password" class="form-control input-item" id="module_delete" placeholder="Delete Module">
                            </div>
                            <button type="submit" class="btn btn-primary mr-2" id="btn_submit">Submit</button>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="module_add_customer">Add Customer</label>
                                <input name="input[module_add_customer]" type="password" class="form-control input-item" id="module_add_customer" placeholder="Add Customer Module">
                            </div>
                            <div class="form-group">
                                <label for="module_change_payment_type">Change Payment Type</label>
                                <input name="input[module_change_payment_type]" type="password" class="form-control input-item" id="module_change_payment_type" placeholder="Cancelling Module">
                            </div>
                            <div class="form-group">
                                <label for="module_remove_online_payment">Remove Online Payment</label>
                                <input name="input[module_remove_online_payment]" type="password" class="form-control input-item" id="module_remove_online_payment" placeholder="Delete Module">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div id="backup" class="tab-pane fade">
                <div class="col-12">
                    <h4 class="card-title">Backup Database</h4>
                    <p class="card-description">
                        Backup your database for future reference.
                    </p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <button type="button" class="btn btn-primary mr-2" id="btn_backup" onclick="backupDatabase()">Backup Database</button>
                    </div>
                </div>
            </div>
            <!-- <div id="version-update" class="tab-pane fade">
                <div class="col-12">
                    <h4 class="card-title">Version Update</h4>
                    <p class="card-description">
                        Fetch latest version update.
                    </p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <button type="button" class="btn btn-primary mr-2" id="btn_pull" onclick="pullVersionControl()">Fetch latest version update</button>
                        <p id="output_pull"></p>
                    </div>
                </div>
            </div> -->
        </div>
    </div>

</div>
<script>
    getEntries();
    $("#frm_submit_profile").submit(function(e) {
        e.preventDefault();

        $("#btn_submit_2").prop('disabled', true);
        $("#btn_submit_2").html("<span class='fa fa-spinner fa-spin'></span> Submitting ...");

        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=Settings&q=addProfile",
            data: $("#frm_submit_profile").serialize(),
            success: function(data) {
                var json = JSON.parse(data);

                if (json.data == 1) {
                    success_update();
                } else {
                    failed_query(json);
                }

                $("#btn_submit_2").prop('disabled', false);
                $("#btn_submit_2").html("<span class='fa fa-check-circle'></span> Submit");
            }
        });
    });

    function getEntries() {
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=Settings&q=view",
            success: function(data) {
                var jsonParse = JSON.parse(data);
                const json = jsonParse.data;
                if (json != null) {

                    $('.input-item').map(function() {
                        const id_name = this.id;
                        this.value = json[id_name];
                    });

                    $('.check-items').map(function() {
                        if (json[this.id] == 1) {
                            this.checked = true;
                        }
                    });
                }
            }
        });
    }

    function pullVersionControl() {
        $("#btn_pull").prop("disabled", true);
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=Settings&q=version",
            success: function(data) {
                var jsonParse = JSON.parse(data);
                const json = jsonParse.data;
                $("#output_pull").html(json);
                $("#btn_pull").prop("disabled", false);
            }
        });
    }

    function backupDatabase() {
        $("#btn_backup").prop("disabled", true);
        $("#btn_backup").html("<span class='fa fa-spin fa-spinner'></span> Backuping database");
        $.ajax({
            url: "controllers/sql.php?c=Settings&q=backup",
            type: 'GET',
            success: function(response) {
                swal("Success!", "Successfully backed up database!", "success");
                // Handle the success response (e.g., display a success message, initiate download, etc.)
                $("#btn_backup").prop("disabled", false);
                $("#btn_backup").html("Backup Database");
            },
            error: function(xhr, status, error) {
                // Handle the error response
                swal("Error!", "Please contact your support!", "warning");
            }
        });
    }
</script>