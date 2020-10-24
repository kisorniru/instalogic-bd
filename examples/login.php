<?php
	
	//Loading Autoload file 
	require '../vendor/autoload.php'; 

	use Organogram\department;

	// To show all departments for login
	$emp = new Department();
	$depts = $emp->getDepartment();

?>

<!DOCTYPE html>

<html>

	<head>
		<title>Login</title>
		<link rel="stylesheet" href="../css/style.css">
	</head>

	<body>

		<div class="log-form">

		  	<h2>Login to your account</h2>
		  	<?php

		  		if ( isset($_GET['exception']) )
				{
				     // treat the error case:
				     echo "<p style='color:red; text-align:center;'>".$_GET['exception']."</p>";
				}

		  		if ( isset($_GET['authError']) && $_GET['authError'] == 1 )
				{
				     // treat the error case:
				     echo "<p style='color:red; text-align:center;'>* Sorry! Email Address or Password doesn't match.</p>";
				}

				if ( isset($_GET['dptError']) && $_GET['dptError'] == 1 )
				{
				     // treat the error case:
				     echo "<p style='color:red; text-align:center;'>* Sorry! Department doesn't match with your credentials.</p>";
				}
		  	
		  	?>
				
				<form method="post" action="sample.php">
					
					<table>

						<tr>
							<td>
								<label>Email: </label>
							</td>
							<td>
								<input type="email" name="email" placeholder="email">
							</td>
						</tr>
						
						<tr>
							<td>
								<label>Password: </label>
							</td>
							<td>
								<input type="password" name="password" placeholder="password">
							</td>
						</tr>
						
						<tr>
							<td>
								<label>Department: </label>
							</td>
							<td>
								
								<select name="department" style="width: 100%;" >
						
									<?php foreach ($depts as $dept) {

										echo "<option value='$dept[id]'>$dept[name]</option>";

									} ?>

								</select>

							</td>
						</tr>
						
						<tr>
							<td colspan="2" style="text-align: center;">
								<input type="submit" class="btn" name="btnSubmit">
							</td>
						</tr>
					
					</table>
					
				</form>

		</div>

	</body>

</html>