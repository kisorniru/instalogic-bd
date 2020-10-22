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
     * @return type
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
     * ToDo:: // do something
     */
    public function employeeRole($employeeId, $departmentId){
        $where = "WHERE e_id = $employeeId AND d_id = $departmentId";
        $sql= "SELECT * FROM emp_dpt_roles {$where}"; 
        $result = $this->query($sql);
        $data = $this->fetch($result);
        if (isset($data)) {
            $user_role_id = $data['r_id'];
        } else {
            $user_role_id = 0;
        }
        return $user_role_id;
    }
    
    /**
     * ToDo:: // do something
     */

    public function departments(){
        $sql= "SELECT * FROM departments"; 
        $result = $this->query($sql);
        $data = $this->fetchAll($result);
        return $data;
    }
    
    /**
     * ToDo:: // do something
     */

    public function employeesUnderMe($departmentId, $roleId){
        
        $sql= "SELECT emp.name as 'employee name', dpt.name as 'department name', roles.name as role FROM emp_dpt_roles INNER JOIN employees AS emp ON emp.id = emp_dpt_roles.e_id INNER JOIN departments AS dpt ON dpt.id = emp_dpt_roles.d_id INNER JOIN roles ON roles.id = emp_dpt_roles.r_id WHERE d_id = $departmentId AND r_id > $roleId";
        $result = $this->query($sql);
        $data = $this->fetchAll($result);
        return $data;
    }

}