<?php

class StockCard extends Connection
{
    public $table = "tbl_product_transactions";

    public function view()
    {
        $product_id = $this->inputs['product_id'];
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        $branch_id = $this->getBranch();
        $warehouse_id = $this->inputs['warehouse_id'];
        $rows = array();

        $result = $this->select('tbl_beginning_balance b LEFT JOIN tbl_product_transactions pt ON b.bb_id=pt.header_id', "b.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', quantity, 0) AS qty_in, 0 AS qty_out, b.date_added AS transaction_date, b.bb_ref_id AS ref_id ", "pt.status=1 AND pt.product_id= '$product_id' AND pt.module='BB' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id = '$branch_id' AND b.date_added BETWEEN '$start_date' AND '$end_date' AND pt.quantity > 0  UNION ALL SELECT s.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, 0 AS qty_in, IF(pt.type='OUT', quantity, 0) AS qty_out, s.sales_date AS transaction_date, s.sales_id AS ref_id FROM tbl_sales s LEFT JOIN tbl_product_transactions pt ON s.sales_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id= '$product_id' AND pt.module='SLS' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id = '$branch_id' AND s.sales_date BETWEEN '$start_date' AND '$end_date' AND pt.quantity > 0  UNION ALL SELECT po.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', quantity, 0) AS qty_in, 0 AS qty_out, po.po_date AS transaction_date, po.po_id AS ref_id  FROM tbl_purchase_order po LEFT JOIN tbl_product_transactions pt ON po.po_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id= '$product_id' AND pt.module='PO' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id = '$branch_id' AND po.po_date BETWEEN '$start_date' AND '$end_date' AND pt.quantity > 0  UNION ALL SELECT pc.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', quantity, 0) AS qty_in, IF(pt.type='OUT', quantity, 0) AS qty_out, pc.conversion_date AS transaction_date, pc.conversion_id AS ref_id  FROM tbl_product_conversions pc LEFT JOIN tbl_product_transactions pt ON pc.conversion_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id= '$product_id' AND pt.module='PC' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id = '$branch_id' AND pc.conversion_date BETWEEN '$start_date' AND '$end_date' AND pt.quantity > 0  UNION ALL SELECT ia.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', quantity, 0) AS qty_in, IF(pt.type='OUT', quantity, 0) AS qty_out, ia.adjustment_date AS transaction_date, ia.adjustment_id AS ref_id  FROM tbl_inventory_adjustments ia LEFT JOIN tbl_product_transactions pt ON ia.adjustment_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id= '$product_id' AND pt.module='IA' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id = '$branch_id' AND ia.adjustment_date BETWEEN '$start_date' AND '$end_date' AND pt.quantity > 0  UNION ALL SELECT sr.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', quantity, 0) AS qty_in, IF(pt.type='OUT', quantity, 0) AS qty_out, sr.return_date AS transaction_date, sr.sales_return_id AS ref_id  FROM tbl_sales_return sr LEFT JOIN tbl_product_transactions pt ON sr.sales_return_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id= '$product_id' AND pt.module='SR' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id = '$branch_id' AND sr.return_date BETWEEN '$start_date' AND '$end_date' AND pt.quantity > 0  UNION ALL SELECT pr.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', quantity, 0) AS qty_in, IF(pt.type='OUT', quantity, 0) AS qty_out, pr.return_date AS transaction_date, pr.pr_id AS ref_id  FROM tbl_purchase_return pr LEFT JOIN tbl_product_transactions pt ON pr.pr_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id= '$product_id' AND pt.module='PR' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id = '$branch_id' AND pr.return_date BETWEEN '$start_date' AND '$end_date' AND pt.quantity > 0  UNION ALL SELECT st.reference_number AS reference_number, pt.cost, SUM(pt.quantity) AS quantity, pt.type, pt.module, SUM(IF(st.destination_warehouse_id = '$warehouse_id', pt.quantity, 0)) AS qty_in,  SUM(IF(st.source_warehouse_id = '$warehouse_id', pt.quantity, 0)) AS qty_out, st.stock_transfer_date AS transaction_date, st.stock_transfer_id AS ref_id FROM tbl_stock_transfer st LEFT JOIN tbl_product_transactions pt ON st.stock_transfer_id = pt.header_id  WHERE pt.status = 1 AND pt.product_id = '$product_id' AND pt.module = 'STK' AND pt.branch_id = '$branch_id' AND st.stock_transfer_date BETWEEN '$start_date' AND '$end_date' AND pt.quantity > 0 AND (st.source_warehouse_id = '$warehouse_id' OR st.destination_warehouse_id = '$warehouse_id') GROUP BY st.stock_transfer_id, pt.product_id ORDER BY transaction_date ASC");



        $bf = $this->balance_fowarded();
        $qty_balance = $bf['qty'];
        while ($row = $result->fetch_assoc()) {
            $qty = $row['qty_in'] - $row['qty_out'];
            $qty_balance += $qty;

            if ($row['module'] == "BB") {
                $module = "Beginning Balance";
            } else if ($row['module'] == "PO") {
                $module = "Purchase Order";
            } else if ($row['module'] == "SLS") {
                $module = "Sales";
            } else if ($row['module'] == "JO") {
                $module = "Job Order";
            } else if ($row['module'] == "PC") {
                $module = "Product Conversion";
            } else if ($row['module'] == "IA") {
                $module = "Inventory Adjustment";
            } else if ($row['module'] == "SR") {
                $module = "Sales Return";
            } else if ($row['module'] == "PR") {
                $module = "Purchase Return";
            } else if ($row['module'] == "STK") {
                $module = "Stock Transfer";
            }

            $row['qty_balance'] = number_format($qty_balance, 2);
            $row['module'] = $module;
            $row['reference_number'] = $row['reference_number'];
            $row['amount'] = number_format($qty_balance * $row['cost'], 2);
            $row['date'] = date('M d, Y', strtotime($row['transaction_date']));
            $rows[] = $row;
        }

        // while ($row = $result->fetch_assoc()) {
        //     $rows[] = $row;
        // }

        return $rows;
    }

