<?php

ini_set('max_execution_time', -1);

class Sales extends Connection
{
    private $table = 'tbl_sales';
    public $pk = 'sales_id';
    public $name = 'reference_number';

    private $table_detail = 'tbl_sales_details';
    public $pk2 = 'sales_detail_id';
    public $fk_det = 'product_id';

    public $module = 'SLS';

    public $module_name = "Sales";
    public $inputs = [];
    public $searchable = ['reference_number'];
    public $uri = "sales";


    public function add()
    {
        $for_pick_up = isset($this->inputs['for_pick_up']) ? $this->inputs['for_pick_up'] : 0;
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'customer_id'   => $this->inputs['customer_id'],
            'branch_id'     => isset($this->inputs['branch_id']) ? $this->inputs['branch_id'] : $this->getBranch(),
            'warehouse_id'  => $this->inputs['warehouse_id'],
            'sales_type'    => $this->inputs['sales_type'],
            'discount_id'   => $this->inputs['discount_id'],
            'remarks'       => $this->inputs['remarks'],
            'for_pick_up'   => $for_pick_up,
            'withdrawal_status'   => $for_pick_up,
            'paid_status'   => ($this->inputs['sales_type'] == "C" ? 1 : 0),
            'sales_date'    => $this->inputs['sales_date'],
            'encoded_by'    => isset($this->inputs['encoded_by']) ? $this->inputs['encoded_by'] :  $_SESSION['accounting_user']['id'],
            'date_added'    => $this->getCurrentDate()
        );
        return $this->insertIfNotExist($this->table, $form, '', 'Y');
    }

    public function edit()
    {
        $for_pick_up = isset($this->inputs['for_pick_up']) ? 1 : 0;
        $form = array(
            'customer_id'           => $this->inputs['customer_id'],
            'sales_type'            => $this->inputs['sales_type'],
            'remarks'               => $this->inputs['remarks'],
            'for_pick_up'           => $for_pick_up,
            'withdrawal_status'     => $for_pick_up,
            'paid_status'           => ($this->inputs['sales_type'] == "C" ? 1 : 0),
            'sales_date'            => $this->inputs['sales_date'],
            'encoded_by'            => $_SESSION['accounting_user']['id'],
            'warehouse_id'          => $this->inputs['warehouse_id'],
            'date_last_modified'    => $this->getCurrentDate()
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function show_data()
    {   
        $branch_id = $this->getBranch();
        $param = "branch_id = '$branch_id'";
        $param .= isset($this->inputs['param']) ? $this->inputs['param'] : '';
        $rows = array();
        $result = $this->select('tbl_sales s LEFT JOIN tbl_customers c ON s.customer_id=c.customer_id LEFT JOIN tbl_users u ON s.encoded_by=u.user_id', 's.*,u.user_fullname AS encoded_name,c.customer_name AS customer,c.suki_card_number', $param);
        while ($row = $result->fetch_assoc()) {
            $row['total'] = number_format($row['total_sales_amount'], 2);
            $row['date_last_modified'] = date('Y-m-d H:i:s', strtotime($row['date_last_modified'] . ' + 8 hours'));
            $rows[] = $row;
        }
        return $rows;
    }


    public function show_old()
    {
        $Customers = new Customers;
        $Users = new Users;
        $Warehouses = new Warehouses;
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $customer_name = $row['customer_id'] > 0 ? $Customers->name($row['customer_id']) : 'Walk-in';
            $row['suki_card_number'] = $row['customer_id'] > 0 ? $Customers->get_suki_card_number($row['customer_id']) : '';
            $row['customer'] = $customer_name;

            $row['customer_id'] = $row['customer_id'];
            $total = $row['total_sales_amount'];
            $row['total'] = number_format($total, 2);
            $row['total_nonformat'] = $total;
            $row['inv_ref'] = $row['reference_number'] . " (₱" . number_format($this->dr_balance($row['sales_id']), 2) . ")";
            $row['withdrawal_ref'] = $row['reference_number'] . " (Customer: " . $customer_name . ")";
            $row['encoded_name'] = $Users->getUser($row['encoded_by']);
            $row['warehouse_name'] = $Warehouses->name($row['warehouse_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function show()
    {
        $Customers = new Customers;
        $Users = new Users;
        $Warehouses = new Warehouses;
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select("$this->table s LEFT JOIN tbl_customers c ON s.customer_id=c.customer_id LEFT JOIN tbl_users u ON s.encoded_by=u.user_id LEFT JOIN tbl_warehouses w ON s.warehouse_id=w.warehouse_id", "s.*, c.customer_id, c.customer_name, c.suki_card_number, u.user_fullname, w.warehouse_name", $param);
        while ($row = $result->fetch_assoc()) {
            //$customer_name = $row['customer_id'] > 0 ? $Customers->name($row['customer_id']) : 'Walk-in';
            $customer_name = $row['customer_id'] > 0 ? $row['customer_name'] : 'Walk-in';
            //$row['suki_card_number'] = $row['customer_id'] > 0 ? $Customers->get_suki_card_number($row['customer_id']) : '';
            $row['customer'] = $customer_name;

            //$row['customer_id'] = $row['customer_id'];
            $total = $this->total($row['sales_id']);
            $row['total'] = number_format($total, 2);
            $row['total_nonformat'] = $total;
            $row['inv_ref'] = $row['reference_number'] . " (₱" . number_format($this->dr_balance($row['sales_id']), 2) . ")";
            $row['withdrawal_ref'] = $row['reference_number'] . " (Customer: " . $customer_name . ")";
            $row['encoded_name'] = $row['user_fullname'];//$Users->getUser($row['encoded_by']);
            //$row['warehouse_name'] = $row['warehouse_name'];//$Warehouses->name($row['warehouse_id']);
            $rows[] = $row;
        }
        return $rows;
    }

    public function show_pos()
    {
        $Customers = new Customers;
        $Users = new Users;
        $Warehouses = new Warehouses;
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select("$this->table s LEFT JOIN tbl_customers c ON s.customer_id=c.customer_id LEFT JOIN tbl_users u ON s.encoded_by=u.user_id LEFT JOIN tbl_warehouses w ON s.warehouse_id=w.warehouse_id", "s.*, c.customer_id, c.customer_name, c.suki_card_number, u.user_fullname, w.warehouse_name", $param);
        while ($row = $result->fetch_assoc()) {
            $customer_name = $row['customer_id'] > 0 ? $row['customer_name'] : 'Walk-in';
            $row['suki_card_number'] = $row['customer_id'] > 0 ? $row['suki_card_number'] : "";
            $row['customer'] = $customer_name;
            $row['withdrawal_ref'] = $row['reference_number'] . " (Customer: " . $customer_name . ")";
            $row['encoded_name'] = $row['user_fullname'];
            $total = $row['total_sales_amount'];//$this->total($row['sales_id']);
            $row['total'] = number_format($total, 2);
            $row['total_nonformat'] = $total;
            $rows[] = $row;
        }
        return $rows;
    }

    public function view()
    {
        $primary_id = $this->inputs['id'];
        $Warehouses = new Warehouses;
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        if ($result->num_rows > 0) {
            $Customers = new Customers;
            $row = $result->fetch_assoc();
            $row['customer_name'] = $row['customer_id'] > 0 ? $Customers->name($row['customer_id']) : 'Walk-in';
            $row['salestype'] = $row['sales_type'] == "C" ? "Cash" : "Charge";
            $row['warehouse_name'] = $Warehouses->name($row['warehouse_id']);
            return $row;
        } else {
            return null;
        }
    }

    public function rows($name = null)
    {
        $name = $name == "" ? $this->inputs['id'] : $name;
        $result = $this->select($this->table, "*", "$this->name = '$name'");
        if ($result->num_rows > 0) {
            $Customers = new Customers;
            $row = $result->fetch_assoc();
            $row['customer_name'] = $row['customer_id'] > 0 ? $Customers->name($row['customer_id']) : 'Walk-in';
            $row['salestype'] = $row['sales_type'] == "C" ? "Cash" : "Charge";
            return $row;
        } else {
            return null;
        }
    }

    public function rows_($id)
    {
        $result = $this->select($this->table, "*", "$this->pk = '$id'");
        $row = $result->fetch_assoc();
        return $row;
    }

    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function generate()
    {
        //return 'DR-' . date('ymdHis');
        $fetch = $this->select($this->table, "max(sales_id) + 1 as max_id", $this->pk > 0);
        $row = $fetch->fetch_assoc();
        return sprintf("%'.06d", $row['max_id']);
    }

    public function finish()
    {
        $primary_id = $this->inputs['id'];
        $fetch = $this->select($this->table, "*", "$this->pk='$primary_id'");
        $row = $fetch->fetch_assoc();

        $total_sales_amount = $this->total_sales($primary_id);

        $form = array(
            'status' => 'F',
            'total_sales_amount' => $total_sales_amount
        );

        // update inventory qty
        $result = $this->update($this->table, $form, "$this->pk = '$primary_id'");
        if ($result) {
            $fetch = $this->select($this->table, "*", "$this->pk='$primary_id'");
            $row = $fetch->fetch_assoc();
            $InventoryReport = new InventoryReport;
            $InventoryReport->update_product_qty("tbl_sales_details", "sales_id", $primary_id, $row['branch_id'], $row['warehouse_id']);
        }

        return $result;
    }

    public function pk_by_name($name = null)
    {
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name' AND (status='F' OR status='P')");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function pk_by_name_branch($name = null)
    {
        $branch_id = $this->getBranch();
        $name = $name == null ? $this->inputs[$this->name] : $name;
        $result = $this->select($this->table, $this->pk, "$this->name = '$name' AND (status='F' OR status='P') AND branch_id='$branch_id'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function sales_warehouse($sales_id)
    {
        $result = $this->select($this->table, 'warehouse_id', "$this->pk = '$sales_id'");
        $row = $result->fetch_assoc();
        return $row['warehouse_id'];
    }

    public function pk_name($name, $customer_id)
    {
        $result = $this->select($this->table, $this->pk, "$this->name = '$name' AND (status='F' OR status='P') AND customer_id='$customer_id'");
        $row = $result->fetch_assoc();
        return $row[$this->pk] * 1;
    }

    public function name($primary_id)
    {
        $result = $this->select($this->table, $this->name, "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$this->name];
    }

    public function dataRow($primary_id, $field)
    {
        $result = $this->select($this->table, $field, "$this->pk = '$primary_id'");
        if ($result->num_rows > 0) {
            $row = $result->fetch_array();
            return $row[$field];
        } else {
            return "";
        }
    }

    public function detailsRow($primary_id, $field)
    {
        $result = $this->select($this->table_detail, $field, "$this->pk2 = '$primary_id'");
        if ($result->num_rows > 0) {
            $row = $result->fetch_array();
            return $row[$field];
        } else {
            return "";
        }
    }

    public function add_detail()
    {
        $primary_id = $this->inputs[$this->pk];
        $fk_det     = $this->inputs[$this->fk_det];
        $branch_id  = $this->getBranch();
        $warehouse_id = $this->dataRow($primary_id, 'warehouse_id');

        // check inventory here ...
        $Inventory = new InventoryReport();
        $current_balance = $Inventory->balance_per_warehouse($this->inputs['product_id'], $branch_id, $warehouse_id);
        if ($current_balance - $this->inputs['quantity'] >= 0) {

            $Products = new Products;
            $product_price = $Products->productPrice($fk_det);
            $product_cost = $Products->productCost($fk_det);
            $Discounts = new Discounts();
            $discount_id = $this->dataRow($primary_id, 'discount_id');
            $row_disc = $discount_id > 0 ? $Discounts->manual($discount_id, $fk_det, $this->inputs['quantity'], $product_price) : $Discounts->automatic($fk_det, $product_price, $this->inputs['quantity']);

            $form = array(
                $this->pk       => $this->inputs[$this->pk],
                $this->fk_det   => $fk_det,
                'quantity'      => $this->inputs['quantity'],
                'price'         => $product_price,
                'cost'          => $product_cost,
                'discount'      => $row_disc['discount_amount'],
                'discount_id'   => $row_disc['discount_id'],
            );
            return $this->insert($this->table_detail, $form);
        } else {
            return -3; //insufficient qty
        }
    }

    public function show_detail()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $count = 1;
        $result = $this->select("$this->table_detail d LEFT JOIN tbl_products p ON d.product_id=p.product_id", 'd.*, p.product_name', $param);
        while ($row = $result->fetch_assoc()) {
            //$row['product'] = Products::name($row['product_id']);
            $row['product'] = $row['product_name'];
            $amount = ($row['quantity'] * $row['price']) - $row['discount'];
            $row['amount'] = number_format($amount, 2);
            $row['pos_qty'] = number_format($row['quantity']);
            $row['pos_price'] = "@ &nbsp;" . $row['price'];
            $row['count'] = $count++;
            $rows[] = $row;
        }
        return $rows;
    }

    public function remove_detail()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
    }

    public function total($primary_id)
    {
        $result_dr = $this->select($this->table_detail, 'sum((quantity*price)-discount)', "$this->pk = '$primary_id'");
        $total_dr = $result_dr->fetch_array();

        $result_sr = $this->select("tbl_sales_return as sr, tbl_sales_return_details as srd", "SUM((srd.quantity_return*srd.price)-(srd.discount/srd.quantity*srd.quantity_return)) as total", "sr.sales_return_id=srd.sales_return_id AND sr.status='F' AND sr.sales_id='$primary_id'");
        $total_sr = $result_sr->fetch_array();

        
        $get_credit_memo = $this->select("tbl_credit_memo as h, tbl_credit_memo_details as d", "sum(d.amount)", "d.ref_type='DR' AND d.reference_id='$primary_id' AND h.memo_type='AR' AND h.status='F' AND h.cm_id=d.cm_id");
        $total_cm = $get_credit_memo->fetch_array();

        $get_debit_memo = $this->select("tbl_debit_memo as h, tbl_debit_memo_details as d", "sum(d.amount)", "d.ref_type='DR' AND d.reference_id='$primary_id' AND memo_type='AR' AND h.status='F' AND h.dm_id=d.dm_id");
        $total_dm = $get_debit_memo->fetch_array();

        return ($total_dr[0]+$total_dm[0]) - ($total_sr[0]+$total_cm[0]);
    }

    public function total_sales($primary_id){
        $result_dr = $this->select($this->table_detail, 'sum((quantity*price)-discount)', "$this->pk = '$primary_id'");
        $total_dr = $result_dr->fetch_array();
        return $total_dr[0] * 1;
    }

    public function script_total_sales_runner(){
        $result = "";
        $fetch = $this->select("tbl_sales_return", "sales_id", "status='F'");
        while($row = $fetch->fetch_assoc()){
            $total_sales_amount = $this->total($row['sales_id']);
            $total_sales_amount = $total_sales_amount > 0 ? $total_sales_amount : 0;
            $res = $this->update($this->table, ['total_sales_amount' => $total_sales_amount], "sales_id='$row[sales_id]'");
            if($res){
                $response = "Updated sales id: " . $row['sales_id'] . " amount = " . $total_sales_amount;
            }else{
                $response = "(X) ----> Updated sales id: " . $row['sales_id'];
            }

            $result .= $response . "<br />";
        }

        return $result;
    }

    public function cancel_sales_pos()
    {

        $access_code = $this->inputs['access_code'];

        $Settings = new Settings();
        $setting_row = $Settings->view();
        if ($setting_row['module_cancel'] == $access_code) {
            $reference_number = $this->inputs['reference_number'];
            $param = "reference_number = '$reference_number'";
            $primary_id = $this->getID($param);
            $form = array(
                'status' => 'C'
            );

            return $this->update($this->table, $form, "$this->pk = '$primary_id'");
        } else {
            return -2;
        }
    }

    public function remove_detail_pos()
    {
        $access_code = $this->inputs['access_code'];

        $Settings = new Settings();
        $setting_row = $Settings->view();
        if ($setting_row['module_delete'] == $access_code) {
            $ids = implode(",", $this->inputs['ids']);
            return $this->delete($this->table_detail, "$this->pk2 IN($ids)");
        } else {
            return -2;
        }
    }

    public function save_sales()
    {
        $reference_number = $this->inputs['reference_number'];
        $param = "reference_number = '$reference_number'";
        $primary_id = $this->getID($param);
        $form = array(
            'status' => 'P'
        );

        return $this->update($this->table, $form, "$this->pk = '$primary_id'");
    }

    public function edit_discount()
    {
        $reference_number = $this->inputs['reference_number'];
        $discount_id = $this->inputs['discount_id'];
        $access_code = $this->inputs['access_code'];

        $Settings = new Settings();
        $setting_row = $Settings->view();
        if ($setting_row['module_discount'] == $access_code) {
            $param = "reference_number = '$reference_number'";
            $sales_id = $this->getID($param);

            $Discounts = new Discounts();
            $Discounts->inputs['id'] = $discount_id;
            $row = $Discounts->view();

            if ($row['coverage_type'] == 'A') {
                $result = $this->select($this->table_detail, "sales_detail_id,quantity,price", "sales_id = '$sales_id'");
            } else {
                $result = $this->table("$this->table_detail AS det")
                    ->join("tbl_discount_details AS d", "det.product_id", "=", "d.product_id")
                    ->selectRaw('sales_detail_id', 'quantity', 'price')
                    ->where('d.discount_id', $discount_id)
                    ->where('sales_id', $sales_id)
                    ->get();
            }

            $this->update($this->table_detail, ['discount_id' => 0, 'discount' => 0], "sales_id = '$sales_id'");
            while ($row_dr = $result->fetch_assoc()) {
                $qty = $row_dr['quantity'];
                $price = $row_dr['price'];
                $sales_detail_id = $row_dr['sales_detail_id'];

                $discount_price = $row['is_percentage'] == 1 ? $price * $row['discount_percent'] / 100 : $row['discount_amount'];
                $discount_amount = $discount_price * $qty;
                $this->update($this->table_detail, ['discount_id' => $discount_id, 'discount' => $discount_amount], "sales_detail_id = '$sales_detail_id'");
            }
            $this->update($this->table, ['discount_id' => $discount_id], "sales_id = '$sales_id'");
            return 1;
        } else {
            return -2;
        }
    }

    public function edit_line_discount()
    {
        $sales_detail_id = $this->inputs['sales_detail_id'];
        $line_discount_type = $this->inputs['line_discount_type'];
        $discount = $this->inputs['discount'];
        $access_code = $this->inputs['access_code'];

        $Settings = new Settings();
        $setting_row = $Settings->view();
        if ($setting_row['module_discount'] == $access_code) {
            $this->inputs['param'] = "sales_detail_id='$sales_detail_id'";
            $quantity = $this->detailsRow($sales_detail_id, 'quantity');
            if ($line_discount_type == 1) {
                $discount = ($quantity * $discount);
            } else {
                $discount = $discount;
            }

            $form = array(
                'discount' => $discount
            );

            return $this->update($this->table_detail, $form, " $this->pk2 = '$sales_detail_id'");
        } else {
            return -2; // access denied
        }
    }

    public function getID($param)
    {
        $fetch = $this->select($this->table, $this->pk, $param);

        if ($fetch->num_rows > 0) {
            $row = $fetch->fetch_array();
            return $row[0];
        } else {
            return null;
        }
    }

    public function edit_detail()
    {

        $sales_detail_id = $this->inputs['sales_detail_id'];
        $product_id = $this->detailsRow($sales_detail_id, 'product_id');
        $branch_id = $this->inputs['branch_id'];
        $warehouse_id = $this->inputs['warehouse_id'];

        // check inventory here ...
        $Inventory = new InventoryReport();
        $current_balance = $Inventory->balance_per_warehouse($product_id, $branch_id, $warehouse_id);
        if ($current_balance - $this->inputs['quantity'] >= 0) {

            $sales_id = $this->detailsRow($sales_detail_id, 'sales_id');
            $discount_id = $this->dataRow($sales_id, 'discount_id');

            $Products = new Products;
            $product_price = $Products->productPrice($product_id);

            $Discounts = new Discounts();
            $row_disc = $discount_id > 0 ? $Discounts->manual($discount_id, $product_id, $this->inputs['quantity'], $product_price) : $Discounts->automatic($product_id, $product_price, $this->inputs['quantity']);


            $row_disc = $Discounts->automatic($product_id, $product_price, $this->inputs['quantity']);

            $form = array(
                'quantity'      => $this->inputs['quantity'],
                'discount'      => $row_disc['discount_amount'],
                'discount_id'   => $row_disc['discount_id'],
            );
            return $this->update($this->table_detail, $form, " $this->pk2 = '$sales_detail_id'");
        } else {
            return -3; // insufficient qty
        }
    }

    public function addSalesPOS()
    {

        $response = [];

        if ($this->inputs['product_id'] == "" || $this->inputs['product_id'] <= 0) {
            $Products = new Products;
            $this->inputs['product_id'] = $Products->productID($this->inputs['product_barcode']);
        }

        if ($this->inputs['product_id'] > 0) {

            // check inventory here ...
            $Inventory = new InventoryReport();
            $current_balance = $Inventory->balance_per_warehouse($this->inputs['product_id'], $this->inputs['branch_id'], $this->inputs['warehouse_id']);
            if ($current_balance - $this->inputs['quantity'] >= 0) {

                $reference_number = $this->inputs['reference_number'];
                $param = "reference_number = '$reference_number'";
                $this->inputs['sales_date'] = $this->getCurrentDate();
                $this->inputs['discount_id'] = 0;
                $sales_id = $this->add();

                if ($sales_id == -2) {
                    $sales_id = $this->getID($param);
                }

                // checker for sales num
                if ($reference_number == "") {
                    $reference_number = sprintf("%'.06d", $sales_id);
                    $form = array(
                        'reference_number' => $reference_number
                    );
                    $this->update($this->table, $form, "$this->pk = '$sales_id'");
                }

                $this->inputs[$this->pk] = $sales_id;

                //$res = $this->add_detail();
                $primary_id = $sales_id;
                $fk_det     = $this->inputs[$this->fk_det];

                $Products = new Products;
                $product_price = $Products->productPrice($fk_det);
                $product_cost = $Products->productCost($fk_det);

                $Discounts = new Discounts();
                $row_disc = $Discounts->automatic($fk_det, $product_price, $this->inputs['quantity']);

                $form = array(
                    $this->pk       => $this->inputs[$this->pk],
                    $this->fk_det   => $fk_det,
                    'quantity'      => $this->inputs['quantity'],
                    'price'         => $product_price,
                    'cost'          => $product_cost,
                    'discount'      => $row_disc['discount_amount'],
                    'discount_id'   => $row_disc['discount_id'],
                );

                //return $this->insert($this->table_detail, $form);
                $res = $this->insertIfNotExist($this->table_detail, $form, "sales_id='$primary_id' AND product_id='$fk_det'", 'Y');
                if ($res == -2) {
                    $qty = $this->inputs['quantity'];
                    $this->inputs['param'] = "d.sales_id='$primary_id' AND d.product_id='$fk_det' ";
                    $detail_row = $this->show_detail();

                    if (sizeof($detail_row) > 0) {
                        $this->inputs['quantity'] = $detail_row[0]['quantity'] + $qty;
                        $this->inputs['sales_detail_id'] = $detail_row[0]['sales_detail_id'];
                        $this->edit_detail();
                    }
                }

                $response['response_code'] = 1;
                $response['response_sales_num'] = $reference_number;
                return $response;
                //return 1;
            } else {
                $response['response_code'] = -3;
                $response['response_sales_num'] = "";
                return $response;
                //return -3; //insufficient qty
            }
        } else {
            $response['response_code'] = 0;
            $response['response_sales_num'] = "";
            return $response;
            //return "Cannot find item. Please try again.";
        }
    }

    public function getDetailsPOS()
    {
        //$row = $this->show();
        //$sales_id = $row[0]['sales_id'];
        $reference_number = $this->inputs['reference_number'];
        $param = "reference_number = '$reference_number'";
        $sales_id = $this->getID($param);
        $this->inputs['param'] = "sales_id = '$sales_id' ORDER BY date_added DESC";
        return $this->show_detail();
    }

    public function get_withdrawal_items_pos()
    {
        $reference_number = $this->inputs['reference_number'];
        $param = "reference_number='$reference_number'";
        $sales_id = $this->getID($param);

        $Withdrawal = new StockWithdrawal();

        $rows = array();
        $count = 1;
        $result = $this->select($this->table_detail, '*', "sales_id = '$sales_id' ORDER BY date_added DESC");
        while ($row = $result->fetch_assoc()) {
            $row['product_id'] = $row['product_id'];
            $row['product'] = Products::name($row['product_id']);
            $row['pos_qty'] = number_format($row['quantity']);
            $row['remaining_qty'] = $Withdrawal->remaining_qty($row['sales_detail_id']);
            //$amount = ($row['quantity'] * $row['price']) - $row['discount'];
            //$row['amount'] = number_format($amount, 2);
            //$row['pos_price'] = "@" . $row['price'];
            //$row['count'] = $count++;
            $rows[] = $row;
        }
        return $rows;
    }

    public function change_sales_type()
    {

        $access_code = $this->inputs['access_code'];
        $action = $this->inputs['action'];

        $Settings = new Settings();
        $setting_row = $Settings->view();
        if ($setting_row['module_change_payment_type'] == $access_code || $action == "N") {
            $reference_number = $this->inputs['reference_number'];
            $param = "reference_number = '$reference_number'";
            $sales_id = $this->getID($param);

            $form = array(
                "sales_type" => $this->inputs['sales_type'],
                "paid_status" => $this->inputs['sales_type'] == "C" ? 1 : 0,
                "customer_id" => $this->inputs['customer_id']
            );

            return $this->update($this->table, $form, "sales_id = '$sales_id'");
        } else {
            return -2;
        }
    }

    public function finishSalesPOS()
    {
        $CustomerPayment = new CustomerPayment;
        $RedeemedPoints = new RedeemedPoints;
        $Customers = new Customers;
        $RedeemedPoints = new RedeemedPoints;
        $InventoryReport = new InventoryReport;
        $reference_number = $this->inputs['reference_number'];
        $customer_payment_amount = $this->inputs['customer_payment_amount'];
        $sales_type = $this->inputs['sales_type'];
        $branch_id = $this->inputs['branch_id'];
        $warehouse_id = $this->inputs['warehouse_id'];
        $release_warehouse_id = $this->inputs['for_pickup'] == 1 ? $this->inputs['release_warehouse_id'] : $warehouse_id;

        $param = "reference_number='$reference_number'";

        $primary_id = $this->getID($param);

        // suki card calculation
        $suki_card_number = $Customers->get_suki_card_number($this->inputs['customer_id']);
        if ($suki_card_number != null || $suki_card_number != "") {
            $reward_points = $RedeemedPoints->get_reward_points($primary_id);
            $remarks = $suki_card_number;
        } else {
            $reward_points = 0;
            $remarks = "walk-in";
        }


        // add customer payment if charge
        if ($sales_type == "H" && $customer_payment_amount > 0) {
            $customer_payment_number = $CustomerPayment->generate();
            $CustomerPayment->inputs['reference_number'] = $customer_payment_number;
            $CustomerPayment->inputs['customer_id'] = $this->inputs['customer_id'];
            $CustomerPayment->inputs['payment_type'] = 'C';
            $CustomerPayment->inputs['payment_date'] = $this->getCurrentDate();
            $CustomerPayment->inputs['remarks'] = "walk-in";
            $CustomerPayment->inputs['payment_option_id'] = 0;
            $CustomerPayment->inputs['check_date'] = "";
            $CustomerPayment->inputs['check_number'] = "";
            $CustomerPayment->inputs['check_bank'] = 0;
            $CustomerPayment->inputs['branch_id'] = $this->inputs['branch_id'];
            $CustomerPayment->inputs['encoded_by'] = $this->inputs['encoded_by'];
            $customer_payment_id = $CustomerPayment->add();

            $CustomerPayment->inputs['cp_id'] = $customer_payment_id;
            $CustomerPayment->inputs['ref_id'] = "DR-" . $primary_id;
            $CustomerPayment->inputs['amount'] = $customer_payment_amount;

            $CustomerPayment->add_detail();
        }

        // update header
        $total_sales_amount = $this->total_sales($primary_id);
        $form = array(
            'status' => 'F',
            'for_pick_up' => $this->inputs['for_pickup'],
            'withdrawal_status' => $this->inputs['for_pickup'],
            'encoded_by' => $this->inputs['encoded_by'],
            'reward_points' => $reward_points,
            'remarks' => $remarks,
            'total_sales_amount' => $total_sales_amount,
            'release_warehouse_id' => $release_warehouse_id
        );
        $res = $this->update($this->table, $form, "$this->pk = '$primary_id'");

        if ($res == 1) {

            // add claim slip
            if ($this->inputs['for_pickup'] == 1 && $this->inputs['action'] != "wp") {
                $ClaimSlip = new ClaimSlip;
                $ClaimSlip->inputs['reference_number'] = $ClaimSlip->generate();
                $ClaimSlip->inputs['sales_id'] = $primary_id;
                $ClaimSlip->inputs['total_amount'] = $this->inputs['total_amount'];
                $ClaimSlip->inputs['warehouse_id'] = $this->inputs['release_warehouse_id'];
                $ClaimSlip->inputs['branch_id'] = $this->inputs['branch_id'];
                $ClaimSlip->add();
            }

            // finish all redeemed points
            $RedeemedPoints->inputs['sales_id'] = $primary_id;
            $RedeemedPoints->finish();

            // update inventory qty
            //$this->update_product_qty($primary_id, $branch_id, $warehouse_id);
            $InventoryReport->update_product_qty("tbl_sales_details", "sales_id", $primary_id, $branch_id, $release_warehouse_id);

            // finish all related customer payment
            return $CustomerPayment->finishCustomerPaymentOfDRPOS($primary_id, $this->inputs['customer_id']);
        } else {
            return -1;
        }
    }

    public function sales_summary()
    {
        $user_id = $this->inputs['user_id'];
        /*$rows = array();
        $result = $this->select($this->table, $this->pk, "encoded_by='$user_id' AND sales_summary_id=0 AND status='F' ORDER BY date_added ASC ");
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_array()) {
                $rows[] = $row[0];
            }

            if (sizeof($rows) > 0) {
                $count = 0;
                $fetch = $this->select($this->table_detail, "*", "sales_id IN(" . implode(',', $rows) . ") ");
                while ($sales_row = $fetch->fetch_assoc()) {
                    $sales_row['product'] = Products::name($sales_row['product_id']);
                    $amount = ($sales_row['quantity'] * $sales_row['price']) - $sales_row['discount'];
                    $sales_row['amount'] = number_format($amount, 2);
                    $sales_row['discount'] = number_format($sales_row['discount'], 2);
                    $sales_row['pos_qty'] = number_format($sales_row['quantity']);
                    $sales_row['pos_price'] = "@" . $sales_row['price'];
                    $sales_row['count'] = $count++;
                    $sales_rows[] = $sales_row;
                }
                return $sales_rows;
            }
        } else {
            return [];
        }*/

        $result = $this->table("$this->table AS s")
            ->join("$this->table_detail AS d", 's.sales_id', '=', 'd.sales_id')
            ->join("tbl_products AS p", 'p.product_id', '=', 'd.product_id')
            ->selectRaw('p.product_name', 'd.quantity', 'd.price', 'd.discount', 's.reference_number', 's.date_added')
            ->where('s.encoded_by', $user_id)
            ->where('s.sales_summary_id', 0)
            ->where('s.status', 'F')
            ->get();

        $count = 1;
        $rows = array();
        while ($row = $result->fetch_assoc()) {
            $amount = ($row['quantity'] * $row['price']) - $row['discount'];
            $row['product'] = $row['product_name'];
            $row['amount'] = number_format($amount, 2);
            $row['discount'] = number_format($row['discount'], 2);
            $row['pos_qty'] = number_format($row['quantity']);
            $row['pos_price'] = "@" . $row['price'];
            $rows[] = $row;
        }
        return $rows;
    }

    public function summary_of_charge_sales()
    {
        $user_id = $this->inputs['user_id'];
        $branch_id = $this->inputs['branch_id'];
        $warehouse_id = $this->inputs['warehouse_id'];

        // charge sales
        $fetch_charge_sales = $this->select("tbl_sales as s, tbl_sales_details as d", "sum((d.quantity*d.price)-d.discount) as total_charge_sales", "s.branch_id = '$branch_id' AND s.warehouse_id = '$warehouse_id' AND s.sales_id=d.sales_id AND s.sales_type='H' and s.status='F' and s.sales_summary_id=0 and s.encoded_by='$user_id' ");
        $sales_row = $fetch_charge_sales->fetch_assoc();
        $sales_rows['total_charge_sales'] = $sales_row['total_charge_sales'];

        // customer payment
        $fetch_payment = $this->select("tbl_customer_payment as cp, tbl_customer_payment_details as cd", "sum(cd.amount) as total_payment", "cp.branch_id = '$branch_id' AND cp.cp_id=cd.cp_id AND cp.payment_type='C' and cp.status='F' and cp.sales_summary_id=0 and encoded_by='$user_id' ");
        $payment_row = $fetch_payment->fetch_assoc();
        $sales_rows['total_payment'] = $payment_row['total_payment'] * 1;

        // sales return
        $fetch_sales_return = $this->select("tbl_sales_return as s, tbl_sales_return_details as d", "sum((d.quantity_return*d.price)-((d.discount/d.quantity) * d.quantity_return)) as total_sr", "s.branch_id = '$branch_id' AND s.warehouse_id = '$warehouse_id' AND s.sales_return_id=d.sales_return_id AND s.status='F' and s.sales_summary_id=0 and s.encoded_by='$user_id' and d.quantity_return > 0");
        $sales_return_row = $fetch_sales_return->fetch_assoc();
        $sales_rows['total_sales_return'] = $sales_return_row['total_sr'] * 1;

        // charge sales return
        $fetch_charge_sales_return = $this->select("tbl_sales_return as s, tbl_sales_return_details AS d,
        tbl_customer_payment AS cp, tbl_customer_payment_details AS cpd", "sum((d.quantity_return*d.price)-((d.discount/d.quantity) * d.quantity_return)) as total_charge_sr, SUM(cpd.amount) AS total_cp", "s.branch_id = '$branch_id' AND s.warehouse_id = '$warehouse_id' AND s.sales_return_id=d.sales_return_id AND s.status='F' AND s.sales_summary_id=0 AND s.encoded_by='$user_id' AND cp.cp_id=cpd.cp_id AND cpd.ref_id=s.sales_id AND cpd.`type`='DR' AND cp.`status`='F' and d.quantity_return > 0");
        $charge_sales_return_row = $fetch_charge_sales_return->fetch_assoc();
        $sales_rows['total_charge_sales_return'] =  $charge_sales_return_row['total_charge_sr'] * 1;
        $sales_rows['total_returned_payment'] =  $charge_sales_return_row['total_cp'] * 1;

        // redeemed points
        $fetch_redeemed_points = $this->select("tbl_redeemed_points", "sum(redeem_points) as total_points", "status='F' and sales_summary_id=0 and encoded_by='$user_id' ");
        $redeemed_points_row = $fetch_redeemed_points->fetch_assoc();
        $sales_rows['total_redeemed_points'] = $redeemed_points_row['total_points'] * 1;
        $sales_rows['sales_summary_date'] = date('F d, Y', strtotime($this->getCurrentDate()));

        return $sales_rows;
    }

    public function update_review_sales_summary()
    {
        $encoded_by = $this->inputs['encoded_by'];
        $form = array(
            'sales_summary_id' => $this->inputs['sales_summary_id']
        );
        return $this->update($this->table, $form, "sales_summary_id=0 AND encoded_by='$encoded_by' and (status='F' or status='C') ");
    }

    public function released()
    {
        $StockWithdrawal = new StockWithdrawal;
        //$branch_id = isset($this->inputs['branch_id']) ? $this->inputs['branch_id'] : $this->getBranch();
        $sales_id = $this->inputs['sales_id'];
        $branch_id = $this->dataRow($this->inputs['sales_id'], 'branch_id');
        $warehouse_id = $this->dataRow($this->inputs['sales_id'], 'warehouse_id');

        $ref_number = $StockWithdrawal->generate(); //'SW-' . date('YmdHis');
        $r_qty = $this->inputs['r_qty'];
        $r_id = $this->inputs['r_id'];
        $p_id = $this->inputs['p_id'];

        $form = array(
            $this->name         => $ref_number,
            'branch_id'         => $branch_id,
            'warehouse_id'         => $warehouse_id,
            'sales_id'          => $sales_id,
            'withdrawal_date'   => date("Y-m-d"), //$this->sales_date($sales_id),
            // 'status'            => 'P',
            'status'            => 'S',
            'encoded_by'        => isset($this->inputs['encoded_by']) ? $this->inputs['encoded_by'] :  $_SESSION['accounting_user']['id']
        );

        $withdrawal_id = $this->insert('tbl_stock_withdrawal', $form, 'Y');

        array_map(function ($id, $qty, $product_id) use ($withdrawal_id) {
            //if ($qty > 0) {
            $form_details = array(
                'withdrawal_id' => $withdrawal_id,
                'product_id' => $product_id,
                'qty' => $qty,
                'sales_detail_id' => $id,
                'status' => 'F'
            );
            $this->insert('tbl_stock_withdrawal_details', $form_details);
            // }
        }, $r_id, $r_qty, $p_id);

        $StockWithdrawal->inputs['branch_id'] = $branch_id;
        $StockWithdrawal->inputs['warehouse_id'] = $warehouse_id;
        $StockWithdrawal->finish($withdrawal_id);
        //$this->update("tbl_stock_withdrawal", ['status' => 'P'], "withdrawal_id='$withdrawal_id'");
        return $withdrawal_id;
    }

    public function sales_date($primary_id)
    {
        $result = $this->select($this->table, 'sales_date', "$this->pk = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row['sales_date'];
    }


    public function dr_balance($primary_id)
    {
        $dr_total = $this->total($primary_id);
        $fetch_cp = $this->select('tbl_customer_payment_details as d, tbl_customer_payment as h', "sum(amount) as total", "d.ref_id = $primary_id AND h.cp_id=d.cp_id AND h.status='F'");
        $paid_total = 0;
        while ($row = $fetch_cp->fetch_assoc()) {
            $paid_total += $row['total'];
        }


        return $dr_total - $paid_total;
    }

    public function totalSalesDays($days)
    {
        $branch_id = $this->getBranch();
        $fetchData = $this->select('tbl_sales_details as d, tbl_sales as h', "sum((quantity*price)-discount) as total", "h.sales_id = d.sales_id AND h.sales_date BETWEEN NOW() - INTERVAL $days DAY AND NOW() AND h.status='F' AND h.branch_id='$branch_id'");
        $row = $fetchData->fetch_assoc();

        $result_sr = $this->select("tbl_sales_return as sr, tbl_sales_return_details as srd", "SUM((srd.quantity_return*srd.price)-(srd.discount/srd.quantity*srd.quantity_return)) as total", "sr.branch_id='$branch_id' AND sr.sales_return_id=srd.sales_return_id AND sr.status='F' AND sr.return_date BETWEEN NOW() - INTERVAL $days DAY AND NOW()");
        $total_sr = $result_sr->fetch_array();


        return ($row['total'] - $total_sr['total']) == 0 ? 0 : ($row['total'] - $total_sr['total']);
    }

    public function posPrintReceipt()
    {
        $print_type = $this->inputs['print_type'];

        $reference_number = $this->inputs['reference_number'];
        if ($print_type == 'payment') {
            $sales_id = $reference_number;
        } else if ($print_type == 'checked-releasal') {
            $ClaimSlip = new ClaimSlip;
            $claim_slip_id = $reference_number;
            $sales_id = $ClaimSlip->get_row($claim_slip_id, 'sales_id');
            $withdrawal_id = $ClaimSlip->get_row($claim_slip_id, 'withdrawal_id');
        } else {
            $sales_id = $this->getID("reference_number = '$reference_number'");
        }

        $this->inputs['id'] = $sales_id;
        $header_data = $this->view();

        $Users = new Users();
        $Settings = new Settings();
        $settings_data = $Settings->view();

        $response = [
            'company_data' => $settings_data['company_name'] . "<br>" . $settings_data['company_address'],
            'print_header' => $settings_data['print_header'],
            'print_footer' => $settings_data['print_footer'],
            'sales_date' => $header_data['sales_date'],
            'current_time' => date('m/d/Y h:i:s A'),
            'cashier' => $Users->getUser($header_data['encoded_by']),
            'customer' => $header_data['customer_name'],
            'order_no' => $header_data['reference_number'],
        ];

        if ($print_type == 'sales') {

            $this->inputs['param'] = "sales_id = '$sales_id'";
            $details = $this->show_detail();

            $total_qty = 0;
            $total_amt = 0;
            $items = [];
            foreach ($details as $row) {
                $quantity = $row['quantity'] * 1;
                $amount = ($quantity * $row['price']) - $row['discount'];
                $discounted_price = $amount / $quantity;

                $items[] = [
                    'quantity' => '',
                    'description' => substr(strtoupper($row['product']), 0, 30),
                    'discount' => '',
                    'amount' => ''
                ];

                $items[] = [
                    'quantity' => (float) $quantity,
                    'description' => $quantity . "&nbsp;" . $row['pos_price'],
                    'discounted_price' => (float) $discounted_price,
                    'discount' => (float) $row['discount'],
                    'amount' => number_format($amount, 2)
                ];
                $total_qty += $row['quantity'];
                $total_amt += $amount;
            }

            $CustomerPayment = new CustomerPayment();

            $response['reference_number'] = $header_data['reference_number'];
            $response['items'] = $items;
            $response['payments'] = $CustomerPayment->getPaymentByRef($sales_id);
            $response['total_qty'] = $total_qty;
            $response['total_amt'] = number_format($total_amt, 2);
            $response['duplicate_copy'] = $settings_data['duplicate_order_slip'];
        } else if ($print_type == 'claim') {

            $StockWithdrawal = new StockWithdrawal();
            $withdrawal_id = $StockWithdrawal->getID("sales_id = '$sales_id' ORDER BY date_added DESC LIMIT 1");

            $StockWithdrawal->inputs['param'] = "withdrawal_id = '$withdrawal_id'";
            $items = $StockWithdrawal->show_detail();

            $ClaimSlip = new ClaimSlip();
            $ClaimSlip->inputs['sales_id'] = $sales_id;
            $ClaimSlip->inputs['withdrawal_id'] = $withdrawal_id;
            $claim_slip_id = $ClaimSlip->get_claimslip();

            $response['claim_slip_no'] = $claim_slip_id;
            $response['items'] = $items;
            $response['duplicate_copy'] = $settings_data['duplicate_claim_slip'];
        } else if ($print_type == 'payment') {
            $CustomerPayment = new CustomerPayment();
            $payment_amount = $CustomerPayment->total_paid($sales_id, "DR");
            $cp_id = $CustomerPayment->get_pk_by_ref($sales_id, "DR");
            $CustomerPayment->inputs['id'] = $cp_id;
            $payment_data = $CustomerPayment->view();

            $response['payment_slip_no'] = $payment_data['reference_number'];
            $response['payment_date'] = $payment_data['payment_date'];
            $response['payment_amount'] = (float) $payment_amount;
            $response['duplicate_copy'] = $settings_data['duplicate_payment_slip'];
        } else if ($print_type == 'checked-releasal') {
            $StockWithdrawal = new StockWithdrawal();
            $StockWithdrawal->inputs['param'] = "withdrawal_id = '$withdrawal_id'";
            $items = $StockWithdrawal->show_detail();

            $response['reference_number'] = $StockWithdrawal->name($withdrawal_id);
            $response['items'] = $items;
            $response['withdrawal_date'] = date("Y-m-d H:i:s");
            $response['duplicate_copy'] = $settings_data['duplicate_withdrawal_slip'];
        } else {

            $StockWithdrawal = new StockWithdrawal();
            $withdrawal_id = $StockWithdrawal->getID("sales_id = '$sales_id' ORDER BY date_added DESC LIMIT 1");

            $StockWithdrawal->inputs['param'] = "withdrawal_id = '$withdrawal_id'";
            $items = $StockWithdrawal->show_detail();

            $response['reference_number'] = $StockWithdrawal->name($withdrawal_id);
            $response['items'] = $items;
            $response['withdrawal_date'] = date("Y-m-d H:i:s");
            $response['duplicate_copy'] = $settings_data['duplicate_withdrawal_slip'];
        }

        return $response;
    }

    public function getLastSales()
    {
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $fetch = $this->select($this->table, "sales_id", $param);
        $row = $fetch->fetch_assoc();

        $this->inputs['id'] = $row['sales_id'];
        $rows = $this->view();
        return $rows;
    }

    public function schema()
    {
        if (DEVELOPMENT) {
            $default['date_added'] = $this->metadata('date_added', 'datetime', '', 'NOT NULL', 'CURRENT_TIMESTAMP');
            $default['date_last_modified'] = $this->metadata('date_last_modified', 'datetime', '', 'NOT NULL', '', 'ON UPDATE CURRENT_TIMESTAMP');
            $default['encoded_by'] = $this->metadata('encoded_by', 'int', 11);


            // TABLE HEADER
            $tables[] = array(
                'name'      => $this->table,
                'primary'   => $this->pk,
                'fields' => array(
                    $this->metadata($this->pk, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                    $this->metadata($this->name, 'varchar', 75),
                    $this->metadata('sales_invoice', 'int', 11),
                    $this->metadata('customer_id', 'int', 11),
                    $this->metadata('for_pick_up', 'int', 1, 'NOT NULL', '0', '', "'1 = Yes; 0 = No'"),
                    $this->metadata('sales_type', 'varchar', 1, 'NOT NULL', '', '', "'C=Cash;H=Charge'"),
                    $this->metadata('discount_id', 'int', 11, 'NOT NULL', '0', '', "'Manual Discounts'"),
                    $this->metadata('remarks', 'varchar', 255),
                    $this->metadata('terms', 'int', 3),
                    $this->metadata('reward_points', 'decimal', "6,2"),
                    $this->metadata('sales_summary_id', 'int', 11),
                    $this->metadata('sales_date', 'date'),
                    $this->metadata('paid_status', 'varchar', 1, 'NOT NULL', '0', '', "'1 = Paid; 0 = Unpaid'"),
                    $this->metadata('withdrawal_status', 'int', 1, '', '0', '', "'0 = Fully served ; 1 = Pending'"),
                    $this->metadata('status', 'varchar', 1, 'NOT NULL', "'S'", '', "'S = Saved; F = Finish'"),
                    $default['encoded_by'],
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
                    $this->metadata($this->pk, 'int', 11),
                    $this->metadata($this->fk_det, 'int', 11),
                    $this->metadata('discount_id', 'int', 11, 'NOT NULL', '0', '', "'Automatic Discounts'"),
                    $this->metadata('discount', 'decimal', '12,2'),
                    $this->metadata('quantity', 'decimal', '12,2'),
                    $this->metadata('cost', 'decimal', '12,2'),
                    $this->metadata('price', 'decimal', '12,2'),
                    $default['date_added'],
                    $default['date_last_modified']
                )
            );

            return $this->schemaCreator($tables);
        }
    }

    public function triggers()
    {
        $table_transaction = "tbl_product_transactions";
        // HEADER
        $triggers[] = array(
            'table' => $this->table,
            'name' => 'finish_sales',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "UPDATE", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "UPDATE $table_transaction SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.$this->pk AND module = '$this->module'"
        );

        $triggers[] = array(
            'table' => $this->table,
            'name' => 'delete_sales',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "DELETE", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "DELETE FROM $this->table_detail WHERE $this->pk = OLD.$this->pk"
        );


        // DETAILS
        $triggers[] = array(
            'table' => $this->table_detail,
            'name' => 'add_sales_detail',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "INSERT", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "INSERT INTO $table_transaction (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.quantity,NEW.cost,NEW.price,NEW.$this->pk,NEW.$this->pk2,'$this->module','OUT')"
        );

        $triggers[] = array(
            'table' => $this->table_detail,
            'name' => 'update_sales_detail',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "UPDATE", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "UPDATE $table_transaction SET product_id = NEW.product_id,quantity = NEW.quantity,cost=NEW.cost, price = NEW.price WHERE detail_id = OLD.$this->pk2 AND header_id = OLD.$this->pk AND module = '$this->module'"
        );

        $triggers[] = array(
            'table' => $this->table_detail,
            'name' => 'delete_sales_detail',
            'action_time' => 'AFTER', // ['AFTER','BEFORE']
            'event' => "DELETE", // ['INSERT','UPDATE', 'DELETE']
            "statement" => "DELETE FROM $table_transaction WHERE header_id = OLD.$this->pk AND detail_id = OLD.$this->pk2 AND module = '$this->module'"
        );

        return $this->triggerCreator($triggers);
    }


    public function getHeader()
    {
        $Customers = new Customers;
        $Warehouses = new Warehouses;
        $id = $_POST['id'];
        $result = $this->select($this->table, "*", "$this->pk='$id'");
        $row = $result->fetch_assoc();
        $c_row = $Customers->view($row['customer_id']);
        $row['sales_date_mod'] = date("F j, Y", strtotime($row['sales_date']));
        $row['customer_name'] = $c_row['customer_name'];
        $row['warehouse_name'] = $Warehouses->name($row['warehouse_id']);
        $row['customer_address'] = $c_row['customer_address'];
        $row['customer_tin'] = $c_row['customer_tin'];
        $row['terms'] = $row['terms'];
        $total = $this->total($row['sales_id']);
        $row['total'] = number_format($total, 2);
        $row['due_date'] = date('F j, Y', strtotime($row['sales_date'] . ' + ' . $row['terms'] . ' days'));
        $rows[] = $row;
        return $rows;
    }
    public function getPrintDetails()
    {
        $id = $_POST['id'];
        $Products = new Products;
        $rows = array();
        $result = $this->select($this->table_detail, "*", "$this->pk='$id'");
        while ($row = $result->fetch_assoc()) {
            $amount = ($row['price'] * $row['quantity']) - $row['discount'];
            $row['product_name'] = $Products->name($row['product_id']);
            $row['price'] = number_format($row['price'], 2);
            $row['amount'] = number_format($amount, 2);
            $rows[] = $row;
        }
        return $rows;
    }

    public function total_cash_sales_summary($id)
    {
        $fetchData = $this->select('tbl_sales_details as d, tbl_sales as h', "sum((quantity*price)-discount) as total", "h.sales_id = d.sales_id AND h.sales_summary_id='$id' AND h.status='F' AND h.sales_type='C'");
        $row = $fetchData->fetch_array();

        return $row[0];
    }


    public function sales_qty($id)
    {
        $fetchData = $this->select('tbl_sales_details as d, tbl_sales as h', "sum(quantity) as qty", "h.sales_id = d.sales_id AND h.sales_id='$id'");
        $row = $fetchData->fetch_assoc();

        return $row['qty'];
    }

    public function total_charge_sales_summary($id)
    {
        $fetchData = $this->select('tbl_sales_details as d, tbl_sales as h', "sum((quantity*price)-discount) as total", "h.sales_id = d.sales_id AND h.sales_summary_id='$id' AND h.status='F' AND h.sales_type='H'");
        $row = $fetchData->fetch_array();

        return $row[0];
    }

    public static function search($words, &$rows)
    {
        $self = new self;
        if (count($self->searchable) > 0) {
            $where = implode(" LIKE '%$words%' OR ", $self->searchable) . " LIKE '%$words%'";
            $result = $self->select($self->table, '*', $where);
            while ($row = $result->fetch_assoc()) {
                $names = [];
                foreach ($self->searchable as $f) {
                    $names[] = $row[$f];
                }
                $rows[] = array(
                    'name' => implode(" ", $names),
                    'module' => $self->module_name,
                    'slug' => $self->uri . "?id=" . $row[$self->pk]
                );
            }
        }
    }

    public function graph()
    {
        ini_set('date.timezone', 'UTC');
        //error_reporting(E_ALL);
        date_default_timezone_set('UTC');
        $today = date('H:i:s');
        $year = date('Y', strtotime($today) + 28800);

        $branch_id = $this->getBranch();
        $rows = array();
        $count = 1;
        while ($count <= 12) {
            $result = $this->select('tbl_sales_details as d, tbl_sales as h', "sum((quantity*price)-discount) as total", "h.sales_id = d.sales_id AND h.status='F' AND MONTH(h.sales_date)='$count' AND YEAR(h.sales_date) = '$year' AND h.branch_id='$branch_id'");
            $total_sales = $result->fetch_assoc();

            $result_sr = $this->select('tbl_sales_return_details as d, tbl_sales_return as h', "sum((quantity_return*price)-discount) as total", "h.sales_return_id = d.sales_return_id AND h.status='F' AND MONTH(h.return_date)='$count' AND YEAR(h.return_date) = '$year' AND h.branch_id='$branch_id'");
            $total_return = $result_sr->fetch_assoc();


            $rows[] = ($total_sales['total'] - $total_return['total']) * 1;

            $count++;
        }

        return $rows;
    }

    public function update_terms()
    {
        $form = array(
            'terms'   => $this->inputs['terms']
        );
        return $this->updateIfNotExist($this->table, $form);
    }

    public function top_products()
    {

        $branch_id = $this->getBranch();
        $Products = new Products;
        $sales_return = new SalesReturn;
        $rows = array();
        $result = $this->select('tbl_sales_details as d, tbl_sales as h', "sum((quantity*price)-discount) as total,product_id, count(h.sales_id) as count", "h.sales_id = d.sales_id AND h.status='F' AND h.branch_id='$branch_id' GROUP BY d.product_id ORDER BY sum((quantity*price)-discount) DESC LIMIT 10");
        while ($row = $result->fetch_assoc()) {
            $total = $row['total'] - $sales_return->total_return_by_product($row['product_id']);
            $row['product'] = $Products->name($row['product_id']);
            $row['qty'] = $row['count'];
            $row['total'] = number_format($total, 2);
            $rows[] = $row;
        }

        return $rows;
    }
}
