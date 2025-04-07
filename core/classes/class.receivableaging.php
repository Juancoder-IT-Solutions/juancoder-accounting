<?php

class ReceivableAging extends Connection
{


    public function view()
    {
        $customer_id = $this->inputs['customer_id'];
        
        $rows = array();

        $result = $this->select("tbl_sales","reference_number","customer_id='$customer_id' AND status='F' AND sales_type='H' UNION ALL SELECT reference_number FROM tbl_beginning_balance WHERE bb_ref_id='$customer_id' AND bb_module='AR'");
        
        $Sales = new Sales;
        $CustomerPayment = new CustomerPayment;
        $BeginningBalance = new BeginningBalance;
        $bf = $this->total();
        $balance = (float) $bf[0];
        $count = 1;
        while ($row = $result->fetch_assoc()) {

            $trans = substr($row['reference_number'], 0, 2);


            if($trans == "BB"){
                $trans = "Beginning Balance";
                $id = $BeginningBalance->pk_by_name($row['reference_number']);
                $net_amount = $BeginningBalance->total($id);
                $amount_paid = $CustomerPayment->amount_paid($id, "BB");
                $balance += $net_amount;
                $date = $BeginningBalance->get_row($id, 'bb_date');
                $ref_number = $row['reference_number'];
            }else{
                $trans = "Sales";
                $id = $Sales->pk_by_name($row['reference_number']);
                $net_amount = ($Sales->total($id));
                $amount_paid = $CustomerPayment->amount_paid($id, "DR");
                $balance += $net_amount;
                $date = $Sales->dataRow($id, 'sales_date');
                $ref_number = $row['reference_number'];
            }

            $balance = $net_amount-$amount_paid;

            if($balance > 0){
                $aging_date = $this->daysDifference($this->getCurrentDate(),$date);

                if($aging_date >= 0 AND $aging_date <= 7){
                    $days1 = number_format($balance,2);
                    $days2 = "";
                    $days3 = "";
                    $days4 = "";
                    $days5 = "";
                    $days6 = "";
                    $days7 = "";

                }else if($aging_date >= 8 AND $aging_date <= 15){
                    $days1 = "";
                    $days2 = number_format($balance,2);
                    $days3 = "";
                    $days4 = "";
                    $days5 = "";
                    $days6 = "";
                    $days7 = "";
                }else if($aging_date >= 16 AND $aging_date <= 30){
                    $days1 = "";
                    $days2 = "";
                    $days3 = number_format($balance,2);
                    $days4 = "";
                    $days5 = "";
                    $days6 = "";
                    $days7 = "";
                }else if($aging_date >= 31 AND $aging_date <= 60){
                    $days1 = "";
                    $days2 = "";
                    $days3 = "";
                    $days4 = number_format($balance,2);
                    $days5 = "";
                    $days6 = "";
                    $days7 = "";
                }else if($aging_date >= 61 AND $aging_date <= 90){
                    $days1 = "";
                    $days2 = "";
                    $days3 = "";
                    $days4 = "";
                    $days5 = number_format($balance,2);
                    $days6 = "";
                    $days7 = "";
                }else if($aging_date >= 91 AND $aging_date <= 120){
                    $days1 = "";
                    $days2 = "";
                    $days3 = "";
                    $days4 = "";
                    $days5 = "";
                    $days6 = number_format($balance,2);
                    $days7 = "";
                }else if($aging_date > 120){
                    $days1 = "";
                    $days2 = "";
                    $days3 = "";
                    $days4 = "";
                    $days5 = "";
                    $days6 = "";
                    $days7 = number_format($balance,2);
                }

                $row['count'] = $count++;
                $row['date'] = $date;
                $row['reference_number'] = $ref_number;
                $row['net_amount'] = number_format($net_amount,2);
                $row['amount_paid'] = number_format($amount_paid,2);
                $row['balance'] = number_format($balance,2);
                $row['days1'] = $days1;
                $row['days2'] = $days2;
                $row['days3'] = $days3;
                $row['days4'] = $days4;
                $row['days5'] = $days5;
                $row['days6'] = $days6;
                $row['days7'] = $days7;
                
                $rows[] = $row;
            }

        }
        return $rows;
    }

