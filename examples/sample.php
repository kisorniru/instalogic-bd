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

	// Use try catch to avoid exception 
	try {

		// Check button is triggered or not
		if (!isset($_POST['btnSubmit'])) {
			header('Location: login.php');
		}

		$email 		= $_POST["email"];
		$password 	= $_POST["password"];

		// Check email or password field is empty or not
		if (empty($email) || empty($password)) {
			Header('Location: login.php');
		}

		$data = $emp->getEmployeeAuthCheck($email, $password);

		// Check auth is made or not
		if (!isset($data)) {
			Header( 'Location: login.php?authError=1' );
		}

		$emp_id = $data['id'];
		$dpt_id = $_POST["department"];
		
		// To know employee role or hierarchy level in department
		$empDetails = $emp->getEmployeeHierarchyLevel($emp_id, $dpt_id);
		$emp_hierarchy_level = 0;

        if (isset($empDetails)) {
            $emp_hierarchy_level = $empDetails['hierarchy_level'];
        }

		// To check employee is under inputed department or not
		if ((int)$emp_hierarchy_level == 0) {
			header('Location: login.php?dptError=1');
		}

		// To know who works under this logged in user
		$employeesUnderMe = $emp->getEmployeeUnderMe($dpt_id, $emp_hierarchy_level);

		if (empty($employeesUnderMe)) {
			$employeesUnderMe = ['No employee work under this logged in employee.'];
		}

		echo "*** Logged in employee information: "; 
		echo "<pre>";
		print_r($empDetails);
		echo "</pre>";

		echo "*** list of the employees, who work under logged in employee: "; 
		echo "<pre>"; 
		print_r($employeesUnderMe);
		echo "</pre>";
	
	// To avoid unwanted exception
	} catch (Exception $ex) {
		$msg = "Error: " . $ex->getMessage();
		header('Location: login.php?exception=$msg');
	}