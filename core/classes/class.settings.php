<?php
class Settings extends Connection
{
    private $table = 'tbl_settings';
    public $pk = 'settings_id';

    public $inputs;

    public function add()
    {
        $form = array(
            'module_discount'               => $this->inputs['module_discount'],
            'module_cancel'                 => $this->inputs['module_cancel'],
            'module_delete'                 => $this->inputs['module_delete'],
            'module_add_customer'           => $this->inputs['module_add_customer'],
            'module_change_payment_type'    => $this->inputs['module_change_payment_type'],
            'module_remove_online_payment'  => $this->inputs['module_remove_online_payment'],
        );

        $result = $this->select($this->table, 'settings_id');
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $settings_id = $row['settings_id'];
            return $this->update($this->table, $form, "settings_id = '$settings_id'");
        } else {
            return $this->insert($this->table, $form);
        }
    }

    public function addProfile()
    {
        $form = array(
            'company_name'      => $this->clean($this->inputs['company_name']),
            'company_address'   => $this->clean($this->inputs['company_address']),
            'print_header'      => $this->clean($this->inputs['print_header']),
            'print_footer'      => $this->clean($this->inputs['print_footer']),
            'rewards_point_factor'      => $this->clean($this->inputs['rewards_point_factor']),
            'duplicate_order_slip'      => 0,
            'duplicate_withdrawal_slip' => 0,
            'duplicate_claim_slip'      => 0,
            'has_warehouse_checker'     => 0,
        );
        $loop = $this->inputs['allows'];
        if (count($loop) > 0) {
            foreach ($loop as $value) {
                $form[$value] = 1;
            }
        }
        $result = $this->select($this->table, 'settings_id');
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $settings_id = $row['settings_id'];
            return $this->update($this->table, $form, "settings_id = '$settings_id'");
        } else {
            return $this->insert($this->table, $form);
        }
    }

    public function view()
    {
        $result = $this->select($this->table);
        return $result->fetch_assoc();
    }

    public function get_reward_points_factor()
    {
        $result = $this->select($this->table, "rewards_point_factor");
        $row = $result->fetch_assoc();
        return $row['rewards_point_factor'];
    }

    public function version()
    {
        $repo = __DIR__ . "../../";
        $git_file = "C:\Program Files\Git\bin\git";
        $output = shell_exec("cd $repo && git pull 2>&1");
        return "<pre>$output</pre>";
    }

    public function backup()
    {

        // Define the backup directory
        $backupDir = '../backup/' . date('Y/m/d/');

        // Create the backup directory if it doesn't exist
        if (!is_dir($backupDir)) {
            mkdir($backupDir, 0755, true);
        }

        $backupFile = $backupDir . date('Ymd-His') . '.sql';

        // Open the backup file for writing
        $fileHandler = fopen($backupFile, 'w');

        // Get a list of all tables in the database
        $tables = array();
        $result = $this->query("SHOW TABLES");
        while ($row = $result->fetch_row()) {
            $tables[] = $row[0];
        }

        // Get a list of all triggers in the database
        $triggers = array();
        $result = $this->query("SHOW TRIGGERS");
        while ($row = $result->fetch_assoc()) {
            $triggers[] = $row['Trigger'];
        }

        // Get a list of all views in the database
        $views = array();
        $result = $this->query("SHOW FULL TABLES WHERE Table_type = 'VIEW'");
        while ($row = $result->fetch_row()) {
            $views[] = $row[0];
        }

        // Iterate through each table, trigger, and view and export its structure and data
        foreach (array_merge($tables, $triggers, $views) as $item) {
            // Check if it's a table, trigger, or view
            if (in_array($item, $tables)) {
                // Retrieve table structure
                $structure = $this->query("SHOW CREATE TABLE `$item`");
                $row = $structure->fetch_row();
                fwrite($fileHandler, $row[1] . ";\n");

                // Retrieve table data
                $data = $this->query("SELECT * FROM `$item`");
                while ($row = $data->fetch_row()) {
                    $values = array();
                    foreach ($row as $value) {
                        $values[] = "'" . $this->clean($value) . "'";
                    }
                    fwrite($fileHandler, "INSERT INTO `$item` VALUES (" . implode(', ', $values) . ");\n");
                }
            } elseif (in_array($item, $triggers)) {
                // Retrieve trigger definition
                $definition = $this->query("SHOW CREATE TRIGGER `$item`");
                $row = $definition->fetch_row();
                fwrite($fileHandler, $row[2] . ";;\n");
            } elseif (in_array($item, $views)) {
                // Retrieve view definition
                $definition = $this->query("SHOW CREATE VIEW `$item`");
                $row = $definition->fetch_row();
                fwrite($fileHandler, $row[1] . ";\n");
            }

            fwrite($fileHandler, "\n");
        }

        // Close the backup file
        fclose($fileHandler);
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
                    $this->metadata('module_discount', 'varchar', 32),
                    $this->metadata('module_cancel', 'varchar', 32),
                    $this->metadata('module_delete', 'varchar', 32),
                    $this->metadata('module_add_customer', 'varchar', 32),
                    $this->metadata('module_change_payment_type', 'varchar', 32),
                    $this->metadata('module_remove_online_payment', 'varchar', 32),
                    $this->metadata('company_name', 'varchar', 50),
                    $this->metadata('company_address', 'varchar', 100),
                    $this->metadata('print_header', 'text'),
                    $this->metadata('print_footer', 'text'),
                    $this->metadata('duplicate_order_slip', 'int', 1),
                    $this->metadata('duplicate_withdrawal_slip', 'int', 1),
                    $this->metadata('duplicate_claim_slip', 'int', 1),
                    $this->metadata('duplicate_payment_slip', 'int', 1),
                    $this->metadata('rewards_point_factor', 'decimal', '12,2'),
                    $this->metadata('has_warehouse_checker', 'int', 1),
                    $default['date_added'],
                    $default['date_last_modified']
                )
            );

            return $this->schemaCreator($tables);
        }
    }
}
