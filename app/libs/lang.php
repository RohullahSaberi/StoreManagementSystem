<?php

	global $LG;
    require_once(dirname(__FILE__) . '/lang_en.php');

	//
	function tr($item)
	{
		global $LG;
		
		return array_key_exists($item, $LG) ? $LG[$item] : '[Item missing in language]';
	}
	
	//
	function say($item)
	{
		echo(tr($item));
	}

?>