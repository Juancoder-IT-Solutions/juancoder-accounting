<?php

class PayableLedger extends Connection
{


    public function view()
    {
        $supplier_id = $this->inputs['supplier_id'];
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];
        
        $rows = array();

        $result = $this->select("tbl_purchase_order","reference_number","supplier_id='$supplier_id' AND (po_date >= '$start_date' AND po_date <= '$end_date') AND status='F' AND po_type='H' UNION ALL SELECT reference_number FROM tbl_supplier_payment WHERE supplier_id='$supplier_id' AND (payment_date >= '$start_date' AND payment_date <= '$end_date') AND status='F' UNION ALL SELECT reference_number FROM tbl_beginning_balance WHERE bb_ref_id='$supplier_id' AND (bb_date >= '$start_date' AND bb_date <= '$end_date') AND bb_module='AP' UNION ALL SELECT reference_number FROM tbl_credit_memo WHERE account_id='$supplier_id' AND (memo_date >= '$start_date' AND memo_date <= '$end_date') AND status='F' AND memo_type='AP' UNION ALL SELECT reference_number FROM tbl_debit_memo WHERE account_id='$supplier_id' AND (memo_date >= '$start_date' AND memo_date <= '$end_date') AND status='F' AND memo_type='AP'");
        
        $PurchaseOrder = new PurchaseOrder;
        $SupplierPayment = new SupplierPayment;
        $BeginningBalance = new BeginningBalance;
        $PurchaseReturn = new PurchaseReturn;
        $CreditMemo = new CreditMemo;
        $DebitMemo = new DebitMemo;
        $bf = $this->total();
        $balance = (float) $bf[0];
        while ($row = $result->fetch_assoc()) {

            $trans = substr($row['reference_number'], 0, 2);

            if($trans == "PO"){
                $trans = "Purchase Order";
                $po_id = $PurchaseOrder->pk_by_name($row['reference_number']);
                $debit = $PurchaseOrder->total($po_id);
                $credit = 0;
                $balance += $debit;
                $date = $PurchaseOrder->get_row($po_id, 'po_date');
                $ref_number = $row['reference_number']." (Invoice: ".$PurchaseOrder->get_row($po_id, 'po_invoice').")";
            }else if($trans == "SP"){
                $trans = "Supplier Payment";
                $id = $SupplierPayment->pk_by_name($row['reference_number']);
                $debit = 0;
                $credit = $SupplierPayment->total($id);
                $balance -= $credit;
                $date = $SupplierPayment->get_row($id, 'payment_date');
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
                $credit = 0;
                $debit = $CreditMemo->total($id);
                $balance += $debit;
                $date = $CreditMemo->get_row($id, 'memo_date');
                $ref_number = $row['reference_number'];
            }else if($trans == "DM"){
                $trans = "Debit Memo";
                $id = $DebitMemo->pk_by_name($row['reference_number']);
                $credit = $DebitMemo->total($id);
                $debit = 0;
                $balance -= $credit;
                $date = $DebitMemo->get_row($id, 'memo_date');
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
        $supplier_id = $this->inputs['supplier_id'];
        $start_date = $this->inputs['start_date'];
        $end_date = $this->inputs['end_date'];

        $get_po = $this->select("tbl_purchase_order as h, tbl_purchase_order_details as d","sum(d.supplier_price*d.qty)","h.supplier_id='$supplier_id' AND h.po_date < '$start_date' AND h.status='F' AND h.po_type='H' AND h.po_id=d.po_id");
        $total_po = $get_po->fetch_array();

       $getPO = $this->select("tbl_purchase_order" , "po_id", "supplier_id='$supplier_id' AND po_date < '$start_date' AND status='F'");
       $total_pr = 0;
       while($poRow = $getPO->fetch_array()){
            $fetch_pr = $this->select("tbl_purchase_return as h, tbl_purchase_return_details as d","sum(d.supplier_price*d.qty_return)","h.status='F' AND h.pr_id=d.pr_id AND h.po_id='$poRow[po_id]'");
            $sum_pr = $fetch_pr->fetch_array();
            $total_pr = $sum_pr[0];
       }

        $get_payment = $this->select("tbl_supplier_payment as h, tbl_supplier_payment_details as d","sum(d.amount)","h.supplier_id='$supplier_id' AND h.payment_date < '$start_date' AND h.status='F' AND h.sp_id=d.sp_id");
        $total_payment = $get_payment->fetch_array();

        $get_bb = $this->select("tbl_beginning_balance","sum(bb_amount)","bb_ref_id='$supplier_id' AND bb_date < '$start_date' AND bb_module='AP'");
        $total_bb = $get_bb->fetch_array();

        
        $get_credit_memo = $this->select("tbl_credit_memo as h, tbl_credit_memo_details as d","sum(d.amount)","h.account_id='$supplier_id' AND h.memo_date < '$start_date'  AND memo_type='AP' AND h.status='F' AND h.cm_id=d.cm_id");
        $total_cm = $get_credit_memo->fetch_array();

        $get_debit_memo = $this->select("tbl_debit_memo as h, tbl_debit_memo_details as d","sum(d.amount)","h.account_id='$supplier_id' AND h.memo_date < '$start_date'  AND memo_type='AP' AND h.status='F' AND h.dm_id=d.dm_id");
        $total_dm = $get_debit_memo->fetch_array();

        $bf = ($total_po[0]+$total_bb[0]+$total_cm[0])-($total_payment[0]+$total_pr+$total_dm[0]);
        $total = "";
        
        return [$bf,$total];
        
    }
    
    public function balance($supplier_id)
    {
       
    }
}
