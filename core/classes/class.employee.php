<?php
class Employee extends Connection
{
    private $table = 'tbl_employee';
    public $pk = 'employee_id';
    public $inputs = [];
    public $name = 'emp_firstname';

    public function show()
    {   
        $EmployeeCategory = new EmployeeCategory();
        $fetch = $this->select($this->table, '*');
        $rows = [];
        while($row = $fetch->fetch_assoc()){
            $row['employee_name'] = $row['emp_firstname'] . ' ' . $row['emp_lastname'];
            $row['employee_category'] = $EmployeeCategory->name($row['emp_category_id']);
            $rows[] = $row;
        }

        return $rows;
    }

    public function add()
    {
        $form = [
            'emp_firstname'     => $this->inputs['emp_firstname'],
            'emp_mname'         => $this->inputs['emp_mname'],
            'emp_lastname'      => $this->inputs['emp_lastname'],
            'emp_category_id'   => $this->inputs['emp_category_id']
        ];

        $result = $this->insertIfNotExist($this->table, $form);
        return $result;
    }

    public function edit(){
        $form = [
            'emp_firstname' => $this->inputs['emp_firstname'],
            'emp_mname'     => $this->inputs['emp_mname'],
            'emp_lastname'  => $this->inputs['emp_lastname'],
            'emp_category_id'   => $this->inputs['emp_category_id']
        ];

        $result = $this->update($this->table, $form, "$this->pk = {$this->inputs[$this->pk]}");
        return $result;
    }
    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        return $result->fetch_assoc();
    }

    public static function total()
    {
        $self = new self;
        $result = $self->select($self->table, "count($self->pk) as total");
        if ($result->num_rows == 0) {
            return 0;
        }else{
            $row = $result->fetch_assoc();
            return $row['total'];
        }
    }

    
}