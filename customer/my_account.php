<!DOCTYPE>
<?php
session_start(); 

include("functions/function.php");

include("includes/db.php");
?>


<html>
	<head>
		<title>Computer Sells</title>
	
	<link rel="stylesheet" href="styles/styles.css" media="all" />
	</head>
	
	
<body>
	<!--main starts here-->
	<div class="main_wrapper">
	
			
		<!--header starts here-->
		<div class="header_wrapper">
		
		<a href="../index.php"><img id="logo" src="images/images.png" width=150px; height=150px; /></a>
		<img id="banner" src="images/banner.jpg" width=1350; height=150; />
		
		
	</div>
	
	
	<!--menu starts here-->
	<div class="menubar"> 
	
		<ul id="menu">
			<li><a href="../index.php">Home</a></li>
			<li><a href="../all_products.php">All Products</a></li>
			<li><a href="../cart.php">Shopping cart</a></li>
			<li><a href="#">Contact Us</a></li>
		
	<div id="form">
		<form method="get" action="result.php" enctype="multipart/form-date">
			<input type="text" name="user_query" placeholder="Serarch Products" />
			<input type="submit" name="search" value="Search" />
		</form>
	</div>
	
		</ul>
		
			
	
	</div>
		
		

	<!--content starts here-->
	<div class="content_wrapper">
		
			<div id="sidebar">
			
				<div id="sidebar_title" align="center">MY Account</div>
				
				<ul id="cats">
				<?php 
				$user = $_SESSION['customer_email'];
				
				$get_img = "select * from customers where customer_email='$user'";
				
				$run_img = mysqli_query($con, $get_img); 
				
				$row_img = mysqli_fetch_array($run_img); 
				
				$c_image = $row_img['customer_image'];
				
				$c_name = $row_img['customer_name'];
				
				$c_phone = $row_img['customer_contact'];
				
				$c_add = $row_img['customer_address'];
				
				$c_city = $row_img['customer_city'];
				
				$c_country = $row_img['customer_country'];
				
				echo "<p style='text-align:center;'><img src='customer_images/$c_image' width='150' height='150'/></p>";
				
				?>
				<li><a href="my_account.php?my_orders">My Orders</a></li>
				<li><a href="my_account.php?edit_account">Edit Account</a></li>
				<li><a href="my_account.php?change_pass">Change Password</a></li>
				<li><a href="my_account.php?delete_account">Delete Account</a></li>
				
				<ul>
				</div>	
		
			<div id="content_area">
			
			<?php cart(); ?>
			
			<div id="shopping_cart"> 
					
					<span style="float:right; font-size:17px; padding:5px; line-height:40px;">
					
					<?php 
					if(isset($_SESSION['customer_email'])){
					echo "<b>Welcome:</b>" . $_SESSION['customer_email'];
					}
					?>
					
					
					<?php 
					if(!isset($_SESSION['customer_email'])){
					
					echo "<a href='../checkout.php' style='color:orange;'>Login</a>";
					
					}
					else {
					echo "<a href='logout.php' style='color:orange;'>Logout</a>";
					}
					
					
					
					?>
					
					
					
					</span>
			</div>
			
				<div id="products_box">
				
				<?php 
				if(!isset($_GET['my_orders'])){
					if(!isset($_GET['edit_account'])){
						if(!isset($_GET['change_pass'])){
							if(!isset($_GET['delete_account'])){
							
				echo "
				<h2 style='padding:20px;'>Welcome:  $c_name </h2>
				<h2 style='Padding:20px;' >Address :-    $c_add </h2> 
				<h2 style='Padding:20px;' >Phone  Number :-    $c_phone </h2> 
				<h2 style='Padding:20px;' >City :-    $c_city </h2> 
				<h2 style='Padding:20px;' >Country :-   $c_country </h2> ";
				}
				}
				}
				}
				?>
				
				<?php 
				if(isset($_GET['edit_account'])){
				include("edit_account.php");
				}
				if(isset($_GET['change_pass'])){
				include("change_pass.php");
				}
				if(isset($_GET['delete_account'])){
				include("delete_account.php");
				}
				
				
				?>
				
				
				</div>
			
			</div>
		</div>
		
		
		<!--Content wrapper ends-->
		
		
		
	<!--footer starts here-->	
	<div id="footer">
	<h2 Style="text-align:center; padding-top:30px;">&copy; Pratik & Sakshi</h2>
	
	
	</div>
	
	
	
	
	
	
	
	
	
	</div>


</body>


</html>