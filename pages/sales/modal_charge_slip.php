 <style>
     .table thead th,
     .jsgrid .jsgrid-table thead th {
         border-top: 1px solid #ced4da;
         border-bottom-width: 1px;
         font-weight: 600;
         font-size: .875rem;
     }
 </style>
 <div class="modal fade bd-example-modal-lg" id="modalChargeSlip" aria-labelledby="myModalLabel">
     <div class="modal-dialog modal-lg" style="margin-top: 50px;" role="document">
         <div class="modal-content">
                 <div class="modal-header" style="display:block;">
                     <div class="row" style="font-size: small;">
                         <div class="col-sm-4">
                         <h4 class="modal-title" id="modalLabel"><span class='fa fa-print'></span> Charge Slip</h4>
                         </div>
                         <div class="col-sm-8" style="text-align: right;">
                             <button type="button" onclick="updateTerms()" class="btn btn-success ml-1">
                                 <i class="bx bx-check d-block d-sm-none"></i>
                                 <span class="d-none d-sm-block"><span class='ti ti-pencil'></span> Update Terms</span>
                             </button>
                             <button type="button" onclick="print_report('charge_slip_canvas')" class="btn btn-primary ml-1">
                                 <i class="bx bx-check d-block d-sm-none"></i>
                                 <span class="d-none d-sm-block"><span class='ti ti-printer'></span> Print</span>
                             </button>
                         </div>
                     </div>
                 </div>
             <div class="modal-body" style="padding: 15px;">
                 <div class="col-12" id="charge_slip_canvas">
                     <center>
                         <strong>
                             <h4 class="report-header"><span class="company_name_label"></span></h4>
                             <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                             <h5>CHARGE INVOICE</h5>
                         </strong>
                         <br>
                     </center>
                     <div class="row">
                         <div class="col-md-6">
                             <strong>CHARGE TO: </strong><span class="customer_name_span"></span><br>
                             <strong>ADDRESS: </strong><span class="customer_address_span"></span><br>
                             <strong>TIN: </strong><span class="customer_tin_span"></span><br>
                         </div>
                         <div class="col-md-6">
                             <strong>REFERENCE #: </strong><span class="reference_number_span"></span><br>
                             <strong>INVOICE DATE: </strong><span class="sales_date_span"></span><br>
                             <strong>TERMS (days): </strong><span class="terms_span"></span><br>
                             <strong>DUE DATE: </strong><span class="due_date_span"></span><br>
                         </div>
                     </div>
                     <br><br>
                     <div class="table-responsive">
                         <table class="table table-bordered">
                             <thead>
                                 <tr>
                                     <th>PRODUCT</th>
                                     <th>QUANTITY</th>
                                     <th>PRICE</th>
                                     <th>DISCOUNT</th>
                                     <th>AMOUNT</th>

                                 </tr>
                             </thead>
                             <tbody id="cs_details">
                             </tbody>
                             <tfoot>
                                 <tr>
                                     <td colspan="4" style="text-align: right;"><strong>TOTAL AMOUNT</strong></td>
                                     <td><strong><span class="total_dr"></span></strong></td>
                                 </tr>
                             </tfoot>
                         </table>
                     </div>
                     <br style="clear: both;" />
                     <p><strong>PROMISORY NOTE</strong></p>
                     <p>&emsp;&emsp;&emsp; The undersigned hereby promise to pay  <span class="company_name_label"></span> the above items purchased, the total amount of which is indicated above, for ____ month(s) from the date hereof at seven percent (7%) per month as liquidated damages. The demand to pay is hereby waived.</p>
                     <div class="row" style="padding-top: 30px;">
                         <div class="col-md-6"></div>
                         <div class="col-md-6">
                             <center><strong>CUSTOMER ACKNOWLEDGEMENT</strong></center>
                             <center>I received all merchandise as indicated above in complete and Good order.</center>

                             <div style="padding-top: 80px;">
                                 <center>
                                     <span style="text-decoration: overline;">
                                         &emsp;&emsp;SIGNATURE OVER PRINTED NAME&emsp;&emsp;</span>
                                     <span style="text-decoration: overline;padding-left: 30px;">
                                         &emsp;&emsp;DATE&emsp;&emsp;</span>
                                 </center>
                             </div>
                         </div>
                     </div>
                     <!-- style="position: absolute;bottom: 0;" -->
                     <div class="row" style="padding-top: 100px;"></div>
                     <div class="row div_footer" style="position: absolute;bottom: 0;width:100%;">
                         <div class="col-md-6">
                             <i>Prepared by:</i><span style="text-decoration: underline;">&emsp;<?= strtoupper($_SESSION['user']['fullname']); ?>&emsp;</span>
                             <br><br>
                             <i>Approved by:</i><span style="text-decoration: underline;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</span>
                         </div>
                         <div class="col-md-6">
                             <p style="text-align: center;"><i>Carried by:<span style="text-decoration: underline;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</span>
                                     Date: <span style="text-decoration: underline;">&emsp;&emsp;&emsp;&emsp;</span></i></p>
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
     function cs_details(id) {

         $.ajax({
             type: 'POST',
             url: "controllers/sql.php?c=" + route_settings.class_name + "&q=getPrintDetails",
             data: {
                 id: id
             },
             success: function(data) {
                 var json = JSON.parse(data);
                 var arr_count = json.data.length;
                 var i = 0;
                 while (i < arr_count) {
                     console.log(json.data[i]);
                     $("#cs_details").append('<tr>' +
                         '<td>' + json.data[i].product_name + '</td>' +
                         '<td>' + json.data[i].quantity + '</td>' +
                         '<td>' + json.data[i].price + '</td>' +
                         '<td>' + json.data[i].discount + '</td>' +
                         '<td>' + json.data[i].amount + '</td>' +
                         '</tr>');
                     i++;
                 }

             }
         });
     }

     function updateTerms(){
        $("#modalTerms").modal("show");
     }
 </script>