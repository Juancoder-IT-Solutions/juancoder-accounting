<?php
include 'core/config.php';

ini_set('date.timezone', 'UTC');
//error_reporting(E_ALL);
date_default_timezone_set('UTC');
$today = date('H:i:s');
$currentDate = date('Y-m-d H:i:s', strtotime($today) + 28800);
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Juancoder IT Solutions POS</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">

  <link rel="stylesheet" href="vendors/select2/select2.min.css">
  <link rel="stylesheet" href="vendors/select2-bootstrap-theme/select2-bootstrap.min.css">

  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <!-- <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css"> -->
  <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css">

  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/icon.png" />
  <!-- container-scroller -->
  <link rel="stylesheet" href="css/sweetalert.css">

  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="js/dataTables.select.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/dashboard.js"></script>
  <script src="js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->

  <script src="js/sweetalert.js"></script>


  <script src="vendors/select2/select2.min.js"></script>
  <style>
    .dataTables_filter input {
      height: 30px !important;
    }

    .dataTables_length select {
      height: 30px !important;
    }

    #dt_entries_2 tr td {
      padding: 6px;
      font-size: 14px;
    }

    .table-bordered {
      border: 0px !important;
    }

    table.dataTable thead .sorting_asc:after {
      content: none;
    }
  </style>
</head>

