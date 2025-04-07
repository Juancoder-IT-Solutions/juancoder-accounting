<?php

class RedeemedPoints extends Connection {
    private $table = 'tbl_redeemed_points';
    public $pk = 'redeem_id';
    public $name = 'reference_number';

    public $module_name = "Redeemed Points";
    public $inputs = [];

    public function add()
    {
        $form = array(
            $this->name     => $this->clean($this->inputs[$this->name]),
            'sales_id'      => $this->inputs['sales_id'],
            'customer_id'  => $this->inputs['customer_id'],
            'redeem_points'  => $this->inputs['redeem_points'],
            'encoded_by'  => $this->inputs['encoded_by'],
            'suki_card_number' => $this->inputs['suki_card_number'],
            'status'        => 'S'
        );
        return $this->insertIfNotExist($this->table, $form);
    }

    public function finish()
    {
        $sales_id = $this->inputs['sales_id'];
        $form = array(
            'status' => 'F',
        );
        return $this->update($this->table, $form, "sales_id = '$sales_id'");
    }

    public function generate()
    {
        return 'RP-' . date('YmdHis');
    }

    public function show()
    {
        $Customers = new Customers;
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : null;
        $rows = array();
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {

            $sales_id = $row['sales_id'];
            $fetch_sales = $this->select("tbl_sales", "*", "sales_id = '$sales_id'");
            $sales_row = $fetch_sales->fetch_array();

            $customer_name = $sales_row['customer_id'] > 0 ? $Customers->name($sales_row['customer_id']) : 'Walk-in';
            $row['customer'] = $customer_name;
            $total = $row['total_amount'];
            $row['total'] = number_format($total, 2);
            $row['total_nonformat'] = $total;
            $row['sales_num'] = $sales_row['reference_number'];
            $row['sales_type'] = $sales_row['sales_type'];

            $rows[] = $row;
        }
        return $rows;
    }

    public function get_reward_points($sales_id){
        $Settings = new Settings;
        
        $fetch_total_sales = $this->select("tbl_sales_details", "sum((quantity*price)-discount) as total", "sales_id = '$sales_id'");
        $sales_row = $fetch_total_sales->fetch_assoc();
        $reward_points_factor = $Settings->get_reward_points_factor();

        $reward_points = $reward_points_factor > 0 ? $sales_row['total']/$reward_points_factor : 0;

        return $reward_points;
    }

    public function get_available_reward_points(){
        $Customers = new Customers;
        $customer_id = $this->inputs['customer_id'];
        $suki_card_number = $Customers->get_suki_card_number($customer_id);

        //return $total_points['total'] - $redeemed_points['total'];
        
        // total points
        $fetch_total_points = $this->select("tbl_sales", "sum(reward_points) as total", "remarks='$suki_card_number' and remarks != '' ");
        $total_points = $fetch_total_points->fetch_assoc();
        // total redeemed points
        $fetch_total_redeemed_points = $this->select($this->table, "sum(redeem_points) as total", "suki_card_number='$suki_card_number' and suki_card_number != '' ");
        $redeemed_points = $fetch_total_redeemed_points->fetch_assoc();
        $available_points = ($total_points['total']*1) - ($redeemed_points['total']*1);
        return $available_points;
    }

    public function update_review_sales_summary()
    {
        $encoded_by = $this->inputs['encoded_by'];
        $form = array(
            'sales_summary_id' => $this->inputs['sales_summary_id']
        );
        return $this->update($this->table, $form, "sales_summary_id=0 AND encoded_by='$encoded_by' and (status='F' or status='C') ");
    }

    /*

CREATE TABLE `tbl_redeemed_points` (
  `redeem_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(30) NOT NULL DEFAULT '',
  `customer_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `redeem_points` decimal(9,2) NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '',
  `sales_summary_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`redeem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

*/

    public function schema()
    {
        if (DEVELOPMENT) {
            $default['date_added'] = $this->metadata('date_added', 'datetime', '', 'NOT NULL', 'CURRENT_TIMESTAMP');
            $default['date_last_modified'] = $this->metadata('date_last_modified', 'datetime', '', 'NOT NULL', 'CURRENT_TIMESTAMP', 'ON UPDATE CURRENT_TIMESTAMP');
            $default['encoded_by'] = $this->metadata('encoded_by', 'int', 11);


            // TABLE HEADER
            $tables[] = array(
                'name'      => $this->table,
                'primary'   => $this->pk,
                'fields' => array(
                    $this->metadata($this->pk, 'int', 11, 'NOT NULL', '', 'AUTO_INCREMENT'),
                    $this->metadata($this->name, 'varchar', 75),
                    $this->metadata('customer_id', 'int', 11),
                    $this->metadata('sales_id', 'int', 11),
                    $this->metadata('redeem_points', 'decimal', "9,2"),
                    $this->metadata('sales_summary_id', 'int', 11),
                    $this->metadata('status', 'varchar', 1, 'NOT NULL', "'S'", '', "'S = Saved; F = Finish'"),
                    $default['encoded_by'],
                    $default['date_added'],
                    $default['date_last_modified']
                )
            );

            return $this->schemaCreator($tables);
        }
    }
}





?>