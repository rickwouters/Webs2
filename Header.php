<html>

	<head>
		<link rel="stylesheet" href="css/HeaderStyle.css"/>
	</head>

	<a href="Home.php">
	
		<img src="images/HomeIcon.png" height="100" width="100">
		
	</a>

	<ul>
		<li onclick="location.href='Product.php';" target="_parent">
			Producten
		</li>
		
		<li onclick="location.href='About.php';">
			Over ons
		</li>
	
	</ul>

	<p>
	<?php
		$crumbs = explode("/",$_SERVER["REQUEST_URI"]);
		foreach($crumbs as $crumb){
			echo ucfirst(str_replace(array(".php","_"),array(""," "),$crumb) . '');
			if ($crumb != $crumbs[0] && $crumb != end($crumbs)) {echo " > ";}
		}
	?>
	</p>


</html>