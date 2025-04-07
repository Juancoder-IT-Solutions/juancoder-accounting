<?php

class Search extends Connection
{
	public $inputs = [];
	public $response = [];

	public function finder()
	{
        $words = $this->clean($this->inputs['words']);

        $this->searchTransactions($words);
        $this->searchMasterData($words);

        return $this->response;
	}

	public function searchMasterData($words)
	{
		$classes = ['Products','ProductCategories','Banks','Customers','Suppliers'];
		foreach($classes as $className){
			$className::search($words,$this->response);
		}
	}

	public function searchTransactions($words)
	{
		$classes = ['PurchaseOrder','PurchaseReturn','Sales','SalesReturn','StockWithdrawal','CustomerPayment','SupplierPayment','Expense','ExpenseCategories','JobOrder','ProductConversion','InventoryAdjustment','Deposit','BeginningBalance'];
		foreach($classes as $className){
			$className::search($words,$this->response);
		}
	}
}
