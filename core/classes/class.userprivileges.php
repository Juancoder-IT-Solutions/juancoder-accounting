<?php

class UserPrivileges extends Connection
{
    private $table = 'tbl_user_privileges';
    private $pk = 'privilege_id';
    public $inputs = [];

    public function add()
    {
        $user_id = $this->inputs['user_id'];
        $loop = $this->inputs;

        $this->update($this->table, ['status' => 0], "user_id = '$user_id'");
        if (count($loop) > 0) {
            foreach ($loop as $url => $status) {
                if ($url != 'user_id') {
                    $result = $this->select($this->table, $this->pk, "user_id = '$user_id' AND url='$url'");
                    if ($result->num_rows > 0) {
                        $row = $result->fetch_assoc();
                        $privilege_id = $row['privilege_id'];

                        $this->update(
                            $this->table, 
                            ['status' => 1], 
                            "$this->pk = '$privilege_id'"
                        );

                    } else {
                        $this->insert($this->table, [
                            'user_id' => $user_id,
                            'url' => $url,
                            'status' => 1
                        ]);
                    }
                }
            }
        }
        return 1;
    }

    public function lists()
    {
        $user_id = $this->inputs['id'];
        $Menus = new Menus();
        $Menus->lists();

        $master_data = [];
        $_menus = $Menus->menus['master-data'];
        foreach ($_menus as $row) {
            $master_data[] = [
                'name'      => $row['name'], 
                'url'       => $row['url'], 
                'status'    => $this->check($row['url'], $user_id)
            ];
        }

        $transaction_data = [];
        $_menus = $Menus->menus['transaction'];
        foreach ($_menus as $row) {
            $transaction_data[] = [
                'name'      => $row['name'], 
                'url'       => $row['url'], 
                'status'    => $this->check($row['url'], $user_id)
            ];
        }

        $reports_data = [];
        $_menus = $Menus->menus['report'];
        foreach ($_menus as $row) {
            $reports_data[] = ['name' => $row['name'], 'url' => $row['url'], 'status' => $this->check($row['url'], $user_id)];
        }

        return [
            'masterdata' => $master_data,
            'transaction' => $transaction_data,
            'report' => $reports_data,
        ];
    }

    public function check($url, $user_id)
    {
        $User = new Users();
        $user_category = $User->dataRow($user_id, 'user_category');
        if ($user_category == 'A') {
            return 1;
        } else {
            if ($url == 'homepage') {
                return 1;
            } else {
                $result = $this->select($this->table, 'status', "url = '$url' AND user_id = '$user_id'");
                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    return (int) $row['status'];
                } else {
                    return 0;
                }
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
                    $this->metadata('user_id', 'int'),
                    $this->metadata('url', 'varchar', 50),
                    $this->metadata('status', 'int', 1),
                    $default['date_added'],
                    $default['date_last_modified']
                )
            );

            return $this->schemaCreator($tables);
        }
    }
}