    public function balance_fowarded()
    {
        $start_date = $this->inputs['start_date'];
        $product_id = $this->inputs['product_id'];
        $warehouse_id = $this->inputs['warehouse_id'];
        $branch_id = $this->getBranch();
        $rows = array();


        // $result = $this->select($this->table, "SUM(CASE WHEN type = 'IN' THEN cost*quantity ELSE 0 END) as total_cost", "product_id = '$product_id' AND status = 1 AND branch_id = '$branch_id' AND warehouse_id = '$warehouse_id' AND date_added < '$start_date'");
        // $row = $result->fetch_array();

        // $result_in = $this->select($this->table, "SUM(quantity) as qty_in", "product_id = '$product_id' AND status = 1 AND branch_id = '$branch_id' AND warehouse_id = '$warehouse_id' AND date_added < '$start_date' AND type='IN'");
        // $rowIN = $result_in->fetch_array();

        // $resultOut = $this->select($this->table, "SUM(quantity) as qty_out", "product_id = '$product_id' AND status = 1 AND branch_id = '$branch_id' AND warehouse_id = '$warehouse_id' AND date_added < '$start_date' AND type='OUt'");
        // $rowOut = $resultOut->fetch_array();

        // Execute the query
        $result = $this->select('tbl_beginning_balance b LEFT JOIN tbl_product_transactions pt ON b.bb_id=pt.header_id', "b.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', pt.quantity, 0) AS qty_in, 0 AS qty_out, b.date_added AS transaction_date, b.bb_ref_id AS ref_id", "pt.status=1 AND pt.product_id='$product_id' AND pt.module='BB' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id='$branch_id' AND b.date_added < '$start_date' AND pt.quantity > 0 UNION ALL SELECT s.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, 0 AS qty_in, IF(pt.type='OUT', pt.quantity, 0) AS qty_out, s.sales_date AS transaction_date, s.sales_id AS ref_id FROM tbl_sales s LEFT JOIN tbl_product_transactions pt ON s.sales_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id='$product_id' AND pt.module='SLS' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id='$branch_id' AND s.sales_date < '$start_date' AND pt.quantity > 0 UNION ALL SELECT po.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', pt.quantity, 0) AS qty_in, 0 AS qty_out, po.po_date AS transaction_date, po.po_id AS ref_id FROM tbl_purchase_order po LEFT JOIN tbl_product_transactions pt ON po.po_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id='$product_id' AND pt.module='PO' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id='$branch_id' AND po.po_date < '$start_date' AND pt.quantity > 0 UNION ALL SELECT pc.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', pt.quantity, 0) AS qty_in, IF(pt.type='OUT', pt.quantity, 0) AS qty_out, pc.conversion_date AS transaction_date, pc.conversion_id AS ref_id FROM tbl_product_conversions pc LEFT JOIN tbl_product_transactions pt ON pc.conversion_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id='$product_id' AND pt.module='PC' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id='$branch_id' AND pc.conversion_date < '$start_date' AND pt.quantity > 0 UNION ALL SELECT ia.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', pt.quantity, 0) AS qty_in, IF(pt.type='OUT', pt.quantity, 0) AS qty_out, ia.adjustment_date AS transaction_date, ia.adjustment_id AS ref_id FROM tbl_inventory_adjustments ia LEFT JOIN tbl_product_transactions pt ON ia.adjustment_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id='$product_id' AND pt.module='IA' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id='$branch_id' AND ia.adjustment_date < '$start_date' AND pt.quantity > 0 UNION ALL SELECT sr.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', pt.quantity, 0) AS qty_in, IF(pt.type='OUT', pt.quantity, 0) AS qty_out, sr.return_date AS transaction_date, sr.sales_return_id AS ref_id FROM tbl_sales_return sr LEFT JOIN tbl_product_transactions pt ON sr.sales_return_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id='$product_id' AND pt.module='SR' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id='$branch_id' AND sr.return_date < '$start_date' AND pt.quantity > 0 UNION ALL SELECT pr.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', pt.quantity, 0) AS qty_in, IF(pt.type='OUT', pt.quantity, 0) AS qty_out, pr.return_date AS transaction_date, pr.pr_id AS ref_id FROM tbl_purchase_return pr LEFT JOIN tbl_product_transactions pt ON pr.pr_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id='$product_id' AND pt.module='PR' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id='$branch_id' AND pr.return_date < '$start_date' AND pt.quantity > 0 UNION ALL SELECT st.reference_number AS reference_number, pt.cost, pt.quantity, pt.type, pt.module, IF(pt.type='IN', pt.quantity, 0) AS qty_in, IF(pt.type='OUT', pt.quantity, 0) AS qty_out, st.stock_transfer_date AS transaction_date, st.stock_transfer_id AS ref_id FROM tbl_stock_transfer st LEFT JOIN tbl_product_transactions pt ON st.stock_transfer_id=pt.header_id WHERE pt.`status`=1 AND pt.product_id='$product_id' AND pt.module='STK' AND pt.warehouse_id='$warehouse_id' AND pt.branch_id='$branch_id' AND st.stock_transfer_date < '$start_date' AND pt.quantity > 0 ORDER BY transaction_date ASC");

        $current_qty = 0;
        $total_cost = 0;
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $current_qty += $row['qty_in']-$row['qty_out'];
                $total_cost += $row['cost'];
            }
        }

        $avg_cost = $current_qty > 0 ? $total_cost / $current_qty : 0;
        $row['qty'] = $current_qty;
        $rows['amount'] = $current_qty > 0 ? number_format($avg_cost, 2) : 0;
        $rows = $row;
        return $rows;
    }

    public function trigger_add($product_id, $quantity, $cost, $price, $header_id, $detail_id, $module, $type)
    {
        return "INSERT INTO $this->table (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.$product_id,NEW.$quantity,NEW.$cost,NEW.$price,NEW.$header_id,NEW.$detail_id,'$module','$type')";
    }
}
