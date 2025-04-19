<?php

class SalesSummary extends Connection
{
    private $table = 'tbl_sales_summary';
    public $pk = 'sales_summary_id';

    // notes: make dynamic values for count if exist

    public function add()
    {
        $cashier_id = $this->inputs['cashier_id'];
        $is_exist = $this->select($this->table, $this->pk, "status = 'S' AND cashier_id='$cashier_id' ");
        if ($is_exist->num_rows > 0) {
            return 2;
        } else {
            $form = array(
                'cashier_id' => $this->clean($this->inputs['cashier_id']),
                'branch_id' => $this->clean($this->inputs['branch_id']),
                'warehouse_id' => $this->clean($this->inputs['warehouse_id']),
                'starting_balance' => $this->clean($this->inputs['starting_balance']),
                'total_sales_amount' => $this->clean($this->inputs['total_sales_amount']),
                'total_amount_collected' => $this->clean($this->inputs['total_amount_collected']),
                'total_deficit' => 0,
                'encoded_by' => 0,
                'status' => 'S',
                'date_added' => $this->getCurrentDate()
            );
            return $this->insert($this->table, $form);
        }
    }

    public function edit()
    {
        $primary_id = $this->inputs[$this->pk];
        $cashier_id = $this->inputs['cashier_id'];
        $is_exist = $this->select($this->table, $this->pk, "status = 'S' AND cashier_id='$cashier_id' AND $this->pk != '$primary_id'");
        if ($is_exist->num_rows > 0) {
            return 2;
        } else {
            $form = array(
                'cashier_id' => $this->inputs['cashier_id'],
                'starting_balance' => $this->inputs['starting_balance'],
                'total_sales_amount' => $this->inputs['total_sales_amount'],
                'total_amount_collected' => $this->inputs['total_amount_collected'],
                'encoded_by' => $this->inputs['encoded_by'],
                'status' => 'S'
            );
            return $this->update($this->table, $form, "$this->pk = '$primary_id'");
        }
    }

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, "*", $param);
        while ($row = $result->fetch_assoc()) {
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

    public function finish()
    {
        $row = $this->getLatestSummary();
        $primary_id = $row['sales_summary_id'] * 1;
        $cashier_id = $this->clean($this->inputs['cashier_id']);
        $starting_balance = $this->clean($this->inputs['ss_starting_balance']);
        $total_cash_additionals = $this->clean($this->inputs['ss_total_cash_additionals']);
        $total_sales_amount = $this->clean($this->inputs['ss_total_expense_amount']);
        $total_sales_amount = $starting_balance + $total_cash_additionals - $total_sales_amount;
        $total_amount_collected = $this->clean($this->inputs['ss_total_amount_collected']);
        $total_deficit = $total_amount_collected - $starting_balance + $total_sales_amount;

        $form = array(
            'status' => 'F',
            'encoded_by' => $cashier_id,
            'total_sales_amount' => $total_sales_amount,
            'total_amount_collected' => $total_amount_collected,
            'total_deficit' => $total_deficit
        );
        $res = $this->update($this->table, $form, "$this->pk = '$primary_id'");
        if($res == 1){
            $this->update("tbl_cash_additionals", ['summary_id' => $primary_id], "summary_id=0 AND cashier_id='$cashier_id' AND status='F'");
            return $this->update("tbl_expense", ['summary_id' => $primary_id], "summary_id=0 AND encoded_by='$cashier_id'");
        }
    }

    public function getLatestSummary()
    {
        $cashier_id = $this->inputs['cashier_id'];
        $result = $this->select($this->table, "*", "status='S' AND cashier_id='$cashier_id'");
        if($result->num_rows > 0){
            return $result->fetch_assoc();
        }else{
            return -1;
        }
        
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }
}
