<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-12 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Price Notice </h3>
                    <h6 class="font-weight-normal mb-3">Manage Price notice here</h6>
                </div>
            </div>

            <div class="col-12 col-xl-12 card shadow mb-4">
               <div class="pull-right py-3">
                    <!-- <a href="#" class="btn btn-primary btn-sm btn-icon-split" onclick="addModal()">
                        <span class="icon text-white-50">
                            <i class="fas fa-plus"></i>
                        </span>
                        <span class="text">Add Entry</span>
                    </a>
                    <a href="#" class="btn btn-danger btn-sm btn-icon-split" onclick='deleteEntry()' id='btn_delete'>
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
                                    <th>Reference</th>
                                    <th>Effective Date</th>
                                    <th>Effective Status</th>
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
<?php include 'modal_price.php' ?>
<script type="text/javascript">
    function getEntries() {
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "ajax": {
                "url": "controllers/sql.php?c=" + route_settings.class_name + "&q=show",
                "dataSrc": "data"
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return row.status == 'F' ? '' : "<input type='checkbox' value=" + row.price_id + " class='dt_id' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return "<center><button class='btn btn-primary btn-circle' onclick='getEntryDetails2(" + row.price_id + ")' style='padding:15px;height:45px;'><span class='ti ti-menu'></span></button></center>";
                    }
                },
                {
                    "data": "reference_number"
                },
                {
                    "data": "effective_date"
                },
                {
                    "mRender": function(data, type, row) {
                        return row.status == 'F' ? (row.effective_status == 1 ? "<span class='badge badge-success'>Price Updated</span>" : "<span class='badge badge-danger'>Pending Notice</span>") : "";
                    }
                },
                {
                    "mRender": function(data, type, row) {
                        return row.status == 'F' ? "<span class='badge badge-success'>Finish</span>" : "<span class='badge badge-danger'>Saved</span>";
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

    function getEntries2() {
        var params = "price_id = '" + $("#hidden_id_2").val() + "'";
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
                "targets": [2, 3],
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
                    .column(3)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Total over this page
                pageTotal = api
                    .column(3, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Update footer
                $(api.column(3).footer()).html(
                    "&#x20B1; " + this.fnSettings().fnFormatNumber(parseFloat(total).toFixed(2))
                );
            },
            "columns": [{
                    "mRender": function(data, type, row) {
                        return "<input type='checkbox' value=" + row.price_detail_id + " class='dt_id_2' style='position: initial; opacity:1;'>";
                    }
                },
                {
                    "data": "product"
                },
                {
                    "data": "old_price"
                },
                {
                    "data": "price"
                },
            ]
        });
    }

    function changeProduct() {
        var optionSelected = $("#product_id").find('option:selected').attr('product_price');
        $("#price").val(optionSelected);
    }

    $(document).ready(function() {
        schema();
        getEntries();
        getSelectOption('Products', 'product_id', 'product_name', "product_id > 0 ORDER BY product_name ASC", ['product_price']);
    });
</script>