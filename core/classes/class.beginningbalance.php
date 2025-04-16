<?php

class BeginningBalance extends Connection
{
    private $table = 'tbl_beginning_balance';
    public $pk = 'bb_id';
    public $name = 'reference_number';
    public $module_name = "Beginning Balance";

    // notes: make dynamic values for count if exist
    public $inputs = [];
    public $searchable = ['reference_number','bb_remarks'];
    public $uri = "beginning-balance";
    public function add()
    {

        $bb_ref_id = $this->clean($this->inputs['bb_ref_id']);
        $bb_module = $this->clean($this->inputs['bb_module']);
        $is_exist = $this->select($this->table, $this->pk, "bb_ref_id = '$bb_ref_id' AND bb_module='$bb_module'");
        if ($is_exist->num_rows > 0) {
            Logs::storeCrud($this->module_name, 'c', 2, $bb_ref_id);
            return 2;
        } else {
            $form = array(
                $this->name     => $this->clean($this->inputs[$this->name]),
                'branch_id'     => $this->getBranch(),
                'warehouse_id'  => $this->inputs['warehouse_id'],
                'bb_date'       => $this->inputs['bb_date'],
                'bb_ref_id'     => $bb_ref_id,
                'bb_module'     => $bb_module,
                'bb_qty'        => $this->inputs['bb_qty'],
                'bb_amount'     => $this->inputs['bb_amount'],
                'bb_remarks'    => $this->inputs['bb_remarks'],
                'encoded_by'    => $_SESSION['accounting_user']['id'],
                'date_added'    => $this->getCurrentDate()
            );

            if ($bb_module == "INV") {
                $Products = new Products();
                $amount =  $this->inputs['bb_amount'] / $this->inputs['bb_qty'];
                $Products->prodAVG($bb_ref_id, $this->inputs['bb_qty'], $amount);
            }

            $result = $this->insert($this->table, $form);
            Logs::storeCrud($this->module_name, 'c', $result, $bb_ref_id);
            return $result;
        }
    }

    public function edit()
    {
        $bb_ref_id = $this->clean($this->inputs['bb_ref_id']);
        $bb_module = $this->clean($this->inputs['bb_module']);
        $is_exist = $this->select($this->table, $this->pk, "bb_ref_id = '$bb_ref_id' AND bb_module='$bb_module'");
        if ($is_exist->num_rows > 0) {
            Logs::storeCrud($this->module_name, 'u', 2, $bb_ref_id);
            return 2;
        } else {
            $form = array(
                $this->name             => $this->clean($this->inputs[$this->name]),
                'bb_date'               => $this->inputs['bb_date'],
                'bb_ref_id'             => $bb_ref_id,
                'bb_module'             => $bb_module,
                'bb_qty'                => $this->inputs['bb_qty'],
                'bb_amount'             => $this->inputs['bb_amount'],
                'bb_remarks'            => $this->inputs['bb_remarks'],
                'encoded_by'            => $_SESSION['accounting_user']['id'],
                'date_last_modified'    => $this->getCurrentDate()
            );
            $result = $this->updateIfNotExist($this->table, $form);
            Logs::storeCrud($this->module_name, 'u', $result, $bb_ref_id);
            return $result;
        }
    }

    public function show()
    {
        $rows = array();
        $Products = new Products();
        $Customers = new Customers();
        $Suppliers = new Suppliers();
        $Users = new Users();
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            if ($row['bb_module'] == "INV") {
                $type = "INVENTORY";
                $account = $Products->name($row['bb_ref_id']);
            } else if ($row['bb_module'] == "AP") {
                $type = "ACCOUNTS PAYABLE";
                $account = $Suppliers->name($row['bb_ref_id']);
            } else if ($row['bb_module'] == "AR") {
                $type = "ACCOUNTS RECEIVABLE";
                $account = $Customers->name($row['bb_ref_id']);
            }

            $row['type'] =  $type;
            $row['account'] =  $account;
            $row['encoded_name'] = $Users->getUser($row['encoded_by']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        return $result->fetch_assoc();
    }

    public function rows($name = null)
    {
        $name = $name == "" ? $this->inputs['id'] : $name;
        $result = $this->select($this->table, "*", "$this->name = '$name'");
        return $result->fetch_assoc();
    }

    public function rows_($id)
    {
        $result = $this->select($this->table, "*", "$this->pk = '$id'");
        $row = $result->fetch_assoc();
        return $row;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        $Products = new Products();
        $result = $this->select($this->table, "*", "$this->pk IN($ids)");
        while ($row = $result->fetch_array()) {
            if ($row['bb_module'] == "INV") {
                $amount = $row['bb_amount'] / $row['bb_qty'];
                $Products->prodRVS($row['bb_ref_id'], $row['bb_qty'], $amount);
            }

            Logs::storeCrud($this->module_name, 'd', 1, $row['bb_ref_id']);
        }

        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function generate()
    {
        return 'BB-' . date('YmdHis');
    }

    public function get_row($primary_id, $field)
    {
        $result = $this->select($this->table, $field, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$field];
    }


    public function pk_by_name($name = null)
    {
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function pk_name($name, $bb_ref_id)
    {
        $result = $this->select($this->table, $this->pk, "$this->name = '$name' AND status='F' AND bb_ref_id='$bb_ref_id'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function total($primary_id)
    {
        $result = $this->select($this->table, 'bb_amount', "$this->pk = '$primary_id'");
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            return $row['bb_amount'];
        } else {
            return 0;
        }
    }

    public function bb_balance($primary_id)
    {
        $bb_total = $this->total($primary_id);

        $fetch_sp = $this->select('tbl_supplier_payment_details as d, tbl_supplier_payment as h', "sum(amount) as total", "d.ref_id = $primary_id AND h.sp_id=d.sp_id AND h.status='F' AND d.type='BB'");
        $paid_total = 0;
        while ($row = $fetch_sp->fetch_assoc()) {
            $paid_total += $row['total'];
        }

        return $bb_total - $paid_total;
    }

    public function bb_balance_ar($primary_id)
    {
        $bb_total = $this->total($primary_id);

        $fetch_cp = $this->select('tbl_customer_payment_details as d, tbl_customer_payment as h', "sum(amount) as total", "d.ref_id = $primary_id AND h.cp_id=d.cp_id AND h.status='F' AND d.type='BB'");
        $paid_total = 0;
        while ($row = $fetch_cp->fetch_assoc()) {
            $paid_total += $row['total'];
        }

        return $bb_total - $paid_total;
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
}
