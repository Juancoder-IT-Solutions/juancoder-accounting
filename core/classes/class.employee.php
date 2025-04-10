<?php
class Employee extends Connection
{
    private $table = 'tbl_employee';
    public $pk = 'employee_id';
    public $inputs = [];

    public function show()
    {   
        $EmployeeCategory = new EmployeeCategory();
        $fetch = $this->select($this->table, '*');
        $rows = [];
        while($row = $fetch->fetch_assoc()){
            $row['employee_name'] = $row['emp_firstname'] . ' ' . $row['emp_lastname'];
            $row['employee_category'] = $EmployeeCategory->name($row['category_id']);
            $rows[] = $row;
        }

        return $rows;
    }

    public function add()
    {
        $form = [
            'emp_firstname' => $this->inputs['emp_firstname'],
            'emp_mname'     => $this->inputs['emp_mname'],
            'emp_lastname'  => $this->inputs['emp_lastname'],
            'category_id'   => $this->inputs['category_id']
        ];

        $result = $this->insert($this->table, $form);
        return $result;
    }

    public function edit(){
        $form = [
            'emp_firstname' => $this->inputs['emp_firstname'],
            'emp_mname'     => $this->inputs['emp_mname'],
            'emp_lastname'  => $this->inputs['emp_lastname'],
            'category_id'   => $this->inputs['category_id']
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
    
}