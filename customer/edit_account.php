		<?php 	
				include("includes/db.php"); 
				
				$user = $_SESSION['customer_email'];
				
				$get_customer = "select * from customers where customer_email='$user'";
				
				$run_customer = mysqli_query($con, $get_customer); 
				
				$row_customer = mysqli_fetch_array($run_customer); 
				
				$c_id = $row_customer['customer_id'];
				$name = $row_customer['customer_name'];
				$email = $row_customer['customer_email'];
				$pass = $row_customer['customer_pass'];
				$country = $row_customer['customer_country'];
				$city = $row_customer['customer_city'];
				$contact = $row_customer['customer_contact'];
				$address= $row_customer['customer_address'];
				$image = $row_customer['customer_image'];
				
				
		?>
			
		<form action="" method="post" align="center" enctype="multipart/form-data">
					
					<h2 align="center">Update your Account</h2><br><br>
					Customer Name:
					<input type="text" name="c_name" value="<?php echo $name;?>" required/><br>
					Customer Email:	
					<input type="text" name="c_email" value="<?php echo $email;?>" required/><br>
					Customer Password:
					<input type="password" name="c_pass" value="<?php echo $pass;?>" required/><br>
					Customer Image:</td>
					<input type="file" name="c_image"/><img src="customer_images/<?php echo $image; ?>" width="50" height="50"/><br>
					Customer Country:
							<select name="c_country" disabled>
								<option><?php echo $country; ?></option>
								<option>Afghanistan</option>
								<option>India</option>
								<option>Japan</option>
								<option>Pakistan</option>
								<option>Israel</option>
								<option>Nepal</option>
								<option>United Arab Emirates</option>
								<option>United States</option>
								<option>United Kingdom</option>
							</select><br>
					Customer City:
					<input type="text" name="c_city" value="<?php echo $city;?>"/><br>
					Customer Contact:</td>
					<input type="text" name="c_contact" value="<?php echo $contact;?>"/><br>
					Customer Address
					<input type="text" name="c_address" value="<?php echo $address;?>"/><br><br>
					<input type="submit" name="update" value="Update Account" /><br>
				</form>
		
		
		
	
<?php 
	if(isset($_POST['update'])){
	
		
		$ip = getIp();
		
		$customer_id = $c_id;
		
		$c_name = $_POST['c_name'];
		$c_email = $_POST['c_email'];
		$c_pass = $_POST['c_pass'];
		$c_image = $_FILES['c_image']['name'];
		$c_image_tmp = $_FILES['c_image']['tmp_name'];
		$c_city = $_POST['c_city'];
		$c_contact = $_POST['c_contact'];
		$c_address = $_POST['c_address'];
	
		
		move_uploaded_file($c_image_tmp,"customer_images/$c_image");
		
		 $update_c = "update customers set customer_name='$c_name', customer_email='$c_email', customer_pass='$c_pass',customer_city='$c_city', customer_contact='$c_contact',customer_address='$c_address',customer_image='$c_image' where customer_id='$customer_id'";
	
		$run_update = mysqli_query($con, $update_c); 
		
		if($run_update){
		
		echo "<script>alert('Your account successfully Updated')</script>";
		echo "<script>window.open('my_account.php','_self')</script>";
		
		}
	}





?>










