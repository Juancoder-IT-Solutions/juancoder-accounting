<?php
class CreditMemo extends Connection
{
    private $table = 'tbl_credit_memo';
    public $pk = 'cm_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_credit_memo_details';
    public $pk2 = 'cmd_id';
    public $fk_det = 'reference_id';

    public function add()
    {
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'memo_date'     => $this->inputs['memo_date'],
            'memo_type'     => $this->inputs['memo_type'],
            'account_id'    => $this->inputs['account_id'],
            'remarks'       => $this->inputs['remarks'],
            'encoded_by'    => $_SESSION['user']['id'],
            'date_added'    => $this->getCurrentDate()
        );
        return $this->insertIfNotExist($this->table, $form, '', 'Y');
    }

    public function add_detail()
    {
        $refID = $this->inputs['reference_id'];
        $PurchaseOrder = new PurchaseOrder;
        $BeginningBalance = new BeginningBalance;
        $Sales = new Sales;

        $trans = substr($refID, 0, 2);

        if ($trans == "PO") {
            $reference_id = $PurchaseOrder->pk_by_name($refID);
            $type = "PO";
        } else if ($trans == "BB") {
            $reference_id = $BeginningBalance->pk_by_name($refID);
            $type = "BB";
        } else {
            $reference_id = $Sales->pk_by_name($refID);
            $type = "DR";
        }

        $form = array(
            $this->pk => $this->inputs[$this->pk],
            $this->fk_det => $reference_id,
            'amount' => $this->inputs['amount'],
            'ref_type' => $type,
            'description' => $this->inputs['description'],

        );

        return $this->insert($this->table_detail, $form);
    }

    public function edit()
    {
        $form = array(
            'memo_date'             => $this->inputs['memo_date'],
            'remarks'               => $this->inputs['remarks'],
            'encoded_by'            => $_SESSION['user']['id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function view()
    {
        $Suppliers = new Suppliers;
        $Customers = new Customers;
        $Users = new Users;
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['account'] = $row['memo_type'] == "AP" ? $Suppliers->name($row['account_id']) : $Customers->name($row['account_id']);
        $row['encoded_name'] = $Users->getUser($row['encoded_by']);
        $row['po_type_name'] = $row['po_type'] == "C" ? "Cash" : "Charge";
        return $row;
    }

    public function rows($name = null)
    { 
        $Suppliers = new Suppliers;
        $Customers = new Customers;
        $Users = new Users;
        $name = $name == "" ? $this->inputs['id'] : $name;
        $result = $this->select($this->table, "*", "$this->name = '$name'");
        $row = $result->fetch_assoc();
        $row['account'] = $row['memo_type'] == "AP" ? $Suppliers->name($row['account_id']) : $Customers->name($row['account_id']);
        $row['encoded_name'] = $Users->getUser($row['encoded_by']);
        $row['po_type_name'] = $row['po_type'] == "C" ? "Cash" : "Charge";
        return $row;
    }

    public function show_detail()
    {
        $Sales = new Sales();
        $PurchaseOrder = new PurchaseOrder();
        $BeginningBalance = new BeginningBalance();
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            if ($row['ref_type'] == "PO") {
                $ref = $PurchaseOrder->name($row['reference_id']);
            } else if ($row['ref_type'] == "BB") {
                $ref = $BeginningBalance->name($row['reference_id']);
            } else {
                $ref = $Sales->name($row['reference_id']);
            }

            $row['amount'] = number_format($row['amount'], 2);
            $row['reference'] = $ref;
            $rows[] = $row;
        }
        return $rows;
    }

    public function show()
    {
        $Suppliers = new Suppliers;
        $Customers = new Customers;
        $Users = new Users;
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['total'] = $this->total($row['cm_id']);
            $row['account'] = $row['memo_type'] == "AP" ? $Suppliers->name($row['account_id']) : $Customers->name($row['account_id']);
            $row['encoded_name'] = $Users->getUser($row['encoded_by']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select("$this->table_detail as d LEFT JOIN $this->table as h ON h.cm_id=d.cm_id", "*, sum(amount) as total", "h.cm_id = '$primary_id' GROUP BY d.reference_id");
        while ($row = $result->fetch_array()) {
            if($row['memo_type'] == "AR"){
                if ($row['ref_type'] == "BB") {
                    $BeginningBalance = new BeginningBalance;
                    $bb_paid = $BeginningBalance->bb_balance_ar($row['reference_id']) - $row['amount'];
                    if ($bb_paid <= 0) {
                        $form_ = array(
                            'bb_paid_status' => 1,
                        );
                        $this->update('tbl_beginning_balance', $form_, "bb_id=" . $row['reference_id'] . " AND bb_module='AR'");
                    }
                } else {
                    $Sales = new Sales;
                    $dr_paid = $Sales->dr_balance($row['reference_id']) - $row['amount'];
                    if ($dr_paid <= 0) {
                        $form_ = array(
                            'paid_status'   => 1,
                        );
                        $this->update('tbl_sales', $form_, 'sales_id=' . $row['reference_id'] . '');
                    }
                }
            }
        }

        $form = array(
            'status' => 'F',
        );
        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }

    public function generate()
    {
        return 'CM-' . date('YmdHis');
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }


    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }


    function ref_checker()
    {
        $refID = $this->inputs['reference_id'];
        $primary_id = $this->inputs['id'];

        $result = $this->select($this->table, "memo_type,account_id", "$this->pk = '$primary_id'");
        $row = $result->fetch_array();

        $trans = substr($refID, 0, 2);

        if ($row['memo_type'] == "AP") {
            if ($trans == "PO") {
                $PurchaseOrder = new PurchaseOrder;
                $reference_id = $PurchaseOrder->pk_name($refID, $row['account_id']);
            } else if ($trans == "BB") {
                $BeginningBalance = new BeginningBalance;
                $reference_id = $BeginningBalance->pk_name($refID, $row['account_id']);
            }
        } else {
            $Sales = new Sales;
            $reference_id = $Sales->pk_name($refID, $row['account_id']);
        }

        return $reference_id * 1;
    }

    public function pk_by_name($name = null)
    {
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name' AND status='F'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function get_row($primary_id, $field)
    {
        $result = $this->select($this->table, $field, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$field];
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function total($primary_id)
    {
        $result = $this->select($this->table_detail, 'sum(amount)', "$this->pk = '$primary_id'");
        if ($result->num_rows > 0) {
            $total = $result->fetch_array();
            return $total[0];
        } else {
            return "";
        }
    }

    public function getHeader()
    {
        $Supplier = new Suppliers;
        $Customers = new Customers;
        $id = $_POST['id'];
        $result = $this->select($this->table, "*", "$this->pk='$id'");
        $row = $result->fetch_assoc();
        $row['memo_date'] = date("F j, Y", strtotime($row['memo_date']));
        $row['account'] = $row['memo_type'] == "AP" ? $Supplier->name($row['account_id']) : $Customers->name($row['account_id']);
        $rows[] = $row;
        return $rows;
    }
    public function getPrintDetails()
    {
        $id = $_POST['id'];
        $PurchaseOrder = new PurchaseOrder;
        $BeginningBalance = new BeginningBalance;
        $Sales = new Sales;
        $rows = array();
        $result = $this->select($this->table_detail, "*", "$this->pk='$id'");
        while ($row = $result->fetch_assoc()) {
            if ($row['ref_type'] == "PO") {
                $ref = $PurchaseOrder->name($row['reference_id']);
            } else if ($row['ref_type'] == "BB") {
                $ref = $BeginningBalance->name($row['reference_id']);
            } else {
                $ref = $Sales->name($row['reference_id']);
            }
            $row['reference'] = $ref;
            $rows[] = $row;
        }
        return $rows;
    }

    public function totalPurchaseDays($days)
    {
        $fetchData = $this->select('tbl_purchase_order_details as d, tbl_purchase_order as h', "sum(supplier_price*qty) as total", "h.po_id = d.po_id AND h.po_date BETWEEN NOW() - INTERVAL $days DAY AND NOW() AND h.status='F'");
        $row = $fetchData->fetch_assoc();

        $result_pr = $this->select("tbl_purchase_return as pr, tbl_purchase_return_details as prd", "SUM(prd.qty_return*prd.supplier_price) as total", "pr.pr_id=prd.pr_id AND pr.status='F' AND pr.return_date BETWEEN NOW() - INTERVAL $days DAY AND NOW()");
        $row_sr = $result_pr->fetch_assoc();

        return ($row['total'] - $row_sr['total']) == 0 ? 0 : ($row['total'] - $row_sr['total']);
    }

    public function schema()
    {
        if (DEVELOPMENT) {
            $default['date_added'] = $this->metadata('date_added', 'datetime', '', 'NOT NULL', 'CURRENT_TIMESTAMP');
            $default['date_last_modified'] = $this->metadata('date_last_modified', 'datetime', '', 'NOT NULL', '', 'ON UPDATE CURRENT_TIMESTAMP');
            $default['encoded_by'] = $this->metadata('encoded_by', 'int', 11);


            // TABLE HEADER
            $tables[] = array(
                'name'      => $this->table,
                'primary'   => $this->pk,
                'fields' => array(
                    $this->metadata($this->pk, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                    $this->metadata($this->name, 'varchar', 75),
                    $this->metadata('memo_date', 'date'),
                    $this->metadata('memo_type', 'varchar', 3),
                    $this->metadata('account_id', 'int', 11),
                    $this->metadata('remarks', 'varchar', 250),
                    $this->metadata('status', 'varchar', 1, 'NOT NULL', "'S'", '', "'S = Saved; F = Finish'"),
                    $default['encoded_by'],
                    $default['date_added'],
                    $default['date_last_modified']
                )
            );

            // TABLE DETAILS
            $tables[] = array(
                'name'      => $this->table_detail,
                'primary'   => $this->pk2,
                'fields' => array(
                    $this->metadata($this->pk2, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                    $this->metadata($this->pk, 'int', 11),
                    $this->metadata($this->fk_det, 'int', 11),
                    $this->metadata('ref_type', 'varchar', 3),
                    $this->metadata('amount', 'decimal', '12,3'),
                    $this->metadata('description', 'varchar', '250')
                )
            );

            return $this->schemaCreator($tables);
        }
    }
}
