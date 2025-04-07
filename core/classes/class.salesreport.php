<?php

class SalesReport extends Connection
{
    public $table = "tbl_sales";
    public $table_details = "tbl_sales_details";

    // public function generate_yearly()
    // {
    //     $year = $this->inputs['sales_year'];
    //     $item = $this->inputs['product_category_id'];

    //     if ($item >= 0) {
    //         $param = "product_category_id = '$item'";
    //     } else {
    //         $param = "";
    //     }

    //     $result = $this->select("tbl_products", "*", $param);
    //     $rows = array();
    //     while ($row = $result->fetch_assoc()) {
    //         $row['item'] = $row['product_name'];
    //         $count = 1;
    //         while ($count <= 12) {
    //             $fetchSAles = $this->select("tbl_sales as h, tbl_sales_details as d", "sum(quantity*price) as amount", "d.product_id='$row[product_id]' AND h.sales_id=d.sales_id AND YEAR(h.sales_date) = '$year' AND MONTH(h.sales_date) = '$count' AND h.status='F'");
    //             $sRow = $fetchSAles->fetch_array();
    //             $row[$count] = ($sRow['amount'] <= 0 ? "" : number_format($sRow['amount'], 2));
    //             $count++;
    //         }
    //         $rows[] = $row;
    //     }
    //     return $rows;
    // }

