<?php

	function deleteUser() {
		global $db;
		
		//
		$ret  = '';
		
		if(array_key_exists('user_id', $_POST)) {
				
			$userId = $_POST['user_id'];
			
			//
			if(!User :: deleteById($userId)) {
					$ret = 'CantDeleteUser';
			}

			// -->
		}
		else {
			$ret = 'MissingParameters';
		}
		
		// -->
		
		return $ret;
	}
	
	//
	$ret = deleteUser();
	
	if($ret != '') {
		$app_error = $ret;
	}
?>