<?php
/**
 * Library which provide all kind of employee information and data
 *
 * @package Organogram
 * @author Sarwar Hossain <sarwar@instabd.com> 
 * @copyright   Instalogic
 * @link URL description
 * @version 1.0.0
 * 
 */
namespace Organogram;


use Organogram\model;

/**
 * Employee Class provides all employee data. 
 * Usages: 
 * ```
 * use \Organogram\Employee <br />
 * $emp = new Employee(); <br />
 * call of your desire method from view or anywhere. 
 * 
 */
 class Employee
{

    function __construct(){
        
    }

    /**
     * Get the employee array 
     * @param type $id
     * @return type
     */
    function getEmployee($id = Null){
        return Model::get()->employees();

    }

    /**
     * Get the employee array 
     * @param type $id
     * @return type
     */
    function employeeAuthCheck($email, $password){
        return Model::get()->employeeAuthCheck($email, $password);

    }

    /**
     * Get the employee array 
     * @param type $id
     * @return type
     */
    function getEmployeeHierarchyLevel($emp_id, $dpt_id){
        return Model::get()->employeeRole($emp_id, $dpt_id);

    }
    
    /**
     * TODO:: Complete this method and get all the id's under an employee
     *          Example: From our sample image(https://bit.ly/2AXmLRX), 
     *                  if we pass department id 1 and employee id 5 it will show 
     *                  all the id's under 5 which is 11,12, 23,24,25,26,27,40,40,42 .. .. .. .. .. 63,64,68
     *                  So you have to show the tree. 
     * @param Integer $employeeId
     * @param Integer $departmentId
     * @return Array List of employees 
     */
    function getEmployeeUnderMe($department_id, $hierarchy_level){
        return Model::get()->employeesUnderMe($department_id, $hierarchy_level); 
    }

   

}