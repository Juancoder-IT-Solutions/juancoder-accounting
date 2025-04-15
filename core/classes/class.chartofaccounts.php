<?php
    class ChartOfAccounts extends Connection
    {
        private $table = 'tbl_chart_of_accounts';
        public $pk = 'chart_id';
        public $inputs = [];

        public function show()
        {    
            $param = isset($this->inputs['param'])? $this->inputs['param'] : "";

            $ChartClassification = new ChartClassification();
            $fetch = $this->select($this->table, '*', $param);
            $rows = [];

            while($row = $fetch->fetch_assoc()){
                $row['chart_type_name'] = $row['chart_type'] == "M" ? "Main" : "Sub";
                $row['classification_name'] = $ChartClassification->name($row['chart_class_id']);

                $row['main_chart_name'] = $row['main_chart_id'] == null ? "----" : $this->name($row['main_chart_id']);
                $row['main_chart_id'] = $row['chart_id'];
                $rows[] = $row;
            }
            return $rows;
        }

        public function add()
        {   
            $main_chart = isset($this->inputs['main_chart_id']) && $this->inputs['main_chart_id'] !== "" ? $this->clean($this->inputs['main_chart_id']) : null;

            if($this->clean($this->inputs['chart_type'] == "S")){
                $classification = $this->getChartClassId($main_chart);
            } else {
                $classification = $this->clean($this->inputs['chart_class_id']);
            }

            $form = [
                'chart_code'        => $this->clean($this->inputs['chart_code']),
                'chart_type'        => $this->clean($this->inputs['chart_type']),
                'chart_name'        => $this->inputs['chart_name'],
                'chart_class_id'    => $classification,
                'main_chart_id'     => $main_chart
            ];

            $result = $this->insert($this->table, $form);
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

        public function edit(){
            $id = $this->inputs[$this->pk];
            $main_chart = isset($this->inputs['main_chart_id']) && $this->inputs['main_chart_id'] !== "" ? $this->clean($this->inputs['main_chart_id']) : null;
            
            $form = [
                'chart_code'        => $this->clean($this->inputs['chart_code']),
                'chart_type'        => $this->clean($this->inputs['chart_type']),
                'chart_name'        => $this->clean($this->inputs['chart_name']),
                'chart_class_id'    => $this->inputs['chart_class_id'],
                'main_chart_id'     => $main_chart
            ];

            $result = $this->update($this->table, $form, "$this->pk = '$id'");
            return $result;    
        }

        public function name($id)
        {
            $row = $this->select($this->table, "chart_name", "$this->pk = '$id'");
            $result = $row->fetch_assoc();
            return $result['chart_name'];
        }

        public function getChartClassId($id)
        {
            $row = $this->select($this->table, 'chart_class_id', "$this->pk = '$id'");
            $result = $row->fetch_assoc();
            return $result['chart_class_id'];
        }
    }

?>