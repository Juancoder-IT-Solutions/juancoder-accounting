<?php

class Banks extends Connection
{
    private $table = 'tbl_banks';
    public $pk = 'bank_id';
    public $name = 'bank_name';
    public $module_name = "Bank";

    public $inputs = [];

    public $searchable = ['bank_name','bank_branch','bank_account_name','bank_account_number'];
    public $uri = "banks";

    public function add()
    {
        $bank_name = $this->clean($this->inputs['bank_name']);
        $is_exist = $this->select($this->table, $this->pk, "bank_name = '$bank_name'");
        if ($is_exist->num_rows > 0) {
            Logs::storeCrud($this->module_name, 'c', 2, $bank_name);
            return 2;
        } else {
            $form = array(
                'bank_name'             => $this->inputs['bank_name'],
                'bank_branch'           => $this->inputs['bank_branch'],
                'bank_account_name'     => $this->inputs['bank_account_name'],
                'bank_account_number'   => $this->inputs['bank_account_number'],
                'date_added'            => $this->getCurrentDate() 
            );

            $result = $this->insert($this->table, $form);
            Logs::storeCrud($this->module_name, 'c', $result, $bank_name);
            return $result;
        }
    }

    public function edit()
    {
        $primary_id = $this->inputs[$this->pk];
        $bank_name = $this->clean($this->inputs['bank_name']);
        $is_exist = $this->select($this->table, $this->pk, "bank_name = '$bank_name' AND $this->pk != '$primary_id'");
        if ($is_exist->num_rows > 0) {
            Logs::storeCrud($this->module_name, 'u', 2, $bank_name);
            return 2;
        } else {
            $form = array(
                'bank_name'             => $this->inputs['bank_name'],
                'bank_branch'           => $this->inputs['bank_branch'],
                'bank_account_name'     => $this->inputs['bank_account_name'],
                'bank_account_number'   => $this->inputs['bank_account_number'],
                'date_last_modified'    => $this->getCurrentDate()
            );

            $result = $this->update($this->table, $form, "$this->pk = '$primary_id'");
            Logs::storeCrud($this->module_name, 'u', $result, $this->name($primary_id), $bank_name . " - " . $this->inputs['bank_account_number']);
            return $result;
        }
    }

    public function show()
    {
        $rows = array();
        $result = $this->select($this->table);
        while ($row = $result->fetch_assoc()) {
            $row['bank'] = $row['bank_name'] . " - " . $row['bank_account_number'];
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
            $name = $this->name($id);
            $result = $this->delete($this->table, "$this->pk = '$id'");
            Logs::storeCrud($this->module_name, 'd', $result, $name);
        }

        return 1; //$this->delete($this->table, "$this->pk IN($ids)");
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, '*', "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row['bank_name'] . " - " . $row['bank_account_number'];
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
