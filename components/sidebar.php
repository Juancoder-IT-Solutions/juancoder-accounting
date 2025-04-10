<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <?php

        $Menus = new Menus();

        // MASTER DATA
        $Menus->sidebar('Dashboard', 'homepage', 'layout-grid2');
        // $Menus->sidebar('Beginning Balance', 'beginning-balance', 'archive');
       
        $Menus->sidebar('Banks', 'banks', 'wallet');
        $Menus->sidebar('Branches', 'branches', 'home');

        $Menus->sidebar_parent('Employee','file', array(
            array('Employee', 'employee'),
            array('Category', 'employee-category'),
        ));

        $Menus->sidebar_parent('Expense', 'money', array(
            array('Entries', 'expense'),
            array('Categories', 'expense-category'),
        ));
        // $Menus->sidebar('Deposit', 'deposit', 'credit-card');

        // REPORTS
        $Menus->sidebar_parent('Accounting', 'write', array(
            array('Journals', 'journals'),
            array('Chart Classification', 'chart-classification'),
            array('Chart of Accounts', 'chart-of-accounts'),
            array('Journal Entry', 'journal-entry'),
            // array('Bank Due Report', 'bankdue-report'),
            // array('Bank Ledger', 'bank-ledger'),
            // array('Expense Report', 'expense-report'),
            // array('Income Statement', 'income-statement'),
            // array('Statement of Accounts', 'statement-of-accounts'),
        ));

        // ADMIN
        // $Menus->sidebar('Admin Controls', 'admin-controls', 'panel');
        $Menus->sidebar('User Accounts', 'users', 'user');
        $Menus->sidebar('Logs', 'log', 'file');
        ?>
    </ul>
</nav>