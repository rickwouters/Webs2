<?php


	function sendQuery($query){
		
		
		if(is_string($query)){
			
			$link = mysqli_connect("localhost:3306", "root", "") or die ("something went wrong");
			$db = mysqli_select_db($link, "bookstoredb");
		
			$result = mysqli_query($link, $query);
		
			mysqli_close($link);
		
		}
		
		return $result;
		
	}
	
?>