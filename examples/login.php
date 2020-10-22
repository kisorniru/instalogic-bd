<?php
//Loading Autoload file 
require '../vendor/autoload.php'; 

use Organogram\department;

// Example to show some department
$emp = new Department();
$depts = $emp->getDepartment();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
</head>
<body>

	<form method="post" action="sample.php">
		
		<label>Email: </label>
		<input type="email" name="email">

		<br>
		
		<label>Password: </label>
		<input type="password" name="password">

		<br>

		<label>Department: </label>
		<select name="department">
			
			<?php foreach ($depts as $dept) {

				echo "<option value='$dept[id]'>$dept[name]</option>";

			} ?>

		</select>

		<br>

		<input type="submit" name="btnSubmit">

	</form>

</body>
</html>