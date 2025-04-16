<?php
class Menus extends Connection
{
    public function lists()
    {
        $this->menus = array(
            'master-data' => array(
                array('url' => 'beginning-balance', 'name' => 'Beginning Balance', 'class_name' => 'BeginningBalance', 'has_detail' => 0),
                array('url' => 'product-categories', 'name' => 'Product Categories', 'class_name' => 'ProductCategories', 'has_detail' => 0),
                array('url' => 'products', 'name' => 'Product Entries', 'class_name' => 'Products', 'has_detail' => 0),
                array('url' => 'product-price', 'name' => 'Product Price Notice', 'class_name' => 'ProductPrice', 'has_detail' => 1),
                array('url' => 'banks', 'name' => 'Banks', 'class_name' => 'Banks', 'has_detail' => 0),
                array('url' => 'branches', 'name' => 'Branches', 'class_name' => 'Branches', 'has_detail' => 0),
                array('url' => 'customers', 'name' => 'Customers', 'class_name' => 'Customers', 'has_detail' => 0),
                array('url' => 'suppliers', 'name' => 'Suppliers', 'class_name' => 'Suppliers', 'has_detail' => 0),
                array('url' => 'discounts', 'name' => 'Discounts', 'class_name' => 'Discounts', 'has_detail' => 1),
                array('url' => 'payment-option', 'name' => 'Payment Option', 'class_name' => 'PaymentOption', 'has_detail' => 0),
                array('url' => 'formulation', 'name' => 'Formulation', 'class_name' => 'Formulation', 'has_detail' => 1),
                array('url' => 'warehouse', 'name' => 'Warehouse', 'class_name' => 'Warehouse', 'has_detail' => 0),
                array('url' => 'employee', 'name' => 'Employee', 'class_name' => 'Employee', 'has_detail' => 0),
                array('url' => 'employee-category', 'name' => 'Employee Category', 'class_name' => 'EmployeeCategory', 'has_detail' => 0),
            ),
            'transaction' => array(
                array('url' => 'credit-memo', 'name' => 'Credit Memo', 'class_name' => 'CreditMemo', 'has_detail' => 1),
                array('url' => 'debit-memo', 'name' => 'Debit Memo', 'class_name' => 'DebitMemo', 'has_detail' => 1),
                array('url' => 'purchase-order', 'name' => 'Purchase Order Entries', 'class_name' => 'PurchaseOrder', 'has_detail' => 1),
                array('url' => 'purchase-return', 'name' => 'Purchase Order Return', 'class_name' => 'PurchaseReturn', 'has_detail' => 1),
                array('url' => 'sales', 'name' => 'Sales Entries', 'class_name' => 'Sales', 'has_detail' => 1),
                array('url' => 'sales-return', 'name' => 'Sales Return', 'class_name' => 'SalesReturn', 'has_detail' => 1),
                array('url' => 'stock-withdrawal', 'name' => 'Stock Withdrawal', 'class_name' => 'StockWithdrawal', 'has_detail' => 1),
                array('url' => 'customer-payment', 'name' => 'Customer Payment', 'class_name' => 'CustomerPayment', 'has_detail' => 1),
                array('url' => 'supplier-payment', 'name' => 'Supplier Payment', 'class_name' => 'SupplierPayment', 'has_detail' => 1),
                array('url' => 'expense', 'name' => 'Expense', 'class_name' => 'Expense', 'has_detail' => 1),
                array('url' => 'expense-category', 'name' => 'Expense Category', 'class_name' => 'ExpenseCategories', 'has_detail' => 0),
                array('url' => 'job-order', 'name' => 'Job Order', 'class_name' => 'JobOrder', 'has_detail' => 1),
                array('url' => 'product-conversion', 'name' => 'Product Conversion', 'class_name' => 'ProductConversion', 'has_detail' => 1),
                array('url' => 'inventory-adjustment', 'name' => 'Inventory Adjustment', 'class_name' => 'InventoryAdjustment', 'has_detail' => 1),
                array('url' => 'deposit', 'name' => 'Deposit', 'class_name' => 'Deposit', 'has_detail' => 1),
                array('url' => 'stock-transfer', 'name' => 'Stock Transfer', 'class_name' => 'StockTransfer', 'has_detail' => 1),
            ),
            'report' => array(

                array('url' => 'bank-ledger', 'name' => 'Bank Ledger', 'class_name' => 'BankLedger', 'has_detail' => 0),
                array('url' => 'customer-soa', 'name' => 'Customer SOA', 'class_name' => 'ReceivableReport', 'has_detail' => 0),
                array('url' => 'expense-report', 'name' => 'Expense Report', 'class_name' => 'ExpenseReport', 'has_detail' => 0),
                array('url' => 'bankdue-report', 'name' => 'Bank Due Date', 'class_name' => 'BankDueDate', 'has_detail' => 0),
                array('url' => 'payable-aging', 'name' => 'Aging of AP', 'class_name' => 'PayableAging', 'has_detail' => 0),
                array('url' => 'payable-ledger', 'name' => 'Payable Ledger', 'class_name' => 'PayableLedger', 'has_detail' => 0),
                array('url' => 'payable-report', 'name' => 'Payable Report', 'class_name' => 'PayableReport', 'has_detail' => 0),
                array('url' => 'price-list', 'name' => 'Price List', 'class_name' => 'Products', 'has_detail' => 0),
                array('url' => 'purchase-report', 'name' => 'Purchase Report', 'class_name' => 'PurchaseReport', 'has_detail' => 0),
                array('url' => 'receivable-aging', 'name' => 'Aging of AR', 'class_name' => 'ReceivableAging', 'has_detail' => 0),
                array('url' => 'receivable-ledger', 'name' => 'Receivable Ledger', 'class_name' => 'ReceivableLedger', 'has_detail' => 0),
                array('url' => 'receivable-report', 'name' => 'Receivable Report', 'class_name' => 'ReceivableReport', 'has_detail' => 0),
                array('url' => 'sales-report', 'name' => 'Sales Report', 'class_name' => 'SalesReport', 'has_detail' => 0),
                array('url' => 'stock-releasal', 'name' => 'Stock Releasal', 'class_name' => 'StockReleasal', 'has_detail' => 0),
                array('url' => 'inventory-report', 'name' => 'Inventory Report', 'class_name' => 'InventoryReport', 'has_detail' => 0),
                array('url' => 'stock-card', 'name' => 'Stock Card', 'class_name' => 'StockCard', 'has_detail' => 0),
                array('url' => 'income-statement', 'name' => 'Income Statement', 'class_name' => 'IncomeStatement', 'has_detail' => 0),
                array('url' => 'statement-of-accounts', 'name' => 'Statement of Accounts', 'class_name' => 'StatementOfAccounts', 'has_detail' => 0),
            ),
            'accounting' => array(
                array('url' => 'journals', 'name' => 'Journals', 'class_name' => 'Journals', 'has_detail' => 0),
                array('url' => 'chart-classification', 'name' => 'Chart Classification', 'class_name' => 'ChartClassification', 'has_detail' => 0),
                array('url' => 'chart-of-accounts', 'name' => 'Chart of Accounts', 'class_name' => 'ChartOfAccounts', 'has_detail' => 0),
                array('url' => 'journal-entry', 'name' => 'Journal Entry', 'class_name' => 'JournalEntry', 'has_detail' => 1),
            ),
            'admin' => array(
                array('url' => 'admin-controls', 'name' => 'Admin Controls', 'class_name' => 'Settings', 'has_detail' => 0),
                array('url' => 'users', 'name' => 'User Account', 'class_name' => 'Users', 'has_detail' => 0),
                array('url' => 'settings', 'name' => 'Settings', 'class_name' => 'Settings', 'has_detail' => 0),
                array('url' => 'log', 'name' => 'Logs', 'class_name' => 'Logs', 'has_detail' => 0),
            ),
            'user' => array(
                array('url' => 'profile', 'name' => 'Profile', 'class_name' => 'Profile', 'has_detail' => 0),
            ),
        );

        return $this->menus;
    }

