<div class="modal fade bd-example-modal-lg" id="modalRelease" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="margin-top: 50px;" role="document">
        <div class="modal-content">
            <div class="modal-header" style="display:block;">
                <div class="row" style="font-size: small;">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-8">
                        <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-dismiss="modal" style="font-size: small;"><i class='ti ti-close'></i> Close</a>
                            </li>
                            <!--<li class="nav-item">
                                <a class="nav-link disabled" href="#">Disabled</a>
                            </li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-body" style="padding: 15px;">
                <div class="row">
                    <div class="col-12">
                    <form method='POST' id='frm_release'>
                        <input type="hidden" id="hidden_id_3" name="input[sales_id]">
                        <div class="table-responsive">
                            <table class="display expandable-table" id="dt_release" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Remaining Qty</th>
                                        <th>Release Qty</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                        <hr>
                        <button type="submit" class="btn btn-success" id="btn_save_release" style="float: right;"><i class="ti ti-check"></i> Release</button>
                    </form>
                    </div>
                </div>
            </div>
            <!--        <div class="modal-footer">
                <div class='btn-group'>
                    <button type="button" class="btn btn-primary btn-sm" id="btn_finish">Finish</button>
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div> -->
        </div>
    </div>
</div>