<?php
    class ChartClassification extends Connection
    {
        private $table = 'tbl_chart_classification';
        public $pk = 'chart_class_id';
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

        public function add()
        {
            $form = [
                'chart_class_name' => $this->inputs['chart_class_name'],
                'chart_class_code' => $this->inputs['chart_class_code'],
            ];

            $result = $this->insert($this->table, $form);
            return $result;
        }

        public function edit()
        {
            $id = $this->inputs[$this->pk];
            $form = [
                'chart_class_name' => $this->inputs['chart_class_name'],
                'chart_class_code' => $this->inputs['chart_class_code'],
            ];

            $result = $this->update($this->table, $form, "$this->pk = '$id'");
            return $result;
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
            return $this->delete($this->table, "$this->pk IN($ids)");
        }

    }
?>