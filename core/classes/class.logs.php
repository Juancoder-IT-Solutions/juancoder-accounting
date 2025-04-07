<?php

class Logs extends Connection
{
	public static function store($action, $module, $user_id = 0, $date = '')
	{
		$log_filename = $_SERVER['DOCUMENT_ROOT'] . "/" . APP_FOLDER . "/logs";
		$self = new self;

		$user = $user_id == 0 ? $_SESSION['user']['id'] : $user_id;
		if ($date == '') {
			$log_file_data = $log_filename . '/log_' . date('m-Y') . '.log';
			$datetime = date('Y-m-d H:i:s');
		} else {
			$log_file_data = $log_filename . '/log_' . date('m-Y', strtotime($date)) . '.log';
			$datetime = $date;
		}

		$dataToLog = [
			'user_id'       => Users::getUser($user),
			'action'        => $self->clean($action),
			'module'        => $self->clean($module),
			'date_added'    => $datetime
		];

		$data = '"' . implode('","', $dataToLog) . '"';
		$data .= PHP_EOL;
		return file_put_contents($log_file_data, $data, FILE_APPEND);
	}

	public function view()
	{
		$log_filename = $_SERVER['DOCUMENT_ROOT'] . "/" . APP_FOLDER . "/logs";

		$date = isset($this->inputs['month_date']) ? $this->inputs['month_date'] : date("Y-m");
		$response = array();
		$log_file_data = $log_filename . '/log_' . date('m-Y', strtotime($date)) . '.log';

		if (file_exists($log_file_data)) {
			$data = file_get_contents($log_file_data);
			$loop_data = explode(PHP_EOL, $data);

			if (count($loop_data) > 0) {
				$counter = 1;
				foreach ($loop_data as $rowData) {
					if (!empty($rowData)) {
						$row = explode('","', $rowData);
						$list = array();

						$list['count']  = $counter++;
						$list['action'] = $row[1];
						$list['module'] = $row[2];
						$list['date']   = date("F d, Y h:i:s A", strtotime(substr($row[3], 0, -1)));
						$list['user']   = substr($row[0], 1);

						array_push($response, $list);
					}
				}
			}
		}
		return $response;
	}

	public static function storeCrud($module, $crud, $result, $old_name, $new_name = '')
	{
		$lowered_module = strtolower($module);
		$post_action = "$lowered_module [$old_name]";

		if ($crud == 'c') { // Add
			$pre_action = $result == 1 ? "Added new" : ($result == 2 ? "Attempt to add existing" : "Error to add new");
			$action = $pre_action . " " . $post_action;
		} else if ($crud == 'cd') { // Add Details
			$pre_action = $result == 1 ? "Added new detail" : ($result == 2 ? "Attempt to add existing detail" : "Error to add detail");
			$post_action .= " : [$new_name]";
			$action = $pre_action . " of " . $post_action;
		} else if ($crud == 'r') { // Read
			$action = "";
		} else if ($crud == 'u') { // Update
			$pre_action = $result == 1 ? "Updated" : ($result == 2 ? "Attempt to update existing" : "Error to update");
			$action = $pre_action . " " . $post_action;
			if ($old_name != $new_name && $new_name != '') {
				$action .= " => [$new_name]";
			}
		} else if ($crud == 'd') { // Delete
			$pre_action = $result == 1 ? "Deleted" : "Error to delete";
			$action = $pre_action . " " . $post_action;
		} else if ($crud == 'dd') { // Delete detail
			$pre_action = $result == 1 ? "Deleted detail" : "Error to delete detail";
			$action = $pre_action . " of " . $post_action;
		} else if ($crud == 'f') { // Finish
			$pre_action = $result == 1 ? "Finished" : "Error to finish";
			$action = $pre_action . " " . $post_action;
		} else if ($crud == 'i') { // Finish
			$pre_action = $result == 1 ? "Implemented" : "Error to implement";
			$action = $pre_action . " " . $post_action;
		} else {
			$action = "";
		}

		self::store($action, $module);
	}
}
