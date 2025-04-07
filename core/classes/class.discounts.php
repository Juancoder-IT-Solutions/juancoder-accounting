<?php
class Discounts extends Connection
{
    private $table = 'tbl_discounts';
    public $pk = 'discount_id';
    public $name = 'discount_name';
    public $status = 'status';

    private $table_detail = 'tbl_discount_details';
    public $pk2 = 'discount_detail_id';

    public $inputs;

    public function add()
    {
        $discount_start = $this->inputs['discount_start'];
        $discount_end = $this->inputs['discount_end'];

        if ($discount_start > $discount_end)
            return 'conflict';

        $result = $this->select($this->table, $this->pk, "('$discount_start' BETWEEN discount_start AND discount_end OR '$discount_end' BETWEEN discount_start AND discount_end)");

        if ($result->num_rows > 0)
            return 'conflict';

        $form = array(
            $this->name         => $this->clean($this->inputs[$this->name]),
            'description'       => $this->inputs['description'],
            'coverage_type'     => $this->inputs['coverage_type'],
            'is_percentage'     => $this->inputs['is_percentage'],
            'discount_percent'  => $this->inputs['discount_percent'],
            'discount_amount'   => $this->inputs['discount_amount'],
            'discount_type'     => $this->inputs['discount_type'],
            'discount_start'    => $this->inputs['discount_start'],
            'discount_end'      => $this->inputs['discount_end'],
            'date_added'    => $this->getCurrentDate()
        );
        return $this->insertIfNotExist($this->table, $form, '', 'Y');
    }

