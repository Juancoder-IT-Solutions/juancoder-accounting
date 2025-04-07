<?php
class InventoryAdjustment extends Connection
{
    private $table = 'tbl_inventory_adjustments';
    public $pk = 'adjustment_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_inventory_adjustment_details';
    public $pk2 = 'adjustment_detail_id';

    public $module = 'IA';

    public $module_name = "Inventory Adjustment";
    public $inputs = [];
    public $searchable = ['reference_number','remarks'];
    public $uri = "inventory-adjustment";

    public function add()
    {

        $form = array(
            $this->name             => $this->inputs[$this->name],
            'branch_id'             => $this->getBranch(),
            'warehouse_id'          => $this->inputs['warehouse_id'],
            'remarks'               => $this->clean($this->inputs['remarks']),
            'adjustment_date'       => $this->inputs['adjustment_date'],
            'encoded_by'            => $_SESSION['user']['id'],
            'date_added'            => $this->getCurrentDate()
        );
        return $this->insert($this->table, $form, 'Y');
    }

    public function edit()
    {
        $form = array(
            'remarks'               => $this->clean($this->inputs['remarks']),
            'adjustment_date'       => $this->inputs['adjustment_date'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {   
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['date_last_modified'] = date('Y-m-d H:i:s', strtotime($row['date_last_modified'] . ' + 8 hours'));
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
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
            $row['product'] = Products::name($row['product_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function add_detail()
    {
        if ($this->inputs['quantity'] == 0) {
            return 'IA-ZERO';
        }
        $Product = new Products();
        $form = array(
            $this->pk       => $this->inputs[$this->pk],
            'product_id'    => $this->inputs['product_id'],
            'quantity'      => $this->inputs['quantity'],
            'cost'          => $Product->productCost($this->inputs['product_id']),
            'price'         => $Product->productPrice($this->inputs['product_id']),
        );
        return $this->insertIfNotExist($this->table_detail, $form, "$this->pk = '" . $this->inputs[$this->pk] . "' AND product_id = '" . $this->inputs['product_id'] . "'");
    }

    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $form = array(
            'status' => 'F',
        );
        $result = $this->update($this->table, $form, "$this->pk = '$primary_id'");
        // update inventory qty
        if ($result) {
            $fetch = $this->select($this->table, "*", "$this->pk='$primary_id'");
            $row = $fetch->fetch_assoc();
            $InventoryReport = new InventoryReport;
            $InventoryReport->update_product_qty($this->table_detail, $this->pk, $primary_id, $row['branch_id'], $row['warehouse_id']);
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
                $this->metadata('adjustment_date', 'datetime', 'NOT NULL'),
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
                $this->metadata('product_id', 'int', 11),
                $this->metadata('quantity', 'decimal', '12,2'),
                $this->metadata('cost', 'decimal', '12,2'),
                $this->metadata('price', 'decimal', '12,2'),
                $default['date_added'],
                $default['date_last_modified']
            )
        );
        return $this->schemaCreator($tables);
    }

    public function triggers()
    {
        $table_transaction = "tbl_product_transactions";

        // HEADER
        $triggers[] = array(
            'table' => $this->table,
            'name' => 'finish_adjustment',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "UPDATE", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "UPDATE $table_transaction SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.$this->pk AND module = '$this->module'"
        );

        $triggers[] = array(
            'table' => $this->table,
            'name' => 'delete_adjustment',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "DELETE", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "DELETE FROM $this->table_detail WHERE $this->pk = OLD.$this->pk"
        );


        // DETAILS
        $triggers[] = array(
            'table' => $this->table_detail,
            'name' => 'add_adjustment_detail',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "INSERT", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "INSERT INTO $table_transaction (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,ABS(NEW.quantity),NEW.cost,NEW.price,NEW.$this->pk,NEW.$this->pk2,'$this->module',IF(NEW.quantity > 0,'IN','OUT'))"
        );

        $triggers[] = array(
            'table' => $this->table_detail,
            'name' => 'delete_adjustment_detail',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "DELETE", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "DELETE FROM $table_transaction WHERE header_id = OLD.$this->pk AND detail_id = OLD.$this->pk2 AND module = '$this->module'"
        );

        return $this->triggerCreator($triggers);
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
