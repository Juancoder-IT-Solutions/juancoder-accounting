<?php

use LDAP\Result;

class PurchaseReturn extends Connection
{
    private $table = 'tbl_purchase_return';
    public $pk = 'pr_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_purchase_return_details';
    public $pk2 = 'pr_detail_id';
    public $fk_det = 'product_id';

    public $module = 'PO-RET-';

    public $module_name = "Purchase Return";
    public $inputs = [];
    public $searchable = ['reference_number','remarks'];
    public $uri = "purchase-return";

    public function add()
    {
        $PurchaseOrder = new PurchaseOrder;
        $po_id = $PurchaseOrder->pk_by_name($this->inputs['po_reference_number']);
        $warehouse_id =  $PurchaseOrder->get_row($po_id, 'warehouse_id');
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'branch_id'     => $this->getBranch(),
            'warehouse_id'  => $warehouse_id,
            'po_id'         => $po_id,
            'remarks'       => $this->inputs['remarks'],
            'return_date'   => $this->inputs['return_date'],
            'encoded_by'    => $_SESSION['user']['id'],
            'date_added'    => $this->getCurrentDate()
        );
        $pr_id = $this->insert($this->table, $form,'Y');

        $form_detail = array(
            'pr_id'             => "$pr_id AS pr_id",
            'po_detail_id'      => 'po_detail_id',
            'product_id'        => 'product_id',
            'qty'               => 'qty',
            'supplier_price'    => 'supplier_price'
        );

        $this->insert_select($this->table_detail, 'tbl_purchase_order_details', $form_detail, "po_id = '$po_id' ");
        return $pr_id;
    }

    public function edit()
    {
        $form = array(
            'remarks'               => $this->inputs['remarks'],
            'return_date'           => $this->inputs['return_date'],
            'encoded_by'            => $_SESSION['user']['id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {
        $PurchaseOrder = new PurchaseOrder;
        $Users = new Users;
        $Warehouse = new Warehouses;
        $branch_id = $this->getBranch();
        $param = "branch_id = '$branch_id'";
        $param .= isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['po_reference_number'] = $PurchaseOrder->name($row['po_id']);
            $row['encoded_name'] = $Users->getUser($row['encoded_by']);
            $row['warehouse_name'] = $Warehouse->name($row['warehouse_id']);
            $row['date_last_modified'] = date('Y-m-d H:i:s', strtotime($row['date_last_modified'] . ' + 8 hours'));
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $PurchaseOrder = new PurchaseOrder;
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['po_reference_number'] = $PurchaseOrder->name($row['po_id']);
        return $row;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function generate()
    {
        return $this->module . date('YmdHis');
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $Products = new Products();
        $result = $this->select($this->table_detail, " * ", "$this->pk = '$primary_id'");
        while ($row = $result->fetch_array()) {
            $Products->prodRVS($row['product_id'], $row['qty_return'], $row['supplier_price']);
        }

        $form = array(
            'status' => 'F',
        );

        $result = $this->update($this->table, $form, "$this->pk = '$primary_id'");

        if($result){
            $row_header = $this->rows($primary_id);
            $InventoryReport = new InventoryReport;
            $InventoryReport->update_product_qty($this->table_detail, $this->pk, $primary_id, $row_header['branch_id'], $row_header['warehouse_id']);
        }

        return $result;
    }

    public function rows($primary_id)
    {
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row;
    }

    public function add_detail()
    {
        $primary_id_2   = $this->inputs[$this->pk2];
        $qty_return     = $this->inputs['qty_return'];

        $result = $this->select($this->table_detail, 'qty,qty_return,po_detail_id', "$this->pk2 = '$primary_id_2'");
        $row = $result->fetch_assoc();

        $new_qty_return = $row['qty_return'] + $qty_return;
        if (($new_qty_return+$this->total_return($row['po_detail_id'])) > $row['qty']) {
            return 2;
        } else {
            $form = array(
                'qty_return' => $new_qty_return,
            );

            //inventory
            $form2 = array(
                'quantity' => $new_qty_return
            );

            $this->update('tbl_product_transactions' , $form2 ,"detail_id = '$primary_id_2' AND module = 'PR' AND type='OUT'");
            return $this->update($this->table_detail, $form, "$this->pk2 = '$primary_id_2'");

        }
    }

    public function show_detail()
    {
        $Products = new Products();
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            if($this->get_status($row['pr_id']) == "F"){
                $total = $row['qty_return'];
            }else{
                $total = $row['qty_return'] + $this->total_return($row['po_detail_id']);
            }

            $row['product'] = Products::name($row['product_id']);
            $row['amount'] = $row['qty'] * $row['supplier_price'];
            $row['qty_return'] = $total;
            $rows[] = $row;
        }
        return $rows;
    }

    public function get_status($primary_id){
        $result = $this->select($this->table, 'status', "$this->pk  = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row['status'];
    }

    public function total_return($primary_id){
        $result = $this->select("tbl_purchase_return_details as d, tbl_purchase_return as p" , 'sum(d.qty_return)', "p.pr_id=d.pr_id AND p.status='F' AND d.po_detail_id='$primary_id'");
        $row = $result->fetch_array();

        return $row[0];
    }

    
    public function get_row($primary_id, $field)
    {
        $result = $this->select($this->table, $field, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$field];
    }

    public function pk_by_name($name = null)
    {
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function total_per_po($primary_id){
        $result = $this->select("tbl_purchase_return_details as d, tbl_purchase_return as p" , 'sum(d.qty_return*d.supplier_price) as total', "p.pr_id=d.pr_id AND p.status='F' AND p.po_id='$primary_id'");
        if($result->num_rows > 0){
            $row = $result->fetch_assoc();
            return $row['total'];
        }else{
            return 0;
        }
        
    }

    public function remove_detail()
    {
        $form = array(
            'qty_return' => 0,
        );
        $ids = implode(",", $this->inputs['ids']);
        return $this->update($this->table_detail, $form, "$this->pk2 IN($ids)");
    }

    private function delete_PurchaseOrder_details()
    {
        $query = "CREATE TRIGGER `delete_PurchaseOrder_details` AFTER DELETE ON `tbl_PurchaseOrder` FOR EACH ROW DELETE FROM tbl_purchase_order_details WHERE po_id = OLD.po_id";
    }

    private function finish_transaction()
    {
        $query = "CREATE TRIGGER `finish_transaction` AFTER UPDATE ON `tbl_PurchaseOrder` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.po_id AND module = 'SLS'";
    }

    private function add_transaction_in()
    {
        $query = "CREATE TRIGGER `add_transaction_in` AFTER INSERT ON `tbl_purchase_order_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,qty,cost,supplier_price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.qty,NEW.cost,NEW.supplier_price,NEW.po_id,NEW.PurchaseOrder_detail_id,'SLS','OUT')";
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
