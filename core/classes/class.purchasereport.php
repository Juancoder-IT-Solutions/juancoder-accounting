<?php

class PurchaseReport extends Connection
{
    public $table = "tbl_purchase_order";
    public $table_details = "tbl_purchase_order_details";


    public function generate_supplier()
    {
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        $supplier_id = $this->inputs['supplier_id'];
        
        if($supplier_id >= 0){
            $param = "AND h.supplier_id = '$supplier_id'";
        }else{
            $param = "";
        }

        $result = $this->select("tbl_purchase_order as h, tbl_purchase_order_details as d","product_id, sum(qty*supplier_price) as amount, sum(qty) as qty","h.po_id=d.po_id $param AND (h.po_date >= '$start_date' AND h.po_date <= '$end_date') AND h.status='F' GROUP BY product_id");
        while($row = $result->fetch_assoc()) {
            
            $row['item'] = Products::name($row['product_id']);
            // $fetchSAles = $this->select("tbl_purchase_order as h, tbl_purchase_order_details as d","sum(qty*supplier_price) as amount, sum(qty) as qty","d.product_id='$row[product_id]' $param AND h.po_id=d.po_id AND (h.po_date >= '$start_date' AND h.po_date <= '$end_date') AND h.status='F'");
            // $sRow = $fetchSAles->fetch_array();
            
            $row['qty'] = number_format($row['qty'],2);
            $row['amount'] = number_format($row['amount'],2);
                
            $rows[] = $row;
        }
        return $rows;
    }


    public function balance($product_id)
    {
        $result = $this->select($this->table, "SUM(IF(type='IN',quantity,-quantity)) AS qty", "product_id = '$product_id' AND status = 1");
        $row = $result->fetch_assoc();
        return (float) $row['qty'];
    }
}
