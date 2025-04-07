<div class="container-fluid page-body-wrapper full-page-wrapper">
    <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
            <div class="col-lg-4 mx-auto">
                <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                    <div class="brand-logo">
                        <center><img src="images/icon.png" alt="logo" style="width: 80px;"></center>
                    </div>
                    <center><h4>Hello! let's get started</h4>
                    <h6 class="font-weight-light">Sign in to continue.</h6></center>
                    <form class="pt-3" id="frm_submit">
                        <div class="form-group">
                            <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Username" name="input[username]">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password" name="input[password]">
                        </div>
                        <div class="mt-3">
                            <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" href="#" id="btn_submit">SIGN IN</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- content-wrapper ends -->
</div>
<script>
    $("#frm_submit").submit(function(e) {
        e.preventDefault();

        $("#btn_submit").prop('disabled', true);
        $("#btn_submit").html("<span class='fa fa-spinner fa-spin'></span> Checking account ...");

        $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=Users&q=login",
            data: $("#frm_submit").serialize(),
            success: function(data) {
                var res = JSON.parse(data);
                if (res.data.login == 'Yes') {
                    swal("Success!", "Successfully login!", "success");
                    location.reload();
                } else {
                    swal("Authentication!", "Username or password is incorrect!", "warning");
                    $("#btn_submit").prop('disabled', false);
                    $("#btn_submit").html("SIGN IN");
                }
            }
        });
    });
</script>