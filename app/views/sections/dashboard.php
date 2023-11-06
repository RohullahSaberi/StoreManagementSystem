  <?php
	
	if(!defined('APP_IS_RUNNING')) {
		exit;
	}

	// Dependencies
	require_once(dirname(__FILE__) . '/../libs/widget_counter.php');
	require_once(dirname(__FILE__) . '/../libs/widget_list.php');
	require_once(dirname(__FILE__) . '/../libs/populate_last_users_activities.php');
?>

<header class="w3-container">
	<h5><b><i class="fa fa-dashboard fa-fw"></i> <?php say('Dashboard'); ?></b></h5>
	<hr class="w3-border-gray">
</header>


<div class="w3-row-padding">

<?php	
	widgetCounter('nodes', 'cubes', tr('Nodes'), Node :: countAll(), 'green', tr('NumberOfNodes'), 'index.php?action=nodes');
	widgetCounter('users', 'users', tr('Users'), User :: countAll(), 'blue', tr('NumberOfUsers'), 'index.php?action=users')
?>	
	
	<div style="clear:both;"></div>
	
<?php
	widgetList('last_users_activities1', 'users', tr('LastUsersActivities'), populateLastUsersActivities());
?>

<?php
	$graph = new NiceGraph();

?>
	

<?php
	$graph = new NiceGraph();
	

	//$graph -> setShowValues(false);
	//$graph -> setFontFamily('Monospace');


?>
	<div style="clear:both; padding-top:16px"></div>
	
	<br>
	<br>
	
</div>

<script>
	// Init view
	function initSection() {
		
		//
	}
	
	function trello_left() {

	}

	function trello_right() {

	}


</script>
 

