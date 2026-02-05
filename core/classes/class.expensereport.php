<?php
class ExpenseReport extends Connection
{   
   // Define the $inputs property
    public $inputs = [];
    public function show()
    {
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        $expense_category_id = $this->inputs['expense_category_id'];
        $supplier_id = $this->inputs['supplier_id'];
        $branch_id = $this->getBranch();

        $cat_param = $expense_category_id >= 0? "AND d.expense_category_id = '$expense_category_id'":"";
        $sup_param = $supplier_id >= 0? "AND h.supplier_id = '$supplier_id'":"";

        $Supplier = new Suppliers();
        $ExpenseCategories = new ExpenseCategories();

        $result = $this->select(
            "tbl_expense h
            INNER JOIN tbl_expense_details d
            ON h.expense_id = d.expense_id",
                "h.expense_date,
                d.expense_category_id,
                h.reference_number,
                h.supplier_id,
                d.amount",
            "h.status='F' 
            AND (h.expense_date >= '$start_date' 
            AND h.expense_date <= '$end_date')
            AND h.branch_id = $branch_id
            $cat_param
            $sup_param");
        $rows = array();
        while($row = $result->fetch_assoc()) {
            
            $row['expense_date'] = $row['expense_date'];
            $row['expense'] = $ExpenseCategories->name($row['expense_category_id']);
            $row['reference_number'] = $row['reference_number'];
            $row['supplier'] = $Supplier->name($row['supplier_id']);
            $row['amount'] = number_format($row['amount'],2);
            // $row['chart_id'] = $row['chart_id'];
                
            $rows[] = $row;
        }
        return $rows;
    }
}
