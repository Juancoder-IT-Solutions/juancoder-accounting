<?php
    class JournalEntry extends Connection
    {
        private $table = 'tbl_journal_entries';
        private $table2 = 'tbl_journal_entry_details';
        public $pk = 'journal_entry_id';
        public $inputs = [];
        public $name = 'reference_number';

        public function show()
        {   
            $Branches = new Branches();
            $Journal = new Journals();
            $fetch = $this->select($this->table, '*');
            $rows = [];
            while($row = $fetch->fetch_assoc()){
                $row['general_reference'] = $row['reference_number'];
                $row['journal']           = $Journal->name($row['journal_id']);
                $row['branch']            = $Branches->name($row['branch_id']);
                $rows[]                   = $row;
            }
            return $rows;
        }

        public function add()
        {
            $form = array(
                'journal_id'         => $this->inputs['journal_id'],
                'reference_number'   => $this->inputs['reference_number'],
                'cross_reference'    => $this->inputs['cross_reference'],
                'branch_id'          => $this->getBranch(),
                'journal_date'       => $this->inputs['journal_date'],
                'remarks'            => $this->inputs['remarks'],
                'is_manual'          => 1,
            );

            $result = $this->insertIfNotExist($this->table, $form,'', 'Y');
            return $result;
        }

        public function view()
        {
            $primary_id = $this->inputs['id'];
            $Branches = new Branches;
            $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
            
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $row['branch']              = $Branches->name($row['branch_id']);
                $row['general_reference']   = $row['reference_number'];
                return $row;
            } else {
                return null;
            }
        }

        public function show_detail()
        {   
            $ChartOfAccounts = new ChartOfAccounts();
            $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
            $fetch = $this->select($this->table2, '*', $param);
            $rows = [];
            while($row = $fetch->fetch_assoc()){
                $row['chart'] = $ChartOfAccounts->name($row['chart_id']);
                $rows[] = $row;
            }
            return $rows;
        }

        public function remove()
        {
            $ids = implode(",", $this->inputs['ids']);
            
            $this->delete($this->table2, "$this->pk IN($ids)");
            return $this->delete($this->table, "$this->pk IN($ids)");
        }

        public function generate($journal_code = 'JE')
        {
            return $journal_code . '-' . date('YmdHis');
        }

        public function add_detail()
        {   
            if($this->inputs['type'] == 'D') {
                $value_d = $this->inputs['amount'];
                $value_c = 0;
            } else {
                $value_c = $this->inputs['amount'];
                $value_d = 0;
            }

            $form = [
                'journal_entry_id'      => $this->inputs['journal_entry_id'],
                'chart_id'              => $this->inputs['chart_id'],
                'description'           => $this->inputs['description'],
                'debit'                 => $value_d,
                'credit'                => $value_c,
            ];
            
            $result = $this->insert($this->table2, $form);
            return $result;
        }
    }  
?>