<form method='POST' id='frm_terms'>
    <div class="modal fade" id="modalTerms" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="margin-top: 50px;"  role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Update Terms</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="hidden_id_terms" name="input[sales_id]">
                    <div class="form-group row">
                        <div class="col">
                            <label><strong>Terms (days)</strong></label>
                            <div>
                            <input type="number" min="1" class="form-control input-item" name="input[terms]" id="terms" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class='btn-group'>
                        <button type="submit" class="btn btn-primary" id="btn_terms_submit">Submit</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    $("#frm_terms").submit(function(e) {
        e.preventDefault();

        var id = $("#hidden_id_terms").val();

        $("#btn_terms_submit").prop('disabled', true);
        $("#btn_terms_submit").html("<span class='fa fa-spinner fa-spin'></span> Submitting ...");

        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=" + route_settings.class_name + "&q=update_terms",
          data: $("#frm_terms").serialize(),
          success: function(data) {
            var json = JSON.parse(data);
            if (json.data == 1) {
              success_update();
              chargeSlip(id)
              $("#modalTerms").modal('hide');
            } else {
              failed_query(json);
              $("#modalTerms").modal('hide');
            }
            $("#btn_terms_submit").prop('disabled', false);
            $("#btn_terms_submit").html("<span class='fa fa-check-circle'></span> Submit");
          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });
      });
</script>