    public function routes($page, $dir)
    {
        $this->lists();
        $levels = ['master-data', 'transaction', 'accounting', 'report', 'admin', 'user'];

        if ($page == 'homepage' || $page == 'profile') {
            $this->dir = $dir;
            $this->route_settings = [];
        } else {
            $has_page = false;
            $main_column = '';
            foreach ($levels as $main_column_) {
                if (array_search($page, array_column($this->menus[$main_column_], 'url')) !== FALSE) {
                    $main_column = $main_column_;
                    $has_page = true;
                    break;
                }
            }
            if ($has_page) {
                $index = array_search($page, array_column($this->menus[$main_column], 'url'));
                $list_data = $this->menus[$main_column][$index];

                $UserPrivileges = new UserPrivileges();
                if ($UserPrivileges->check($page, $_SESSION['accounting_user']['id']) == 1) {
                    $this->dir = $dir;
                    $this->route_settings = [
                        'class_name' => $list_data['class_name'],
                        'has_detail' => $list_data['has_detail']
                    ];
                } else {
                    $this->dir = 'pages/restricted/index.php';
                    $this->route_settings = [];
                }
            } else {
                $this->dir = 'pages/404/index.php';
                $this->route_settings = [];
            }
        }
    }

    public function sidebar($name, $url, $ti)
    {
        $UserPrivileges = new UserPrivileges();
        if ($UserPrivileges->check($url, $_SESSION['accounting_user']['id']) == 1) {
            echo '<li class="nav-item">
            <a class="nav-link" href="./' . $url . '">
                <i class="ti ti-' . $ti . ' menu-icon"></i>
                <span class="menu-title">' . $name . '</span>
            </a>
        </li>';
        }
    }

    public function sidebar_parent($name, $ti, $child)
    {
        $UserPrivileges = new UserPrivileges();

        $ui = str_replace(' ', '', strtolower($name));
        $child_label = "";
        foreach ($child as $row) {
            if ($UserPrivileges->check($row[1], $_SESSION['accounting_user']['id']) == 1) {
                $child_label .= '<li class="nav-item"> <a class="nav-link" href="./' . $row[1] . '">' . $row[0] . '</a></li>';
            }
        }
        if ($child_label != '') {
            echo '<li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-' . $ui . '" aria-expanded="false" aria-controls="ui-' . $ui . '">
                <i class="ti ti-' . $ti . ' menu-icon"></i>
                <span class="menu-title">' . $name . '</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-' . $ui . '">
                <ul class="nav flex-column sub-menu">' . $child_label . '</ul>
            </div>
        </li>';
        }
    }
}
