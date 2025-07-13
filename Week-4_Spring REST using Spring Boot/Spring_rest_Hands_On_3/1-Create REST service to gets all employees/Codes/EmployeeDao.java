package com.cognizant.employeewebservice.dao;

import com.cognizant.employeewebservice.model.Employee;

import java.util.ArrayList;

public class EmployeeDao {

    public static ArrayList<Employee> EMPLOYEE_LIST;

    public EmployeeDao(ArrayList<Employee> empList) {
        EMPLOYEE_LIST = empList;
    }

    public ArrayList<Employee> getAllEmployees() {
        return EMPLOYEE_LIST;
    }
}