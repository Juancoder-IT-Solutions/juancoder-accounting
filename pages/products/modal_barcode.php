<div class="modal fade" id="modalBarcode" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" style="margin-top: 10px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalLabel"><span class='fa fa-pen'></span> Generate Barcode</h4>
            </div>
            <div class="modal-body" style="padding: 20px 26px;">
                <input type="hidden" id="hidden_barcode_id" name="input[product_id]">
                <div class="form-group row">
                    <div class="col-3">
                        <label><strong>Quantiy</strong></label>
                        <div>
                            <input type="number" class="form-control input-item" name="input[barcode_qty]" id="barcode_qty" min="0" autocomplete="off" value="30" onkeyup="generateBarcode()" required>
                        </div>
                    </div>
                </div>
                <div class='row' id='barcode'>
                </div>
            </div>
            <div class="modal-footer">
                <div class='btn-group'>
                    <button type="button" onclick="print_report('barcode')" class="btn btn-primary" id="btn_print">Print</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>