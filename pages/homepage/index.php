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
        <div class="col-md-12 grid-margin transparent">
            <div class="row">
                <div class="col-md-6 mb-4 stretch-card transparent">
                    <div class="card card-tale">
                        <div class="card-body">
                            <?php
                            $Sales = new Sales();
                            ?>
                            <p class="mb-4">Total Sales</p>
                            <p class="fs-30 mb-2">
                                <?= number_format($Sales->totalSalesDays(30), 2); ?>
                            </p>
                            <p>(30 days)</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4 stretch-card transparent">
                    <?php
                    $Expense = new Expense();
                    ?>
                    <div class="card card-light-danger">
                        <div class="card-body">
                            <p class="mb-4">Total Expenses</p>
                            <p class="fs-30 mb-2">
                                <?= number_format($Expense->totalExpensesDays(30), 2); ?>
                            </p>
                            <p>(30 days)</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
                    <div class="card card-light-blue">
                        <?php
                        $PurchaseOrder = new PurchaseOrder();
                        ?>
                        <div class="card-body">
                            <p class="mb-4">Total Purchases</p>
                            <p class="fs-30 mb-2">
                                <?= number_format($PurchaseOrder->totalPurchaseDays(30), 2); ?>
                            </p>
                            <p>(30 days)</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 stretch-card transparent">
                    <div class="card card-dark-blue">
                        <?php
                        $Customers = new Customers();
                        ?>
                        <div class="card-body">
                            <p class="mb-4">Number of Customers</p>
                            <p class="fs-30 mb-2">
                                <?= number_format($Customers->totalCustomers()); ?>
                            </p>
                            <p>(Total number)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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

    <div class="row">
        <div class="col-md-7 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <p class="card-title">Sales Report</p>
                    </div>
                    <p class="font-weight-500">
                        <?= date("Y"); ?> Monthly Sales Graph
                    </p>
                    <div id="sales-legend" class="chartjs-legend mt-4 mb-2"></div>
                    <canvas id="sales-chart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-5 stretch-card grid-margin">
            <div class="card">
                <div class="card-body">
                    <p class="card-title mb-0">Top Products</p>
                    <div class="table-responsive">
                        <table id="dt_entries" class="table table-borderless">
                            <thead>
                                <tr>
                                    <th class="pl-0  pb-2 border-bottom">Products</th>
                                    <th class="border-bottom pb-2">Qty Sold</th>
                                    <th class="border-bottom pb-2">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- <tr>
                                    <td class="pl-0">Kentucky</td>
                                    <td>
                                        <p class="mb-0"><span class="font-weight-bold mr-2">65</span></p>
                                    </td>
                                    <td class="text-muted">65</td>
                                </tr>
                                <tr>
                                    <td class="pl-0">Ohio</td>
                                    <td>
                                        <p class="mb-0"><span class="font-weight-bold mr-2">54</span></p>
                                    </td>
                                    <td class="text-muted">51</td>
                                </tr>
                                <tr>
                                    <td class="pl-0">Nevada</td>
                                    <td>
                                        <p class="mb-0"><span class="font-weight-bold mr-2">22</span></p>
                                    </td>
                                    <td class="text-muted">32</td> -->
                                </tr>
                            </tbody>
                        </table>
                    </div>
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
    // if ($("#sales-chart").length) {
    //     //$.getJSON("controllers/sql.php?c=Sales&q=graph", function(data) {
    //     $.ajax({
    //         type: "POST",
    //         url: "controllers/sql.php?c=Sales&q=graph",
    //         success: function(data) {
    //             //var jsonParse = JSON.parse(data);
    //             // var data_ = jsonParse.data;
    //             var jsonParse = JSON.parse(data);
    //             console.log(jsonParse.data);
    //             var monthly_data = jsonParse.data;
    //             var SalesChartCanvas = $("#sales-chart").get(0).getContext("2d");
    //             var SalesChart = new Chart(SalesChartCanvas, {
    //                 type: 'bar',
    //                 data: {
    //                     labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"],
    //                     datasets: [{
    //                         label: 'Total Sales',
    //                         data: monthly_data,
    //                         backgroundColor: '#98BDFF'
    //                     }]
    //                 },
    //                 options: {
    //                     cornerRadius: 5,
    //                     responsive: true,
    //                     maintainAspectRatio: true,
    //                     layout: {
    //                         padding: {
    //                             left: 0,
    //                             right: 0,
    //                             top: 20,
    //                             bottom: 0
    //                         }
    //                     },
    //                     scales: {
    //                         yAxes: [{
    //                             display: true,
    //                             gridLines: {
    //                                 display: true,
    //                                 drawBorder: false,
    //                                 color: "#F2F2F2"
    //                             },
    //                             ticks: {
    //                                 display: true,
    //                                 min: 0,
    //                                 callback: function(value, index, values) {
    //                                     return number_format(value);
    //                                 },
    //                                 autoSkip: true,
    //                                 maxTicksLimit: 10,
    //                                 fontColor: "#6C7383"
    //                             }
    //                         }],
    //                         xAxes: [{
    //                             stacked: false,
    //                             ticks: {
    //                                 beginAtZero: true,
    //                                 fontColor: "#6C7383"
    //                             },
    //                             gridLines: {
    //                                 color: "rgba(0, 0, 0, 0)",
    //                                 display: false
    //                             },
    //                             barPercentage: 1
    //                         }]
    //                     },
    //                     legend: {
    //                         display: false
    //                     },
    //                     elements: {
    //                         point: {
    //                             radius: 0
    //                         }
    //                     }
    //                 },
    //             });
    //             document.getElementById('sales-legend').innerHTML = SalesChart.generateLegend();

    //         }
    //     });
    // }

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
                "url": "controllers/sql.php?c=Sales&q=top_products",
                "dataSrc": "data",
                "type": "POST"
            },
            "columns": [{
                "data": "product"
            },
            {
                "data": "qty"
            },
            {
                "data": "total"
            }
            ]
        });
    }
    $(document).ready(function() {
        getEntries();
    });
</script>