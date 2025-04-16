<?php
class ProductConversion extends Connection
{
    private $table = 'tbl_product_conversions';
    public $pk = 'conversion_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_product_conversion_details';
    public $pk2 = 'conversion_detail_id';

    public $module = 'PC';

    public $module_name = "Product Conversion";
    public $inputs = [];
    public $searchable = ['reference_number', 'remarks'];
    public $uri = "product-conversion";
    public function add()
    {
        $branch_id = $this->getBranch();
        $form = array(
            $this->name             => $this->inputs[$this->name],
            'branch_id'             => $branch_id,
            'warehouse_id'          => $this->clean($this->inputs['warehouse_id']),
            'remarks'               => $this->clean($this->inputs['remarks']),
            'conversion_date'       => $this->inputs['conversion_date'],
            'encoded_by'            => $_SESSION['accounting_user']['id'],
            'date_added'            => $this->getCurrentDate()
        );
        return $this->insert($this->table, $form, 'Y');
    }

    public function edit()
    {
        $form = array(
            $this->name             => $this->clean($this->inputs[$this->name]),
            'product_category_id'   => $this->inputs['product_category_id'],
            'no_of_batches'         => $this->inputs['no_of_batches'],
            'remarks'               => $this->inputs['remarks'],
            'job_order_date'        => $this->inputs['job_order_date'],
            'encoded_by'            => $_SESSION['accounting_user']['id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        $Warehouse = new Warehouses();
        while ($row = $result->fetch_assoc()) {
            // $row['original_product'] = Products::name($row['original_product_id']);
            // $row['converted_product'] = Products::name($row['converted_product_id']);
            $row['warehouse_name'] = $Warehouse->name($row['warehouse_id']);
            $row['last_date_modified'] = date('Y-m-d H:i:s', strtotime($row['date_last_modified'] . ' + 8 hours'));
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $Warehouse = new Warehouses;
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['warehouse_name'] = $Warehouse->name($row['warehouse_id']);

        return $row;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function generate()
    {
        return $this->module . '-' . date('YmdHis');
    }

    public function show_detail()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $count = 1;
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['original_product'] = Products::name($row['original_product_id']);
            $row['converted_product'] = Products::name($row['converted_product_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function getHeader()
    {
        $Warehouses = new Warehouses;
        $id = $_POST['id'];
        $result = $this->select($this->table, "*", "$this->pk='$id'");
        $row = $result->fetch_assoc();
        $row['warehouse_name'] = $Warehouses->name($row['warehouse_id']);
        $row['conversion_date'] = date("F j, Y", strtotime($row['conversion_date']));
        $rows[] = $row;
        return $rows;
    }

    public function getPrintDetails()
    {
        $id = $_POST['id'];
        $rows = array();
        $result = $this->select($this->table_detail, "*", "$this->pk='$id'");
        while ($row = $result->fetch_assoc()) {
            $row['original_product'] = Products::name($row['original_product_id']);
            $row['converted_product'] = Products::name($row['converted_product_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function add_detail()
    {
        if ($this->inputs['original_product_id'] == $this->inputs['converted_product_id']) {
            return 'PC-SAME-ITEM';
        }

        // check inventory here ...
        $branch_id = $this->getBranch();
        $warehouse_id = $this->dataRow($this->inputs[$this->pk], 'warehouse_id');
        $InventoryReport = new InventoryReport();
        $current_balance = $InventoryReport->balance_per_warehouse($this->inputs['original_product_id'], $branch_id, $warehouse_id);

        if ($current_balance >= $this->inputs['original_qty']) {

            $Products = new Products();
            $original_cost = $Products->productCost($this->inputs['original_product_id']);
            $converted_cost = $original_cost * $this->inputs['original_qty'] / $this->inputs['converted_qty'];
            $form = array(
                $this->pk               => $this->inputs[$this->pk],
                'original_product_id'   => $this->inputs['original_product_id'],
                'original_qty'          => $this->inputs['original_qty'],
                'original_cost'         => $original_cost,
                'original_price'        => $Products->productPrice($this->inputs['original_product_id']),
                'converted_product_id'  => $this->inputs['converted_product_id'],
                'converted_qty'         => $this->inputs['converted_qty'],
                'converted_cost'        => $converted_cost,
                'converted_price'       => $Products->productPrice($this->inputs['converted_product_id']),
            );
            return $this->insert($this->table_detail, $form);
        } else {
            return -3;
        }
    }

    public function dataRow($primary_id, $field)
    {
        $result = $this->select($this->table, $field, "$this->pk = '$primary_id'");
        if ($result->num_rows > 0) {
            $row = $result->fetch_array();
            return $row[$field];
        } else {
            return "";
        }
    }

    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $Products = new Products();
        $result = $this->select($this->table_detail, " * ", "$this->pk = '$primary_id'");
        while ($row = $result->fetch_array()) {
            $Products->prodAVG($row['converted_product_id'], $row['converted_qty'], $row['converted_cost']);
        }

        $form = array(
            'status' => 'F',
        );

        $result = $this->update($this->table, $form, "$this->pk = '$primary_id'");
        if ($result) {
            $hRows = $this->rows($primary_id);
            $InventoryReport = new InventoryReport;
            $InventoryReport->update_product_qty($this->table_detail, $this->pk, $primary_id, $hRows['branch_id'], $hRows['warehouse_id'], "converted_product_id");
            $InventoryReport->update_product_qty($this->table_detail, $this->pk, $primary_id, $hRows['branch_id'], $hRows['warehouse_id'], "original_product_id");
        }

        return $result;
    }

    public function rows($primary_id)
    {
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row;
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
                $this->metadata($this->name, 'varchar', 75),
                $this->metadata('remarks', 'varchar', 255, 'NOT NULL'),
                $this->metadata('status', 'varchar', 1, 'NOT NULL'),
                $this->metadata('encoded_by', 'int', 11, 'NOT NULL'),
                $this->metadata('conversion_date', 'datetime', 'NOT NULL'),
                $default['date_added'],
                $default['date_last_modified']
            )
        );

        // TABLE DETAIL
        $tables[] = array(
            'name'      => $this->table_detail,
            'primary'   => $this->pk2,
            'fields' => array(
                $this->metadata($this->pk2, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                $this->metadata($this->pk, 'int', 11),
                $this->metadata('original_product_id', 'int', 11),
                $this->metadata('original_qty', 'decimal', '12,2'),
                $this->metadata('original_cost', 'decimal', '12,2'),
                $this->metadata('original_price', 'decimal', '12,2'),
                $this->metadata('converted_product_id', 'int', 11),
                $this->metadata('converted_qty', 'decimal', '12,2'),
                $this->metadata('converted_cost', 'decimal', '12,2'),
                $this->metadata('converted_price', 'decimal', '12,2'),
                $default['date_added'],
                $default['date_last_modified']
            )
        );
        return $this->schemaCreator($tables);
    }

    public function triggers()
    {
        // HEADER
        $triggers[] = array(
            'table' => $this->table,
            'name' => 'finish_conversion',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "UPDATE", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.$this->pk AND module = '$this->module'"
        );
        $triggers[] = array(
            'table' => $this->table,
            'name' => 'delete_conversion',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "DELETE", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "DELETE FROM tbl_inventory_adjustment_details WHERE $this->pk = OLD.$this->pk"
        );

        // DETAILS
        $triggers[] = array(
            'table' => $this->table_detail,
            'name' => 'add_conversion_detail',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "INSERT", // ['INSERT','UPDATE', 'DELETE']
            "statement" => [
                "INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.original_product_id,NEW.original_qty,NEW.original_cost,NEW.original_price,NEW.$this->pk,NEW.$this->pk2,'$this->module','OUT');",
                "INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.converted_product_id,NEW.converted_qty,NEW.converted_cost,NEW.converted_price,NEW.$this->pk,NEW.$this->pk2,'$this->module','IN');"
            ]
        );
        $triggers[] = array(
            'table' => $this->table_detail,
            'name' => 'delete_conversion_detail',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "DELETE", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "DELETE FROM tbl_product_transactions WHERE header_id = OLD.$this->pk AND detail_id = OLD.$this->pk2 AND module = '$this->module'"
        );

        return $this->triggerCreator($triggers);
    }

    public static function search($words, &$rows)
    {
        $self = new self;
        if (count($self->searchable) > 0) {
            $where = implode(" LIKE '%$words%' OR ", $self->searchable) . " LIKE '%$words%'";
            $result = $self->select($self->table, '*', $where);
            while ($row = $result->fetch_assoc()) {
                $names = [];
                foreach ($self->searchable as $f) {
                    $names[] = $row[$f];
                }
                $rows[] = array(
                    'name' => implode(" ", $names),
                    'module' => $self->module_name,
                    'slug' => $self->uri . "?id=" . $row[$self->pk]
                );
            }
        }
    }
}
