<?php
$Users = new Users();
?>
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Welcome
                        <?= strtoupper($Users->name($_SESSION['accounting_user']['id'])); ?>
                    </h3>
                </div>
                <div class="col-12 col-xl-4">
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 grid-margin stretch-card">
            <div class="card tale-bg">
                <div class="card-body">
                    <p class="card-title mb-0">Top Expenses</p><br>
                    <table id="dt_entries" class="table table-borderless">
                        <thead>
                            <tr>
                                <th class="pl-0  pb-2 border-bottom">#</th>
                                <th class="pl-0  pb-2 border-bottom">Expenses</th>
                                <th class="border-bottom pb-2">Total</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-6 grid-margin transparent">
            <div class="row">
                <div class="col-md-6 mb-4 stretch-card transparent">
                    <div class="card card-tale">
                        <div class="card-body">
                            <p class="mb-4">Total Suppliers</p>
                            <p class="fs-30 mb-2"><?php $Suppliers = new Suppliers;
                                                    echo $Suppliers->total(); ?></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4 stretch-card transparent">
                    <div class="card card-dark-blue">
                        <div class="card-body">
                            <p class="mb-4">Total Employees</p>
                            <p class="fs-30 mb-2"><?php $Employees = new Employee;
                                                    echo $Employees->total(); ?></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
                    <div class="card card-light-blue">
                        <div class="card-body">
                            <p class="mb-4">Total Expense Category</p>
                            <p class="fs-30 mb-2"><?php $ExpenseCat = new ExpenseCategories;
                                                    echo $ExpenseCat->total(); ?></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 stretch-card transparent">
                    <div class="card card-light-danger">
                        <div class="card-body">
                            <p class="mb-4">Total of Expenses</p>
                            <p class="fs-30 mb-2"><?php $Expense = new Expense;
                                                    echo number_format($Expense->totalExpensesDays(30), 2); ?></p>
                            <p>(30 days)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <p class="card-title">Expense Report</p>
                    </div>
                    <p class="font-weight-500">
                        <?= date("Y") - 4; ?> -
                        <?= date("Y"); ?> Annual Expenses
                    </p>
                    <div id="pieChart-legend" class="chartjs-legend mt-4 mb-2"></div>
                    <canvas id="pieChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    if ($("#pieChart").length) {
        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=Expense&q=graph",
            success: function(data) {
                var res = JSON.parse(data);
                var pie_data = res.data;
                var areaData = {
                    labels: pie_data.labels,
                    datasets: pie_data.datasets
                };

                var areaOptions = {
                    plugins: {
                        filler: {
                            propagate: true
                        }
                    }
                }

                var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
                var pieChart = new Chart(pieChartCanvas, {
                    type: 'line',
                    data: areaData,
                    options: areaOptions
                });
            }
        });
    }

    function number_format(number, decimals, dec_point, thousands_sep) {
        // *     example: number_format(1234.56, 2, ',', ' ');
        // *     return: '1 234,56'
        number = (number + '').replace(',', '').replace(' ', '');
        var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
                var k = Math.pow(10, prec);
                return '' + Math.round(n * k) / k;
            };
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
    }

    function getEntries() {
        $("#dt_entries").DataTable().destroy();
        $("#dt_entries").DataTable({
            "processing": true,
            "searching": false,
            "paging": false,
            "ordering": false,
            "info": false,
            "ajax": {
                "url": "controllers/sql.php?c=Expense&q=top_expenses",
                "dataSrc": "data",
                "type": "POST"
            },
            "columns": [{
                    "data": "count"
                },
                {
                    "data": "expense_category"
                },
                {
                    "data": "amount",
                }
            ]
        });
    }
    $(document).ready(function() {
        getEntries();
    });
</script>