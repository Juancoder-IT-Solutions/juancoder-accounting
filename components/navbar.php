<!-- partial:partials/_navbar.html -->
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="./" style="margin-top: 15px;margin-left: 25px;"><img style="height: 100px;" src="images/logo-green.png" class="mr-2" alt="logo" /></a>
        <a class="navbar-brand brand-logo-mini" href="./"><img src="images/logo-green.png" alt="logo" /></a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
            <li class="nav-item nav-search d-none d-lg-block">
                <form method="POST" id="frm_search">
                    <div class="input-group">
                        <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                            <span class="input-group-text" id="search">
                                <i class="icon-search"></i>
                            </span>
                        </div>
                        <input type="text" minlength="5" required name="input[words]" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
                    </div>
                </form>
            </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item dropdown">
                <!-- <select class="form-control select2" name="input[branch_id]" id="session_branch_id" required>
                </select> -->
                <select class="form-control" id="branch_id" name="input[branch_id]" style="width: 250px;" onchange="AuthBranch()"></select>
                <input type="hidden" id="pos_branch_id" value="<?= $_SESSION['branch_id']; ?>">
            </li>
            <li class="nav-item nav-profile dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                    <span class="icon-head mx-0"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                    <a class="dropdown-item" href="./profile">
                        <i class="ti-user text-primary"></i>
                        Profile
                    </a>
                    <a class="dropdown-item" href="./settings">
                        <i class="ti-settings text-primary"></i>
                        Settings
                    </a>
                    <a href="#" onclick="logout()" class="dropdown-item">
                        <i class="ti-power-off text-primary"></i>
                        Logout
                    </a>
                </div>
            </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="icon-menu"></span>
        </button>
    </div>
</nav>