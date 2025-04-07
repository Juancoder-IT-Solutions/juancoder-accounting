<?php
class SupplierPayment extends Connection
{
    private $table = 'tbl_supplier_payment';
    public $pk = 'sp_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_supplier_payment_details';
    public $pk2 = 'spd_id';
    public $fk_det = 'ref_id';

    public $module_name = "Supplier Payment";
    public $inputs = [];
    public $searchable = ['reference_number','remarks','check_number'];
    public $uri = "supplier-payment";

    public function add()
    {
        $branch_id = $this->getBranch(); 
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'branch_id'     => $this->getBranch(),
            'supplier_id'   => $this->inputs['supplier_id'],
            'payment_date'  => $this->inputs['payment_date'],
            'payment_type'  => $this->inputs['payment_type'],
            'bank_id'       => $this->inputs['bank_id'],
            'check_number'  => $this->inputs['check_number'],
            'check_date'    => $this->inputs['check_date'],
            'remarks'       => $this->inputs['remarks'],
            'encoded_by'    => $_SESSION['user']['id'],
            'date_added'    => $this->getCurrentDate()
        );
        return $this->insertIfNotExist($this->table, $form, '', 'Y');
    }

    public function edit()
    {
        $form = array(
            'supplier_id'   => $this->inputs['supplier_id'],
            'payment_date'  => $this->inputs['payment_date'],
            'payment_type'  => $this->inputs['payment_type'],
            'bank_id'       => $this->inputs['bank_id'],
            'check_number'  => $this->inputs['check_number'],
            'check_date'    => $this->inputs['check_date'],
            'remarks'       => $this->inputs['remarks'],
            'encoded_by'            => $_SESSION['user']['id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {
        $Suppliers = new Suppliers;
        $Banks = new Banks;
        $Users = new Users;
        $branch_id = $this->getBranch();
        $param = "branch_id = '$branch_id'";
        $param .= isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['supplier'] = $Suppliers->name($row['supplier_id']);
            $row['bank'] = $Banks->name($row['bank_id']);
            $row['total'] = $this->total($row['sp_id']);
            $row['encoded_name'] = $Users->getUser($row['encoded_by']);
            $row['date_last_modified'] = date('Y-m-d H:i:s', strtotime($row['date_last_modified'] . ' + 8 hours'));
            $rows[] = $row;
        }
        return $rows;
    }

    public function show_ref()
    {
        $PurchaseOrder = new PurchaseOrder;
        $BeginningBalance = new BeginningBalance;
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();

        $result = $this->select("tbl_purchase_order","reference_number","supplier_id='$param' AND status='F' AND paid_status='0' AND po_type='H' UNION ALL SELECT reference_number FROM tbl_beginning_balance WHERE bb_ref_id='$param' AND bb_module='AP' AND bb_paid_status= 0");

        while ($row = $result->fetch_assoc()) {
            $trans = substr($row['reference_number'], 0, 2);
            if($trans == "PO"){
                $po_id = $PurchaseOrder->pk_by_name($row['reference_number']);
                $bal = $PurchaseOrder->po_balance($po_id);
                if($bal > 0){
                    $row['reference'] = $row['reference_number']." (₱".number_format($bal,2).")";
                    $row['ref_id'] = "PO-".$po_id;
                    $rows[] = $row;
                }
            }else{
                $bb_id = $BeginningBalance->pk_by_name($row['reference_number']);
                $row['reference'] = $row['reference_number']." (₱".number_format($BeginningBalance->bb_balance($bb_id),2).")";
                $row['ref_id'] = "BB-".$bb_id;
                $rows[] = $row;
            }
        }
        return $rows;
    }

    public function view()
    {
        $Suppliers = new Suppliers;
        $Banks = new Banks;
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['supplier'] = $Suppliers->name($row['supplier_id']);
        $row['bank'] = $Banks->name($row['bank_id']);
        return $row;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);

        $result = $this->select($this->table_detail, "ref_id,type", "$this->pk IN($ids)");
        while ($row = $result->fetch_assoc()) {
            if($row['type'] == "PO"){
                $form_ = array(
                    'paid_status'   => '0',
                );
                $this->update('tbl_purchase_order', $form_, "po_id = '$row[ref_id]'");
            }else{
                $form_ = array(
                    'bb_paid_status'   => '0',
                );
                $this->update('tbl_beginning_balance', $form_, "bb_id = '$row[ref_id]' AND bb_module = 'AP'");
            }
        }
        
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function cancel()
    {
        $ids = implode(",", $this->inputs['ids']);


        $result = $this->select($this->table_detail, "ref_id,type", "$this->pk IN($ids)");
        while ($row = $result->fetch_assoc()) {
            if($row['type'] == "PO"){
                $form_ = array(
                    'paid_status'   => '0',
                );
                $this->update('tbl_purchase_order', $form_, "po_id = '$row[ref_id]'");
            }else{
                $form_ = array(
                    'bb_paid_status'   => '0',
                );
                $this->update('tbl_beginning_balance', $form_, "bb_id = '$row[ref_id]' AND bb_module = 'AP'");
            }
        }

        $form = array(
            'status'   => 'C',
        );

        return $this->update($this->table, $form, "$this->pk IN($ids)");
    }

    public function generate()
    {
        return 'SP-' . date('YmdHis');
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];

        $fetch_po = $this->select($this->table_detail, "ref_id, type, sum(amount) as total", "$this->pk = '$primary_id' GROUP BY ref_id,type");
        while($row = $fetch_po->fetch_array()){
            if($row['type'] == "PO"){
                $PurchaseOrder = new PurchaseOrder;
                $po_paid = $PurchaseOrder->po_balance($row['ref_id']) - ($row['total']+$this->total_paid($primary_id, 'PO'));
                if($po_paid <= 0){
                    $form_ = array(
                        'paid_status'   => 1,
                    );
                    $this->update('tbl_purchase_order', $form_, 'po_id='.$row['ref_id'].'');
                }
            }else{
                $BeginningBalance = new BeginningBalance;
                $bb_paid = $BeginningBalance->bb_balance($row['ref_id']) - ($row['total']+$this->total_paid($primary_id, 'BB'));
                if($bb_paid <= 0){
                    $form_ = array(
                        'bb_paid_status' => 1,
                    );
                    $this->update('tbl_beginning_balance', $form_, "bb_id=".$row['ref_id']." AND bb_module='AP'");
                }
            }
        }

        $form = array(
            'status' => 'F',
        );
        return  $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }

    public function pk_by_name($name = null)
    {
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function get_row($primary_id, $field){
        $result = $this->select($this->table, $field, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$field];
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function add_detail()
    {
        $primary_id = $this->inputs[$this->pk];
        $fk_det     = substr($this->inputs[$this->fk_det], 3);
        $type = substr($this->inputs[$this->fk_det], 0, 2);

        if($type == "PO"){
            $PurchaseOrder = new PurchaseOrder;
            $balance = ($PurchaseOrder->total($fk_det)) - (($this->inputs['amount'])+($this->total_saved($primary_id,$fk_det, 'PO'))+$this->total_paid($fk_det, 'PO'));
        }else{
            $BeginningBalance = new BeginningBalance;
            $balance = ($BeginningBalance->total($fk_det)) - (($this->inputs['amount'])+($this->total_saved($primary_id,$fk_det, 'BB'))+$this->total_paid($fk_det, 'BB'));
        }
        

        if($balance < 0){
            return 3;
        }else{
            $form = array(
                $this->pk => $this->inputs[$this->pk],
                $this->fk_det => $fk_det,
                'type' => $type,
                'amount' => $this->inputs['amount'],
            );

            return $this->insert($this->table_detail, $form);
        }

    }

    public function show_detail()
    {
        $PurchaseOrder = new PurchaseOrder;
        $BeginningBalance = new BeginningBalance;
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['ref_id'] = $row['type'] == "PO" ? $PurchaseOrder->name($row['ref_id']) : $BeginningBalance->name($row['ref_id']);
            $row['amount'] = number_format($row['amount'],2);
            $rows[] = $row;
        }
        return $rows;
    }

    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function total($primary_id)
    {
        $result = $this->select($this->table_detail, 'sum(amount)', "$this->pk = '$primary_id'");
        $row = $result->fetch_array();
        return $row[0];
    }

    public function total_saved($primary_id,$ref_id,$type){
        $result = $this->select($this->table_detail, 'sum(amount)', "$this->pk = '$primary_id' AND ref_id = '$ref_id' AND type='$type'");
        $row = $result->fetch_array();
        return $row[0];
    }

    public function total_paid($ref_id,$type){
        $result = $this->select('tbl_supplier_payment as h, tbl_supplier_payment_details as d', 'sum(d.amount)', "d.ref_id = '$ref_id' AND h.status='F' AND h.sp_id=d.sp_id AND d.type='$type'");
        $row = $result->fetch_array();
        return $row[0];
    }

    
    public function getHeader()
    {
        $Suppliers = new Suppliers;
        $id = $_POST['id'];
        $result = $this->select($this->table, "*", "$this->pk='$id'");
        $row = $result->fetch_assoc();
        $row['payment_date_mod'] = date("F j, Y", strtotime($row['payment_date']));
        $row['supplier_name'] = $Suppliers->name($row['supplier_id']);
        $rows[] = $row;
        return $rows;
    }

    public function getPrintDetails()
    {
        $id = $_POST['id'];
        $PurchaseOrder = new PurchaseOrder;
        $BeginningBalance = new BeginningBalance;
        $rows = array();
        $result = $this->select($this->table_detail, "*", "$this->pk='$id'");
        while ($row = $result->fetch_assoc()) {
            $row['reference'] = $row['type'] == "PO" ? $PurchaseOrder->name($row['ref_id']) : $BeginningBalance->name($row['ref_id']);
            $row['amount'] = number_format($row['amount'],2);
            $rows[] = $row;
        }
        return $rows;
    }

    public static function search($words,&$rows)
    {
        $self = new self;
        if(count($self->searchable) > 0 ){
            $where = implode(" LIKE '%$words%' OR ", $self->searchable)." LIKE '%$words%'";
            $result = $self->select($self->table, '*', $where);
            while ($row = $result->fetch_assoc()) {
                $names = [];
                foreach($self->searchable as $f){
                    $names[] = $row[$f];
                }
                $rows[] = array(
                    'name' => implode(" ", $names),
                    'module' => $self->module_name,
                    'slug' => $self->uri."?id=".$row[$self->pk]
                );
            }
        }
    }
}
