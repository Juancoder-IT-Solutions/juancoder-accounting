<?php
class PurchaseOrder extends Connection
{
    private $table = 'tbl_purchase_order';
    public $pk = 'po_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_purchase_order_details';
    public $pk2 = 'po_detail_id';
    public $fk_det = 'product_id';

    public $module_name = "Purchase Order";
    public $inputs = [];
    public $searchable = ['po_invoice','reference_number','po_remarks'];
    public $uri = "purchase-order";

    public function add()
    {
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'branch_id'     => $this->getBranch(),
            'warehouse_id'  => $this->inputs['warehouse_id'],
            'supplier_id'   => $this->inputs['supplier_id'],
            'po_type'       => $this->inputs['po_type'],
            'po_invoice'    => $this->inputs['po_invoice'],
            'po_terms'      => $this->inputs['po_terms'],
            'paid_status'   => ($this->inputs['po_type'] == "C" ? 1 : 0),
            'po_date'       => $this->inputs['po_date'],
            'po_remarks'    => $this->inputs['po_remarks'],
            'encoded_by'    => $_SESSION['accounting_user']['id'],
            'date_added'    => $this->getCurrentDate()
        );
        return $this->insertIfNotExist($this->table, $form, '', 'Y');
    }

    public function add_detail()
    {
        $primary_id = $this->inputs[$this->pk];
        $fk_det     = $this->inputs[$this->fk_det];

        $form = array(
            $this->pk => $this->inputs[$this->pk],
            $this->fk_det => $fk_det,
            'qty' => $this->inputs['qty'],
            'supplier_price' => $this->inputs['supplier_price'],
        );

        return $this->insert($this->table_detail, $form);
    }

    public function edit()
    {
        $form = array(
            'supplier_id'           => $this->inputs['supplier_id'],
            'po_type'               => $this->inputs['po_type'],
            'po_date'               => $this->inputs['po_date'],
            'po_invoice'            => $this->inputs['po_invoice'],
            'po_terms'              => $this->inputs['po_terms'],
            'po_remarks'            => $this->inputs['po_remarks'],
            'encoded_by'            => $_SESSION['accounting_user']['id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function view()
    {
        $Suppliers = new Suppliers;
        $Users = new Users;
        $Warehouses = new Warehouses;
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['supplier_name'] = $Suppliers->name($row['supplier_id']);
        $row['warehouse_name'] = $Warehouses->name($row['warehouse_id']);
        $row['encoded_name'] = $Users->getUser($row['encoded_by']);
        $row['po_type_name'] = $row['po_type'] == "C" ? "Cash" : "Charge";
        return $row;
    }

    public function show_detail()
    {
        $Products = new Products();
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['amount'] = $row['supplier_price'] * $row['qty'];
            $row['product'] = Products::name($row['product_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function show()
    {
        $Suppliers = new Suppliers();
        $Users = new Users;
        $Warehouses = new Warehouses;
        $branch_id = $this->getBranch();
        $param = "branch_id = '$branch_id'";
        $param .= isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['supplier_id'] = $Suppliers->name($row['supplier_id']);
            $row['warehouse_name'] = $Warehouses->name($row['warehouse_id']);
            $row['total'] = $this->total($row['po_id']);
            $row['encoded_name'] = $Users->getUser($row['encoded_by']);
            $row['po_ref'] = $row['po_invoice']." (₱".number_format($this->po_balance($row['po_id']),2).")";
            $row['date_last_modified'] = date('Y-m-d H:i:s', strtotime($row['date_last_modified'] . ' + 8 hours'));
            $rows[] = $row;
        }
        return $rows;
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $Products = new Products();
        $result = $this->select($this->table_detail, " * ", "$this->pk = '$primary_id'");
        while ($row = $result->fetch_array()) {
            $Products->prodAVG($row['product_id'], $row['qty'], $row['supplier_price']);
        }

        $form = array(
            'status' => 'F',
        );

        $result =  $this->update($this->table, $form, "$this->pk = '$primary_id'");
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


    public function generate()
    {
        return 'PO-' . date('YmdHis');
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }


    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function po_id($primary_id)
    {

        $result = $this->select($this->table, $this->pk, "$this->name = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function pk_by_name($name = null)
    {
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name' AND status='F'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function get_row($primary_id, $field)
    {
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

    public function total($primary_id)
    {
        $result_po = $this->select($this->table_detail, 'sum(qty*supplier_price)', "$this->pk = '$primary_id'");
        $po_total = $result_po->fetch_array();

        $result_pr = $this->select("tbl_purchase_return as pr, tbl_purchase_return_details as prd", "SUM(prd.qty_return*prd.supplier_price) as total", "pr.pr_id=prd.pr_id AND pr.status='F' AND pr.po_id='$primary_id'");
        $pr_total = $result_pr->fetch_array();

        // $result_dm = $this->select("tbl_debit_memo as dm, tbl_debit_memo_details as dmd", "SUM(dmd.amount) as total", "dm.dm_id=dmd.dm_id AND dm.status='F' AND dmd.reference_id='$primary_id'");
        // $dm_total = $result_dm->fetch_array();

        // $result_cm = $this->select("tbl_credit_memo as h, tbl_credit_memo_details as d", "SUM(d.amount) as total", "h.cm_id=d.cm_id AND h.status='F' AND d.reference_id='$primary_id'");
        // $cm_total = $result_cm->fetch_array();


        // return ($po_total[0]+$cm_total)-($pr_total[0]+$dm_total);
        return $po_total[0]-$pr_total[0];
    }


    public function po_balance($primary_id)
    {
        $po_total = $this->total($primary_id);

        $fetch_sp = $this->select('tbl_supplier_payment_details as d, tbl_supplier_payment as h', "sum(amount) as total", "d.ref_id = $primary_id AND d.type='PO' AND h.sp_id=d.sp_id AND h.status='F'");
        $paid_total = 0;
        while ($row = $fetch_sp->fetch_assoc()) {
            $paid_total += $row['total'];
        }

        $get_credit_memo = $this->select("tbl_credit_memo as h, tbl_credit_memo_details as d","sum(d.amount)","memo_type='AR' AND h.status='F' AND h.cm_id=d.cm_id AND d.reference_id='$primary_id' AND d.ref_type='PO'");
        $total_cm = $get_credit_memo->fetch_array();

        $get_debit_memo = $this->select("tbl_debit_memo as h, tbl_debit_memo_details as d","sum(d.amount)","h.memo_type='AR' AND h.status='F' AND h.dm_id=d.dm_id AND d.reference_id='$primary_id' AND d.ref_type='PO'");
        $total_dm = $get_debit_memo->fetch_array();

        return ($po_total+$total_cm[0]) - ($paid_total+$total_dm[0]);
    }

    public function getHeader()
    {
        $Supplier = new Suppliers;
        $Warehouses = new Warehouses;
        $id = $_POST['id'];
        $result = $this->select($this->table, "*", "$this->pk='$id'");
        $row = $result->fetch_assoc();
        $row['po_date_mod'] = date("F j, Y", strtotime($row['po_date']));
        $row['supplier_name'] = $Supplier->name($row['supplier_id']);
        $row['warehouse_name'] = $Warehouses->name($row['warehouse_id']);
        $rows[] = $row;
        return $rows;
    }
    
    public function getPrintDetails()
    {
        $id = $_POST['id'];
        $Products = new Products;
        $rows = array();
        $result = $this->select($this->table_detail, "*", "$this->pk='$id'");
        while ($row = $result->fetch_assoc()) {
            $row['product_name'] = $Products->name($row['product_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function totalPurchaseDays($days)
    {
        
        $branch_id = $this->getBranch();
        $fetchData = $this->select('tbl_purchase_order_details as d, tbl_purchase_order as h', "sum(supplier_price*qty) as total", "h.po_id = d.po_id AND h.po_date BETWEEN NOW() - INTERVAL $days DAY AND NOW() AND h.status='F' AND h.branch_id='$branch_id'");
        $row = $fetchData->fetch_assoc();

        $result_pr = $this->select("tbl_purchase_return as pr, tbl_purchase_return_details as prd", "SUM(prd.qty_return*prd.supplier_price) as total", "pr.pr_id=prd.pr_id  AND pr.branch_id='$branch_id' AND pr.status='F' AND pr.return_date BETWEEN NOW() - INTERVAL $days DAY AND NOW()");
        $row_sr = $result_pr->fetch_assoc();

        return ($row['total']-$row_sr['total']) == 0 ? 0 : ($row['total']-$row_sr['total']);
    }

    private function delete_sales_details()
    {
        $query = "CREATE TRIGGER `delete_po_details` AFTER DELETE ON `tbl_purchase_order` FOR EACH ROW DELETE FROM tbl_purchase_order_details WHERE po_id = OLD.po_id";
    }

    private function finish_transaction()
    {
        $query = "CREATE TRIGGER `finish_transaction` AFTER UPDATE ON `tbl_sales` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.sales_status = 'F', 1, 0) WHERE header_id = NEW.sales_id AND module = 'SLS'";
    }

    private function add_transaction_in()
    {
        $query = "CREATE TRIGGER `add_transaction_in` AFTER INSERT ON `tbl_sales_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.quantity,NEW.cost,NEW.price,NEW.sales_id,NEW.sales_detail_id,'SLS','OUT')";
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
