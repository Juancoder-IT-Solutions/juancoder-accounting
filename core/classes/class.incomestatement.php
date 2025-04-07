<?php

class IncomeStatement extends Connection
{
    public $table = "tbl_product_transactions";
    public function view()
    {
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];

        $sales = $this->sales_total($start_date,$end_date);
        $purchase = $this->purchase_total($start_date,$end_date);
        $purchase_return = $this->purchase_return_total($start_date,$end_date);
        $other_expense = $this->other_expense($start_date,$end_date);
        $operating_expense = $this->operating_expense($start_date,$end_date);
        $Inventory = new InventoryReport;

        $start_inv = $Inventory->balance_total($start_date);
        $cost_total = $purchase-$purchase_return;//($purchase+$start_inv)-$purchase_return;

        $income = $sales[2] - ($operating_expense[1]+$other_expense[1]+$sales[4]);
        //$sales[2] - ($cost_total+$operating_expense[1]+$other_expense[1]+$sales[4]);

        $rows = array();
        $row['sales_total'] = number_format($sales[0],2);
        $row['cogs_total'] = number_format($sales[4],2);
        $row['sales_return_total'] = number_format($sales[3],2); 
        $row['discount_total'] = number_format($sales[1],2);
        $row['revenue_total'] = number_format($sales[2],2);
        $row['purchases_total'] = number_format($purchase,2);
        $row['pr_total'] = number_format($purchase_return,2);
        $row['cost_total'] = number_format($cost_total,2);
        $row['income_total'] = number_format($income,2);
        $row['start_inv'] = number_format($start_inv,2);
        // $row['ending_inv'] = number_format($ending_inv,2);
        $row['other_list'] = $other_expense[0];
        $row['other_total'] = number_format($other_expense[1],2);
        $row['operating_list'] = $operating_expense[0];
        $row['oe_total'] = number_format($operating_expense[1],2);
        $rows = $row;
        return $rows;
    }

    public function sales_total($start_date,$end_date){
        $result = $this->select("tbl_sales as h, tbl_sales_details as d","sum(d.quantity*d.price) as total, sum(d.quantity*d.cost) as cogs, sum(d.discount) as dis","(h.sales_date >= '$start_date' AND h.sales_date <= '$end_date') AND h.status='F' AND h.sales_id=d.sales_id");
        $row = $result->fetch_array();

        $result_return = $this->select("tbl_sales_return as h, tbl_sales_return_details as d","sum(d.price*d.quantity_return) as total, sum(d.cost*d.quantity_return) as cogs","(h.return_date >= '$start_date' AND h.return_date <= '$end_date') AND h.status='F' AND h.sales_return_id=d.sales_return_id");
        $row_return = $result_return->fetch_array();
        
        $total = ($row['total']-$row_return['total'])-$row['dis'];
        $cogs_total = $row['cogs']-$row_return['cogs'];

        return [$row['total'],$row['dis'],$total,$row_return['total'],$cogs_total];
    }

    public function purchase_total($start_date,$end_date){
        $result = $this->select("tbl_purchase_order as h, tbl_purchase_order_details as d","sum(d.supplier_price*d.qty) as total","(h.po_date >= '$start_date' AND h.po_date <= '$end_date') AND h.status='F' AND h.po_id=d.po_id");
        $row = $result->fetch_array();

        return $row['total'];
    }

    public function purchase_return_total($start_date,$end_date){
        $result = $this->select("tbl_purchase_return as h, tbl_purchase_return_details as d","sum(d.supplier_price*d.qty_return) as total","(h.return_date >= '$start_date' AND h.return_date <= '$end_date') AND h.status='F' AND h.pr_id=d.pr_id");
        $row = $result->fetch_array();

        return $row['total'];
    }
    
    public function expenses_total($start_date,$end_date){
        $result = $this->select("tbl_expense e LEFT JOIN tbl_expense_details d ON e.expense_id=d.expense_id LEFT JOIN tbl_expense_category c ON c.expense_category_id=d.expense_category_id","sum(CASE WHEN c.expense_type='O' then d.amount ELSE 0 END) as other, sum(CASE WHEN c.expense_type='OE' then d.amount ELSE 0 END) as operational","e.status='F' AND (e.expense_date >= '$start_date' AND e.expense_date <= '$end_date')");
        $row = $result->fetch_array();

        return [$row['other'],$row['operational']];
    }

    public function other_expense($start_date,$end_date){

        $result = $this->select("tbl_expense_category", "*", "expense_type='O'");
        $list = "";
        $total = 0;
        while($row = $result->fetch_array()){
            $sum = $this->category_total($row['expense_category_id'],$start_date,$end_date);
            if($sum > 0){
                $list .= "<tr><td style='padding-left: 100px;'>".$row['expense_category']."</td><td style='text-align:right;'>".number_format($sum,2)."</td></tr>";
            }
            $total += $sum;
        }

        return [$list,$total];
    }

    public function operating_expense($start_date,$end_date){

        $result = $this->select("tbl_expense_category", "*", "expense_type='OE'");
        $list = "";
        $total = 0;
        while($row = $result->fetch_array()){
            $sum = $this->category_total($row['expense_category_id'],$start_date,$end_date);
            if($sum > 0){
                $list .= "<tr><td style='padding-left: 100px;'>".$row['expense_category']."</td><td style='text-align:right;'>".number_format($sum,2)."</td></tr>";
            }
            $total += $sum;
        }

        return [$list,$total];
    }

    public function category_total($primary,$start_date,$end_date){

        $result = $this->select("tbl_expense as e, tbl_expense_details as d","sum(d.amount)","e.status='F' AND (e.expense_date >= '$start_date' AND e.expense_date <= '$end_date') AND d.expense_category_id='$primary' AND e.expense_id=d.expense_id");
        $row = $result->fetch_array();
        
        return $row[0];

    }


}
