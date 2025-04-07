<?php

ini_set('max_execution_time', -1);

class ReceivableReport extends Connection
{
    public $table = "tbl_customers";

    public function view()
    {
        $customer_id = $this->inputs['customer_id'];
        $rows = array();

        if ($customer_id == -1) {
            $query = "";
        } else {
            $query = "customer_id='$customer_id'";
        }

        $result = $this->select($this->table, "*", $query);

        $count = 1;
        while ($row = $result->fetch_assoc()) {
            $bal = $this->balance($row['customer_id']);
            $row['balance'] = number_format($bal, 2);
            $row['total'] = $bal;
            $row['count'] = $count++;
            $rows[] = $row;
        }
        return $rows;
    }


    public function balance_old($customer_id)
    {
        $get_payment_h = $this->select("tbl_customer_payment AS ch, tbl_customer_payment_details AS cd", "SUM(cd.amount) as total", "ch.customer_id='$customer_id' AND ch.cp_id=cd.cp_id AND cd.type='DR' AND ch.status='F'");
        $payment_h = $get_payment_h->fetch_assoc();

        $get_sales = $this->select("tbl_sales as h, tbl_sales_details AS d", "SUM((d.price*d.quantity)-d.discount) as total", "h.customer_id='$customer_id' AND d.sales_id=h.sales_id AND h.status='F' AND h.sales_type='H'");
        $sales_row = $get_sales->fetch_assoc();

        $get_sr = $this->select("tbl_sales as h, tbl_sales_details AS d, tbl_sales_return as sr, tbl_sales_return_details as srd", "SUM((srd.quantity_return*srd.price)-(srd.discount/srd.quantity*srd.quantity_return)) as total", "h.customer_id='$customer_id' AND d.sales_id=h.sales_id AND h.status='F' AND h.sales_type='H' AND sr.sales_return_id=srd.sales_return_id AND sr.status='F' AND sr.sales_id=h.sales_id AND d.sales_detail_id=srd.sales_detail_id");
        $sr_row = $get_sr->fetch_assoc();

        $get_bb = $this->select("tbl_beginning_balance", "SUM(bb_amount) as total", "bb_ref_id='$customer_id' AND bb_module='AR'");
        $bb_row = $get_bb->fetch_assoc();

        $get_payment_bb = $this->select("tbl_customer_payment AS ch, tbl_customer_payment_details AS cd", "SUM(cd.amount) as total", "ch.customer_id='$customer_id' AND ch.cp_id=cd.cp_id AND cd.type='BB' AND ch.status='F' AND ch.status='F'");
        $payment_bb = $get_payment_bb->fetch_assoc();

        $get_credit_memo = $this->select("tbl_credit_memo as h, tbl_credit_memo_details as d", "sum(d.amount)", "h.account_id='$customer_id'  AND memo_type='AR' AND h.status='F' AND h.cm_id=d.cm_id");
        $total_cm = $get_credit_memo->fetch_array();

        $get_debit_memo = $this->select("tbl_debit_memo as h, tbl_debit_memo_details as d", "sum(d.amount)", "h.account_id='$customer_id'  AND memo_type='AR' AND h.status='F' AND h.dm_id=d.dm_id");
        $total_dm = $get_debit_memo->fetch_array();

        return (($sales_row['total'] - $sr_row['total']) + $bb_row['total'] + $total_dm[0]) - ($payment_h['total'] + $payment_bb['total'] + $total_cm[0]);
    }

