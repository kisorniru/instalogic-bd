<?php
/**
 * Model - All kind of database query and fetching result.  
 *
 *
 * PHP version 7.3
 *
 *
 * @category   CategoryName
 * @package    Organogram
 * @author     Sarwar Hossain <sarwar@instabd.com>
 * @copyright  2020 Intalogic Bangaldesh
 * @version    1.0.1
 */
namespace Organogram;

// Include the configration file 
include_once 'config.php';


/**
 * Model Class Statically use to all over the system.
 * Usage: \Model::get()->
 * 
 */
class Model{

    /**
     * @var MySQLi Object  
     */
    private $_dbcon;

    /**
     * Constructor 
     */
    public function __construct(){
        $this->_dbcon = new \MySQLi(env('DB_HOST', 'localhost'), env('DB_USER', 'dbuser'), env('DB_PASSWORD', 'password'), env('DB_NAME', 'dbname'));
        
        if ($this->_dbcon->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
    }
    
    
    /**
     * Static method get the Model Object 
     * @return \Organogram\Model
     */
    public static function get() {
        return new Model();
    }

    /**
     * Query : Execute the base query 
     * @param String $sql
     * @return mixed 
     */
    private function query($sql){
        return $this->_dbcon->query($sql);
    }
    
    /**
     * fetch : get the first result 
     * @param mixed $result
     * @return Array
     */
    private function fetch($result){
        
        $data = $result->fetch_assoc();
        $result->free_result();
        
        $this->_dbcon->close();
        
        return $data; 

    }
    /**
     * fetchAll : get the full result of query
     * @param type $result
     * @return type
     */
    private function fetchAll($result){        
        
        $data = $result->fetch_all(MYSQLI_ASSOC);
        $result->free_result();
        
        $this->_dbcon->close();
        
        return $data; 
    }

    /**
     * employee: get the employees data
     * @param type $id
     * @return type
     */
    public function employees($id = false){
        
        $where = $id ? "WHERE id='{$id}'" : "";
        $sql= "SELECT * FROM employees {$where}"; 
        
        $result = $this->query($sql);
        $data = $this->fetchAll($result);
        
        return $data; 
    }

    /**
     * employee: employee authentication check
     * @param type $email, $password
     * @return Array
     */
    public function employeeAuthCheck($email, $password){
        
        $where = "WHERE email = '{$email}' AND password ='{$password}'";
        $sql= "SELECT * FROM employees {$where}"; 
        
        $result = $this->query($sql);
        $data = $this->fetch($result);
        
        return $data;
    }

    /**
     * ToDo:: // do something
     */
    public function roles(){
        // do something

    }

    /**
     * get the employee role hierarchy level with
     * employee name, hierarchy name and department name
     * @param type $employeeId, $departmentId
     * @return Array
     */
    public function employeeRole($employeeId, $departmentId){
        
        $joins = "INNER JOIN emp_dpt_roles ON roles.id = emp_dpt_roles.role_id INNER JOIN employees ON emp_dpt_roles.emp_id = employees.id INNER JOIN departments ON emp_dpt_roles.dpt_id = departments.id";
        $where = "WHERE emp_id = $employeeId AND dpt_id = $departmentId";
        $sql= "SELECT employees.name as 'employee name', roles.name as 'role name', roles.hierarchy_level, departments.name as 'department name' FROM roles {$joins} {$where}"; 
        
        $result = $this->query($sql);
        $data = $this->fetch($result);
 
        return $data;
    }
    
    /**
     * get the details of department table
     * @return Array
     */

    public function departments(){
        
        $sql= "SELECT * FROM departments"; 
        
        $result = $this->query($sql);
        $data = $this->fetchAll($result);
        
        return $data;
    }
    
    /**
     * get the employees who work under a specific department and a specific role
     * employee name, hierarchy name and department name
     * @param type $department_id, $hierarchy_level
     * @return Array
     */

    public function employeesUnderMe($department_id, $hierarchy_level){
        
        $joins = "INNER JOIN emp_dpt_roles ON employees.id = emp_dpt_roles.emp_id 
         INNER JOIN departments AS dpt ON dpt.id = emp_dpt_roles.dpt_id 
         INNER JOIN roles ON roles.id = emp_dpt_roles.role_id";
        $where = "WHERE emp_dpt_roles.dpt_id = $department_id AND roles.hierarchy_level > $hierarchy_level";
        $sql= "SELECT employees.name as 'employee name', roles.name as 'role name', dpt.name as 'department name' FROM employees {$joins} {$where}";

        $result = $this->query($sql);
        $data = $this->fetchAll($result);

        return $data;
    }

}