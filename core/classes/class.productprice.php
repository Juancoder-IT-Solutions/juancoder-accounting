<?php
class ProductPrice extends Connection
{
    private $table = 'tbl_price_notice';
    public $pk = 'price_id';
    public $name = 'reference_number';


    private $table_detail = 'tbl_price_notice_details';
    public $pk2 = 'price_detail_id';
    public $fk_det = 'product_id';

    public $module_name = "Price Notice";

    public $inputs;
    public function add()
    {
        $effective_date = date('Y-m-d', strtotime($this->inputs['effective_date']));
        $form = array(
            $this->name         => $this->clean($this->inputs[$this->name]),
            'effective_date'    => $effective_date,
            'remarks'           => $this->clean($this->inputs['remarks']),
            'status'            => 'S',
            'date_added'        => $this->getCurrentDate()
        );
        $result = $this->insertIfNotExist($this->table, $form, "effective_date = '$effective_date'", 'Y');
        $new_result = $result > 0 ? 1 : abs($result); // for return last_id
        Logs::storeCrud($this->module_name, 'c', $new_result, $this->inputs[$this->name]);
        return $result;
    }

    public function edit()
    {
        $effective_date = date('Y-m-d', strtotime($this->inputs['effective_date']));
        $form = array(
            $this->name             => $this->clean($this->inputs[$this->name]),
            'effective_date'        => $effective_date,
            'remarks'               => $this->clean($this->inputs['remarks']),
            'date_last_modified'    => $this->getCurrentDate()
        );

        $result = $this->updateIfNotExist($this->table, $form, "effective_date = '$effective_date' AND ");
        if ($result == 2)
            return 'conflict';

        Logs::storeCrud($this->module_name, 'u', $result, $this->inputs[$this->name]);
        return $result;
    }

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : '';
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        return $result->fetch_assoc();
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);

        foreach ($this->inputs['ids'] as $id) {
            $name = self::name($id);
            $result = $this->delete($this->table, "$this->pk = '$id'");
            Logs::storeCrud($this->module_name, 'd', $result, $name);
        }

        return 1; //$this->delete($this->table, "$this->pk IN($ids)");
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }


    public function generate()
    {
        return 'PN-' . date('YmdHis');
    }

    public function add_detail()
    {
        $primary_id = $this->inputs[$this->pk];
        $fk_det     = $this->inputs[$this->fk_det];

        $form = array(
            $this->pk       => $this->inputs[$this->pk],
            $this->fk_det   => $fk_det,
            'old_price'     => $this->inputs['old_price'],
            'price'         => $this->inputs['new_price'],
        );

        $result = $this->insertIfNotExist($this->table_detail, $form, "$this->pk = '$primary_id' AND $this->fk_det = '$fk_det'");
        $details = Products::name($fk_det) . " " . $this->inputs['old_price'] . " ->  " . $this->inputs['new_price'];
        Logs::storeCrud($this->module_name, 'cd', $result, $this->name($primary_id), $details);
        return $result;
    }

    public function show_detail()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $count = 1;
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['count'] = $count++;
            $row['product'] = Products::name($row['product_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);

        foreach ($this->inputs['ids'] as $id) {
            $name = $this->name_detail($id);
            $result = $this->delete($this->table_detail, "$this->pk2 = '$id'");
            Logs::storeCrud($this->module_name, 'dd', $result, $name);
        }

        return 1; // $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function name_detail($pk2)
    {
        $result = $this->select($this->table_detail, "product_id,price", "$this->pk2 = '$pk2'");
        $row = $result->fetch_assoc();
        return Products::name($row['product_id']) . " @ $row[price]";
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $form = array(
            'status' => 'F',
        );
        $result = $this->update($this->table, $form, "$this->pk = '$primary_id'");
        Logs::storeCrud($this->module_name, 'f', $result, $this->name($primary_id));
        return $result;
    }

    public function runner()
    {
        $current_date = date('Y-m-d');
        $rows = array();
        $result = $this->select($this->jccrypt($this->table), "$this->pk,$this->name", "status = 'F' AND effective_status = 0 AND effective_date <= '$current_date'");
        while ($row = $result->fetch_assoc()) {
            if ($this->implement($row[$this->pk]) == 1) {
                $rows[] = $row[$this->name];
                $res = $this->update($this->jccrypt($this->table), ['effective_status' => 1], "$this->pk = '" . $row[$this->pk] . "'");
                Logs::storeCrud($this->module_name, 'i', $res, $row[$this->name]);
            }
        }
        return $rows;
    }

    public function implement($price_id)
    {
        $sql = "UPDATE " . $this->jccrypt($this->table_detail) . " AS d, " . $this->jccrypt('tbl_products') . " AS p SET p.product_price = d.price  WHERE d.product_id = p.product_id AND d.price_id = '$price_id'";
        return $this->query($sql);
    }

    public function schema()
    {
        if (DEVELOPMENT) {
            $default['date_added'] = $this->metadata('date_added', 'datetime', '', 'NOT NULL', 'CURRENT_TIMESTAMP');
            $default['date_last_modified'] = $this->metadata('date_last_modified', 'datetime', '', 'NOT NULL', '', 'ON UPDATE CURRENT_TIMESTAMP');


            // TABLE HEADER
            $tables[] = array(
                'name'      => $this->jccrypt($this->table),
                'primary'   => $this->pk,
                'fields' => array(
                    $this->metadata($this->pk, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                    $this->metadata($this->name, 'varchar', 75),
                    $this->metadata('effective_date', 'date'),
                    $this->metadata('effective_status', 'int', 1),
                    $this->metadata('remarks', 'varchar', 255),
                    $this->metadata('status', 'varchar', 1),
                    $default['date_added'],
                    $default['date_last_modified']
                )
            );

            // TABLE DETAILS
            $tables[] = array(
                'name'      => $this->jccrypt($this->table_detail),
                'primary'   => $this->pk2,
                'fields' => array(
                    $this->metadata($this->pk2, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                    $this->metadata($this->pk, 'int', 11),
                    $this->metadata($this->fk_det, 'int', 11),
                    $this->metadata('old_price', 'decimal', '12,2'),
                    $this->metadata('price', 'decimal', '12,2'),
                    $default['date_added'],
                    $default['date_last_modified']
                )
            );

            return $this->schemaCreator($tables);
        }
    }
}