    public function balance($customer_id)
    {
        $result = $this->select("tbl_sales", "reference_number, total_sales_amount AS total, 'Sales' AS module_name, 'DR' as module_code, sales_date as transaction_date, date_added, sales_id as ref_id", "customer_id='$customer_id' AND sales_type='H' AND status='F' UNION ALL SELECT reference_number, bb_amount as total, 'Beginning Balance' AS module_name, 'BB' as module_code, bb_date as transaction_date, date_added, bb_id as ref_id FROM tbl_beginning_balance WHERE bb_ref_id='$customer_id' AND bb_module='AR' AND bb_paid_status=0 ORDER BY date_added ASC");
        $balance = 0;
        while ($row = $result->fetch_assoc()) {
            $fetch_total_return = $this->select("tbl_sales_return h LEFT JOIN tbl_sales_return_details d ON h.sales_return_id=d.sales_return_id", "sum((d.quantity_return*d.price)-(d.discount/d.quantity))", "h.status='F' AND h.sales_id='$row[ref_id]'");
            $total_return = $fetch_total_return->fetch_array();


            $fetch_payment = $this->select("tbl_customer_payment h LEFT JOIN tbl_customer_payment_details d ON h.cp_id=d.cp_id", "sum(d.amount) as total", "h.status='F' AND d.ref_id='$row[ref_id]' AND d.type='$row[module_code]' AND h.customer_id='$customer_id'");
            $payment_row = $fetch_payment->fetch_assoc();
            $total_payment = $payment_row['total'] > 0 ? $payment_row['total'] : 0;

            $get_credit_memo = $this->select("tbl_credit_memo as h, tbl_credit_memo_details as d", "sum(d.amount)", "h.account_id='$customer_id' AND d.reference_id='$row[ref_id]' AND h.memo_type='AR' AND h.status='F' AND h.cm_id=d.cm_id");
            $total_cm = $get_credit_memo->fetch_array();

            $get_debit_memo = $this->select("tbl_debit_memo as h, tbl_debit_memo_details as d", "sum(d.amount)", "h.account_id='$customer_id' AND d.reference_id='$row[ref_id]' AND memo_type='AR' AND h.status='F' AND h.dm_id=d.dm_id");
            $total_dm = $get_debit_memo->fetch_array();

            $total_dr = ($row['total'] + $total_dm[0]) - ($total_payment + $total_cm[0]+$total_return[0]);
            $balance += $total_dr;
        }

        return $balance;
    }



