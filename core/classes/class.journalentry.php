<?php
    class JournalEntry extends Connection
    {
        private $table = 'tbl_journal_entries';
        public $pk = 'journal_entry_id';
        public $inputs = [];

        public function show()
        {
            $fetch = $this->select($this->table, '*');
            $rows = [];
            while($row = $fetch->fetch_assoc()){
                $row['general_reference'] = $row['reference_number'];
                $rows[] = $row;
            }
            return $rows;
        }
    }  
?>