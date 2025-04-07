<?php

class BankDueDate extends Connection
{
    public $table = "tbl_supplier_payment";
    private $pk = 'sp_id';

    public function view()
    {
        $bank_id = $this->inputs['bank_id'];
        $rows = array();

        if ($bank_id == -1) {
            $query = "";
        } else {
            $query = "AND bank_id='$bank_id'";
        }

        $result = $this->select($this->table, "*", "payment_type='H' AND due_status='0' $query");
        $SupplierPayment = new SupplierPayment();
        $Banks = new Banks();
        $count = 1;
        while ($row = $result->fetch_assoc()) {
            $row['reference'] = $row['reference_number'];
            $row['check_number'] = $row['check_number'];
            $row['check_date'] = $row['check_date'];
            $row['bank'] = $Banks->name($row['bank_id']);
            $row['amount'] = number_format($SupplierPayment->total($row['sp_id']), 2);
            $row['count'] = $count++;
            $rows[] = $row;
        }
        return $rows;
    }

    public function cleared()
    {
        $primary_id = $this->inputs['id'];
        $form = array(
            'due_status' => 1,
        );

        Logs::store("Successfully cleared bank due date [$primary_id]", "Bank Due Date");
        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }
}
