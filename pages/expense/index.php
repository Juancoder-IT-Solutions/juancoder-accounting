<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Expense</h3>
                    <h6 class="font-weight-normal mb-3">Manage expenses here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-3 col-xl-3">
                            <label><strong>Start Date</strong></label>
                            <div>
                                <input type="date" required class="form-control form-control-sm" id="start_date"
                                    value="<?php echo date('Y-m-01', strtotime(date(" Y-m-d"))); ?>"
                                name="input[start_date]">
                            </div>
                        </div>
                        <div class="col-3 col-xl-3">
                            <label><strong>End Date</strong></label>
                            <div>
                                <input type="date" required class="form-control form-control-sm" id="end_date"
                                    value="<?php echo date('Y-m-t', strtotime(date(" Y-m-d"))) ?>"
                                name="input[end_date]">
                            </div>
                        </div>
                        <div class="col-6 col-xl-6">
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
                                    <th>Date</th>
                                    <th>Reference</th>
                                    <th>Total</th>
                                    <th>Supplier</th>
                                    <th>Status</th>
                                    <th>Encoded by</th>
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
<?php include 'modal_expense.php' ?>
<?php include 'modal_print.php' ?>
<script type="text/javascript">
    function getEntries() {
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var param = "(expense_date >= '" + start_date + "' AND expense_date <= '" + end_date + "')";

        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "order": [[3, 'desc']],
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data",
                "type": "POST",
                "data": {
                    input: {
                        param: param
                    }
                }
            },
            "columns": [{
                "mRender": function(data, type, row) {
                    return row.status == 'F' ? '' : "<input type='checkbox' value=" + row.expense_id + " class='dt_id' style='position: initial; opacity:1;'>";
                }
            },
            {
                "mRender": function(data, type, row) {
                    return "<div style='display:flex;align-items:center'><button class='btn btn-primary btn-circle mr-1' onclick='getEntryDetails2(" + row.expense_id + ")' style='padding:15px';height='45px;'><span class='ti ti-menu'></span></button><button onclick='printRecord("+ row.expense_id +")' class='btn btn-warning btn-circle' style='padding:15px';height='45px;'><span class='ti ti-printer'></span></button></div>";
                }                
            },
            {
                "data": "expense_date"
            },
            {
                "data": "reference_number"
            },
            {
                "data": "supplier_name"
            },
            {
                "data": "total"
            },
            {
                "mRender": function(data, type, row) {
                    return row.status == 'F' ? "<span class='badge badge-success'>Finish</span>" : "<span class='badge badge-warning'>Saved</span>";
                }
            },
            {
                "data": "encoded_by"
            },
            {
                "data": "date_added"
            },
            {
                "data": "date_last_modified"
            },
            ]
        });
    }

    function getEntries2() {
        var params = "expense_id = '" + $("#hidden_id_2").val() + "'";
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
                "targets": [2, 3, 4],
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
                    .column(5)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Total over this page
                pageTotal = api
                    .column(5, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(5).footer()).html(
                    "&#x20B1; " + this.fnSettings().fnFormatNumber(parseFloat(parseFloat(total).toFixed(2)))
                );
            },
            "columns": [{
                "mRender": function(data, type, row) {
                    return "<input type='checkbox' value=" + row.expense_detail_id + " class='dt_id_2' style='position: initial; opacity:1;'>";
                }
            },
            {
                "data": "expense_category"
            },
            {
                "data": "supplier"
            },
            {
                "data": "invoice_no"
            },
            {
                "data": "description"
            },
            {
                "data": "amount"
            },
            ]
        });
    }


    function fetchProductsByCategory() {
        var product_category_id = $("#product_category_id").val();

        getSelectOption('Products', 'product_id', 'product_name', "product_category_id = '" + product_category_id + "'", ['product_price']);
    }

    function changeProduct() {
        var optionSelected = $("#product_id").find('option:selected').attr('product_price');
        $("#price").val(optionSelected);
    }

    $(document).ready(function() {
        getEntries();
        getSelectOption('ExpenseCategories', 'expense_category_id', 'expense_category');
        getSelectOption('Suppliers', 'supplier_id', 'supplier_name');

        getSelectOption('ChartOfAccounts', 'chart_id', 'chart_name');
    });
</script>