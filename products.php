<html>
<head>
<title>Winkelnaam - Home</title>

<link rel="stylesheet" href="css/productsStyle.css"/>

</head>
<body>

<?php
include 'Header.php';
?>
		
		<h1>Ons assortiment</h1>
		
		<div id="ProductShowcase">
		
			<?php 
			
				include 'ClassFiles/database.inc.php';
				
				$result = sendQuery("SELECT * FROM products");
				
				echo "<table cellpadding=\"2\" border=\"1\" id=\"ProductTable\">";
				echo "<tr>";
				
				$collumNumber = 0;
				
				while ($row = mysqli_fetch_array($result)){
					
					if($collumNumber == 2){
						
						echo "</tr>";
						echo "<tr>";
						$collumNumber = 0;
						
					}else{
						$collumNumber++;
					}
					
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