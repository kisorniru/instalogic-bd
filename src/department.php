<?php
/**
 * Library which provide all kind of department information and data
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
 * Department Class provides all department data. 
 * Usages: 
 * ```
 * use \Organogram\Department <br />
 * $emp = new Department(); <br />
 * call of your desire method from view or anywhere. 
 * 
 */
 class Department
{

    function __construct(){
        
    }

    /**
     * Get the department array 
     * @param type $id
     * @return type
     */
    function getDepartment($id = Null){
        return Model::get()->departments();

    }  

}