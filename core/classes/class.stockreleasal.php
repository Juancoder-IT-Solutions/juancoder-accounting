<?php

class StockReleasal extends Connection
{
    public $table = "tbl_sales";

    public function view()
    {
        $customer_id = $this->inputs['customer_id'];
        $product_id = $this->inputs['product_id'];
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];

        $cust_param = ($customer_id == -1) ? "" : "AND c.customer_id='$customer_id'";
        $prod_param = ($product_id == -1) ? "" : "AND d.product_id='$product_id'";

        $Products = new Products();
        $StockWithdrawal = new StockWithdrawal();
        $SalesReturn = new SalesReturn();

        $data = "";
        $counter = 0;

        $fetch_customer = $this->select(
            "tbl_customers c LEFT JOIN tbl_sales s ON c.customer_id=s.customer_id",
            "c.customer_id, c.customer_name",
            "s.withdrawal_status=1 AND (s.sales_date >= '$start_date' AND s.sales_date <= '$end_date') AND s.status='F' $cust_param GROUP BY c.customer_id"
        );

        while ($cRow = $fetch_customer->fetch_array()) {
            $result = $this->select(
                "tbl_sales h LEFT JOIN tbl_sales_details d ON h.sales_id=d.sales_id",
                "*, sum(d.quantity) as total_qty",
                "h.withdrawal_status=1 AND h.status='F' AND h.customer_id='$cRow[customer_id]' AND (h.sales_date >= '$start_date' AND h.sales_date <= '$end_date') $prod_param GROUP BY d.sales_detail_id, h.customer_id"
            );

            if ($result->num_rows > 0) {
                $counter++;
                $table_header = "<table class='table' style='margin-bottom: 50px;'><thead><tr><th colspan='7' style='background: #607d8b;color: #fff;'>Customer: {$cRow['customer_name']}</th></tr><tr><th>DATE</th><th>REFERENCE #</th><th>PRODUCT</th><th style='text-align:right;'>SALES QTY</th><th style='text-align:right;'>RETURN QTY</th><th style='text-align:right;'>RELEASED QTY</th><th style='text-align:right;'>REMAINING QTY</th></tr></thead><tbody>";

                $data_ = "";
                $tbl_counter = 0;

                while ($row = $result->fetch_assoc()) {
                    $return_qty = $SalesReturn->return_by_sd_id($row['sales_detail_id']);
                    $total_release = $StockWithdrawal->pickup_out($row['sales_detail_id']);
                    $remaining_qty = $row['total_qty'] - $total_release - $return_qty;

                    if ($remaining_qty > 0) {
                        $data_ .= "<tr><td>" . date('M d,Y', strtotime($row['sales_date'])) . "</td>";
                        $data_ .= "<td>{$row['reference_number']}</td>";
                        $data_ .= "<td>" . $Products->name($row['product_id']) . "</td>";
                        $data_ .= "<td style='text-align: right;'>" . number_format($row['total_qty'], 2) . "</td>";
                        $data_ .= "<td style='text-align: right;'>" . number_format($return_qty, 2) . "</td>";
                        $data_ .= "<td style='text-align: right;'>" . number_format($total_release, 2) . "</td>";
                        $data_ .= "<td style='text-align: right;'>" . number_format($remaining_qty, 2) . "</td></tr>";
                        $tbl_counter++;
                    }
                }

                if ($tbl_counter > 0) {
                    $data .= $table_header . $data_ . "</tbody></table>";
                }
            }
        }

