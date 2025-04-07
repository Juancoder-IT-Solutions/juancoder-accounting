<form method='POST' id='frm_privileges_submit' class="users">
    <div class="modal fade" id="modalPrivileges" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" style="margin-top: 10px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalPrivilegesLabel"><span class='fa fa-pen'></span> User Privileges</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="input[user_id]" id="priv_user_id">
                    <div class="row">
                        <div class="col-4">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <i class="ti ti-layout-grid2 menu-icon"></i>
                                        <span class="menu-title">Master Data</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="list-wrapper px-3">
                                <ul class="d-flex flex-column" id="master_data_column"></ul>
                            </div>
                        </div>
                        <div class="col-4">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <i class="ti ti-shopping-cart menu-icon"></i>
                                        <span class="menu-title">Transactions</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="list-wrapper px-3">
                                <ul class="d-flex flex-column" id="transaction_column"></ul>
                            </div>
                        </div>
                        <div class="col-4">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <i class="ti ti-write menu-icon"></i>
                                        <span class="menu-title">Reports</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="list-wrapper px-3">
                                <ul class="d-flex flex-column" id="report_column"></ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class='btn-group'>
                        <button type="submit" class="btn btn-primary btn-sm" id="btn_submit_priv">Submit</button>
                        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<style>
    .list-wrapper {
        max-height: 400px;
    }

    .modal .modal-dialog .modal-content .modal-body {
        padding: 18px 26px;
    }
</style>