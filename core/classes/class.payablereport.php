<?php

class PayableReport extends Connection
{
    public $table = "tbl_suppliers";

    public function view()
    {
        $supplier_id = $this->inputs['supplier_id'];
        $rows = array();

        if($supplier_id == -1){
            $query = "";
        }else{
            $query = "supplier_id='$supplier_id'";
        }

        $result = $this->select($this->table, "*", $query);

        $count = 1;
        while ($row = $result->fetch_assoc()) {
            $row['balance'] = number_format($this->balance($row['supplier_id']),2);
            $row['count'] = $count++;
            $rows[] = $row;
        }
        return $rows;
    }

    public function balance($supplier_id)
    {
        $get_payment_po = $this->select("tbl_supplier_payment AS sh, tbl_supplier_payment_details AS sd", "SUM(sd.amount) as total", "sh.supplier_id='$supplier_id' AND sh.sp_id=sd.sp_id AND sd.type='PO' AND sh.status='F'");
        $payment_po = $get_payment_po->fetch_assoc();

        $get_po = $this->select("tbl_purchase_order as po, tbl_purchase_order_details AS pd", "SUM(pd.supplier_price*pd.qty) as total", "po.supplier_id='$supplier_id' AND pd.po_id=po.po_id AND po.status='F' AND po.po_type='H'");
        $po_row = $get_po->fetch_assoc();

        $get_pr = $this->select("tbl_purchase_order as po, tbl_purchase_order_details AS pd, tbl_purchase_return as pr, tbl_purchase_return_details as prd", "SUM(prd.qty_return*prd.supplier_price) as total", "po.supplier_id='$supplier_id' AND pd.po_id=po.po_id AND po.status='F' AND po.po_type='H' AND pr.pr_id=prd.pr_id AND pr.status='F' AND pr.po_id=po.po_id AND pd.po_detail_id=prd.po_detail_id");
        $pr_row = $get_pr->fetch_assoc();


        $get_bb = $this->select("tbl_beginning_balance", "SUM(bb_amount) as total", "bb_ref_id='$supplier_id' AND bb_module='AP'");
        $bb_row = $get_bb->fetch_assoc();

        $get_payment_bb = $this->select("tbl_supplier_payment AS sh, tbl_supplier_payment_details AS sd", "SUM(sd.amount) as total", "sh.supplier_id='$supplier_id' AND sh.sp_id=sd.sp_id AND sd.type='BB' AND sh.status='F'");
        $payment_bb = $get_payment_bb->fetch_assoc();

        $get_credit_memo = $this->select("tbl_credit_memo as h, tbl_credit_memo_details as d","sum(d.amount)","h.account_id='$supplier_id' AND memo_type='AP' AND h.status='F' AND h.cm_id=d.cm_id");
        $total_cm = $get_credit_memo->fetch_array();

        $get_debit_memo = $this->select("tbl_debit_memo as h, tbl_debit_memo_details as d","sum(d.amount)","h.account_id='$supplier_id' AND memo_type='AP' AND h.status='F' AND h.dm_id=d.dm_id");
        $total_dm = $get_debit_memo->fetch_array();

        
        return (($po_row['total']-$pr_row['total'])+$bb_row['total']+$total_cm[0])-($payment_po['total']+$payment_bb['total']+$total_dm[0]);
    }
}
