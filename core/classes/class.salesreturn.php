<?php
ini_set('max_execution_time', -1);
class SalesReturn extends Connection
{
    private $table = 'tbl_sales_return';
    public $pk = 'sales_return_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_sales_return_details';
    public $pk2 = 'return_detail_id';
    public $fk_det = 'product_id';

    public $module = 'SLS-RET-';

    public $module_name = "Sales Return";
    public $inputs = [];
    public $searchable = ['reference_number','sales_reference_number','remarks'];
    public $uri = "sales-return";

    public function add()
    {
        $Sales = new Sales;
        //$branch_id = $this->getBranch();
        
        $sales_id = $Sales->pk_by_name($this->inputs['sales_reference_number']);
        
        $fetch_sales = $this->select("tbl_sales","*","sales_id='$sales_id'");
        $sRow = $fetch_sales->fetch_assoc();
        $branch_id = $sRow['branch_id'];
        $warehouse_id = $sRow['release_warehouse_id'] > 0 ? $sRow['release_warehouse_id'] : $sRow['warehouse_id'];

        //$warehouse_id = $Sales->sales_warehouse($sales_id);
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            //'branch_id'     => $this->getBranch(),
            'sales_id'      => $sales_id,
            'branch_id'     => isset($this->inputs['branch_id']) ? $this->inputs['branch_id'] : $branch_id,
            'warehouse_id'  => $warehouse_id,
            'remarks'       => $this->inputs['remarks'],
            'return_date'   => $this->inputs['return_date'],
            'encoded_by'    => isset($this->inputs['encoded_by']) ? $this->inputs['encoded_by'] :  $_SESSION['accounting_user']['id'],
            'date_added'    => $this->getCurrentDate()
        );
        $sales_return_id = $this->insert($this->table, $form, 'Y');

        $form_detail = array(
            'sales_return_id'   => "$sales_return_id AS sales_return_id",
            'sales_detail_id'   => 'sales_detail_id',
            'product_id'        => 'product_id',
            'quantity'          => 'quantity',
            'price'             => 'price',
            'discount'          => 'discount',
            'cost'              => 'cost'
        );

