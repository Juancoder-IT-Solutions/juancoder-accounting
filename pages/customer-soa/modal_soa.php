 <style>
     .table thead th,
     .jsgrid .jsgrid-table thead th {
         border-top: 1px solid #ced4da;
         border-bottom-width: 1px;
         font-weight: 600;
         font-size: .875rem;
     }
 </style>
 <div class="modal fade bd-example-modal-lg" id="modalSoaSlip" aria-labelledby="myModalLabel">
     <div class="modal-dialog modal-lg" style="margin-top: 50px;" role="document">
         <div class="modal-content">
             <div class="modal-header" style="display:block;">
                 <div class="row" style="font-size: small;">
                     <div class="col-sm-4">
                         <h4 class="modal-title" id="modalLabel"><span class='fa fa-print'></span> STATEMENT OF ACCOUNT</h4>
                     </div>
                     <div class="col-sm-8" style="text-align: right;">
                         <button type="button" onclick="print_report('charge_slip_canvas')" class="btn btn-primary ml-1 btn-sm">
                             <i class="bx bx-check d-block d-sm-none"></i>
                             <span class="d-none d-sm-block"><span class='ti ti-printer'></span> Print</span>
                         </button>
                     </div>
                 </div>
             </div>
             <div class="modal-body" style="padding: 15px;">
                 <div class="col-12" id="charge_slip_canvas">
                     <div class="row">
                         <div class="col-sm-6">
                             <h4><b>STATEMENT OF ACCOUNT</b></h4>
                         </div>
                         <div class="col-sm-6" style="text-align: right;">
                             <h4 class="report-header"><span class="company_name_label"></span></h4>
                             <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                         </div>

                     </div>
                     <div class="row">
                         <div class="col-md-6">
                             <strong>Bill To: </strong><span class="customer_name_span"></span><br>
                             <strong>Address: </strong><span class="customer_address_span"></span><br>
                             <strong>Term: </strong><span class="customer_terms_span"></span><br>
                         </div>
                     </div>
                     <br>
                     <div class="row">
                         <div class="col-sm-12" style="text-align: right;">
                             <h6 class="report-header">AS FOR THE DATE OF <span class="today_span"></span></h6>
                         </div>
                         <div class="col-sm-12" style="padding:10px;border: 1px dashed;border-radius: 8px;">
                             <div class="row">
                                 <div class="col-sm-6">
                                     <h5>Account Summary</h5>
                                     <br>
                                     <h4>Total: <strong><span class="total"></span></strong></h4>
                                     <h6>Amount in words: <span class="amount_to_word"></span></h6>
                                 </div>
                                 <div class="col-sm-6">
                                     <table class="table table-bordered" style="font-size:8px;margin-top: 20px;" id="dt_entries" width="100%" cellspacing="0">
                                         <thead>
                                             <tr>
                                                 <th style="text-align:center;font-size: 10px;">1 to 15 days</th>
                                                 <th style="text-align:center;font-size: 10px;">16 to 30 days</th>
                                                 <th style="text-align:center;font-size: 10px;">31 to 60 days</th>
                                                 <th style="text-align:center;font-size: 10px;">61 days Above</th>
                                             </tr>
                                         </thead>
                                         <tbody style="font-size: 10px;text-align:right;" id="aging_details">
                                         </tbody>
                                     </table>
                                 </div>
                             </div>
                         </div>

                         <div class="col-md-12" style="padding:10px;margin-top: 20px;">
                             <div class="table-responsive">
                                 <table class="table table-bordered">
                                     <thead>
                                         <tr>
                                             <th>Transaction Date</th>
                                             <th>Due</th>
                                             <th>Reference</th>
                                             <th>Remarks</th>
                                             <th>Amount</th>
                                             <th>Payments</th>
                                             <th>Interest</th>
                                             <th>Balance</th>

                                         </tr>
                                     </thead>
                                     <tbody id="cs_details">
                                     </tbody>
                                     <tfoot>
                                         <tr>
                                             <td colspan="4" style="text-align: right;"><strong>TOTAL AMOUNT DUE FOR THIS BILLING:</strong></td>
                                             <td><strong><span class="total_dr"></span></strong></td>
                                             <td><strong><span class="total_payment"></span></strong></td>
                                             <td><strong><span class="total_interest"></span></strong></td>
                                             <td><strong><span class="total"></span></strong></td>
                                         </tr>
                                     </tfoot>
                                 </table>
                             </div>
                         </div>
                         1.) If the above figures do not agree with your record, please inform us immediately.

                     </div>
                     <div class="row" style="padding-top: 100px;"></div>

                     <div class="div_footer" style="position: absolute; bottom: 0; width: 100%;">
                         <div class="row">
                             <div class="left-column">
                                 <i>Prepared by:</i><span style="text-decoration: underline;">&emsp;<?= strtoupper($_SESSION['user']['fullname']); ?>&emsp;</span>
                                 <br><br>
                                 <i>Counter Check by:</i><span style="text-decoration: underline;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</span>
                             </div>
                             <div class="right-column" style="margin-left: 70px;">
                                 <b>Received all original invoices for processing of payments</b><br><br>

                                 <!-- Signature and Date group -->
                                 <div style="display: flex; align-items: center;">
                                     <!-- Signature over printed name -->
                                     <div style="flex-grow: 1;">
                                         <hr style="margin-top: 20px; margin-bottom: 5px; border-top: 2px solid #424242; width: 100%;">
                                         <center>Signature over printed name</center>
                                     </div>

                                     <!-- Date -->
                                     <div style="width: 30%;">
                                         <hr style="margin-top: 20px; margin-bottom: 5px; border-top: 2px solid #424242; width: 80%;">
                                         <center>Date</center>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="modal-footer">

             </div>
         </div>
     </div>
 </div>
 <script type="text/javascript">
     function unpaid_details(customer_id, customer_terms) {

        const formatter = new Intl.NumberFormat('en-US', {
            //style: 'currency',
            //currency: 'PHP',
            minimumFractionDigits: 2, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
            // maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
        });

         $.ajax({
             type: 'POST',
             url: "controllers/sql.php?c=" + route_settings.class_name + "&q=show_unpaid",
             data: {
                 input: {
                     customer_id: customer_id,
                     customer_terms: customer_terms
                 }
             },
             success: function(data) {
                var json = JSON.parse(data);
                var arr_count = json.data.length;
                var i = 0;
                var totalPayment = 0;
                var totalDr = 0;

                while (i < arr_count) {
                    //var amount = parseFloat(json.data[i].debit.replace(/[^0-9.-]+/g, "")); // Remove non-numeric characters
                    //var payment = parseFloat(json.data[i].credit.replace(/[^0-9.-]+/g, "")); // Remove non-numeric characters

                    var amount = parseFloat(json.data[i].debit);
                    var payment = parseFloat(json.data[i].credit);

                    $("#cs_details").append('<tr>' +
                        '<td>' + json.data[i].transaction_date + '</td>' +
                        '<td>' + json.data[i].due_date + '</td>' +
                        '<td>' + json.data[i].reference_number + '</td>' +
                        '<td>' + json.data[i].remarks + '</td>' +
                        '<td>' + json.data[i].label_debit + '</td>' +
                        '<td>' + json.data[i].label_credit + '</td>' +
                        '<td></td>' +
                        '<td>' + json.data[i].label_balance + '</td>' +
                        '</tr>');

                    // Update totalPayment and totalDr
                    totalPayment += payment;
                    totalDr += amount;

                    i++;
                }

                 // Display totalPayment and totalDr in the footer
                 $(".total_payment").text(formatter.format(totalPayment));
                 $(".total_dr").text(formatter.format(totalDr));
             }
         });
     }

     function soa_aging(customer_id) {
         $.ajax({
             type: 'POST',
             url: "controllers/sql.php?c=ReceivableAging&q=soa_aging",
             data: {
                 input: {
                     customer_id: customer_id
                 }
             },
             success: function(data) {
                 var json = JSON.parse(data);
                 var total_day1 = json.data.total_day1;
                 var total_day2 = json.data.total_day2;
                 var total_day3 = json.data.total_day3;
                 var total_day4 = json.data.total_day4;

                 console.log(total_day1, total_day2, total_day3, total_day4);

                 $('#aging_details').html(
                    '<tr>' +
                    '<td style="font-size:10px;">' + total_day1 + '</td>' +
                    '<td style="font-size:10px;">' + total_day2 + '</td>' +
                    '<td style="font-size:10px;">' + total_day3 + '</td>' +
                    '<td style="font-size:10px;">' + total_day4 + '</td>' +
                    '</tr>'
                 );

             }
         });
     }
 </script>