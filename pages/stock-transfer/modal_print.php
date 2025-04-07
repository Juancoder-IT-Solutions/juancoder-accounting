 <div class="modal fade bd-example-modal-lg" id="modalPrint" aria-labelledby="myModalLabel">
     <div class="modal-dialog  modal-lg" style="margin-top: 50px;" role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <h4 class="modal-title" id="modalLabel"><span class='fa fa-print'></span> Print Record</h4>
             </div>
             <div class="modal-body" style="padding: 15px;">
                 <input type="hidden" id="hidden_id_st" name="input[stock_transfer_id]">
                 <div class="col-12" id="print_canvas">
                     <center>
                         <strong>
                             <h4 class="report-header"><span class="company_name_label"></span></h4>
                             <h6 class="report-header"><span class="company_address_label" style="word-wrap: break-word;"></span></h6>
                             <h4>Stock Transfer</h4>
                         </strong>
                     </center>
                     <strong>Source Warehouse: </strong><span class="source_name_span"></span><br>
                     <strong>Destination Warehouse: </strong><span class="destination_name_span"></span><br>
                     <strong>Date: </strong><span class="stock_transfer_date_span"></span><br>
                     <strong>Remarks: </strong><span class="remarks_span"></span>
                     <div class="table-responsive" style="padding-top: 10px;">
                         <table class="table table-bordered mb-0" id="tbl_print_details">
                             <thead>
                                 <tr>
                                     <th>PRODUCT</th>
                                     <th>QUANTITY</th>
                                     <th>COST</th>
                                     <th>AMOUNT</th>

                                 </tr>
                             </thead>
                             <tbody id="tb_id">
                             </tbody>
                         </table>
                     </div>

                     <br><br>
                     <strong>Encoded By: </strong><span style="text-decoration: underline;" class="encoded_by_span"></span><br><br><br>
                     <strong>Prepared By: </strong><span style="text-decoration: underline;" class="prepared_by_span"></span><br>
                     <br style="clear: both;" />
                 </div>
             </div>
             <div class="modal-footer">
                 <button type="button" onclick="print_report('print_canvas')" class="btn btn-primary ml-1">
                     <i class="bx bx-check d-block d-sm-none"></i>
                     <span class="d-none d-sm-block"><span class='ti ti-printer'></span> Print</span>
                 </button>
             </div>
         </div>
     </div>
 </div>
 <script type="text/javascript">
     function printRecord(id) {
         $("#tb_id").html("");
         $("#modalPrint").modal('show');
         $.ajax({
             type: 'POST',
             url: "controllers/sql.php?c=" + route_settings.class_name + "&q=view",
             data: {
                 input: {
                     id: id
                 }
             },
             success: function(data) {
                 var jsonParse = JSON.parse(data);
                 const json = jsonParse.data;
                 $(".source_name_span").html(json.source_warehouse);
                 $(".destination_name_span").html(json.destination_warehouse);
                 $(".reference_number_span").html(json.reference_number);
                 $(".stock_transfer_date_span").html(json.stock_transfer_date);
                 $(".remarks_span").html(json.remarks);
                 $(".encoded_by_span").html(json.encoded_name);
                 $(".prepared_by_span").html(json.prepared_name);
                 

                 getPrintDetails(json.stock_transfer_id);
             }
         });
     }

     function getPrintDetails(id) {

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
                     $("#tb_id").append('<tr>' +
                         '<td>' + json.data[i].product_name + '</td>' +
                         '<td>' + json.data[i].qty + '</td>' +
                         '<td>' + json.data[i].cost + '</td>' +
                         '<td>' + json.data[i].amount + '</td>' +
                         '</tr>');
                     i++;
                 }
             }
         });
     }
 </script>