        $this->insert_select($this->table_detail, 'tbl_sales_details', $form_detail, "sales_id = '$sales_id'");
        return $sales_return_id;
    }

    public function add_sales_return_pos(){
        $this->inputs['sales_reference_number'] = $this->inputs['sales_num'];
        $this->inputs[$this->name] = $this->generate();
        $this->inputs['return_date'] = $this->getCurrentDate();
        $sales_return_id = $this->add();
        if($sales_return_id > 0){
            $this->inputs['param'] = "sales_return_id = '$sales_return_id'";
            return $this->show_detail();
        }else{
            //return "sr = " . $sales_return_id;
            return $sales_return_id;
        }
    }

    public function edit()
    {
        $form = array(
            'remarks'               => $this->inputs['remarks'],
            'return_date'           => $this->inputs['return_date'],
            'encoded_by'            => $_SESSION['accounting_user']['id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {
        $Sales = new Sales;
        $Users = new Users;
        $branch_id = $this->getBranch();
        $param = "branch_id = '$branch_id'";
        $param .= isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['sales_reference_number'] = $Sales->name($row['sales_id']);
            $row['encoded_name'] = $Users->getUser($row['encoded_by']);
            $row['date_last_modified'] = date('Y-m-d H:i:s', strtotime($row['date_last_modified'] . ' + 8 hours'));
            $rows[] = $row;
        }
        return $rows;
    }

    public function view($primary_id = null)
    {
        $Sales = new Sales;
        $primary_id = $primary_id == "" ? $this->inputs['id'] : $primary_id;
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['sales_reference_number'] = $Sales->name($row['sales_id']);
        return $row;
    }

    public function getStatus($primary_id)
    {
        $result = $this->select($this->table, "status", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row['status'];
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
        $Sales = new Sales();

        $form = array(
            'status' => 'F',
        );
        $query = $this->update($this->table, $form, "$this->pk = '$primary_id'");

        $sRow = $this->view($primary_id);
        $result = $this->select("$this->table_detail as d, $this->table as h", "h.warehouse_id, h.branch_id, sum(d.quantity_return) as total", "h.sales_id='$sRow[sales_id]' AND h.status='F' AND h.sales_return_id=d.sales_return_id");
        $sr_row = $result->fetch_array();
        $sr_total = $sr_row['total'];

        $sales_qty = $Sales->sales_qty($sRow['sales_id']);
        $qty = $sales_qty-$sr_total;
        if($qty <= 0){
            $total_sales_amount = $Sales->total($sRow['sales_id']);
            $form_ = array(
                'status' => 'R',
                'total_sales_amount' => $total_sales_amount
            );
            $this->update("tbl_sales", $form_, "sales_id = '$sRow[sales_id]'");    
        }
        
        if($query){
            $InventoryReport = new InventoryReport;
            $InventoryReport->update_product_qty($this->table_detail, $this->pk, $primary_id, $sRow['branch_id'], $sRow['warehouse_id']);
        }

        return $query;
    }

    public function add_detail()
    {
        $primary_id_2       = $this->inputs[$this->pk2];
        $quantity_return    = $this->inputs['quantity_return'];

        $result = $this->select($this->table_detail, 'quantity,quantity_return,sales_detail_id', "$this->pk2 = '$primary_id_2'");
        $row = $result->fetch_assoc();

        $new_quantity_return = $row['quantity_return'] + $quantity_return;
        if (($new_quantity_return + $this->total_return($row['sales_detail_id'])) > $row['quantity']) {
            return 2;
        } else {
            $form = array(
                'quantity_return' => $new_quantity_return,
            );

             //inventory
             $form2 = array(
                'quantity' => $new_quantity_return
            );

            $this->update('tbl_product_transactions' , $form2 ,"detail_id = '$primary_id_2' AND module = 'SR' AND type='IN'");

            return $this->update($this->table_detail, $form, "$this->pk2 = '$primary_id_2'");
        }
    }

    public function add_detail_pos()
    {
        $Sales = new Sales();

        $primary_id_2       = $this->inputs['sr_id'];
        $quantity_return    = $this->inputs['sr_qty'];
        $encoded_by    = $this->inputs['encoded_by'];
        $reference_number = $this->inputs['reference_number'];
        $param = "reference_number='$reference_number'";
        $sales_id = $Sales->getID($param);

        $fetch_sr = $this->select($this->table, "sales_return_id", "sales_id = '$sales_id' AND encoded_by = '$encoded_by' ORDER BY date_added DESC LIMIT 1");
        $sales_return_row = $fetch_sr->fetch_assoc();

        array_map(function ($return_detail_id, $qty) {
            $result = $this->select($this->table_detail, 'quantity,quantity_return,sales_detail_id', "$this->pk2 = '$return_detail_id'");
            $row = $result->fetch_assoc();
            
            $form = array(
                'quantity_return' => $qty,
            );
            $this->update($this->table_detail, $form, "$this->pk2 = '$return_detail_id'");

        }, $primary_id_2, $quantity_return);
        

        $this->inputs['id'] = $sales_return_row['sales_return_id'];
        return $this->finish();
        
    }

    public function update_review_sales_summary()
    {
        $encoded_by = $this->inputs['encoded_by'];
        $form = array(
            'sales_summary_id' => $this->inputs['sales_summary_id']
        );
        return $this->update($this->table, $form, "sales_summary_id=0 AND encoded_by='$encoded_by' and (status='F' or status='C') ");
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function total_return($primary_id)
    {
        $result = $this->select("tbl_sales_return_details as d, tbl_sales_return as p", 'sum(d.quantity_return)', "p.sales_return_id=d.sales_return_id AND p.status='F' AND d.sales_detail_id='$primary_id'");
        $row = $result->fetch_array();

        return $row[0];
    }

    public function return_by_sd_id($primary_id)
    {
        $result = $this->select("tbl_sales_return_details d LEFT JOIN tbl_sales_return h ON d.sales_return_id=h.sales_return_id", 'sum(d.quantity_return)', "h.status='F' AND d.sales_detail_id='$primary_id'");
        $row = $result->fetch_array();

        return $row[0];
    }

    public function total_return_by_product($product_id)
    {
        $result = $this->select("tbl_sales_return_details as d, tbl_sales_return as p", 'sum((quantity_return*price)-discount) as total', "p.sales_return_id=d.sales_return_id AND p.status='F' AND d.product_id='$product_id'");
        $row = $result->fetch_assoc();

        return $row['total'];
    }

    public function total_return_per_summary($sales_summary_id)
    {
        $fetchSales = $this->select("tbl_sales", "sales_id", "sales_summary_id='$sales_summary_id' AND status='F'");
        $total = 0;
        while ($sRow = $fetchSales->fetch_assoc()) {
            $result = $this->select("tbl_sales_return_details as d, tbl_sales_return as p", '"sum((quantity_return*price)-discount) as total', "p.sales_return_id=d.sales_return_id AND p.status='F' AND p.sales_id='$sRow[sales_id]'");
            if($result->num_rows > 0){
                $row = $result->fetch_assoc();
                $total += $row['total'];
            }
        }

        return $total;
    }

    public function show_detail()
    {
        $Products = new Products();
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            if ($this->get_status($row['sales_return_id']) == "F") {
                $total = $row['quantity_return'];
            } else {
                $total = $row['quantity_return'] + $this->total_return($row['sales_detail_id']);
            }
            $row['product'] = Products::name($row['product_id']);
            $row['amount'] = $row['quantity'] * $row['price'];
            $row['quantity_return'] = $total;
            $row['remaining_qty'] = $row['quantity'] - $total;
            $rows[] = $row;
        }
        return $rows;
    }

    public function rows($primary_id)
    {
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row;
    }

    public function get_status($primary_id)
    {
        $result = $this->select($this->table, 'status', "$this->pk  = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row['status'];
    }

    public function remove_detail()
    {
        $form = array(
            'quantity_return' => 0,
        );
        $ids = implode(",", $this->inputs['ids']);
        return $this->update($this->table_detail, $form, "$this->pk2 IN($ids)");
    }

    

    private function delete_sales_details()
    {
        $query = "CREATE TRIGGER `delete_sales_details` AFTER DELETE ON `tbl_sales` FOR EACH ROW DELETE FROM tbl_sales_details WHERE sales_id = OLD.sales_id";
    }

    private function finish_transaction()
    {
        $query = "CREATE TRIGGER `finish_transaction` AFTER UPDATE ON `tbl_sales` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.sales_id AND module = 'SLS'";
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

    public function schema()
    {
        $default['date_added'] = $this->metadata('date_added', 'datetime', '', 'NOT NULL', 'CURRENT_TIMESTAMP');
        $default['date_last_modified'] = $this->metadata('date_last_modified', 'datetime', '', 'NOT NULL', '', 'ON UPDATE CURRENT_TIMESTAMP');


        // TABLE HEADER
        $tables[] = array(
            'name'      => $this->table,
            'primary'   => $this->pk,
            'fields' => array(
                $this->metadata($this->pk, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                $this->metadata($this->name, 'varchar', 30),
                $this->metadata('sales_id', 'int', 11),
                $this->metadata('sales_summary_id', 'int', 11),
                $this->metadata('sales_reference_number', 'varchar', 30, 'NOT NULL'),
                $this->metadata('return_date', 'date'),
                $this->metadata('status', 'varchar', 1),
                $this->metadata('encoded_by', 'int', 11),
                $this->metadata('remarks', 'varchar', 250),
                $default['date_added'],
                $default['date_last_modified']
            )
        );

        // TABLE DETAILS
        $tables[] = array(
            'name'      => $this->table_detail,
            'primary'   => $this->pk2,
            'fields' => array(
                $this->metadata($this->pk2, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                $this->metadata($this->pk, 'int', 11, 'NOT NULL'),
                $this->metadata('sales_detail_id', 'int', 11),
                $this->metadata('product_id', 'int', 11),
                $this->metadata('discount', 'decimal', '12,3'),
                $this->metadata('quantity', 'decimal', '12,2'),
                $this->metadata('quantity_return', 'decimal', '12,2'),
                $this->metadata('price', 'decimal', '12,2'),
                $this->metadata('cost', 'decimal', '7,2'),
                $default['date_added'],
            )
        );

        return $this->schemaCreator($tables);
    }
}
