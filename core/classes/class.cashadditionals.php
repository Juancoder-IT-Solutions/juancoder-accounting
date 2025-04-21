<?php
class CashAdditionals extends Connection
{
    private $table = 'tbl_cash_additionals';
    public $pk = 'cash_additional_id';
    public $inputs = [];
    public $name = 'reference_number';
    public $module = 'CCA';

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $Warehouses = new Warehouses;
        $Branches = new Branches;
        $Users = new Users;
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['encoded_by'] = $Users->getUser($row['encoded_by']);
            $row['cashier_name'] = $Users->getUser($row['cashier_id']);
            $row['warehouse_name'] = $Warehouses->name($row['warehouse_id'])." (".$Branches->name($row['branch_id']).")";
            $row['amount'] = number_format($row['amount'], 2);
            $rows[] = $row;
        }
        return $rows;
    }

    public function add()
    {
        $Users = new Users;
        $row = $Users->row($this->inputs['user_id']);
        $branch_id = $row['branch_id'];
        $warehouse_id = $row['warehouse_id'];

        $form = [
            'reference_number'      => $this->inputs['reference_number'],
            'branch_id'             => $branch_id,
            'warehouse_id'          => $warehouse_id,
            'cashier_id'            => $this->inputs['user_id'],
            'amount'                => $this->inputs['amount'],
            'status'                => 'F',
            'encoded_by'            => $_SESSION['accounting_user']['id'],
            'date_added'            => $this->getCurrentDate(),
        ];

        $result = $this->insertIfNotExist($this->table, $form);
        return $result;
    }

    public function generate()
    {
        $fetch = $this->select($this->table, "max($this->pk) as max_id", "$this->pk > 0");
        $row = $fetch->fetch_assoc();
        $next_id = (int)$row['max_id'] + 1;
        return $this->module."-".sprintf("%'.06d", $next_id);
    }


    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        return $result->fetch_assoc();
    }

    public static function total()
    {
        $self = new self;
        $result = $self->select($self->table, "count($self->pk) as total");
        if ($result->num_rows == 0) {
            return 0;
        } else {
            $row = $result->fetch_assoc();
            return $row['total'];
        }
    }
}
