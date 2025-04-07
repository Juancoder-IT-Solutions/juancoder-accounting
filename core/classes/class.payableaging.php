<?php

class PayableAging extends Connection
{


    public function view()
    {
        $supplier_id = $this->inputs['supplier_id'];
        
        $rows = array();

        $result = $this->select("tbl_purchase_order","reference_number","supplier_id='$supplier_id' AND status='F' AND po_type='H' UNION ALL SELECT reference_number FROM tbl_beginning_balance WHERE bb_ref_id='$supplier_id' AND bb_module='AP'");
        
        $PurchaseOrder = new PurchaseOrder;
        $SupplierPayment = new SupplierPayment;
        $BeginningBalance = new BeginningBalance;
        $balance = 0;
        $count = 1;
        while ($row = $result->fetch_assoc()) {

            $trans = substr($row['reference_number'], 0, 2);

            if($trans == "PO"){
                $trans = "PurchaseOrder";
                $id = $PurchaseOrder->pk_by_name($row['reference_number']);
                $net_amount = ($PurchaseOrder->total($id));
                $amount_paid = $SupplierPayment->total_paid($id, "PO");
                $balance += $net_amount;
                $date = $PurchaseOrder->get_row($id, 'po_date');
                $ref_number = $row['reference_number'];
            }else if($trans == "BB"){
                $trans = "Beginning Balance";
                $id = $BeginningBalance->pk_by_name($row['reference_number']);
                $net_amount = $BeginningBalance->total($id);
                $amount_paid = $SupplierPayment->total_paid($id, "BB");
                $balance += $net_amount;
                $date = $BeginningBalance->get_row($id, 'bb_date');
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
}
