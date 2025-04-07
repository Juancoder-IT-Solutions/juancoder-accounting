<?php
class CustomerPayment extends Connection
{
    private $table = 'tbl_customer_payment';
    public $pk = 'cp_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_customer_payment_details';
    public $pk2 = 'cpd_id';
    public $fk_det = 'ref_id';

    public $module_name = "Customer Payment";
    public $inputs = [];
    public $searchable = ['reference_number','remarks','check_number','check_bank'];
    public $uri = "customer-payment";

    public function add()
    {
        $branch_id = $this->getBranch();
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'branch_id'     => isset($this->inputs['branch_id']) ? $this->inputs['branch_id'] : $branch_id,
            'customer_id'   => $this->inputs['customer_id'],
            //'branch_id'     => $this->getBranch(),
            'payment_type'  => $this->inputs['payment_type'],
            'payment_date'  => $this->inputs['payment_date'],
            'check_date'    => $this->inputs['check_date'],
            'check_number'  => $this->inputs['check_number'],
            'check_bank'    => $this->inputs['check_bank'],
            'payment_option_id'     => $this->inputs['payment_option_id'],
            'encoded_by'            => isset($this->inputs['encoded_by']) ? $this->inputs['encoded_by'] :  $_SESSION['user']['id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        $result = $this->insertIfNotExist($this->table, $form, '', 'Y');
        Logs::storeCrud($this->module_name, 'c', abs($result), $this->inputs[$this->name]);
        return $result;
    }

    public function edit()
    {
        $form = array(
            'payment_type'          => $this->inputs['payment_type'],
            'payment_date'          => $this->inputs['payment_date'],
            'remarks'               => $this->inputs['remarks'],
            'encoded_by'            => $_SESSION['user']['id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        $result = $this->updateIfNotExist($this->table, $form);
        Logs::storeCrud($this->module_name, 'u', abs($result), $this->inputs[$this->name]);
        return $result;
    }

    public function show()
    {
        $Customers = new Customers;
        $Users = new Users;
        $branch_id = $this->getBranch();
        $param = "branch_id = '$branch_id'";
        $param .= isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['customer'] = $Customers->name($row['customer_id']);
            $row['total'] = number_format($this->total($row['cp_id']), 2);
            $row['encoded_name'] = $Users->getUser($row['encoded_by']);
            $row['date_last_modified'] = date('Y-m-d H:i:s', strtotime($row['date_last_modified'] . ' + 8 hours'));
            $rows[] = $row;
        }
        return $rows;
    }

    public function view($primary_id = null)
    {
        $Customers = new Customers;
        $primary_id = $primary_id == "" ? $this->inputs['id'] : $primary_id;
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['customer'] = $Customers->name($row['customer_id']);
        $row['payment_type'] = $row['payment_type'];
        $row['paymenttype'] = ($row['payment_type'] == "C" ? "Cash" : ($row['payment_type'] == "H" ? "Check" : "Online Payment"));
        return $row;
    }

    public function rows($name = null)
    {
        $Customers = new Customers;
        $name = $name == "" ? $this->inputs['id'] : $name;
        $result = $this->select($this->table, "*", "$this->name = '$name'");
        $row = $result->fetch_assoc();
        $row['customer'] = $Customers->name($row['customer_id']);
        $row['payment_type'] = $row['payment_type'];
        $row['paymenttype'] = ($row['payment_type'] == "C" ? "Cash" : ($row['payment_type'] == "H" ? "Check" : "Online Payment"));
        return $row;
    }
    
    public function show_ref()
    {
        $Sales = new Sales;
        $BeginningBalance = new BeginningBalance;
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();

        $result = $this->select("tbl_sales", "reference_number", "customer_id='$param' AND status='F' AND paid_status='0' AND sales_type='H' UNION ALL SELECT reference_number FROM tbl_beginning_balance WHERE bb_ref_id='$param' AND bb_module='AR' AND bb_paid_status= 0");

        while ($row = $result->fetch_assoc()) {
            $trans = substr($row['reference_number'], 0, 2);
            if ($trans == "BB") {
                
                $bb_id = $BeginningBalance->pk_by_name($row['reference_number']);
                $row['reference'] = $row['reference_number'] . " (₱" . number_format($BeginningBalance->bb_balance_ar($bb_id), 2) . ")";
                $row['ref_id'] = "BB-" . $bb_id;
                $rows[] = $row;
            } else {
                $sales_id = $Sales->pk_by_name($row['reference_number']);
                $bal = $Sales->dr_balance($sales_id);
                if ($bal > 0) {
                    $row['reference'] = $row['reference_number'] . " (₱" . number_format($bal, 2) . ")";
                    $row['ref_id'] = "DR-" . $sales_id;
                    $rows[] = $row;
                }
            }
        }
        return $rows;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        $result = $this->select($this->table_detail, "ref_id,type", "$this->pk IN($ids)");
        while ($row = $result->fetch_assoc()) {
            if ($row['type'] == "BB") {
                $form_ = array(
                    'bb_paid_status'   => '0',
                );
                $this->update('tbl_beginning_balance', $form_, "bb_id = '$row[ref_id]' AND bb_module = 'AR'");
                
            } else {
                $form_ = array(
                    'paid_status'   => '0',
                );
                $this->update('tbl_sales', $form_, "sales_id = '$row[ref_id]'");
            }

            Logs::storeCrud($this->module_name, 'd', 1, $row['ref_id']);
        }

        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function generate()
    {
        return 'CP-' . date('ymdHis');
    }

    public function finish()
    {

        $primary_id = $this->inputs['id'];

        $result = $this->select($this->table_detail, "ref_id, type, sum(amount) as total", "$this->pk = '$primary_id' GROUP BY ref_id,type");
        while ($row = $result->fetch_array()) {
            if ($row['type'] == "BB") {
                
                $BeginningBalance = new BeginningBalance;
                $bb_paid = $BeginningBalance->bb_balance_ar($row['ref_id']) - ($row['total'] + $this->total_paid($primary_id, 'BB'));
                if ($bb_paid <= 0) {
                    $form_ = array(
                        'bb_paid_status' => 1,
                    );
                    $this->update('tbl_beginning_balance', $form_, "bb_id=" . $row['ref_id'] . " AND bb_module='AR'");
                }
            } else {
                $Sales = new Sales;
                $dr_paid = $Sales->dr_balance($row['ref_id']) - ($row['total'] + $this->total_paid($primary_id, 'DR'));
                if ($dr_paid <= 0) {
                    $form_ = array(
                        'paid_status'   => 1,
                    );
                    $this->update('tbl_sales', $form_, 'sales_id=' . $row['ref_id'] . '');
                }
            }
        }

        $form = array('status' => 'F');
        $res =  $this->update($this->table, $form, "$this->pk = '$primary_id'");
        Logs::storeCrud($this->module_name, 'f', $res, $this->name($primary_id));
        return $res;
    }

    public function pk_by_name($name = null)
    {
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function reference($primary_id)
    {
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row['reference_number'] . " (Amount: " . $this->total($primary_id) . ")";
    }

    public function add_detail()
    {
        $primary_id = $this->inputs[$this->pk];
        $fk_det     = substr($this->inputs[$this->fk_det], 3);
        $type = substr($this->inputs[$this->fk_det], 0, 2);

        if ($type == "BB") {
            $BeginningBalance = new BeginningBalance;
            $balance = ($BeginningBalance->total($fk_det)) - (($this->inputs['amount']) + ($this->total_saved($primary_id, $fk_det, 'BB')) + $this->total_paid($fk_det, 'BB'));
        } else {
            $Sales = new Sales;
            $balance = ($Sales->total($fk_det)) - (($this->inputs['amount']) + ($this->total_saved($primary_id, $fk_det, 'DR')) + $this->total_paid($fk_det, 'DR'));
        }

        if ($balance < 0) {
            return 3;
        } else {
            $form = array(
                $this->pk => $this->inputs[$this->pk],
                $this->fk_det => $fk_det,
                'type' => $type,
                'amount' => $this->inputs['amount']
            );

            return $this->insert($this->table_detail, $form);
        }
    }

    public function show_detail()
    {
        $Sales = new Sales();
        $BeginningBalance = new BeginningBalance();
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['ref_id'] = $row['type'] == "BB" ? $BeginningBalance->name($row['ref_id']) : $Sales->name($row['ref_id']);
            $row['amount'] = number_format($row['amount'], 2);
            $rows[] = $row;
        }
        return $rows;
    }

    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function total($primary_id)
    {
        $result = $this->select($this->table_detail, 'sum(amount)', "$this->pk = '$primary_id'");
        $row = $result->fetch_array();
        return $row[0];
    }

    public function total_paid($ref_id, $type)
    {
        $result = $this->select('tbl_customer_payment as h, tbl_customer_payment_details as d', 'sum(d.amount)', "d.ref_id = '$ref_id' AND h.status='F' AND h.cp_id=d.cp_id AND d.type='$type'");
        $row = $result->fetch_array();
        return $row[0];
    }

    public function total_per_sales($primary_id, $sales_id)
    {
        $result = $this->select($this->table_detail, 'sum(amount)', "$this->pk = '$primary_id' AND sales_id = '$sales_id'");
        $row = $result->fetch_array();
        return $row[0];
    }

    public function dataRow($primary_id, $field)
    {
        $result = $this->select($this->table, $field, "$this->pk = '$primary_id'");
        if ($result->num_rows > 0) {
            $row = $result->fetch_array();
            return $row[$field];
        } else {
            return "";
        }
    }

    public function cancel()
    {
        $ids = implode(",", $this->inputs['ids']);

        $result = $this->select($this->table_detail, "ref_id,type", "$this->pk IN($ids)");
        while ($row = $result->fetch_assoc()) {
            if ($row['type'] == "DR") {
                $form_ = array(
                    'paid_status'   => '0',
                );
                $this->update('tbl_sales', $form_, "sales_id = '$row[ref_id]'");
            } else {
                $form_ = array(
                    'bb_paid_status'   => '0',
                );
                $this->update('tbl_beginning_balance', $form_, "bb_id = '$row[ref_id]' AND bb_module = 'AR'");
            }
        }

        $form = array(
            'status'   => 'C',
        );

        return $this->update($this->table, $form, "$this->pk IN($ids)");
    }


    public function addPaymentPOS()
    {

        if($this->inputs['payment_option_id'] > 0){
            $branch_id = $this->inputs['branch_id'];
            $amount = $this->inputs['amount'] * 1;
            $totalPayable = $this->inputs['total_payment_amount'] * 1;
            $amount_paid = $this->getTotalPaymentPOS() * 1;
    
            if (($amount + $amount_paid) <= $totalPayable) {
                $Sales = new Sales;
                $this->inputs['payment_date'] = $this->getCurrentDate();
                $this->inputs['remarks'] = $this->inputs['other_payment_reference'];
                $this->inputs['payment_type'] = "O";
                $this->inputs['check_date'] = "";
                $this->inputs['check_number'] = "";
                $this->inputs['check_bank'] = "";
    
                $primary_id = $this->add();
                $this->inputs[$this->pk] = $primary_id;
                $sales_num = $this->inputs['sales_num'];
                $param = "reference_number = '$sales_num'";
                $this->inputs[$this->fk_det] = $Sales->getID($param);
                // return $this->add_detail();
    
                $form = array(
                    $this->pk => $this->inputs[$this->pk],
                    $this->fk_det => $this->inputs[$this->fk_det],
                    'amount' => $this->inputs['amount'],
                    'type' => 'DR'
                );
    
                return $this->insert($this->table_detail, $form);
            } else {
                return -1;
            }
        }else{
            // this is for suki card redeem points
            $RedeemedPoints = new RedeemedPoints;
            $Sales = new Sales;
            $Customers = new Customers;

            $suki_card_number = $Customers->get_suki_card_number($this->inputs['customer_id']);
            $RedeemedPoints->inputs['customer_id'] = $this->inputs['customer_id'];
            $available_points = $RedeemedPoints->get_available_reward_points();

            $payment_reference_number = $this->inputs['other_payment_reference'];

            if($available_points >= $this->inputs['amount']){
                if($suki_card_number == $payment_reference_number){
                    $RedeemedPoints->inputs['reference_number'] = $RedeemedPoints->generate();
    
                    $sales_num = $this->inputs['sales_num'];
                    $param = "reference_number = '$sales_num'";
                    $RedeemedPoints->inputs['sales_id'] = $Sales->getID($param);
                    $RedeemedPoints->inputs['customer_id'] = $this->inputs['customer_id'];
                    $RedeemedPoints->inputs['redeem_points'] = $this->inputs['amount'];
                    $RedeemedPoints->inputs['suki_card_number'] = $this->inputs['other_payment_reference'];
                    $RedeemedPoints->inputs['encoded_by'] = $this->inputs['encoded_by'];
                    
    
                    return $RedeemedPoints->add();   
                }else{
                    return -3; // invalid suki card number
                }
            }else{
                return -2;
            }
        }
    }

    public function getTotalPaymentPOS()
    {
        $Sales = new Sales;
        $sales_num = $this->inputs['sales_num'];
        $param = "reference_number='$sales_num'";
        $sales_id = $Sales->getID($param);
        $result = $this->select($this->table_detail, 'sum(amount)', "ref_id='$sales_id' and type='DR' ");
        $row = $result->fetch_array();

        // total redeemed points
        $fetch_redeemed_points = $this->select("tbl_redeemed_points", "sum(redeem_points)", "sales_id='$sales_id' ");
        $redeemed_points = $fetch_redeemed_points->fetch_array();
        return $row[0] + $redeemed_points[0];
    }

    public function getPaymentByRef($ref_id, $type = 'DR')
    {

        $result = $this->table("$this->table AS h")
            ->join("$this->table_detail AS d", 'h.cp_id', '=', 'd.cp_id')
            ->join("tbl_payment_option AS p", 'p.payment_option_id', '=', 'h.payment_option_id')
            ->selectRaw('p.payment_option', 'h.remarks', 'd.amount')
            ->where('d.ref_id', $ref_id)
            ->where('d.type', $type)
            ->get();

        $count = 1;
        $rows = array();
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
        return $rows;
    }

    public function remove_payments()
    {

        $Settings = new Settings();
        $setting_row = $Settings->view();

        $access_code = $this->inputs['access_code'];

        if ($setting_row['module_remove_online_payment'] == $access_code) {
            $Sales = new Sales;
            $reference_number = $this->inputs['reference_number'];
            $param = "reference_number='$reference_number'";
            $sales_id = $Sales->getID($param);

            $rows = array();
            $result = $this->select($this->table_detail, $this->pk, "ref_id='$sales_id' AND type='DR'");
            while ($row = $result->fetch_array()) {
                $rows[] = $row[0];
            }

            $ids = implode(',', $rows);

            // delete redeemed points
            $this->delete("tbl_redeemed_points", "sales_id='$sales_id'");

            if (sizeof($rows) > 0) {
                return $result = $this->delete($this->table,  "cp_id IN($ids)");
            } else {
                return 1;
            }
        } else {
            return -2;
        }
    }

    public function finishCustomerPaymentOfDRPOS($sales_id, $customer_id)
    {
        $rows = array();
        $result = $this->select($this->table_detail, $this->pk, "ref_id='$sales_id' AND type='DR'");

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_array()) {
                $rows[] = $row[0];
            }

            if (sizeof($rows) > 0) {
                $form = array(
                    'status' => 'F',
                    'customer_id' => $customer_id
                );
                return $this->update($this->table, $form, "cp_id IN(" . implode(',', $rows) . ")");
            } else {
                return 1;
            }
        } else {
            return 1;
        }
    }

    public function total_saved($primary_id, $ref_id, $type)
    {
        $result = $this->select($this->table_detail, 'sum(amount)', "$this->pk = '$primary_id' AND ref_id = '$ref_id' AND type='$type'");
        $row = $result->fetch_array();
        return $row[0];
    }


    public function getHeader()
    {
        $Customers = new Customers;
        $id = $_POST['id'];
        $result = $this->select($this->table, "*", "$this->pk='$id'");
        $row = $result->fetch_assoc();
        $row['payment_date_mod'] = date("F j, Y", strtotime($row['payment_date']));
        $row['customer_name'] = $Customers->name($row['customer_id']);
        $rows[] = $row;
        return $rows;
    }
    public function getPrintDetails()
    {
        $id = $_POST['id'];
        $Sales = new Sales;
        $BeginningBalance = new BeginningBalance;
        $rows = array();
        $result = $this->select($this->table_detail, "*", "$this->pk='$id'");
        while ($row = $result->fetch_assoc()) {
            $row['reference'] = $row['type'] == "DR" ? $Sales->name($row['ref_id']) : $BeginningBalance->name($row['ref_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function amount_paid($ref_id, $type){

        $fetch = $this->select('tbl_customer_payment_details as d, tbl_customer_payment as h', "sum(amount) as total", "d.ref_id = $ref_id AND h.cp_id=d.cp_id AND h.status='F' AND d.type='$type'");
        $paid_total = 0;
        while ($row = $fetch->fetch_assoc()) {
            $paid_total += $row['total'];
        }

        return $paid_total;
    }

    public function addCustomerPaymentPOS(){

        $Sales = new Sales;
        $this->inputs[$this->fk_det] = $this->inputs['sales_reference_number'];
        $sales_id     = substr($this->inputs['sales_reference_number'], 3);
        $customer_payment_amount = $this->inputs['customer_payment_amount'];
        //$param = "reference_number='$sales_reference_number'";
        //$sales_id = $Sales->getID($param);
        
        $this->inputs[$this->name] = $this->generate();

        $Sales->inputs['id'] = $sales_id;
        $sales_row = $Sales->view();

        if($sales_row != null){
            $this->inputs['customer_id'] = $sales_row['customer_id'];
            $this->inputs['payment_type'] = "C";
            $this->inputs['payment_date'] = $this->getCurrentDate();
            $this->inputs['check_date'] = "";
            $this->inputs['check_number'] = "";
            $this->inputs['check_bank'] = "";
            $this->inputs['payment_option_id'] = 0;

            $primary_id = $this->add();
            $this->inputs[$this->pk] = $primary_id;
            $this->inputs['amount'] = $customer_payment_amount;
            $res = $this->add_detail();
            
            if($res == 1){
                $this->inputs['id'] = $primary_id;
                return $this->finish();
            }else{
                return $res;
            }

        }else{
            return 0;
        }
    }

    public function getCustomerBalancePerSales(){
        $Sales = new Sales;
        $sales_id = $this->inputs['sales_reference_number'];
        return $this->total_paid($sales_id, 'DR');
    }

    public function update_review_sales_summary()
    {
        $encoded_by = $this->inputs['encoded_by'];
        $form = array(
            'sales_summary_id' => $this->inputs['sales_summary_id']
        );
        return $this->update($this->table, $form, "sales_summary_id=0 AND encoded_by='$encoded_by' and (status='F' or status='C') ");
    }

    public function get_pk_by_ref($ref_id,$type)
    {
        $result = $this->select('tbl_customer_payment as h, tbl_customer_payment_details as d', 'h.cp_id', "d.ref_id = '$ref_id' AND h.cp_id=d.cp_id AND d.type='$type'");
        $row = $result->fetch_array();
        return $row[0];
    }

    public static function search($words,&$rows)
    {
        $self = new self;
        if(count($self->searchable) > 0 ){
            $where = implode(" LIKE '%$words%' OR ", $self->searchable)." LIKE '%$words%'";
            $result = $self->select($self->table, '*', $where);
            while ($row = $result->fetch_assoc()) {
                $names = [];
                foreach($self->searchable as $f){
                    $names[] = $row[$f];
                }
                $rows[] = array(
                    'name' => implode(" ", $names),
                    'module' => $self->module_name,
                    'slug' => $self->uri."?id=".$row[$self->pk]
                );
            }
        }
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
                    $this->metadata('customer_id', 'int', 11),
                    $this->metadata('payment_type', 'varchar', 1),
                    $this->metadata('payment_option_id', 'int', 11),
                    $this->metadata('payment_date', 'date'),
                    $this->metadata('remarks', 'varchar', 255),
                    $this->metadata('sales_date', 'date'),
                    $this->metadata('status', 'varchar', 1),
                    $this->metadata('deposit_status', 'int', 1, '', '0', '', "'1 = Deposited'"),
                    $this->metadata('check_number', 'varchar', 30),
                    $this->metadata('check_bank', 'varchar', 30),
                    $this->metadata('check_date', 'date'),
                    $this->metadata('sales_summary_id', 'int', 11),
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
                    $this->metadata('amount', 'decimal', '12,2'),
                    $this->metadata('type', 'varchar', '2'),
                )
            );

            return $this->schemaCreator($tables);
        }
    }
}
