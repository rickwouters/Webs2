<html>
	<script src="http://www.w3schools.com/lib/w3data.js"></script>
	<head>
		<title>Winkelnaam - Home</title>
		
		<link rel="stylesheet" href="css/HomeStyle.css"/>
		
	</head>
	<body>
<!-- 		<div w3-include-html="Header.php"></div> <script>w3IncludeHTML();</script>
-->

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