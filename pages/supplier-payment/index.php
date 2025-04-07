<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Supplier Payment</h3>
                    <h6 class="font-weight-normal mb-3">Manage spplier payment here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-2 col-xl-2">
                            <label><strong>Start Date</strong></label>
                            <div>
                                <input type="date" required class="form-control form-control-sm" id="start_date" value="<?php echo date('Y-m-01', strtotime(date("Y-m-d"))); ?>" name="input[start_date]">
                            </div>
                        </div>
                        <div class="col-2 col-xl-2">
                            <label><strong>End Date</strong></label>
                            <div>
                                <input type="date" required class="form-control form-control-sm" id="end_date" value="<?php echo date('Y-m-t', strtotime(date("Y-m-d"))) ?>" name="input[end_date]">
                            </div>
                        </div>
                        <div class="col-8 col-xl-8">
                            <label>&nbsp;</label>
                            <div>
                                <button type="button" class="btn btn-warning btn-icon-text" onclick="getEntries()">
                                    <i class="ti-reload mr-1"></i> Generate Entry
                                </button>  
                                <button type="button" class="btn btn-primary btn-icon-text" onclick="addModal()">
                                    <i class="ti-plus mr-1"></i> Add Entry
                                </button>
                                <button type="button" class="btn btn-danger btn-icon-text" onclick="deleteEntry()" id="btn_delete">
                                    <i class="ti-trash mr-1"></i> Delete Entry
                                </button>
                                <button type="button" class="btn btn-secondary btn-icon-text" onclick="cancelEntry()">
                                    <i class="ti-close mr-1"></i> Cancel Entry
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="display expandable-table" id="dt_entries" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th><input type='checkbox' onchange="checkAll(this, 'dt_id')"></th>
                                    <th></th>
                                    <th>Date</th>
                                    <th>Reference</th>
                                    <th>Supplier</th>
                                    <th>Total</th>
                                    <th>Encoded by</th>
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
<?php include 'modal_supplier_payment.php' ?>
<?php include 'modal_print.php' ?>

<script type="text/javascript">
    function getEntries() {
        var  start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var param = "AND (payment_date >= '"+start_date+"' AND payment_date <= '"+end_date+"')";
        
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "order": [[ 3, 'desc' ]],
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data",
                "type": "POST",
                "data": {
                    input: {
                        param:param
                    }
                }
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' value=" + row.sp_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        var print_stat = row.status != "F" ? "display:none;" : "";
                        return "<center><button class='btn btn-primary btn-circle btn-sm' onclick='getDetails(" + row.sp_id + "," + row.supplier_id + ")'><span class='ti ti-list'></span></button><button style='"+print_stat+"' onclick='printRecord("+ row.sp_id +")' class='btn btn-secondary btn-circle btn-sm'><span class='ti ti-printer'></span></button></center>";
                    }
                },
                {
                    "data": "payment_date"
                },
                {
                    "data": "reference_number"
                },
                {
                    "data": "supplier"
                },
                {
                    "data": "total"
                },
                {
                    "data": "encoded_name"
                },
                {
                    "mRender": function(data, type, row) {
                        return row.status == 'F' ? "<span class='badge badge-success'>Finish</span>" : (row.status == 'C' ? "<span class='badge badge-warning'>Cancel</span>" : "<span class='badge badge-danger'>Saved</span>");
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
    
    function getDetails(id,supplier_id){
        $("#supplier_id").val(supplier_id);
        getEntryDetails2(id);
        getSelectOption('SupplierPayment', 'ref_id', 'reference',supplier_id);
    }

    function getReference(){
        var supplier_id = $("#supplier_id").val();
        getSelectOption('SupplierPayment', 'ref_id', 'reference',supplier_id);
        
    }

    function getEntries2() {
        var params = "sp_id = '" + $("#hidden_id_2").val() + "'";
        $("#dt_entries_2").DataTable().destroy();
        $("#dt_entries_2").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show_detail",
                "dataSrc": "data",
                "method": "POST",
                "data": {
                    input: {
                        param: params
                    }
                }
            },
            "columnDefs": [{
               // "targets": [2, 3, 4],
                "render": $.fn.dataTable.render.number(',', '.', 2, ''),
                "className": 'dt-body-right'
            }],
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
                    .column(2)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Total over this page
                pageTotal = api
                    .column(2, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(2).footer()).html(
                    "&#x20B1; " + this.fnSettings().fnFormatNumber(parseFloat(parseFloat(total).toFixed(2)))
                );
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' value=" + row.spd_id + " class='dt_id_2' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "data": "ref_id"
                },
                {
                    "data": "amount"
                },
            ]
        });
    }

    function getPayType(){
        var payment_type = $("#payment_type").val();

        if(payment_type == "H"){
            $("#div_check").show();
            $(".pay-check").prop('required',true);
        }else{
            $("#div_check").hide();
            $(".pay-check").prop('required',false);
        }
    }


    $(document).ready(function() {
        getEntries();
        getSelectOption('Suppliers', 'supplier_id', 'supplier_name');
        getSelectOption('Banks', 'bank_id', 'bank');
        
    });
</script>