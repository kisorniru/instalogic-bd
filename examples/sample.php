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

			// echo $emp_id . "  ---  ". $dpt_id;

			$data = $emp->getEmployeeUnderMe($emp_id, $dpt_id);
			if (isset($data)) {
				return $data;
			} else {
				echo "Sorry! Incorrect Email/Password Or Department.";
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