    public function edit()
    {
        $discount_start = $this->inputs['discount_start'];
        $discount_end = $this->inputs['discount_end'];
        $primary_id = $this->inputs['discount_id'];

        if ($discount_start > $discount_end)
            return 'conflict';

        $result = $this->select($this->table, $this->pk, "('$discount_start' BETWEEN discount_start AND discount_end OR '$discount_end' BETWEEN discount_start AND discount_end) AND discount_id !='$primary_id'");

        if ($result->num_rows > 0)
            return 'conflict';

        $form = array(
            $this->name         => $this->clean($this->inputs[$this->name]),
            'description'       => $this->inputs['description'],
            'coverage_type'     => $this->inputs['coverage_type'],
            'is_percentage'     => $this->inputs['is_percentage'],
            'discount_percent'  => $this->inputs['discount_percent'],
            'discount_amount'   => $this->inputs['discount_amount'],
            'discount_type'     => $this->inputs['discount_type'],
            'discount_start'    => $this->inputs['discount_start'],
            'discount_end'      => $this->inputs['discount_end'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['duration'] = date('M, d Y', strtotime($row['discount_start'])) . "-" . date('M, d Y', strtotime($row['discount_end']));
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();

        $row['coverage'] = $row['coverage_type'] == 'A' ? "All Items" : "Selected Items";
        $row['poa'] = $row['is_percentage'] == 1 ? ($row['discount_percent'] * 1) . "% Off Discount" : "Less ₱" . $row['discount_amount'] . " per Item";
        $row['type'] = $row['discount_type'] == 'A' ? "Automatic" : "Manual";
        $row['duration'] = date('M, d Y', strtotime($row['discount_start'])) . "-" . date('M, d Y', strtotime($row['discount_end']));
        return $row;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
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

    public function coverage($primary_id)
    {
        $result = $this->select($this->table, 'coverage_type', "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row['coverage_type'];
    }

    public function show_detail()
    {
        $discount_id = $this->inputs['discount_id'];
        $status = $this->status($discount_id);
        $coverage = $this->coverage($discount_id);
        if ($status == 'F') {
            if ($coverage == 'A') {
                $table = "tbl_products";
                $result = $this->select($table);
            } else {
                $table = $this->table_detail;
                $param = "det.product_id = p.product_id AND det.discount_id = '$discount_id'";
                $result = $this->select("$this->table_detail AS det, tbl_products AS p", 'product_name', $param);
            }
        } else {
            $table = "tbl_products";
            $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
            $result = $this->select($table, '*', $param);
        }

        $rows = array();
        $count = 1;
        while ($row = $result->fetch_assoc()) {
            $row['is_checked'] = $status == 'F' ? '' : ($this->isItemDiscount($discount_id, $row['product_id']) > 0 ? 'checked' : '');
            $row['count'] = $count++;
            $rows[] = $row;
        }
        return $rows;
    }

    public function isItemDiscount($discount_id, $product_id)
    {
        $is_exist = $this->select($this->table_detail, $this->pk2, "product_id = '$product_id' AND discount_id = '$discount_id'");
        return $is_exist->num_rows;
    }

    public function add_item_discount()
    {
        $product = isset($this->inputs['product_id']) ? $this->inputs['product_id'] : [];
        $discount_id = $this->inputs['discount_id'];
        $all_item = $this->inputs['all_item'];

        $product_ids = $all_item == 1 ? $product : ($this->inputs['is_checked'] == 'true' ? [$product] : []);

        if (count($product_ids) > 0) {
            foreach ($product_ids as $product_id) {
                $form = array(
                    'discount_id'   => $discount_id,
                    'product_id'    => $product_id
                );
                $this->insertIfNotExist($this->table_detail, $form, "product_id = '$product_id' AND discount_id = '$discount_id'");
            }
        }

        if ($all_item == 1) {
            $product_category_id = $this->inputs['product_category_id'];
            $Products = new Products();
            $product_category_id > 0 ? $ject[] = "product_category_id = '$product_category_id'" : "";
            count($product_ids) > 0 ? $ject[] = "product_id NOT IN(" . implode(',', $product_ids) . ")" : "";
            $inject = implode(" AND ", $ject);
            $Products->inputs['param'] = $inject;
            $products = $Products->show();
            $product_del = [];
            if (count($products) > 0) {
                foreach ($products as $rowP) {
                    $product_del[] = $rowP['product_id'];
                }
            }
        } else {
            $product_del = ($this->inputs['is_checked'] == 'true') ? [] : [$product];
        }

        if (count($product_del) > 0) {
            foreach ($product_del as $product_id) {
                $form = array(
                    'discount_id'   => $discount_id,
                    'product_id'    => $product_id
                );
                $this->delete($this->table_detail, "product_id = '$product_id' AND discount_id = '$discount_id'");
            }
        }
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $form = array(
            'status' => 'F',
        );
        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }

    public function automatic($product_id, $product_price, $qty)
    {
        $discount_id = 0;
        $discount_amount = 0;

        $has_discount = false;
        $row_discount = [];

        $result = $this->select($this->table, "IF(is_percentage = 1,$product_price*discount_percent/100,discount_amount) AS discounted_price,discount_id,coverage_type", "status = 'F' AND discount_type = 'A' AND NOW() BETWEEN discount_start AND discount_end ORDER BY discount_start DESC");

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if ($row['coverage_type'] == 'A') {
                    $has_discount = true;
                    $row_discount = $row;
                    break;
                } else {
                    $result2 = $this->select($this->table_detail, "discount_id", "discount_id = '$row[discount_id]' AND product_id = '$product_id'");
                    if ($result2->num_rows > 0) {
                        $has_discount = true;
                        $row_discount = $row;
                        break;
                    }
                }
            }

            if ($has_discount) {
                $discount_amount = $row_discount['discounted_price'] * $qty;
                $discount_id = $row_discount['discount_id'];
            }
        }
        return ['discount_id' => $discount_id, 'discount_amount' => $discount_amount];
    }

    public function manual($discount_id, $product_id, $quantity, $price)
    {
        $discount_amount = 0;
        $has_discount = false;

        $this->inputs['id'] = $discount_id;
        $row_discount = $this->view();

        if ($row_discount['coverage_type'] == 'A') {
            $has_discount = true;
        } else {
            $result2 = $this->select($this->table_detail, "discount_id", "discount_id = '$discount_id' AND product_id = '$product_id'");
            if ($result2->num_rows > 0) {
                $has_discount = true;
            }
        }

        if ($has_discount) {
            $discounted_price = $row_discount['is_percentage'] == 1 ? $price * $row_discount['discount_percent'] / 100 : $row_discount['discount_amount'];
            $discount_amount = $discounted_price * $quantity;
        }
        return ['discount_id' => 0, 'discount_amount' => $discount_amount];
    }

    public function dataRow($primary_id, $field)
    {
        $result = $this->select($this->table, $field, "$this->pk = '$primary_id'");
        $row = $result->fetch_array();
        return $row[$field];
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
                    $this->metadata($this->status, 'varchar', 1),
                    $this->metadata('description', 'varchar', 255),
                    $this->metadata('coverage_type', 'varchar', 1, 'NOT NULL', '', '', "'A=All;L=Limited'"),
                    $this->metadata('discount_type', 'varchar', 1, 'NOT NULL', '', '', "'A=Automatic;M=Manual'"),
                    $this->metadata('is_percentage', 'int', 1),
                    $this->metadata('discount_percent', 'decimal', '12,2'),
                    $this->metadata('discount_amount', 'decimal', '12,2'),
                    $this->metadata('discount_start', 'date'),
                    $this->metadata('discount_end', 'date'),
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
                    $this->metadata('product_id', 'int', 11, 'NOT NULL'),
                    $default['date_added'],
                    $default['date_last_modified']
                )
            );

            return $this->schemaCreator($tables);
        }
    }
}
