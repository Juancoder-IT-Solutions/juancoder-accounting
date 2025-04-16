<?php
class JobOrder extends Connection
{
    private $table = 'tbl_job_orders';
    public $pk = 'job_order_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_job_order_details';
    public $pk2 = 'jo_detail_id';
    public $fk_det = 'product_id';

    public $module_name = "Job Order";
    public $inputs = [];
    public $searchable = ['reference_number','remarks'];
    public $uri = "job-order";

    public function add()
    {

        $finished_product = $this->inputs['product_id'];
        $form = array(
            $this->name         => $this->clean($this->inputs[$this->name]),
            'branch_id'         => $this->getBranch(),
            'product_id'        => $finished_product,
            'no_of_batches'     => $this->inputs['no_of_batches'],
            'remarks'           => $this->inputs['remarks'],
            'job_order_date'    => $this->inputs['job_order_date'],
            'encoded_by'        => $_SESSION['accounting_user']['id'],
            'date_added'    => $this->getCurrentDate()
        );
        $lastId = $this->insertIfNotExist($this->table, $form, '', 'Y');


        if ($lastId > 0) {
            $Formulation = new Formulation();
            $formulation_id = $Formulation->formulation_id($finished_product);
            $result = $this->select("tbl_formulation_details", " * ", "formulation_id=$formulation_id");
            if ($result) {
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_array()) {
                        $Products = new Products;
                        $product_cost = $Products->productCost($row['product_id']);
                        $form_ = array(
                            $this->pk       => $lastId,
                            $this->fk_det   => $row['product_id'],
                            'qty'           => $row['qty'] * $this->inputs['no_of_batches'],
                            'cost'          => $product_cost
                        );

                        $this->insert($this->table_detail, $form_);
                    }
                }
            }
        }
        return $lastId;
    }

    public function add_detail()
    {
        $primary_id = $this->inputs[$this->pk];
        $fk_det     = $this->inputs[$this->fk_det];
        $Products = new Products;
        $product_cost = $Products->productCost($fk_det);
        $form = array(
            $this->pk               => $this->inputs[$this->pk],
            'product_id'            => $this->inputs['product_id'],
            'qty'                   => $this->inputs['qty'],
            'cost'                  => $product_cost,
        );

        return $this->insertIfNotExist($this->table_detail, $form, "$this->pk = '$primary_id' AND $this->fk_det = '$fk_det'");
    }

    public function edit()
    {
        $form = array(
            $this->name             => $this->clean($this->inputs[$this->name]),
            'product_category_id'   => $this->inputs['product_category_id'],
            'no_of_batches'         => $this->inputs['no_of_batches'],
            'remarks'               => $this->inputs['remarks'],
            'job_order_date'        => $this->inputs['job_order_date'],
            'encoded_by'            => $_SESSION['accounting_user']['id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $Users = new Users;
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['product'] = Products::name($row['product_id']);
            $row['encoded_name'] = $Users->getUser($row['encoded_by']);
            $row['date_last_modified'] = ($row['date_last_modified'] == "0000-00-00 00:00:00") ? "" : date('Y-m-d H:i:s', strtotime($row['date_last_modified'] . ' + 8 hours'));
            $rows[] = $row;
        }
        return $rows;
    }

    public function rows($primary_id)
    {
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $Users = new Users;
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        $row['product'] = Products::name($row['product_id']);
        $row['encoded_name'] = $Users->getUser($row['encoded_by']);
        return $row;
    }

    public function show_detail()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $count = 1;
        $result = $this->select($this->table_detail, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['product'] = Products::name($row['product_id']);
            $row['qty'] = $row['qty'];
            $row['cost'] = number_format($row['cost'],2);
            $row['count'] = $count++;
            $rows[] = $row;
        }
        return $rows;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        $this->delete('tbl_product_transactions', "header_id IN($ids) AND module='JO'");
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function status($primary_id)
    {
        $result = $this->select($this->table, $this->status, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->status];
    }

    public function generate()
    {
        return 'JO-' . date('YmdHis');
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];

        $fetch_product_id = $this->select($this->table, 'product_id, no_of_batches', "$this->pk = '$primary_id'");
        $row = $fetch_product_id->fetch_array();

        $cost = $this->totalCost($primary_id)/$row['no_of_batches'];

        $Products = new Products();
        $product_cost = $Products->productCost($row['product_id']);
        $Products->prodAVG($row['product_id'], $row['no_of_batches'], $cost);

        $form_ = array(
            'cost' => $cost,
        );

        $this->update('tbl_product_transactions', $form_, "header_id = '$primary_id' AND detail_id='0' AND module='JO'");

        $form = array(
            'status' => 'F',
        );
        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }

    public function totalCost($primary_id){
        $result = $this->select($this->table_detail, 'sum(cost*qty)', "$this->pk = '$primary_id'");
        $row = $result->fetch_array();

        return $row[0];

    }

    public function schema()
    {
        $default['date_added'] = $this->metadata('date_added', 'datetime', '', 'NOT NULL', 'CURRENT_TIMESTAMP');
        $default['date_last_modified'] = $this->metadata('date_last_modified', 'datetime', '', 'NOT NULL', '', 'ON UPDATE CURRENT_TIMESTAMP');


        // TABLE HEADER
        $tables[] = array(
            'name'      => $this->table,
            'primary'   => $this->pk,
            'fields' => array(
                $this->metadata($this->pk, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                $this->metadata($this->name, 'varchar', 75),
                $this->metadata('product_id', 'int', 11),
                $this->metadata('no_of_batches', 'int', 3, 'NOT NULL'),
                $this->metadata('remarks', 'varchar', 255, 'NOT NULL'),
                $this->metadata('user_id', 'int', 11, 'NOT NULL'),
                $this->metadata('job_order_date', 'datetime', 'NOT NULL'),
                $this->metadata('status', 'varchar', 1),
                $default['date_added'],
                $default['date_last_modified']
            )
        );

        // TABLE DETAILS
        $tables[] = array(
            'name'      => $this->table_detail,
            'primary'   => $this->pk2,
            'fields' => array(
                $this->metadata($this->pk2, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                $this->metadata($this->pk, 'int', 11, 'NOT NULL'),
                $this->metadata('product_id', 'int', 11),
                $this->metadata('qty', 'decimal', '7,2'),
                $this->metadata('cost', 'decimal', '7,2')
            )
        );

        return $this->schemaCreator($tables);
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
}
