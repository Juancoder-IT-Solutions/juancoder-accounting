<?php
class ExpenseCategories extends Connection
{
    private $table = 'tbl_expense_category';
    public $pk = 'expense_category_id';
    public $name = 'expense_category';

    public $module_name = "Expense Category";
    public $inputs = [];
    public $searchable = ['expense_category_code','expense_category'];
    public $uri = "expense-category";
    public function add()
    {
        $form = array(
            $this->name             => $this->clean($this->inputs[$this->name]),
            'expense_category_code' => $this->inputs['expense_category_code'],
            'expense_type' => $this->inputs['expense_type'],
            'date_added'    => $this->getCurrentDate()
        );
        return $this->insertIfNotExist($this->table, $form);
    }

    public function edit()
    {
        $form = array(
            $this->name             => $this->clean($this->inputs[$this->name]),
            'expense_category_code' => $this->inputs['expense_category_code'],
            'expense_type'          => $this->inputs['expense_type'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : '';
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['expense_type_name'] = $row['expense_type'] == "O" ? "Other Expense" : "Operational Expense";
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

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public static function name($primary_id)
    {
        $self = new self;
        $result = $self->select($self->table, $self->name, "$self->pk  = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$self->name];
    }

    public static function expense_type($primary_id)
    {
        $self = new self;
        $result = $self->select($self->table, 'expense_type', "$self->pk  = '$primary_id'");
        if($result->num_rows > 0){
            $row = $result->fetch_assoc();
            return $row['expense_type'] == "O" ? "Other Expense" : "Operational Expense";
        }else{
            return '';
        }   
        
    }

    public function pos_show()
    {
        $branch_id = $this->clean($this->inputs['branch_id']);
        $warehouse_id = $this->clean($this->inputs['warehouse_id']);

        $rows = array();
        $result = $this->select($this->table, '*', "expense_category_id > 0 ORDER BY expense_category ASC");
        $count = 1;
        while ($row = $result->fetch_assoc()) {
            $row['count'] = $count++;
            $rows[] = $row;
        }
        return $rows;
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
