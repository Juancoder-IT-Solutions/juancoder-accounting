<?php
    class EmployeeCategory extends Connection
    {
        private $table = 'tbl_employee_category';
        public $pk = 'category_id';
        public $inputs = [];

        public function show()
        {
            $fetch = $this->select($this->table, '*');
            $rows = [];
            while($row = $fetch->fetch_assoc()){
                $row['category_name'] = $row['category_name'];
                $rows[] = $row;
            }

            return $rows;
        }

        public function view(){
            $primary_id = $this->inputs['id'];
            $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
            return $result->fetch_assoc();
        }

        public function add()
        {
            $form = [
                'category_name' => $this->inputs['category_name'],
            ];

            $result = $this->insert($this->table, $form);
            return $result;
        }

        public function edit()
        {
            $form = [
                'category_name' => $this->inputs['category_name'],
            ];

            $result = $this->update($this->table, $form, "$this->pk = {$this->inputs[$this->pk]}");
            return $result;
        }

        public function remove()
        {
            $ids = implode(",", $this->inputs['ids']);
            return $this->delete($this->table, "$this->pk IN($ids)");
        }

        public function name($primary_id)
        {
            $result = $this->select($this->table, "category_name", "$this->pk = '$primary_id'");
            $row = $result->fetch_assoc();
            return $row['category_name'];
        }
    }
?>