        echo $counter > 0 ? $data : "<hr><center style='color: #757575;'><h3>No details found.</h3></center><hr>";
    }


    // public function per_item()
    // {
    //     $product_id = $this->inputs['product_id'];
    //     $start_date = $this->inputs['start_date'];
    //     $end_date = $this->inputs['end_date'];

    //     if ($product_id == "-1") {
    //         $prod_param = "";
    //     } else {
    //         $prod_param = "product_id='$product_id'";
    //     }
    //     $StockWithdrawal = new StockWithdrawal;
    //     $Inventory = new InventoryReport();
    //     $result = $this->select("tbl_products","*",$prod_param);
    //     while ($row = $result->fetch_assoc()) {

    //         // $for_withdrawal = 0;
    //         // $fetch_claim_slips = $this->select("tbl_claim_slips", "*", "checked_by=0 and status='F'");
    //         // while($cs_row = $fetch_claim_slips->fetch_array()){
    //         //     // withdrawal_id
    //         //     // sales_id
    //         //     $fetch_stock_withdrawal = $this->select("tbl_stock_withdrawal_details", "sum(qty)", "withdrawal_id='$cs_row[withdrawal_id]' and product_id='$row[product_id]'");
    //         //     $sw_qty = $fetch_stock_withdrawal->fetch_array();
    //         //     $for_withdrawal += $sw_qty[0];
    //         // }

    //         $fetchCS = $this->select("tbl_sales as h, tbl_sales_details as d", "sales_detail_id,customer_id", "h.sales_id=d.sales_id AND h.withdrawal_status=1  AND h.for_pick_up=1 AND h.status='F' AND d.product_id='$row[product_id]' AND (h.sales_date >= '$start_date' AND h.sales_date <= '$end_date') GROUP BY d.sales_detail_id");
    //         $for_withdrawal = 0;
    //         $count = "";
    //         while ($row2 = $fetchCS->fetch_assoc()) {
    //             $for_withdrawal += $StockWithdrawal->remaining_qty($row2['sales_detail_id']);
    //             $count .= $StockWithdrawal->remaining_qty($row2['sales_detail_id']) > 0 
    //             ? $StockWithdrawal->remaining_qty($row2['sales_detail_id'])." (". $row2['sales_detail_id'] .") - " : "" ; 
    //         }

    //         if($for_withdrawal > 0){

    //         $on_hand = $Inventory->balance($row['product_id']);

    //         $row['item'] = $row['product_name'];
    //         $row['on_hand'] = number_format(($on_hand+$for_withdrawal),2);
    //         $row['for_withdrawal'] = number_format($for_withdrawal,2);
    //         $row['available'] = number_format(($on_hand),2);

    //         $rows[] = $row;

    //     }
    //     }

    //     return $rows;
    // }
    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select("$this->table s LEFT JOIN tbl_customers c ON s.customer_id=c.customer_id LEFT JOIN tbl_users u ON s.encoded_by=u.user_id LEFT JOIN tbl_warehouses w ON s.warehouse_id=w.warehouse_id", "s.*, c.customer_id, c.customer_name, c.suki_card_number, u.user_fullname, w.warehouse_name", $param);
        while ($row = $result->fetch_assoc()) {
            $customer_name = $row['customer_id'] > 0 ? $row['customer_name'] : 'Walk-in';
            $row['withdrawal_ref'] = $row['reference_number'] . " (Customer: " . $customer_name . ")";
            $rows[] = $row;
        }
        return $rows;
    }


    public function per_item()
    {
        $product_id = $this->inputs['product_id'];
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];

        if ($product_id == -1) {
            $prod_param = "";
        } else {
            $prod_param = "p.product_id='$product_id' AND ";
        }

        $StockWithdrawal = new StockWithdrawal;
        $Inventory = new InventoryReport();
        $SalesReturn = new SalesReturn;
        $result = $this->select("tbl_products p LEFT JOIN tbl_sales_details d ON p.product_id=d.product_id LEFT JOIN tbl_sales h ON h.sales_id=d.sales_id", "*", "$prod_param h.withdrawal_status=1 AND h.for_pick_up=1 AND h.status='F' 
        AND (h.sales_date >= '$start_date' AND h.sales_date <= '$end_date') GROUP BY p.product_id");
        $rows = [];
        while ($row = $result->fetch_assoc()) {
            $fetchCS = $this->select("tbl_sales as h, tbl_sales_details as d", "sum(d.quantity) as total_qty, sales_detail_id,customer_id", "h.sales_id=d.sales_id AND h.withdrawal_status=1 AND h.for_pick_up=1 AND h.status='F' AND d.product_id='$row[product_id]' AND (h.sales_date >= '$start_date' AND h.sales_date <= '$end_date') GROUP BY d.sales_detail_id");
            $for_withdrawal = 0;
            $total_released = 0;
            $count = "";
            while ($row2 = $fetchCS->fetch_assoc()) {
                $return_qty = $SalesReturn->return_by_sd_id($row2['sales_detail_id']);
                $total_release = $StockWithdrawal->pickup_out($row2['sales_detail_id']);
                $remainingqty = $row2['total_qty'] - $total_release - $return_qty;
                $remaining_qty = $remainingqty < 0 ? 0 : $remainingqty;

                $total_released += $total_release;
                $for_withdrawal += $remaining_qty;
                $count .= $remaining_qty > 0 ? $remaining_qty . " (" . $row2['sales_detail_id'] . ") - " : "";
            }

            // if ($for_withdrawal > 0) {

            $on_hand = $Inventory->balance($row['product_id']);

            // $row['item'] = $row['product_name'];
            // $row['on_hand'] = number_format(($on_hand + $for_withdrawal), 2);
            // $row['for_withdrawal'] = number_format($for_withdrawal, 2);
            // $row['available'] = number_format(($on_hand), 2);

            $rows[] = [
                'item' => $row['product_name'],
                'on_hand' => number_format(($on_hand + $for_withdrawal), 2),
                'for_withdrawal' => number_format($for_withdrawal, 2),
                'total_released' => number_format($total_released, 2),
                'available' => number_format($on_hand, 2)
            ];
            // }
            // $rows[] = $row;
        }

        return $rows;
    }

    public function per_day()
    {

        $branch_id = $this->getBranch();
        $today_date = date('Y-m-d', strtotime($this->getCurrentDate()));
        $result = $this->select("tbl_products p LEFT JOIN tbl_stock_withdrawal_details d ON p.product_id=d.product_id LEFT JOIN tbl_stock_withdrawal h ON h.withdrawal_id=d.withdrawal_id LEFT JOIN tbl_claim_slips c ON c.withdrawal_id=h.withdrawal_id", "p.product_name, sum(d.qty) as total", "h.branch_id='$branch_id' AND h.status='F' AND h.withdrawal_date = '$today_date' AND c.sales_id=h.sales_id AND c.status='F' AND c.checked_by > 0 GROUP BY p.product_id");


        $rows = [];
        while ($row = $result->fetch_assoc()) {

            // $on_hand = $Inventory->balance($row['product_id']);

            $rows[] = [
                'item' => $row['product_name'],
                'qty' => number_format($row['total'], 2),
            ];
        }
        return $rows;
    }
}
