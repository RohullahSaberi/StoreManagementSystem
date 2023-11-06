<?php

	function populateNodes($selectedId = null) {
		
		//
		$nodes = Node :: readAll();
		
		//
		if($nodes !== null) {
			//
			echo('<option value="" '.($selectedId === null ? 'selected ' : '').'disabled>'.tr('SelectNode').'</option>');
			
			foreach($nodes as $node) {
				//
				$nodeId = $node -> getId();
				
				//
				echo('<option value="'.$nodeId.'"'.($nodeId == $selectedId ? ' selected' : '').'>'.$node -> getName().'</option>'."\n");
			}
		}
	}
?>