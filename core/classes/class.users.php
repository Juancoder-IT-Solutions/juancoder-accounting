<?php

class Users extends Connection
{
    private $table = 'tbl_users';
    private $pk = 'user_id';
    private $name = 'username';

    public function add()
    {
        $username = $this->clean($this->inputs['username']);
        $is_exist = $this->select($this->table, $this->pk, "username = '$username'");

        if ($is_exist->num_rows > 0) {
            return 2;
        } else {
            if (isset($this->inputs['warehouse_id'])) {
                $warehouse_id = $this->inputs['warehouse_id'];
                $branch_id = $this->getBranch();
            } else {
                $warehouse_id = 0;
                $branch_id = 0;
            }

            $pass = $this->inputs['password'];
            $form = array(
                'user_fullname' => $this->inputs['user_fullname'],
                'user_category' => $this->inputs['user_category'],
                'warehouse_id'  => $warehouse_id,
                'branch_id'     => $branch_id,
                'username'      => $this->inputs['username'],
                'password'      => md5($pass),
                'date_added'    => $this->getCurrentDate()
            );
            return $this->insert($this->table, $form);
        }
    }

    public function edit()
    {
        $primary_id = $this->inputs[$this->pk];
        $user_fullname = $this->clean($this->inputs['user_fullname']);
        $username = $this->clean($this->inputs['username']);
        $is_exist = $this->select($this->table, $this->pk, "username = '$username' AND  $this->pk != '$primary_id'");
        if ($is_exist->num_rows > 0) {
            return 2;
        } else {

            if (isset($this->inputs['warehouse_id'])) {
                $warehouse_id = $this->inputs['warehouse_id'];
                $branch_id = $this->getBranch();
            } else {
                $warehouse_id = 0;
                $branch_id = 0;
            }


            $form = array(
                'user_fullname'         => $user_fullname,
                'username'              => $username,
                'warehouse_id'          => $warehouse_id,
                'branch_id'             => $branch_id,
                'date_last_modified'    => $this->getCurrentDate()
            );
            if ($primary_id != $_SESSION['accounting_user']['id']) {
                $form['user_category'] = $this->inputs['user_category'];
            }
            return $this->update($this->table, $form, "$this->pk = '$primary_id'");
        }
    }


    public function remove()
    {
        $ids = implode(",", $this->inputs['ids']);
        return $this->delete($this->table, "$this->pk IN($ids)");
    }

    public function show()
    {
        $rows = array();
        $param = isset($this->inputs['param']) ? $this->inputs['param'] : '';
        $result = $this->select($this->table, '*', $param);
        while ($row = $result->fetch_assoc()) {
            $row['category'] = ($row['user_category'] == "A" ? "Admin" : ($row['user_category'] == "S" ? "Staff" : ($row['user_category'] == "W" ? "Warehouse Personnel" : "Cashier")));
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

    public static function name($primary_id)
    {
        $self = new self;
        $result = $self->select($self->table, $self->name, "$self->pk  = '$primary_id'");
        $row = $result->fetch_assoc();
        return $row[$self->name];
    }

    public static function getUser($primary_id)
    {
        $self = new self;
        $result = $self->select($self->table, 'user_fullname', "$self->pk  = '$primary_id'");
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            return $row['user_fullname'];
        } else {
            return null;
        }
    }

    public function dataRow($primary_id, $field)
    {
        $result = $this->select($this->table, $field, "$this->pk = '$primary_id'");
        $row = $result->fetch_array();
        return $row[$field];
    }

    public function row($primary_id)
    {
        $result = $this->select($this->table, "*", "$this->pk = '$primary_id'");
        $row = $result->fetch_array();
        return $row;
    }

    public function login()
    {
        $response = [];
        $username = $this->clean($this->inputs['username']);
        $password = md5($this->clean($this->inputs['password']));
        // $result = $this->select($this->table, '*', "username = '$username' AND password = '$password' AND user_category != 'C'");
        $result = $this->select($this->table, '*', "username = '$username' AND password = '$password'");
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $response['login'] = 'Yes';
            $_SESSION['accounting_user']['id'] = $row['user_id'];
            $_SESSION['user']['fullname'] = $row['user_fullname'];
            $_SESSION['user']['category'] = $row['user_category'];

            Logs::store("Successfully Login", "Login", $row['user_id']);
        } else {
            $response['login'] = 'No';
        }
        return $response;
    }

    public function loginCashier()
    {
        $response = [];
        $username = $this->clean($this->inputs['username']);
        $password = md5($this->clean($this->inputs['password']));
        $result = $this->select($this->table, '*', "username = '$username' AND password = '$password' AND user_category='C'");
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            if ($row['branch_id'] > 0 and $row['warehouse_id'] > 0) {
                $response['login'] = 'Yes';
                $response['user_id'] = $row['user_id'];
                $response['user_category'] = $row['user_category'];
                $response['user_fullname'] = $row['user_fullname'];
                $response['branch_id'] = $row['branch_id'];
                $response['warehouse_id'] = $row['warehouse_id'];
            } else {
                $response['login'] = 'No branch';
                $response['user_id'] = "";
            }
        } else {
            $response['login'] = 'No';
            $response['user_id'] = "";
        }
        return $response;
    }

    public function logout()
    {
        session_destroy();
    }
}
