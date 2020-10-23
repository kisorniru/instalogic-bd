<?php
//Loading Autoload file 
require '../vendor/autoload.php'; 

use Organogram\employee;

// Example to show some employee
$emp = new Employee();
// $data = $emp->getEmployee();        
// echo "<pre>"; 
// print_r($data); 
// echo "</pre>"; 

// ToDo:: call your getEmployeeUnerMe(EMP_ID, DPT_ID) and print all the ids here 
// $data = $emp->getEmployeeUnerMe(5,1); 
// echo "<pre>"; 
// print_r($data); 
// echo "</pre>"; 
try {

	if (!isset($_POST['btnSubmit'])) {
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

	$email 		= $_POST["email"];
	$password 	= $_POST["password"];

	if (empty($email) || empty($password)) {
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

	$data = $emp->employeeAuthCheck($email, $password);

	if (!isset($data)) {
		//echo "Sorry! Incorrect Email or Password.";
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

	$emp_id = $data['id'];
	$dpt_id = $_POST["department"];
	$hierarchy_level = $emp->getEmployeeHierarchyLevel($emp_id, $dpt_id);

	if ((int)$hierarchy_level == 0) {

		//echo "Sorry! you have no records in this department.";
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

	$employeeUnderMe = $emp->getEmployeeUnderMe($dpt_id, $hierarchy_level);

	if (empty($employeeUnderMe)) {
		// echo "No employees work under you yet.";
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

	echo "*** List of the employees, who work under you"; 
	echo "<pre>"; 
	print_r($employeeUnderMe);
	echo "</pre>";
	
} catch (Exception $ex) {
	$msg = "Error: " . $ex->getMessage();
	header('Location: ' . $_SERVER['HTTP_REFERER']);
}