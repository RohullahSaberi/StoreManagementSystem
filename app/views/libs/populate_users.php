<?php

	function populateUsers($selectedId = null) {
		
		//
		$users = User :: readAll();
		
		//
		if($users !== null) {
			//
			echo('<option value="" '.($selectedId === null ? 'selected ' : '').'disabled>'.tr('SelectUser').'</option>');
			
			foreach($users as $user) {
				//
				$userId = $user -> getId();
				
				//
				echo('<option value="'.$userId.'"'.($userId == $selectedId ? ' selected' : '').'>'.$user -> getFullname().'</option>'."\n");
			}
		}
	}
?>