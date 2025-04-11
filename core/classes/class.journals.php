<?php
    class Journals extends Connection
    {
        private $table = 'tbl_journals';
        public $pk = 'journal_id';
        public $inputs = [];

        public function show()
        {
            $fetch = $this->select($this->table, '*');
            $rows = [];
            while($row = $fetch->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }

        public function  view()
        {
            $primary_id = $this->inputs['id'];
            $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
            return $result->fetch_assoc();
            
        }

        public function edit()
        {
            $id = $this->inputs[$this->pk];
            $form = [
                'journal_name' => $this->inputs['journal_name'],
                'journal_code' => $this->inputs['journal_code'],
            ];

            $result = $this->update($this->table, $form, "$this->pk = '$id'");
            return $result;
        }

        public function add()
        {
            $form = [
                'journal_name' => $this->inputs['name'],
                'journal_code' => $this->inputs['code'],
            ];
            
            $result = $this->insert($this->table, $form);
            return $result;
        }

        public function remove()
        {
            $ids = implode(",", $this->inputs['ids']);
            return $this->delete($this->table, "$this->pk IN($ids)");
        }
    }
?>