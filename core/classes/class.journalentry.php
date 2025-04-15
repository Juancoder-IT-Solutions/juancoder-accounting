<?php
    class JournalEntry extends Connection
    {
        private $table = 'tbl_journal_entries';
        public $pk = 'journal_entry_id';
        public $inputs = [];

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

        public function add(){
            $form = array(
                'journal_id'         => $this->inputs['journal_id'],
                'reference_number'   => $this->inputs['reference_number'],
                'cross_reference'    => $this->inputs['cross_reference'],
                'branch_id'          => $this->getBranch(),
                'journal_date'       => $this->inputs['journal_date'],
                'remarks'            => $this->inputs['remarks'],
                'is_manual'          => 1,
            );

            $result = $this->insert($this->table, $form,'', 'Y');
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

        public function generate($journal_code = 'JE')
        {
            return $journal_code . '-' . date('YmdHis');
        }
    }  
?>