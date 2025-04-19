<?php

class Branches extends Connection
{
    private $table = 'tbl_branch';
    public $pk = 'branch_id';
    public $name = 'branch_name';
    public $module_name = "Branches";

    public $inputs = [];

    public $searchable = ['branch_name'];
    public $uri = "banks";

    public function add()
    {
        $branch_name = $this->clean($this->inputs['branch_name']);
        $is_exist = $this->select($this->table, $this->pk, "branch_name = '$branch_name'");
        if ($is_exist->num_rows > 0) {
            Logs::storeCrud($this->module_name, 'c', 2, $branch_name);
            return 2;
        } else {
            $form = array(
                'branch_name'   => $this->inputs['branch_name'],
                'date_added'    => $this->getCurrentDate()
            );

            $result = $this->insert($this->table, $form);
            Logs::storeCrud($this->module_name, 'c', $result, $branch_name);
            return $result;
        }
    }

    public function edit()
    {
        $primary_id = $this->inputs[$this->pk];
        $branch_name = $this->clean($this->inputs['branch_name']);
        $is_exist = $this->select($this->table, $this->pk, "branch_name = '$branch_name' AND $this->pk != '$primary_id'");
        if ($is_exist->num_rows > 0) {
            Logs::storeCrud($this->module_name, 'u', 2, $branch_name);
            return 2;
        } else {
            $form = array(
                'branch_name'           => $this->inputs['branch_name'],
                'date_last_modified'    => $this->getCurrentDate()
            );

            $result = $this->update($this->table, $form, "$this->pk = '$primary_id'");
            Logs::storeCrud($this->module_name, 'u', $result, $this->name($primary_id), $branch_name);
            return $result;
        }
    }

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['branch_id_entry'] = $row['branch_id'];
            $rows[] = $row;
        }
        return $rows;
    }


    public function select_branch()
    {
        $rows = array();
        $result = $this->select($this->table);
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }

        // Get the session branch ID
        $session_branch_id = isset($_SESSION['accounting_branch_id']) ? $_SESSION['accounting_branch_id'] : '';

        // Return branch data along with session_branch_id
        return array('branches' => $rows, 'session_branch_id' => $session_branch_id);
    }

    public function update_session_branch()
    {
        session_start();

        $_SESSION['accounting_branch_id'] = $this->inputs['branch_id'];
        return $_SESSION['accounting_branch_id'];
    }

    public function session_branch(){
        $branch_id = $this->clean($this->inputs['branch_id']);
       $_SESSION['accounting_branch_id'] = $branch_id;
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
            $name = $this->name($id);
            $result = $this->delete($this->table, "$this->pk = '$id'");
            Logs::storeCrud($this->module_name, 'd', $result, $name);
        }

        return 1; //$this->delete($this->table, "$this->pk IN($ids)");
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        if ($result->num_rows == 0) {
            return null; // Return null if no result found
        }else {
            $row = $result->fetch_assoc();
            return $row[$this->name];
        }
    }

    public function schema()
    {
        if (DEVELOPMENT) {
            $default['date_added'] = $this->metadata('date_added', 'datetime', '', 'NOT NULL', 'CURRENT_TIMESTAMP');
            $default['date_last_modified'] = $this->metadata('date_last_modified', 'datetime', '', 'NOT NULL', '', 'ON UPDATE CURRENT_TIMESTAMP');
            $default['encoded_by'] = $this->metadata('encoded_by', 'int', 11);


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