    public function total()
    {
        $customer_id = $this->inputs['customer_id'];
        $start_date = $this->inputs['start_date'];

        $get_sales = $this->select("tbl_sales as h, tbl_sales_details as d","sum((d.quantity*d.price)-d.discount)","h.customer_id='$customer_id' AND h.sales_date < '$start_date' AND h.sales_type='H' AND h.status='F' AND h.sales_id=d.sales_id");
        $total_sales = $get_sales->fetch_array();

       $getSales = $this->select("tbl_sales" , "sales_id", "customer_id='$customer_id' AND sales_date < '$start_date' AND status='F'");
       $total_sr = 0;
       while($drRow = $getSales->fetch_array()){
            $fetch_sr = $this->select("tbl_sales_return as h, tbl_sales_return_details as d","sum(d.price*d.quantity_return)","h.status='F' AND h.sales_return_id=d.sales_return_id AND h.sales_id='$drRow[sales_id]'");
            $sum_pr = $fetch_sr->fetch_array();
            $total_sr = $sum_pr[0];
       }

        $get_payment = $this->select("tbl_customer_payment as h, tbl_customer_payment_details as d","sum(d.amount)","h.customer_id='$customer_id' AND h.payment_date < '$start_date' AND h.status='F' AND h.cp_id=d.cp_id");
        $total_payment = $get_payment->fetch_array();

        $get_bb = $this->select("tbl_beginning_balance","sum(bb_amount)","bb_ref_id='$customer_id' AND bb_date < '$start_date' AND bb_module='AR'");
        $total_bb = $get_bb->fetch_array();

        $bf = ($total_sales[0]+$total_bb[0])-($total_payment[0]+$total_sr);
        $total = "";
        
        return [$bf,$total];
        
    }

    public function soa_aging()
    {
        $customer_id = $this->inputs['customer_id'];
        
        $rows = array();

        $result = $this->select("tbl_sales","reference_number","customer_id='$customer_id' AND status='F' AND sales_type='H' UNION ALL SELECT reference_number FROM tbl_beginning_balance WHERE bb_ref_id='$customer_id' AND bb_module='AR'");
        
        $Sales = new Sales;
        $CustomerPayment = new CustomerPayment;
        $BeginningBalance = new BeginningBalance;
        $bf = $this->total();
        $balance = (float) $bf[0];
        $count = 1;
        $total_day1 = 0;
        $total_day2 = 0;
        $total_day3 = 0;
        $total_day4 = 0;
        while ($row = $result->fetch_assoc()) {

            $trans = substr($row['reference_number'], 0, 2);

            if($trans == "BB"){
                $trans = "Beginning Balance";
                $id = $BeginningBalance->pk_by_name($row['reference_number']);
                $net_amount = $BeginningBalance->total($id);
                $amount_paid = $CustomerPayment->amount_paid($id, "BB");
                $balance += $net_amount;
                $date = $BeginningBalance->get_row($id, 'bb_date');
                $ref_number = $row['reference_number'];
            }else{
                $trans = "Sales";
                $id = $Sales->pk_by_name($row['reference_number']);
                $net_amount = ($Sales->total($id));
                $amount_paid = $CustomerPayment->amount_paid($id, "DR");
                $balance += $net_amount;
                $date = $Sales->dataRow($id, 'sales_date');
                $ref_number = $row['reference_number'];
            }

            $balance = $net_amount-$amount_paid;

            if($balance > 0){
                $aging_date = $this->daysDifference($this->getCurrentDate(),$date);

                if($aging_date >= 0 AND $aging_date <= 15){
                    $days1 = $balance;
                    $days2 = 0;
                    $days3 = 0;
                    $days4 = 0;

                }else if($aging_date >= 16 AND $aging_date <= 30){
                    $days1 = 0;
                    $days2 = $balance;
                    $days3 = 0;
                    $days4 = 0;
                }else if($aging_date >= 31 AND $aging_date <= 60){
                    $days1 = 0;
                    $days2 = 0;
                    $days3 = $balance;
                    $days4 = 0;
                }else if($aging_date > 61){
                    $days1 = 0;
                    $days2 = 0;
                    $days3 = 0;
                    $days4 = $balance;
                }

                $total_day1 += $days1;
                $total_day2 += $days2;
                $total_day3 += $days3;
                $total_day4 += $days4;
            }

        }

        return array(
            'total_day1' => number_format($total_day1,2),
            'total_day2' => number_format($total_day2,2),
            'total_day3' => number_format($total_day3,2),
            'total_day4' => number_format($total_day4,2),
            'rows' => $rows 
        );

    }

    
    
}
