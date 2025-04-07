<?php

class Suppliers extends Connection
{
    private $table = 'tbl_suppliers';
    private $pk = 'supplier_id';
    private $name = 'supplier_name';

    public $module_name = "Supplier";
    public $inputs = [];
    public $searchable = ['supplier_name','supplier_address','contact_number'];
    public $uri = "suppliers";

    public function add()
    {
        $supplier_name = $this->clean($this->inputs['supplier_name']);
        $is_exist = $this->select($this->table, $this->pk, "supplier_name = '$supplier_name'");
        if ($is_exist->num_rows > 0) {
            Logs::storeCrud($this->module_name, 'c', 2, $supplier_name);
            return 2;
        } else {
            $form = array(
                'supplier_name'     => $this->inputs['supplier_name'],
                'supplier_address'  => $this->inputs['supplier_address'],
                'contact_number'    => $this->inputs['contact_number'],
                'remarks'           => $this->inputs['remarks'],
                'date_added'        => $this->getCurrentDate()
            );
            $result = $this->insert($this->table, $form);
            Logs::storeCrud($this->module_name, 'c', $result, $supplier_name);
            return $result;
        }
    }

    public function edit()
    {
        $primary_id = $this->inputs[$this->pk];
        $supplier_name = $this->clean($this->inputs['supplier_name']);
        $is_exist = $this->select($this->table, $this->pk, "supplier_name = '$supplier_name' AND  $this->pk != '$primary_id'");
        if ($is_exist->num_rows > 0) {
            Logs::storeCrud($this->module_name, 'u', 2, $supplier_name);
            return 2;
        } else {
            $form = array(
                'supplier_name'     => $supplier_name,
                'supplier_address'  => $this->inputs['supplier_address'],
                'contact_number'    => $this->inputs['contact_number'],
                'remarks'           => $this->inputs['remarks'],
                'date_last_modified'    => $this->getCurrentDate()
            );
            $old_name = $this->name($primary_id);
            $result = $this->update($this->table, $form, "$this->pk = '$primary_id'");
            Logs::storeCrud($this->module_name, 'u', $result, $old_name, $supplier_name);
            return $result;
        }
    }


    public function remove()
    {
        foreach ($this->inputs['ids'] as $id) {
            $name = $this->name($id);
            $result = $this->delete($this->table, "$this->pk = '$id'");
            Logs::storeCrud($this->module_name, 'd', $result, $name);
        }

        return 1; //$this->delete($this->table, "$this->pk IN($ids)");
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

    public static function name($primary_id)
    {
        $self = new self;
        $result = $self->select($self->table, $self->name, "$self->pk  = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$self->name];
    }

    public static function balance($primary_id){
        
        

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
