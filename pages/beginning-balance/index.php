<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Beginning Balance</h3>
                    <h6 class="font-weight-normal mb-3">Manage beginning balance here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="pull-right py-3">
                        <!-- <a href="#" class="btn btn-primary btn-sm btn-icon-split" onclick="addModal()">
                            <span class="icon text-white-50">
                                <i class="fas fa-plus"></i>
                            </span>
                            <span class="text">Add Entry</span>
                        </a> -->

                        <!-- <a href="#" class="btn btn-danger btn-sm btn-icon-split" onclick='deleteEntry()' id='btn_delete'>
                            <span class="icon text-white-50">
                                <i class="fas fa-trash"></i>
                            </span>
                            <span class="text">Delete Entry</span>
                        </a> -->

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
                                    <th>Date</th>
                                    <th>Type</th>
                                    <th>Reference</th>
                                    <th>Account</th>
                                    <th>Encoded by</th>
                                    <th>Amount</th>
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
<?php require_once 'modal_beginning_balance.php'; ?>
<script type="text/javascript">

    function getEntries() {
        var branch_id = "<?=$_SESSION['accounting_branch_id']?>"
        var param = "branch_id = '"+branch_id+"'";
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "order": [[ 3, 'desc' ]],
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data",
                "type": "POST",
                "data": {
                    input:{
                        param:param
                    }
                }
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' value=" + row.bb_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return "<center><button class='btn btn-primary btn-circle' onclick='getEntryDetails(" + row.bb_id + ");' style='padding:15px;height:45px;'><span class='ti-pencil'></span></button></center>";
                    }
                },
                {
                    "data": "bb_date"
                },
                {
                    "data": "type"
                },
                {
                    "data": "reference_number"
                },
                {
                    "data": "account"
                },
                {
                    "data": "encoded_name"
                },
                {
                    "data": "bb_amount"
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

    function checkModule(){
        $('#bb_ref_id').empty();
        var bb_module = $("#bb_module").val();
        if(bb_module == "INV"){
            $("#div_inv").show();
            $("#bb_qty").prop("required", true);
            getSelectMutiID('Products', 'bb_ref_id', 'product_name', '', [], 'product_id');
        }else{
            if(bb_module == "AP"){
                getSelectMutiID('Suppliers', 'bb_ref_id', 'supplier_name', '', [], 'supplier_id');
            }else{
                getSelectMutiID('Customers', 'bb_ref_id', 'customer_name', '', [], 'customer_id');
            }

            $("#div_inv").hide();
            $("#bb_qty").prop("required", false);
        }
    }

    $(document).ready(function() {
        getEntries();
   
        getSelectOption('Warehouses','warehouse_id','warehouse_name','branch_id = "'+ current_branch_id +'"')
    });
</script>