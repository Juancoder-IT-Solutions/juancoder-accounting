<?php

class ReceivableLedger extends Connection
{

    public function view(){
        $customer_id = $this->inputs['customer_id'];
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];

        $rows = array();

        $result = $this->select("tbl_sales","reference_number, 'Sales' AS module_name, sales_date AS transaction_date, total_sales_amount as debit, 0 AS credit","customer_id='$customer_id' AND (sales_date >= '$start_date' AND sales_date <= '$end_date') AND (STATUS='F' OR STATUS='P') AND sales_type='H' UNION ALL SELECT reference_number, 'Customer Payment' AS module_name, payment_date AS transaction_date, 0 as debit, SUM(cd.amount) AS credit FROM tbl_customer_payment_details cd LEFT JOIN tbl_customer_payment c ON c.cp_id=cd.cp_id WHERE customer_id='$customer_id' AND (payment_date >= '$start_date' AND payment_date <= '$end_date') AND STATUS='F' GROUP BY c.cp_id UNION ALL SELECT reference_number, 'Beginning Balance' AS module_name, bb_date AS transaction_date, bb_amount AS debit, 0 as credit FROM tbl_beginning_balance WHERE bb_ref_id='$customer_id' AND (bb_date >= '$start_date' AND bb_date <= '$end_date') AND bb_module='AR' UNION ALL SELECT reference_number, 'Credit Memo' AS module_name, memo_date AS transaction_date, 0 AS debit, SUM(cmd.amount) as credit FROM tbl_credit_memo_details cmd LEFT JOIN tbl_credit_memo cm ON cm.cm_id=cmd.cm_id WHERE account_id='$customer_id' AND (memo_date >= '$start_date' AND memo_date <= '$end_date') AND memo_type='AR' AND STATUS='F' GROUP BY cm.cm_id UNION ALL SELECT reference_number, 'Debit Memo' AS module_name, memo_date AS transaction_date, SUM(dmd.amount) AS debit, 0 as credit FROM tbl_debit_memo_details dmd LEFT JOIN tbl_debit_memo dm ON dmd.dm_id=dm.dm_id WHERE account_id='$customer_id' AND (memo_date >= '$start_date' AND memo_date <= '$end_date') AND memo_type='AR' AND STATUS='F' GROUP BY dm.dm_id");
        
