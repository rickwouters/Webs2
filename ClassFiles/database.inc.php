<?php


	function sendQuery($query){
		
		$link = mysqli_connect("localhost", "root", "") or die ("something went wrong");
		$db = mysqli_select_db($link, "bookstoredb");
		
		$result = mysqli_query($link, $query);
		
		mysqli_close($link);
		
		return $result;
		
	}
	
?>