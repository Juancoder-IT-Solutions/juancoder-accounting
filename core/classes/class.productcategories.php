<?php
class ProductCategories extends Connection
{
    private $table = 'tbl_product_categories';
    public $pk = 'product_category_id';
    public $name = 'product_category';
    public $module_name = "Product Category";

    public $inputs = [];

    public $searchable = ['product_category'];
    public $uri = "product-categories";

    public function add()
    {
        $form = array(
            $this->name => $this->clean($this->inputs[$this->name]),
            'date_added'    => $this->getCurrentDate()
        );

        $result = $this->insertIfNotExist($this->table, $form);
        Logs::storeCrud($this->module_name, 'c', $result, $this->inputs[$this->name]);
        return $result;
    }

    public function edit()
    {
        $form = array(
            $this->name => $this->clean($this->inputs[$this->name]),
            'date_last_modified'    => $this->getCurrentDate()
        );
        $old_name = $this->name($this->inputs[$this->pk]);
        $result = $this->updateIfNotExist($this->table, $form);
        Logs::storeCrud($this->module_name, 'u', $result, $old_name, $this->inputs[$this->name]);
        return $result;
    }

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : '';
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
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

        foreach ($this->inputs['ids'] as $id) {
            $name = self::name($id);
            $result = $this->delete($this->table, "$this->pk = '$id'");
            Logs::storeCrud($this->module_name, 'd', $result, $name);
        }

        return 1; //$this->delete($this->table, "$this->pk IN($ids)");
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
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

    public function schema()
    {
        if (DEVELOPMENT) {
            $default['date_added'] = $this->metadata('date_added', 'datetime', '', 'NOT NULL', 'CURRENT_TIMESTAMP');
            $default['date_last_modified'] = $this->metadata('date_last_modified', 'datetime', '', 'NOT NULL', '', 'ON UPDATE CURRENT_TIMESTAMP');


            // TABLE HEADER
            $tables[] = array(
                'name'      => $this->table,
                'primary'   => $this->pk,
                'fields' => array(
                    $this->metadata($this->pk, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                    $this->metadata($this->name, 'varchar', 75),
                    $this->metadata('remarks', 'varchar', 255),
                    $default['date_added'],
                    $default['date_last_modified']
                )
            );

            return $this->schemaCreator($tables);
        }
    }
}