<body class="sidebar-dark">
  <?php if (!isset($_SESSION['user']['id'])) {
    require_once 'pages/authentication/index.php';
  } else {
    // sidebar-icon-only
  ?>
    <div class="container-scroller">
      <?php require 'components/navbar.php'; ?>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <?php //require 'components/settings.php'; 
        ?>
        <?php require 'components/sidebar.php'; ?>
        <!-- partial -->
        <div class="main-panel">
          <!-- routes -->
          <?php
          if (isset($_SESSION['branch_id']) && $_SESSION['branch_id'] > 0) {
            require 'routes/routes.php';
          } else {
            require 'no_branch.php';
          }
          ?>
          <!-- end routes -->
          <?php require 'components/footer.php'; ?>
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <script type='text/javascript'>
      <?php
      echo "var route_settings = " . $route_settings . ";\n";
      echo "var company_profile = " . $company_profile . ";\n";
      echo "var app_folder = '" . APP_FOLDER . "';\n";
      ?>
    </script>
    <script type="text/javascript">
      var modal_detail_status = 0;
      var current_branch_id = $("#pos_branch_id").val();

      $(document).ready(function() {
        // var branch_id = $("#pos_branch_id").val();

        getSelectOption('Branches', 'branch_id', 'branch_name', '', [], current_branch_id, 'Please Select Branch', '', '', current_branch_id);

        $(".select2").select2();

        $(".select2").css({
          "width": "100%"
        });
        checkPriceNotice();


        // getBranchesSession();
      });

      function AuthBranch() {
        var branch_id = $("#branch_id").val();
        var current_branch_id = localStorage.getItem("session_branch_id");
        
        if(branch_id != current_branch_id){
          localStorage.setItem("session_branch_id", branch_id);

          $.ajax({
            type: "POST",
            url: "controllers/sql.php?c=Branches&q=session_branch",
            data: {
              input: {
                branch_id: branch_id
              }
            },
            success: function(data) {
              var json = JSON.parse(data);
              $("#pos_branch_id").val(json.data);
              swal({
                    title: "Branch Change",
                    text: "Session branch updated!",
                    type: "success",
                    confirmButtonText: "Ok"
                }, function(isConfirm) {
                    if (isConfirm) {
                        location.reload();
                    }
                });
            }
          });
        }
      }

      window.addEventListener("storage", function(event) {
        if (event.key === "session_branch_id") {
            var newBranchId = event.newValue;

            if(newBranchId != current_branch_id){
              $("#branch_id").val(newBranchId).trigger("change");

              swal({
                title: "Branch Change",
                text: "Session branch updated!",
                type: "success",
                confirmButtonText: "Ok"
              },
              function(isConfirm) {
                if (isConfirm) {
                  location.reload();
                }
              });
            }
        }
      });

      function checkPriceNotice() {
        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=ProductPrice&q=runner",
          data: [],
          success: function(data) {
            var json = JSON.parse(data),
              text_data = '';
            if (json.data.length > 0) {
              for (let pNIndex = 0; pNIndex < json.data.length; pNIndex++) {
                const reference = json.data[pNIndex];
                text_data += reference + "\n";
              }
              swal("Price Notice!", text_data + "Price Notice(s) is Effective now!", "warning");
            }
          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });
      }

      function schema() {
        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=" + route_settings.class_name + "&q=schema",
          data: [],
          success: function(data) {
            var json = JSON.parse(data);
            console.log(json.data);
          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });
      }

      function success_add() {
        swal("Success!", "Successfully added entry!", "success");
      }

      function success_update() {
        swal("Success!", "Successfully updated entry!", "success");
      }

      function success_delete() {
        swal("Success!", "Successfully deleted entry!", "success");
      }

      function entry_already_exists() {
        swal("Cannot proceed!", "Entry already exists!", "warning");
      }

      function amount_is_greater() {
        swal("Cannot proceed!", "Amount is greater than balance!", "warning");
      }

      function quantity_is_greater() {
        swal("Cannot proceed!", "Quantity is greater than inventory quantity!", "warning");
      }


      function release_first() {
        swal("Cannot proceed!", "Save transaction first!", "warning");
      }

      function failed_query(data) {
        swal("Failed to execute query!", data, "warning");
        //alert('Something is wrong. Failed to execute query. Please try again.');
      }

      function logout() {
        swal({
            title: "Are you sure?",
            text: "Your session will expire!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Yes, sign me out!",
            cancelButtonText: "No, stay me in!",
            closeOnConfirm: false,
            closeOnCancel: true
          },
          function(isConfirm) {
            if (isConfirm) {

              $.ajax({
                type: "POST",
                url: "controllers/sql.php?c=Users&q=logout",
                success: function(data) {
                  window.location = "./";
                },
                error: function(jqXHR, textStatus, errorThrown) {
                  errorLogger('Error:', textStatus, errorThrown);
                }
              });
            }
          });
      }

      function checkAll(ele, ref) {
        var checkboxes = document.getElementsByClassName(ref);
        if (ele.checked) {
          for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].type == 'checkbox') {
              checkboxes[i].checked = true;
            }
          }
        } else {
          for (var i = 0; i < checkboxes.length; i++) {
            //console.log(i)
            if (checkboxes[i].type == 'checkbox') {
              checkboxes[i].checked = false;
            }
          }
        }
      }


      function addModal() {
        modal_detail_status = 0;
        $("#hidden_id").val(0);
        document.getElementById("frm_submit").reset();
        $('.select2').select2().trigger('change');

        var element = document.getElementById('reference_number');
        if (typeof(element) != 'undefined' && element != null) {
          generateReference(route_settings.class_name);
        }

        if (route_settings.class_name == "PurchaseReturn") {
          $("#po_reference_number").prop("readonly", false);
        } else if (route_settings.class_name == "SalesReturn") {
          $("#sales_reference_number").prop("readonly", false);
        }


        var now = new Date();
        var month = (now.getMonth() + 1);
        var day = now.getDate();
        if (month < 10)
          month = "0" + month;
        if (day < 10)
          day = "0" + day;
        var today = now.getFullYear() + '-' + month + '-' + day;
        $(".modal-body input[type='date']").val(today);


        $("#modalLabel").html("<span class='fa fa-pen'></span> Add Entry");
        $("#modalEntry").modal('show');
      }

      $("#frm_submit").submit(function(e) {
        e.preventDefault();

        $("#btn_submit").prop('disabled', true);
        $("#btn_submit").html("<span class='fa fa-spinner fa-spin'></span> Submitting ...");

        var hidden_id = $("#hidden_id").val();
        var q = hidden_id > 0 ? "edit" : "add";
        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=" + route_settings.class_name + "&q=" + q,
          data: $("#frm_submit").serialize(),
          success: function(data) {
            var json = JSON.parse(data);

            console.log(json.data);
            if (route_settings.has_detail == 1) {
              if (json.data > 0) {
                $("#modalEntry").modal('hide');

                hidden_id > 0 ? success_update() : success_add();
                hidden_id > 0 ? $("#modalEntry2").modal('hide') : '';
                hidden_id > 0 ? getEntryDetails2(hidden_id) : getEntryDetails2(json.data);
              } else if (json.data == -2) {
                entry_already_exists();
              } else if (json.data == 'conflict') {
                swal("Cannot proceed!", "Please check your effective dates!", "warning");
              } else {
                failed_query(json);
              }
            } else {
              if (json.data == 1) {
                hidden_id > 0 ? success_update() : success_add();
                $("#modalEntry").modal('hide');
              } else if (json.data == 2) {
                entry_already_exists();
              } else {
                failed_query(json);
              }
            }
            getEntries();
            $("#btn_submit").prop('disabled', false);
            $("#btn_submit").html("<span class='fa fa-check-circle'></span> Submit");
          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });
      });

      function getEntryDetails(id, is_det = 0) {
        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=" + route_settings.class_name + "&q=view",
          data: {
            input: {
              id: id
            }
          },
          success: function(data) {
            var jsonParse = JSON.parse(data);
            const json = jsonParse.data;

            $("#hidden_id").val(id);
            $('.input-item').map(function() {
              //console.log(this.id);
              const id_name = this.id;
              this.value = json[id_name];
            });

            $(".select2").select2().trigger('change');

            if (route_settings.class_name == "PurchaseReturn") {
              $("#po_reference_number").prop("readonly", true);
            } else if (route_settings.class_name == "SalesReturn") {
              $("#sales_reference_number").prop("readonly", true);
            } else if (route_settings.class_name == "Sales") {
              if (json['for_pick_up'] == 1) {
                $("#for_pick_up").prop("checked", true);
              } else {
                $("#for_pick_up").prop("checked", false);
              }
            } else if (route_settings.class_name == "Users") {
              if (json['user_category'] == "A") {
                $("#div_category").hide();
                $("#user_category").prop("required", false);
              } else {
                $("#div_category").show();
                $("#user_category").prop("required", true);
              }
            }
            $("#modalLabel").html("<span class='fa fa-pen'></span> Update Entry");
            $("#modalEntry").modal('show');
          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });

        if (is_det == 1) {
          modal_detail_status == 1 ? setTimeout(() => {
            $("#modalEntry2").modal('hide')
          }, 500) : '';
        } else {
          modal_detail_status = 0;
        }
      }

      function deleteEntry() {

        $("#btn_delete").prop('disabled', true);
        var count_checked = $("input[class='dt_id']:checked").length;

        if (count_checked > 0) {
          swal({
              title: "Are you sure?",
              text: "You will not be able to recover these entries!",
              type: "warning",
              showCancelButton: true,
              confirmButtonClass: "btn-danger",
              confirmButtonText: "Yes, delete it!",
              cancelButtonText: "No, cancel!",
              closeOnConfirm: false,
              closeOnCancel: false
            },
            function(isConfirm) {
              if (isConfirm) {
                var checkedValues = $("input[class='dt_id']:checked").map(function() {
                  return this.value;
                }).get();

                $.ajax({
                  type: "POST",
                  url: "controllers/sql.php?c=" + route_settings.class_name + "&q=remove",
                  data: {
                    input: {
                      ids: checkedValues
                    }
                  },
                  success: function(data) {
                    getEntries();
                    var json = JSON.parse(data);
                    console.log(json);
                    if (json.data == 1) {
                      success_delete();
                    } else {
                      failed_query(json);
                    }
                  },
                  error: function(jqXHR, textStatus, errorThrown) {
                    errorLogger('Error:', textStatus, errorThrown);
                  }
                });



              } else {
                swal("Cancelled", "Entries are safe :)", "error");
              }
            });
        } else {
          swal("Cannot proceed!", "Please select entries to delete!", "warning");
        }
        $("#btn_delete").prop('disabled', false);
      }

      function cancelEntry() {

        var count_checked = $("input[class='dt_id']:checked").length;

        if (count_checked > 0) {
          swal({
              title: "Are you sure?",
              text: "You will not be able to recover these entries!",
              type: "warning",
              showCancelButton: true,
              confirmButtonClass: "btn-danger",
              confirmButtonText: "Yes, delete it!",
              cancelButtonText: "No, cancel!",
              closeOnConfirm: false,
              closeOnCancel: false
            },
            function(isConfirm) {
              if (isConfirm) {
                var checkedValues = $("input[class='dt_id']:checked").map(function() {
                  return this.value;
                }).get();

                $.ajax({
                  type: "POST",
                  url: "controllers/sql.php?c=" + route_settings.class_name + "&q=cancel",
                  data: {
                    input: {
                      ids: checkedValues
                    }
                  },
                  success: function(data) {
                    getEntries();
                    var json = JSON.parse(data);
                    console.log(json);
                    if (json.data == 1) {
                      success_delete();
                    } else {
                      failed_query(json);
                    }
                  },
                  error: function(jqXHR, textStatus, errorThrown) {
                    errorLogger('Error:', textStatus, errorThrown);
                  }
                });

                $("#btn_cancel").prop('disabled', true);

              } else {
                swal("Cancelled", "Entries are safe :)", "error");
              }
            });
        } else {
          swal("Cannot proceed!", "Please select entries to cancel!", "warning");
        }
      }


      // MODULE WITH DETAILS LIKE SALES

      function getEntryDetails2(id) {
        $("#hidden_id_2").val(id);
        modal_detail_status = 1;
        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=" + route_settings.class_name + "&q=view",
          data: {
            input: {
              id: id
            }
          },
          success: function(data) {
            var jsonParse = JSON.parse(data);
            const json = jsonParse.data;

            if (json.payment_type == "H") {
              $("#div_label_check").show();
            } else {
              $("#div_label_check").hide();
            }

            if (route_settings.class_name == "Sales") {
              if (json['for_pick_up'] == 1) {
                $("#for_pick_up_label").show();
                $("#for_pick_up").prop("checked", true);
                for_pick_up = 1;
              } else {
                $("#for_pick_up_label").hide();
                $("#for_pick_up").prop("checked", false);
                for_pick_up = 0;
              }
            } else if (route_settings.class_name == "Deposit") {
              depositType(json['deposit_type']);
            } else if (route_settings.class_name == "StockTransfer") {
              $("#hidden_source_id").val(json.source_warehouse_id);
            } else if (route_settings.class_name == "JobOrder") {
              $("#hidden_warehouse_id").val(json.warehouse_id);
            }

            $('.label-item').map(function() {
              const id_name = this.id;
              const new_id = id_name.replace('_label', '');
              this.innerHTML = json[new_id];
            });

            var transaction_edit = document.getElementById("menu-edit-transaction");
            var transaction_delete_items = document.getElementById("menu-delete-selected-items");
            var transaction_finish = document.getElementById("menu-finish-transaction");
            var col_list = document.getElementById("col-list");
            var col_item = document.getElementById("col-item");

            if (json.status == 'F' || json.status == 'C' || json.status == 'R' || json.status == 'P') {
              transaction_edit.classList.add('disabled');
              (typeof(transaction_delete_items) != 'undefined' && transaction_delete_items != null) ? transaction_delete_items.classList.add('disabled'): '';
              transaction_finish.classList.add('disabled');

              $("#frm_release :input").prop("disabled", true);

              transaction_edit.setAttribute("onclick", "");
              (typeof(transaction_delete_items) != 'undefined' && transaction_delete_items != null) ? transaction_delete_items.setAttribute("onclick", ""): '';
              transaction_finish.setAttribute("onclick", "");

              (typeof(col_item) != 'undefined' && col_item != null) ? col_item.style.display = "none": '';
              (typeof(col_list) != 'undefined' && col_list != null) ? col_list.classList.remove('col-8'): '';
              (typeof(col_list) != 'undefined' && col_list != null) ? col_list.classList.add('col-12'): '';
            } else {
              transaction_edit.classList.remove('disabled');
              (typeof(transaction_delete_items) != 'undefined' && transaction_delete_items != null) ? transaction_delete_items.classList.remove('disabled'): '';
              transaction_finish.classList.remove('disabled');

              transaction_edit.setAttribute("onclick", "getEntryDetails(" + id + ",1)");
              (typeof(transaction_delete_items) != 'undefined' && transaction_delete_items != null) ? transaction_delete_items.setAttribute("onclick", "deleteEntry2()"): '';
              transaction_finish.setAttribute("onclick", "finishTransaction()");
              $("#frm_release :input").prop("disabled", false);


              (typeof(col_item) != 'undefined' && col_item != null) ? col_item.style.display = "block": '';
              (typeof(col_list) != 'undefined' && col_list != null) ? col_list.classList.remove('col-12'): '';
              (typeof(col_list) != 'undefined' && col_list != null) ? col_list.classList.add('col-8'): '';
            }
            setTimeout(function() {
              $("#product_barcode").focus();
            }, 500);
            getEntries2();
            $("#modalEntry2").modal('show');

          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });
      }

      $("#frm_submit_2").submit(function(e) {
        e.preventDefault();

        $("#btn_submit_2").prop('disabled', true);
        $("#btn_submit_2").html("<span class='fa fa-spinner fa-spin'></span> Submitting ...");

        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=" + route_settings.class_name + "&q=add_detail",
          data: $("#frm_submit_2").serialize(),
          success: function(data) {
            getEntries2();
            var json = JSON.parse(data);
            if (json.data == 1) {
              //success_add();
              document.getElementById("frm_submit_2").reset();
              $('.select2').select2().trigger('change');

              $("#product_barcode").focus();
            } else if (json.data == 2) {
              entry_already_exists();
            } else if (json.data == 3) {
              amount_is_greater();
            } else if (json.data == -3) {
              quantity_is_greater();
            } else if (json.data == 'PC-SAME-ITEM') {
              swal("Cannot proceed!", "Original product and converted should be different.", "warning");
            } else if (json.data == 'IA-ZERO') {
              swal("Cannot proceed!", "Inventory adjustment quantity must not equal to zero.", "warning");
            } else {
              failed_query(json);
              $("#modalEntry2").modal('hide');
            }
            $("#btn_submit_2").prop('disabled', false);
            $("#btn_submit_2").html("<span class='fa fa-check-circle'></span> Submit");
          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });
      });

      function deleteEntry2() {

        var count_checked = $("input[class='dt_id_2']:checked").length;

        if (count_checked > 0) {
          swal({
              title: "Are you sure?",
              text: "You will not be able to recover these entries!",
              type: "warning",
              showCancelButton: true,
              confirmButtonClass: "btn-danger",
              confirmButtonText: "Yes, delete it!",
              cancelButtonText: "No, cancel!",
              closeOnConfirm: false,
              closeOnCancel: false
            },
            function(isConfirm) {
              if (isConfirm) {
                var checkedValues = $("input[class='dt_id_2']:checked").map(function() {
                  return this.value;
                }).get();

                $.ajax({
                  type: "POST",
                  url: "controllers/sql.php?c=" + route_settings.class_name + "&q=remove_detail",
                  data: {
                    input: {
                      ids: checkedValues
                    }
                  },
                  success: function(data) {
                    getEntries2();
                    var json = JSON.parse(data);
                    console.log(json);
                    if (json.data == 1) {
                      success_delete();
                    } else {
                      failed_query(json);
                    }
                  },
                  error: function(jqXHR, textStatus, errorThrown) {
                    errorLogger('Error:', textStatus, errorThrown);
                  }
                });

                $("#btn_delete").prop('disabled', true);

              } else {
                swal("Cancelled", "Entries are safe :)", "error");
              }
            });
        } else {
          swal("Cannot proceed!", "Please select entries to delete!", "warning");
        }
      }

      function finishTransaction() {
        var id = $("#hidden_id_2").val();

        var count_checked = $("input[class='dt_id_2']").length;
        if (count_checked > 0) {
          swal({
              title: "Are you sure?",
              text: "This entries will be finished!",
              type: "warning",
              showCancelButton: true,
              confirmButtonClass: "btn-info",
              confirmButtonText: "Yes, finish it!",
              cancelButtonText: "No, cancel!",
              closeOnConfirm: false,
              closeOnCancel: false
            },
            function(isConfirm) {
              if (isConfirm) {

                $(".confirm").attr('disabled', 'disabled');
                $.ajax({
                  type: "POST",
                  url: "controllers/sql.php?c=" + route_settings.class_name + "&q=finish",
                  data: {
                    input: {
                      id: id
                    }
                  },
                  success: function(data) {
                    getEntries();
                    var json = JSON.parse(data);
                    if (json.data == 1) {
                      success_add();
                      $("#modalEntry2").modal('hide');
                      if (route_settings.class_name == "Sales") {
                        for_pick_up == 1 ? salesWithdrawal() : "";
                      }
                    } else if (json.data == -1) {
                      release_first();
                    } else {
                      failed_query(json);
                    }
                    // swal.enableConfirmButton();

                  },
                  error: function(jqXHR, textStatus, errorThrown) {
                    errorLogger('Error:', textStatus, errorThrown);
                  }
                });
              } else {
                swal("Cancelled", "Entries are safe :)", "error");
              }
            });
        } else {
          swal("Cannot proceed!", "No entries found!", "warning");
        }
      }
      // END MODULE
      function getSelectOption(class_name, primary_id, label, param = '', attributes = [], pre_value = '', pre_label = 'Please Select', sub_option = '', is_class = '', selected = 0) {

        //var fnc = (class_name == "SupplierPayment" || class_name == "CustomerPayment" || class_name == "Deposit" ? "show_ref" : "show");

        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=" + class_name + "&q=show",
          data: {
            input: {
              param: param
            }
          },
          success: function(data) {
            var json = JSON.parse(data);
            if (pre_value != "remove") {
              if (is_class == '') {
                $("#" + primary_id).html("<option value='" + pre_value + "'> &mdash; " + pre_label + " &mdash; </option>");
              } else {
                $("." + primary_id).html("<option value='" + pre_value + "'> &mdash; " + pre_label + " &mdash; </option>");
              }
            }

            for (list_index = 0; list_index < json.data.length; list_index++) {
              const list = json.data[list_index];
              var data_attributes = {};
              if (sub_option == 1) {
                data_attributes['value'] = list[primary_id.slice(0, -2)];
              } else {
                data_attributes['value'] = list[primary_id];
              }
              if (data_attributes['value'] == selected) {
                data_attributes['selected'] = true;
              }
              for (var attr_index in attributes) {
                const attr = attributes[attr_index];
                data_attributes[attr] = list[attr];
              }

              if (is_class == '') {
                $('#' + primary_id).append($("<option></option>").attr(data_attributes).text(list[label]));
              } else {
                $('.' + primary_id).append($("<option></option>").attr(data_attributes).text(list[label]));
              }
            }
          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });
      }


      function handleBarcodeScan() {
        var product_barcode = $("#product_barcode").val();
        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=Products&q=view_by_barcode",
          data: {
            input: {
              product_barcode: product_barcode
            }
          },
          success: function(data) {
            var json = JSON.parse(data);
            if (json.data && json.data.product_id) {
              $("#product_id").val(json.data.product_id).trigger('change');
              console.log("Product", json.data);
              if (route_settings.class_name == "InventoryAdjustment") {
                $("#quantity").focus();
              } else {
                $("#qty").focus();
              }
            } else {
              $("#product_id").val('').trigger('change');
              console.log("Product not found");
              $("#product_barcode").focus();
            }
          }
        });
      }


      function getSelectMutiID(class_name, primary_id, label, param = '', attributes = [], id) {

        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=" + class_name + "&q=show",
          data: {
            input: {
              param: param
            }
          },
          success: function(data) {
            var json = JSON.parse(data);
            $("#" + primary_id).html("<option value=''> &mdash; Please Select &mdash; </option>");
            for (list_index = 0; list_index < json.data.length; list_index++) {
              const list = json.data[list_index];
              var data_attributes = {};
              data_attributes['value'] = list[id];
              for (var attr_index in attributes) {
                const attr = attributes[attr_index];
                data_attributes[attr] = list[attr];
              }
              $('#' + primary_id).append($("<option></option>").attr(data_attributes).text(list[label]));
            }
          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });
      }

      function print_report(container) {
        var printContents = document.getElementById(container).innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();

        document.body.innerHTML = originalContents;

        location.reload();
      }


      function generateReference(class_name) {
        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=" + class_name + "&q=generate",
          data: [],
          success: function(data) {
            var json = JSON.parse(data);
            $("#reference_number").val(json.data);
          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });
      }

      function exportTableToExcel(el, tableID = 'dt_entries', filename = '') {

        $(el).prop('disabled', true);

        filename = filename ? filename + '.xls' : 'excel_data.xls';

        var htmls = "";
        var uri = 'data:application/vnd.ms-excel;base64,';
        var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>';
        var base64 = function(s) {
          return window.btoa(unescape(encodeURIComponent(s)))
        };

        var format = function(s, c) {
          return s.replace(/{(\w+)}/g, function(m, p) {
            return c[p];
          })
        };

        var table = document.getElementById(tableID).createCaption();

        var header_text = '';
        $('.report-header').map(function() {
          header_text += this.innerHTML + "<br>";
        });

        table.innerHTML = header_text + "<br>";

        htmls = $("#" + tableID).html();
        document.getElementById(tableID).deleteCaption();
        var ctx = {
          worksheet: 'Worksheet',
          table: htmls
        }


        var link = document.createElement("a");
        link.download = filename;
        link.href = uri + base64(format(template, ctx));
        link.click();

        myTimeout = setTimeout(function() {
          $(el).prop('disabled', false)
        }, 1000);
      }

      $("#frm_search").submit(function(e) {
        e.preventDefault();
        $(".content-wrapper").html('<div class="row">' +
          '<div class="col-md-12 grid-margin">' +
          '<div class="row">' +
          '<div class="col-12 col-xl-8 mb-4 mb-xl-0">' +
          '<h3 class="font-weight-bold">Search results for : <u>' + $("#navbar-search-input").val() + '</u></h3>' +
          '</div>' +
          '<div class="col-12 col-xl-4">' +
          '</div>' +
          '</div>' +
          '</div>' +
          '</div>' +
          '<div class="row" style="margin-bottom: 10px;">' +
          '<div class="col-md-12 card" style="margin-top:3px;border-bottom: 0px solid #aaa;">' +
          '<div class="card-body">' +
          '<table id="search_table" class="table table-bordered table-hover" style="margin-top:2px;">' +
          '<thead>' +
          '<tr>' +
          '<th style="border: 0px; padding: 0px;"></th>' +
          '</tr>' +
          '</thead>' +
          '<tbody id="search_result">' +
          '</tbody>' +
          '</table>' +
          '</div>' +
          '</div>' +
          '</div>');
        var search_result = '';
        $("#search_result").html("<center><h3><span class='fa fa-spinner fa-spin'></span> Loading data . . .</h3></center><br>");
        $.ajax({
          type: "POST",
          url: "controllers/sql.php?c=Search&q=finder",
          data: $("#frm_search").serialize(),
          success: function(data) {
            var res = JSON.parse(data);
            if (res.data.length > 0) {

              for (var i = 0; i < res.data.length; i++) {
                const items = res.data[i];
                search_result += '<tr style="background: transparent !important; color: #505050;">' +
                  '<td style="border-top: 1px solid #ddd; font-size: 12px;text-align:left;width: 100%;">' +
                  '<div class="row">' +
                  '<div class="col-9" style="margin-top: 10px;">' +
                  '<b><a href="#" style="font-size: 14px; color: #2e2e2e;">' + items.name + '</a></b>' +
                  '<span style="display:block"><p><span style="color: #1b69b6;"> ' + items.module + ' </span>' +
                  '</div>' +
                  '<div class="col-3" style="margin-top: 10px; vertical-align: baseline; display: inline-block;">' +
                  '<div class="btn-group pull-right">' +
                  '<a href="' + items.slug + '&search=' + $("#navbar-search-input").val() + '" class="btn btn-primary btn-sm btn-icon-split">' +
                  '<span class="icon text-white-50">' +
                  '<i class="fas fa-plus"></i>' +
                  '</span>' +
                  '<span class="text">View</span>' +
                  '</a>' +
                  '</div>' +
                  '</div>' +
                  '</div>' +
                  '</td>' +
                  '</tr>';
              }
            }
            $("#search_result").html(search_result);
            $('#search_table').dataTable({
              "paging": true,
              "bFilter": false,
              "bLengthChange": false,
              "bSort": false,
              "ordering": false
            });
          },
          error: function(jqXHR, textStatus, errorThrown) {
            errorLogger('Error:', textStatus, errorThrown);
          }
        });
      });

      function errorLogger(jqXHR, textStatus, errorThrown) {
        console.log('Error:', textStatus, errorThrown);
      }
    </script>
  <?php } ?>
</body>

</html>