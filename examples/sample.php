<?php
//Loading Autoload file 
require '../vendor/autoload.php'; 

use Organogram\employee;

// Example to show some employee
$emp = new Employee();
$data = $emp->getEmployee();        
// echo "<pre>"; 
// print_r($data); 
// echo "</pre>"; 

// ToDo:: call your getEmployeeUnerMe(EMP_ID, DPT_ID) and print all the ids here 
// $data = $emp->getEmployeeUnerMe(5,1); 
// echo "<pre>"; 
// print_r($data); 
// echo "</pre>"; 

if (isset($_POST['btnSubmit']))
{
	$email 		= $_POST["email"];
	$password 	= $_POST["password"];

	if (($email != '') && ($password != '')) {

		$data = $emp->employeeAuthCheck($email, $password);

		if (isset($data)) {

			$emp_id = $data['id'];
			$dpt_id = $_POST["department"];
			$role_id = $emp->getEmployeeRole($emp_id, $dpt_id);
			
			if ($role_id != 0) {

				$employeeUnderMe = $emp->getEmployeeUnderMe($dpt_id, $role_id);

				if (!empty($employeeUnderMe)) {

					echo "*** List of the employees, who work under you"; 
					echo "<pre>"; 
					print_r($employeeUnderMe);
					echo "</pre>";

				} else {

					echo "No employees work under you yet.";

				}

			} else {

				echo "Sorry! you have no records in this department.";

			}
		
		} else {

			echo "Sorry! Incorrect Email or Password.";

		}

	} else {

		header('Location: ' . $_SERVER['HTTP_REFERER']);

	}

} else {

	header('Location: ' . $_SERVER['HTTP_REFERER']);

}