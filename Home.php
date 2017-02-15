<html>
	<head>
		<title>Winkelnaam - Home</title>
		
		<link rel="stylesheet" href="css/HomeStyle.css"/>
		
	</head>
	<body>

		<?php 
		include 'Header.php';
		?>
		
		<h1>Aanbiedingen bij boekenwinkel</h1>
		
		<div id="ProductShowcase">
		
			<?php 
			
				include 'ClassFiles/database.inc.php';
				
				$result = sendQuery("SELECT * FROM products LIMIT 2");
				
				echo "<table cellpadding=\"2\" border=\"1\" id=\"ProductTable\">";
				echo "<tr>";
				while ($row = mysqli_fetch_array($result)){
					
					
					
					$title = $row["title"];
				
					$shortDescritpion = $row["description"];
					
					echo "<td width=\"50%\">$title</br>$shortDescritpion</td>";
					
					
					
					
				}
				echo"</tr>";
				echo "</table>";
			
			?>
		
		</div>

	</body>
</html> 