<?php
class ExpenseReport extends Connection
{
    public function show()
    {
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        $expense_type = $this->inputs['expense_type'];
        $expense_category_id = $this->inputs['expense_category_id'];
        
        if($expense_type >= 0){
            $param = "AND c.expense_type = '$expense_type'";
        }else{
            $param = "";
        }

        if($expense_category_id >= 0){
            $cat_param = "AND c.expense_category_id = '$expense_category_id'";
        }else{
            $cat_param = "";
        }

        $Supplier = new Suppliers();

        $result = $this->select("tbl_expense as e, tbl_expense_details as d, tbl_expense_category as c","e.expense_date, c.expense_category, e.reference_number, d.supplier_id, d.amount","e.status='F' AND (e.expense_date >= '$start_date' AND e.expense_date <= '$end_date') AND e.expense_id=d.expense_id AND d.expense_category_id=c.expense_category_id $param $cat_param");
        $rows = array();
        while($row = $result->fetch_assoc()) {
            
            $row['expense_date'] = $row['expense_date'];
            $row['expense'] = $row['expense_category'];
            $row['reference_number'] = $row['reference_number'];
            $row['supplier'] = $Supplier->name($row['supplier_id']);
            $row['amount'] = number_format($row['amount'],2);
                
            $rows[] = $row;
        }
        return $rows;
    }
}
