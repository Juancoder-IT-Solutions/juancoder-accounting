<?php
class Formulation extends Connection
{
    private $table = 'tbl_formulation';
    public $pk = 'formulation_id';
    public $name = 'product_id';

    private $table_detail = 'tbl_formulation_details';
    public $pk2 = 'formulation_detail_id';

    public function add()
    {
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'remarks'       => $this->inputs['remarks'],
            'date_added'    => $this->getCurrentDate()
        );
        return $this->insertIfNotExist($this->table, $form, '', 'Y');
    }

    public function add_detail()
    {
        $form = array(
            $this->pk               => $this->inputs[$this->pk],
            'product_id'            => $this->inputs['product_id'],
            'qty'                   => $this->inputs['qty']
        );

        return $this->insert($this->table_detail, $form);
    }

    public function edit()
    {
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'remarks'      => $this->inputs['remarks'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form, '', 'Y');
    }

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['product'] = Products::name($row['product_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['product'] = Products::name($row['product_id']);
        return $row;
    }

    public function show_detail()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $count = 1;
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['product'] = Products::name($row['product_id']);
            $row['qty'] = number_format($row['qty']);
            $row['count'] = $count++;
            $rows[] = $row;
        }
        return $rows;
    }

    public function formulation_id($primary_id)
    {
        $result = $this->select($this->table, 'formulation_id', "product_id = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row['formulation_id'];
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

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function status($primary_id)
    {
        $result = $this->select($this->table, $this->status, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->status];
    }

    public function generate()
    {
        return 'JO-' . date('YmdHis');
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $form = array(
            'status' => 'F',
        );
        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
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
                $this->metadata($this->name, 'int', 75),
                $this->metadata('remarks', 'varchar', 255, 'NOT NULL'),
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
                $this->metadata('product_id', 'int', 11),
                $this->metadata('qty', 'decimal', '7,2'),
            )
        );

        return $this->schemaCreator($tables);


        return $this->schemaCreator($tables);
    }
}
