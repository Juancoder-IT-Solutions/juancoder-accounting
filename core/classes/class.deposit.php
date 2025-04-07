<?php
class Deposit extends Connection
{
    private $table = 'tbl_deposit';
    public $pk = 'deposit_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_deposit_details';
    public $pk2 = 'deposit_detail_id';
    public $fk_det = 'cp_id';

    public $module = 'DEP-';

    public $module_name = "Deposit";
    public $inputs = [];
    public $searchable = ['reference_number','remarks'];
    public $uri = "deposit";
    public function add()
    {
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'branch_id'     => $this->getBranch(),
            'remarks'       => $this->inputs['remarks'],
            'deposit_date'  => $this->inputs['deposit_date'],
            'deposit_type'  => $this->inputs['deposit_type'],
            'bank_id'  => $this->inputs['bank_id'],
            'encoded_by'    => $_SESSION['user']['id'],
            'date_added'    => $this->getCurrentDate()
        );
        return $this->insertIfNotExist($this->table, $form, '', 'Y');
    }

    public function edit()
    {
        $form = array(
            'remarks'       => $this->inputs['remarks'],
            'deposit_date'  => $this->inputs['deposit_date'],
            'bank_id'       => $this->inputs['bank_id'],
            'encoded_by'    => $_SESSION['user']['id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {   
        $branch_id = $this->getBranch();
        $param = "branch_id = '$branch_id'";
        $param .= isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $Users = new Users;
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['encoded_name'] = $Users->getUser($row['encoded_by']);
            $row['total'] = number_format($this->total($row['deposit_id']),2);
            $row['date_last_modified'] = date('Y-m-d H:i:s', strtotime($row['date_last_modified'] . ' + 8 hours'));
            $rows[] = $row;
        }
        return $rows;
    }

    public function show_ref()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $CustomerPayment = new CustomerPayment;
        $result = $this->select('tbl_customer_payment', '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['cp_id'] = $row['cp_id'];
            $row['reference'] = $row['check_bank']." - ".$row['check_number']." (₱ ".number_format($CustomerPayment->total($row['cp_id']),2).")";
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $Banks = new Banks;
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['deposit_type_name'] = $row['deposit_type'] == "C" ? "CASH" : "CHECK";
        $row['bank_name'] = $Banks->name($row['bank_id']);
        return $row;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function generate()
    {
        return $this->module  . date('YmdHis');
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table_detail, '*', "$this->pk = '$primary_id'");
        while($row = $result->fetch_array()){
            $form_ = array(
                'deposit_status' => 1
            );
            $this->update('tbl_customer_payment', $form_, "cp_id = '$row[cp_id]'");
        }

        $form = array(
            'status' => 'F',
        );
        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }
    

    public function pk_by_name($name = null)
    {
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function get_row($primary_id, $field){
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

    public function add_detail()
    {
        $CustomerPayment = new CustomerPayment();
        if(isset($this->inputs['cp_id']) AND $this->inputs['cp_id'] > 0){
            $amount = $CustomerPayment->total($this->inputs['cp_id']);
            $fk_det     = $this->inputs[$this->fk_det];
            $primary_id = $this->inputs[$this->pk];
            $form = array(
                $this->pk       => $primary_id,
                'cp_id'         => $fk_det,
                'amount'        => $amount,
            );
            return $this->insertIfNotExist($this->table_detail, $form, "$this->pk = '$primary_id' AND $this->fk_det = '$fk_det'");
        }else{
            $form = array(
                $this->pk       => $this->inputs[$this->pk],
                'cp_id'         => $this->inputs['cp_id'],
                'amount'        => $this->inputs['amount'],
            );
            return $this->insert($this->table_detail, $form);
        }
        
    }

    public function show_detail()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $CustomerPayment = new CustomerPayment();
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['remarks'] = $row['cp_id'] > 0 ? $CustomerPayment->reference($row['cp_id']) : "Cash On Hand";
            $row['amount'] = number_format($row['amount'],2);
            $rows[] = $row;
        }
        return $rows;
    }

    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function totalExpensesDays($days)
    {
       $fetchData = $this->select('tbl_expense_details as d, tbl_expense as h', "sum(amount) as total", "h.expense_id = d.expense_id AND h.expense_date BETWEEN NOW() - INTERVAL $days DAY AND NOW() AND h.status='F'");
        $row = $fetchData->fetch_assoc();

        return $row['total'] == 0 ? 0 : $row['total'];
    }

    public function total($primary_id)
    {
       $fetchData = $this->select('tbl_deposit_details as d, tbl_deposit as h', "sum(amount) as total", "h.deposit_id = d.deposit_id AND h.deposit_id='$primary_id'");
        $row = $fetchData->fetch_assoc();

        return $row['total'];
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