    public function show_unpaid()
    {
        $customer_id = isset($this->inputs['customer_id']) ? $this->inputs['customer_id'] : null;
        $customer_terms = $this->inputs['customer_terms'];
        $rows = array();

        //$result = $this->select("tbl_sales", "reference_number, total_sales_amount AS total, 'Sales' AS module_name, 'DR' as module_code, sales_date as transaction_date, date_added, sales_id as ref_id", "customer_id='$customer_id' AND sales_type='H' AND (STATUS='F' OR STATUS='P') UNION ALL SELECT reference_number, bb_amount as total, 'Beginning Balance' AS module_name, 'BB' as module_code, bb_date as transaction_date, date_added, bb_id as ref_id FROM tbl_beginning_balance WHERE bb_ref_id='$customer_id' AND bb_module='AR' AND bb_paid_status=0 ORDER BY date_added ASC");

        $result = $this->select("tbl_sales s LEFT JOIN tbl_customer_payment_details cd ON cd.ref_id=s.sales_id LEFT JOIN tbl_customer_payment c ON c.cp_id=cd.cp_id", "s.sales_id as id, s.reference_number, total_sales_amount AS total, SUM(IF((c.`status`='F' AND cd.`type`='DR'),cd.amount,0)) AS total_payment, total_sales_amount - SUM(IF((c.`status`='F' AND cd.`type`='DR'),cd.amount,0)) AS balance, 'Sales' AS module_name, 'DR' as module_code, s.sales_date as transaction_date, s.date_added, s.sales_id as ref_id", "s.customer_id='$customer_id' AND s.sales_type='H' AND s.`status`='F' GROUP BY s.sales_id HAVING balance > 0 UNION ALL SELECT b.bb_id as id, b.reference_number, bb_amount as total, SUM(IF((c.`status`='F' AND cd.`type`='BB'),cd.amount,0)) AS total_payment, bb_amount - SUM(IF((c.`status`='F' AND cd.`type`='BB'),cd.amount,0)) AS balance, 'Beginning Balance' AS module_name, 'BB' as module_code, bb_date as transaction_date, b.date_added, bb_id as ref_id FROM tbl_beginning_balance b LEFT JOIN tbl_customer_payment_details cd ON cd.ref_id=b.bb_id LEFT JOIN tbl_customer_payment c ON c.cp_id=cd.cp_id WHERE bb_ref_id='1' AND bb_module='AR' AND bb_paid_status=0 GROUP BY b.bb_id HAVING balance > 0 ORDER BY date_added ASC");

        $rows = array();
        $balance = 0;
        while ($row = $result->fetch_assoc()) {
            $get_credit_memo = $this->select("tbl_credit_memo as h, tbl_credit_memo_details as d", "sum(d.amount)", "h.account_id='$customer_id' AND d.reference_id='$row[id]' AND h.memo_type='AR' AND h.status='F' AND h.cm_id=d.cm_id");
            $total_cm = $get_credit_memo->fetch_array();

            $get_debit_memo = $this->select("tbl_debit_memo as h, tbl_debit_memo_details as d", "sum(d.amount)", "h.account_id='$customer_id' AND d.reference_id='$row[id]' AND memo_type='AR' AND h.status='F' AND h.dm_id=d.dm_id");
            $total_dm = $get_debit_memo->fetch_array();

            $fetch_total_return = $this->select("tbl_sales_return h LEFT JOIN tbl_sales_return_details d ON h.sales_return_id=d.sales_return_id", "sum((d.quantity_return*d.price)-(d.discount/d.quantity))", "h.status='F' AND h.sales_id='$row[id]'");
            $total_return = $fetch_total_return->fetch_array();

            $total_dr = ($row['total'] + $total_dm[0]) - ($total_cm[0]+$total_return[0]);
            $total_payment = $row['total_payment'];

            $row['debit'] = $total_dr;
            $row['credit'] = $total_payment;
            $row['label_debit'] = number_format($total_dr, 2);
            $row['label_credit'] = number_format($total_payment, 2);
            $row['reference_number'] = $row['reference_number'];
            $row['transaction_date'] = $row['transaction_date'];
            $balance += $total_dr;
            $balance -= $total_payment;
            $row['balance'] = $balance;
            $row['label_balance'] = number_format($balance, 2);
            $row['due_date'] = date('Y-m-d', strtotime($row['transaction_date'] . ' + ' . $customer_terms . ' days'));
            $row['remarks'] = $row['module_name'];
            $rows[] = $row;
        }

        return $rows;
    }

    public function show_unpaid_old()
    {
        $Sales = new Sales;
        $BeginningBalance = new BeginningBalance;
        $CustomerPayment = new CustomerPayment;
        $customer_id = isset($this->inputs['customer_id']) ? $this->inputs['customer_id'] : null;
        $customer_terms = $this->inputs['customer_terms'];
        $rows = array();

        $result = $this->select("tbl_sales", "reference_number", "customer_id='$customer_id' AND status='F' AND paid_status='0' AND sales_type='H' UNION ALL SELECT reference_number FROM tbl_beginning_balance WHERE bb_ref_id='$customer_id' AND bb_module='AR' AND bb_paid_status= 0");

        while ($row = $result->fetch_assoc()) {
            $trans = substr($row['reference_number'], 0, 2);
            if ($trans == "BB") {
                $row = $BeginningBalance->rows($row['reference_number']);
                $bb_id = $row['bb_id'];


                $terms = $customer_terms;
                $sales_date = $row['bb_date'];
                $sales_date = $row['sales_date'];
                $due = date('Y-m-d', strtotime($sales_date . ' + ' . $terms . ' days'));

                $row['payment'] =  number_format($CustomerPayment->total_paid($bb_id, "BB"), 2);
                $row['balance'] = number_format($BeginningBalance->bb_balance_ar($bb_id), 2);
                $row['ref_id'] = "BB-" . $bb_id;
                $row['sales_date'] = $sales_date;
                $row['pmamount'] = $CustomerPayment->total_paid($bb_id, "DR");
                $row['dramount'] = $Sales->total($bb_id);
                $row['due_date'] = $due;
                $rows[] = $row;
            } else {
                $row = $Sales->rows($row['reference_number']);
                $sales_id = $row['sales_id'];
                $bal = $Sales->dr_balance($sales_id);
                if ($bal > 0) {
                    $terms = $row['terms'] > 0 ? $row['terms'] : $customer_terms;
                    $sales_date = $row['sales_date'];
                    $due = date('Y-m-d', strtotime($sales_date . ' + ' . $terms . ' days'));

                    $row['payment'] = number_format($CustomerPayment->total_paid($sales_id, "DR"), 2);
                    $row['balance'] = number_format($bal, 2);
                    $row['amount'] = number_format($Sales->total($sales_id));
                    $row['ref_id'] = "DR-" . $sales_id;
                    $row['due_date'] = $due;
                    $row['sales_date'] = $sales_date;
                    $rows[] = $row;
                }
            }
        }
        return $rows;
    }