    public function generate_yearly()
    {
        $year = $this->inputs['sales_year'];
        $item = $this->inputs['product_category_id'];
        $branch_id = $this->getBranch();

        if ($item >= 0) {
            $param = "AND p.product_category_id = '$item'";
        } else {
            $param = "";
        }

        // Construct a single SQL query to fetch yearly sales for all products
        $result =  $this->select("tbl_products AS p
        INNER JOIN tbl_sales_details AS d ON p.product_id = d.product_id
        INNER JOIN tbl_sales AS h ON h.sales_id = d.sales_id", "p.product_id, p.product_name,
        SUM(CASE WHEN MONTH(h.sales_date) = 1 THEN d.quantity * d.price ELSE 0 END) AS month_1,
        SUM(CASE WHEN MONTH(h.sales_date) = 2 THEN d.quantity * d.price ELSE 0 END) AS month_2,
        SUM(CASE WHEN MONTH(h.sales_date) = 3 THEN d.quantity * d.price ELSE 0 END) AS month_3,
        SUM(CASE WHEN MONTH(h.sales_date) = 4 THEN d.quantity * d.price ELSE 0 END) AS month_4,
        SUM(CASE WHEN MONTH(h.sales_date) = 5 THEN d.quantity * d.price ELSE 0 END) AS month_5,
        SUM(CASE WHEN MONTH(h.sales_date) = 6 THEN d.quantity * d.price ELSE 0 END) AS month_6,
        SUM(CASE WHEN MONTH(h.sales_date) = 7 THEN d.quantity * d.price ELSE 0 END) AS month_7,
        SUM(CASE WHEN MONTH(h.sales_date) = 8 THEN d.quantity * d.price ELSE 0 END) AS month_8,
        SUM(CASE WHEN MONTH(h.sales_date) = 9 THEN d.quantity * d.price ELSE 0 END) AS month_9,
        SUM(CASE WHEN MONTH(h.sales_date) = 10 THEN d.quantity * d.price ELSE 0 END) AS month_10,
        SUM(CASE WHEN MONTH(h.sales_date) = 11 THEN d.quantity * d.price ELSE 0 END) AS month_11,
        SUM(CASE WHEN MONTH(h.sales_date) = 12 THEN d.quantity * d.price ELSE 0 END) AS month_12", "YEAR(h.sales_date) = '$year' AND h.status = 'F' AND h.branch_id = '$branch_id' $param GROUP BY p.product_id, p.product_name");

        $rows = array();
        while ($row = $result->fetch_assoc()) {
            // Format the monthly sales amounts
            for ($i = 1; $i <= 12; $i++) {
                $row[$i] = number_format($row["month_$i"], 2);
            }
            unset($row["month_1"], $row["month_2"], $row["month_3"], $row["month_4"], $row["month_5"], $row["month_6"], $row["month_7"], $row["month_8"], $row["month_9"], $row["month_10"], $row["month_11"], $row["month_12"]);
            $row['item'] = $row['product_name'];

            $rows[] = $row;
        }

        return $rows;
    }


    public function generate_daily()
    {
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        $branch_id = $this->getBranch();

        $item = $this->inputs['product_category_id'];

        if ($item >= 0) {
            $param = "p.product_category_id = '$item' AND";
        } else {
            $param = "";
        }

        $result = $this->select("tbl_products as p INNER JOIN tbl_sales_details as d ON p.product_id = d.product_id INNER JOIN tbl_sales as h ON h.sales_id = d.sales_id", "p.product_id, p.product_name, SUM(d.quantity) as qty, sum(d.discount) as total_discount, SUM(d.quantity * d.price) as amount", "$param h.sales_date >= '$start_date' AND h.sales_date <= '$end_date' AND h.status = 'F' AND h.branch_id = '$branch_id' GROUP BY p.product_id, p.product_name");
        $rows = array();
        while ($row = $result->fetch_assoc()) {
            $total = $row['amount'] - $row['total_discount'];
            $row['item'] = $row['product_name'];
            $row['qty'] = number_format($row['qty'], 2);
            $row['discount'] = number_format($row['total_discount'], 2);
            $row['amount'] = number_format($row['amount'], 2);
            $row['net_amount'] = number_format($total, 2);
            $rows[] = $row;
        }

        return $rows;
    }



    public function generate_cashier()
    {
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        $user_id = $this->inputs['user_id'];
        $branch_id = $this->getBranch();

        if ($user_id >= 0) {
            $param = "AND h.encoded_by = '$user_id'";
        } else {
            $param = "";
        }

        $result = $this->select("tbl_products", "*", "");
        $rows = array();
        while ($row = $result->fetch_assoc()) {

            $row['item'] = Products::name($row['product_id']);
            // $fetchSAles = $this->select("tbl_sales as h, tbl_sales_details as d, tbl_users as u", "sum((quantity*price)-discount) as amount, sum(quantity) as qty", "d.product_id='$row[product_id]' AND u.user_category='C' AND u.user_id=h.encoded_by $param AND h.sales_id=d.sales_id AND (h.sales_date >= '$start_date' AND h.sales_date <= '$end_date') AND h.status='F'");

            $fetchSAles = $this->select("tbl_sales as h INNER JOIN tbl_sales_details as d ON h.sales_id = d.sales_id INNER JOIN tbl_users as u ON u.user_id = h.encoded_by","SUM((d.quantity * d.price) - d.discount) as amount, SUM(d.quantity) as qty","d.product_id='$row[product_id]' AND u.user_category='C' AND (h.sales_date >= '$start_date' AND h.sales_date <= '$end_date') AND h.status='F' AND h.branch_id = '$branch_id'");



            $sRow = $fetchSAles->fetch_array();

            $row['qty'] = number_format($sRow['qty'], 2);
            $row['amount'] = number_format($sRow['amount'], 2);

            $rows[] = $row;
        }
        return $rows;
    }

    public function generate_customer()
    {
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        $customer_id = $this->inputs['customer_id'];
        $branch_id = $this->getBranch();

        if ($customer_id >= 0) {
            $param = "AND h.customer_id = '$customer_id'";
        } else {
            $param = "";
        }

        $result = $this->select("tbl_products", "*", "");
        $rows = array();
        while ($row = $result->fetch_assoc()) {

            $row['item'] = Products::name($row['product_id']);
            $fetchSAles = $this->select("tbl_sales as h, tbl_sales_details as d", "sum((quantity*price)-discount) as amount, sum(quantity) as qty", "d.product_id='$row[product_id]' $param AND h.sales_id=d.sales_id AND (h.sales_date >= '$start_date' AND h.sales_date <= '$end_date') AND h.status='F' AND h.branch_id = '$branch_id'");
            $sRow = $fetchSAles->fetch_array();

            $row['qty'] = number_format($sRow['qty'], 2);
            $row['amount'] = number_format($sRow['amount'], 2);

            $rows[] = $row;
        }
        return $rows;
        
    }

    public function generate_summary()
    {
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        $user_id = $this->inputs['user_id'];

        if ($user_id >= 0) {
            $param = "AND cashier_id = '$user_id'";
        } else {
            $param = "";
        }

        $Sales = new Sales();
        //$SalesReturn = new SalesReturn();
        $result = $this->select("tbl_sales_summary", "*", "(date_added >= '$start_date' AND date_added <= '$end_date') AND status='F' $param");
        $rows = array();
        while ($row = $result->fetch_assoc()) {

            //$total_return = $SalesReturn->total_return_per_summary($row['sales_summary_id']);

            $row['cashier'] = Users::name($row['cashier_id']);
            $row['starting_balance'] = number_format($row['starting_balance'], 2);
            $row['total_sales_amount'] = number_format($row['total_sales_amount'], 2);
            $row['total_sales_cash'] = number_format($Sales->total_cash_sales_summary($row['sales_summary_id']), 2);
            $row['total_sales_charge'] = number_format($Sales->total_charge_sales_summary($row['sales_summary_id']), 2);
            $row['total_amount_collected'] = number_format($row['total_amount_collected'], 2);
            $row['total_deficit'] = number_format($row['total_deficit'], 2);
            $row['date'] = date('M d, Y h:m A', strtotime($row["date_added"]));


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
