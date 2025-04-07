<?php

class BankLedger extends Connection
{


    public function view()
    {
        $bank_id = $this->inputs['bank_id'];
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        
        $rows = array();

        $result = $this->select("tbl_supplier_payment","reference_number","bank_id='$bank_id' AND (check_date >= '$start_date' AND check_date <= '$end_date') AND status='F' AND payment_type='H' UNION ALL SELECT reference_number FROM tbl_deposit WHERE bank_id='$bank_id' AND (deposit_date >= '$start_date' AND deposit_date <= '$end_date') AND status='F'");
        
        $SupplierPayment = new SupplierPayment;
        $Deposit = new Deposit;
        $bf = $this->total();
        $balance = (float) $bf[0];
        while ($row = $result->fetch_assoc()) {

            $trans = substr($row['reference_number'], 0, 2);

            if($trans == "SP"){
                $trans = "Supplier Payment";
                $credit = $SupplierPayment->total($SupplierPayment->pk_by_name($row['reference_number']));
                $debit = 0;
                $balance -= $credit;
                $date = $SupplierPayment->get_row($SupplierPayment->pk_by_name($row['reference_number']), 'check_date');
                $ref_number = $row['reference_number']." (Check #: ".$SupplierPayment->get_row($SupplierPayment->pk_by_name($row['reference_number']), 'check_number').")";
            }else if($trans == "DE"){
                $trans = "Deposit";
                $credit = 0;
                $debit = $Deposit->total($Deposit->pk_by_name($row['reference_number']));
                $balance += $debit;
                $date = $Deposit->get_row($Deposit->pk_by_name($row['reference_number']), 'deposit_date');
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

    public function total()
    {
        $bank_id = $this->inputs['bank_id'];
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];

        $get_payment = $this->select("tbl_supplier_payment as h, tbl_supplier_payment_details as d","sum(d.amount)","h.bank_id='$bank_id' AND h.check_date < '$start_date' AND h.status='F' AND h.payment_type='H' AND h.sp_id=d.sp_id");
        $total_payment = $get_payment->fetch_array();

        $get_deposit = $this->select("tbl_deposit as h, tbl_deposit_details as d","sum(d.amount)","h.bank_id='$bank_id' AND h.deposit_date < '$start_date' AND h.status='F' AND h.deposit_id=d.deposit_id");
        $total_deposit = $get_deposit->fetch_array();

        $bf = $total_deposit[0]-$total_payment[0];
        $total = "";
        
        return [$bf,$total];
        
    }
    
    public function balance($bank_id)
    {
       
    }
}
