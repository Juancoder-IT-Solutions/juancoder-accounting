<?php

class PaymentOption extends Connection
{
    private $table = 'tbl_payment_option';
    private $pk = 'payment_option_id';
    private $name = 'payment_option';

    public function add()
    {
        $payment_option = $this->clean($this->inputs[$this->name]);
        $is_exist = $this->select($this->table, $this->pk, "payment_option='$payment_option'");
        if ($is_exist->num_rows > 0) {
            return 2;
        } else {
            $form = array(
                $this->name => $this->inputs[$this->name],
                'date_added'    => $this->getCurrentDate()
            );
            return $this->insert($this->table, $form);
        }
    }

    public function edit()
    {
        $primary_id = $this->inputs[$this->pk];
        $payment_option = $this->clean($this->inputs[$this->name]);
        $is_exist = $this->select($this->table, $this->pk, "payment_option = '$payment_option' AND  $this->pk != '$primary_id'");
        if ($is_exist->num_rows > 0) {
            return 2;
        } else {
            $form = array(
                $this->name             => $this->inputs[$this->name],
                'date_last_modified'    => $this->getCurrentDate()
            );
            return $this->update($this->table, $form, "$this->pk = '$primary_id'");
        }
    }


    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function show()
    {
        $rows = array();
        $result = $this->select($this->table);
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
                $default['date_added'],
                $default['date_last_modified']
            )
        );

        return $this->schemaCreator($tables);
    }
}
