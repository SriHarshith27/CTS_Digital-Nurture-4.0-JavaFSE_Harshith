package com.cognizant.employeewebservice.dao;

import com.cognizant.employeewebservice.model.Department;
import java.util.ArrayList;

public class DepartmentDao {

    public static ArrayList<Department> DEPARTMENT_LIST;

    public DepartmentDao(ArrayList<Department> deptList) {
        DEPARTMENT_LIST = deptList;
    }

    public ArrayList<Department> getAllDepartments() {
        return DEPARTMENT_LIST;
    }
}