        $bf = $this->total();
        $balance = (float) $bf[0];
        while ($row = $result->fetch_assoc()) {
            $row['date'] = $row['transaction_date'];
            $row['reference_number'] = $row['reference_number'];
            $row['transaction'] = $row['module_name'];

            $debit = $row['debit'];
            $credit = $row['credit'];
            $row['debit'] = number_format($row['debit'],2);
            $row['credit'] = number_format($row['credit'],2);
            $balance += $debit;
            $balance -= $credit;
            $row['balance'] = number_format($balance,2);
            $rows[] = $row;
        }
        return $rows;
    }

    public function view_old()
    {
        $customer_id = $this->inputs['customer_id'];
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        
        $rows = array();

        $result = $this->select("tbl_sales","reference_number","customer_id='$customer_id' AND (sales_date >= '$start_date' AND sales_date <= '$end_date') AND (status='F' OR status='P') AND sales_type='H' UNION ALL SELECT reference_number FROM tbl_customer_payment WHERE customer_id='$customer_id' AND (payment_date >= '$start_date' AND payment_date <= '$end_date') AND status='F' UNION ALL SELECT reference_number FROM tbl_beginning_balance WHERE bb_ref_id='$customer_id' AND (bb_date >= '$start_date' AND bb_date <= '$end_date') AND bb_module='AR' UNION ALL SELECT reference_number FROM tbl_credit_memo WHERE account_id='$customer_id' AND (memo_date >= '$start_date' AND memo_date <= '$end_date') AND status='F' AND memo_type='AR' UNION ALL SELECT reference_number FROM tbl_debit_memo WHERE account_id='$customer_id' AND (memo_date >= '$start_date' AND memo_date <= '$end_date') AND status='F' AND memo_type='AR'");
        
        $Sales = new Sales;
        $CustomerPayment = new CustomerPayment;
        $BeginningBalance = new BeginningBalance;
        $CreditMemo = new CreditMemo;
        $DebitMemo = new DebitMemo;
        $bf = $this->total();
        $balance = (float) $bf[0];
        while ($row = $result->fetch_assoc()) {

            $trans = substr($row['reference_number'], 0, 2);

            if($trans == "CP"){
                $trans = "Customer Payment";
                $id = $CustomerPayment->pk_by_name($row['reference_number']);
                $debit = 0;
                $credit = $CustomerPayment->total($id);
                $balance -= $credit;
                $date = $CustomerPayment->dataRow($id, 'payment_date');
                $ref_number = $row['reference_number'];
            }else if($trans == "BB"){
                $trans = "Beginning Balance";
                $id = $BeginningBalance->pk_by_name($row['reference_number']);
                $debit = $BeginningBalance->total($id);
                $credit = 0;
                $balance += $debit;
                $date = $BeginningBalance->get_row($id, 'bb_date');
                $ref_number = $row['reference_number'];
            }else if($trans == "CM"){
                $trans = "Credit Memo";
                $id = $CreditMemo->pk_by_name($row['reference_number']);
                $credit = $CreditMemo->total($id);
                $debit = 0;
                $balance -= $credit;
                $date = $CreditMemo->get_row($id, 'memo_date');
                $ref_number = $row['reference_number'];
            }else if($trans == "DM"){
                $trans = "Debit Memo";
                $id = $DebitMemo->pk_by_name($row['reference_number']);
                $credit = 0;
                $debit = $DebitMemo->total($id);
                $balance += $debit;
                $date = $DebitMemo->get_row($id, 'memo_date');
                $ref_number = $row['reference_number'];
            }else{
                $trans = "Sales";
                $id = $Sales->pk_by_name($row['reference_number']);
                $debit = ($Sales->total($id));
                $credit = 0;
                $balance += $debit;
                $date = $Sales->dataRow($id, 'sales_date');
                $ref_number = $row['reference_number'];
            }

            $row['date'] = $date;
            $row['reference_number'] = $ref_number;
            $row['transaction'] = $trans;
            $row['debit'] = number_format($debit,2);
            $row['credit'] = number_format($credit,2);
            $row['balance'] = number_format($balance,2);
            $rows[] = $row;
        }
        return $rows;
    }

    public function total(){
        $customer_id = $this->inputs['customer_id'];
        $start_date = $this->inputs['start_date'];

        $fetch_total_sales = $this->select("tbl_sales","SUM(total_sales_amount)","customer_id='$customer_id' AND sales_date < '$start_date' AND sales_type='H' AND (status='F' OR status='P')");
        $total_sales_row = $fetch_total_sales->fetch_array();
        //$fetch_total_return = $this->select("tbl_sales_return h LEFT JOIN tbl_sales_return_details d ON h.sales_return_id=d.sales_return_id","sum((d.quantity_return*d.price)-(d.discount/d.quantity))","h.status='F' AND h.sales_id IN (SELECT sales_id FROM tbl_sales where customer_id='$customer_id' AND sales_date < '$start_date' AND sales_type='H' AND (status='F' OR status='P'))");
        //$total_return_row = $fetch_total_return->fetch_array();

        $get_payment = $this->select("tbl_customer_payment as h, tbl_customer_payment_details as d","sum(d.amount)","h.customer_id='$customer_id' AND h.payment_date < '$start_date' AND h.status='F' AND h.cp_id=d.cp_id");
        $total_payment = $get_payment->fetch_array();

        $get_credit_memo = $this->select("tbl_credit_memo as h, tbl_credit_memo_details as d","sum(d.amount)","h.account_id='$customer_id' AND h.memo_date < '$start_date'  AND memo_type='AR' AND h.status='F' AND h.cm_id=d.cm_id");
        $total_cm = $get_credit_memo->fetch_array();

        $get_debit_memo = $this->select("tbl_debit_memo as h, tbl_debit_memo_details as d","sum(d.amount)","h.account_id='$customer_id' AND h.memo_date < '$start_date'  AND memo_type='AR' AND h.status='F' AND h.dm_id=d.dm_id");
        $total_dm = $get_debit_memo->fetch_array();

        $get_bb = $this->select("tbl_beginning_balance","sum(bb_amount)","bb_ref_id='$customer_id' AND bb_date < '$start_date' AND bb_module='AR'");
        $total_bb = $get_bb->fetch_array();
        
        $total_sr = 0;

        $bf = ($total_sales_row[0]+$total_bb[0]+$total_dm[0])-($total_payment[0]+$total_sr+$total_cm[0]);
        $total = "";
        
        return [$bf,$total];

    }

    public function total_old()
    {
        $customer_id = $this->inputs['customer_id'];
        $start_date = $this->inputs['start_date'];

        $get_sales = $this->select("tbl_sales as h, tbl_sales_details as d","sum((d.quantity*d.price)-d.discount)","h.customer_id='$customer_id' AND h.sales_date < '$start_date' AND h.sales_type='H' AND (h.status='F' OR h.status='P') AND h.sales_id=d.sales_id");
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

        $get_credit_memo = $this->select("tbl_credit_memo as h, tbl_credit_memo_details as d","sum(d.amount)","h.account_id='$customer_id' AND h.memo_date < '$start_date'  AND memo_type='AR' AND h.status='F' AND h.cm_id=d.cm_id");
        $total_cm = $get_credit_memo->fetch_array();

        $get_debit_memo = $this->select("tbl_debit_memo as h, tbl_debit_memo_details as d","sum(d.amount)","h.account_id='$customer_id' AND h.memo_date < '$start_date'  AND memo_type='AR' AND h.status='F' AND h.dm_id=d.dm_id");
        $total_dm = $get_debit_memo->fetch_array();

        $get_bb = $this->select("tbl_beginning_balance","sum(bb_amount)","bb_ref_id='$customer_id' AND bb_date < '$start_date' AND bb_module='AR'");
        $total_bb = $get_bb->fetch_array();

        $bf = ($total_sales[0]+$total_bb[0]+$total_dm[0])-($total_payment[0]+$total_sr+$total_cm[0]);
        $total = "";
        
        return [$bf,$total];
        
    }
    
}
