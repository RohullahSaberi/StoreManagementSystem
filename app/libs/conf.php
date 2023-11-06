<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 1);
	
	define('APP_HAS_NODES', true);
	define('APP_HAS_LOGS', true);

	// Configuration
	global $CF;

	$CF = array();
	
	$CF['app_name']      = 'سیستم مدیریت فروشگاه';
	$CF['app_version']   = '1.1';
	$CF['app_date']      = '01 Nov 2023';
	$CF['app_copyright'] = '&copy; 2023';
	$CF['app_language']  = 'en';
	
	$CF['db_server']     = 'localhost';
	$CF['db_name']       = 'store';
	$CF['db_user']       = 'root';
	$CF['db_password']   = '';
	
	$CF['user_session_time'] = '+1 day';
?>