    public function getSoa()
    {
        $Customers = new Customers;
        $id = $_POST['id'];
        $total = $_POST['total'];
        $row = $Customers->view($id);
        $terms = $row['customer_terms'];
        $row['terms'] = $terms > 1 ? $terms . " days" : $terms . " day";
        $row['total'] = number_format($total, 2);
        $row['amount_to_words'] = "<i>" . strtoupper($this->convertNumberToWord($total)) . " ONLY</i>";
        $row['today'] = date('M d, Y', strtotime($this->getCurrentDate()));
        $rows[] = $row;
        return $rows;
    }


    function convertNumberToWord($num = false)
    {
        $num = str_replace(array(',', ' '), '', trim($num));
        if (!$num) {
            return false;
        }
        $num = (int) $num;
        $words = array();
        $list1 = array(
            '',
            'one',
            'two',
            'three',
            'four',
            'five',
            'six',
            'seven',
            'eight',
            'nine',
            'ten',
            'eleven',
            'twelve',
            'thirteen',
            'fourteen',
            'fifteen',
            'sixteen',
            'seventeen',
            'eighteen',
            'nineteen'
        );
        $list2 = array('', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety', 'hundred');
        $list3 = array(
            '',
            'thousand',
            'million',
            'billion',
            'trillion',
            'quadrillion',
            'quintillion',
            'sextillion',
            'septillion',
            'octillion',
            'nonillion',
            'decillion',
            'undecillion',
            'duodecillion',
            'tredecillion',
            'quattuordecillion',
            'quindecillion',
            'sexdecillion',
            'septendecillion',
            'octodecillion',
            'novemdecillion',
            'vigintillion'
        );
        $num_length = strlen($num);
        $levels = (int) (($num_length + 2) / 3);
        $max_length = $levels * 3;
        $num = substr('00' . $num, -$max_length);
        $num_levels = str_split($num, 3);
        for ($i = 0; $i < count($num_levels); $i++) {
            $levels--;
            $hundreds = (int) ($num_levels[$i] / 100);
            $hundreds = ($hundreds ? ' ' . $list1[$hundreds] . ' hundred' . ' ' : '');
            $tens = (int) ($num_levels[$i] % 100);
            $singles = '';
            if ($tens < 20) {
                $tens = ($tens ? ' ' . $list1[$tens] . ' ' : '');
            } else {
                $tens = (int)($tens / 10);
                $tens = ' ' . $list2[$tens] . ' ';
                $singles = (int) ($num_levels[$i] % 10);
                $singles = ' ' . $list1[$singles] . ' ';
            }
            $words[] = $hundreds . $tens . $singles . (($levels && (int) ($num_levels[$i])) ? ' ' . $list3[$levels] . ' ' : '');
        } //end for loop
        $commas = count($words);
        if ($commas > 1) {
            $commas = $commas - 1;
        }
        return implode(' ', $words);
    }
}
