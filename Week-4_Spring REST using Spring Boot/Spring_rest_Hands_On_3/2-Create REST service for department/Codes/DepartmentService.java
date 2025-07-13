package com.cognizant.employeewebservice.service;

import com.cognizant.employeewebservice.dao.DepartmentDao;
import com.cognizant.employeewebservice.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;

@Service
public class DepartmentService {

    private final DepartmentDao departmentDao;

    @Autowired
    public DepartmentService(DepartmentDao departmentDao) {
        this.departmentDao = departmentDao;
    }

    public ArrayList<Department> getAllDepartments() {
        return departmentDao.getAllDepartments();
    }
}