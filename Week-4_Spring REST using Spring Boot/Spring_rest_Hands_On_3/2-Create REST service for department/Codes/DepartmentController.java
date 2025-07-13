package com.cognizant.employeewebservice.controller;

import com.cognizant.employeewebservice.model.Department;
import com.cognizant.employeewebservice.service.DepartmentService; 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.ArrayList;

@RestController
public class DepartmentController {

    private static final Logger LOGGER = LoggerFactory.getLogger(DepartmentController.class);
    private final DepartmentService departmentService;

    @Autowired
    public DepartmentController(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    @GetMapping("/departments")
    public ArrayList<Department> getAllDepartments() {
        LOGGER.info("START: Inside getAllDepartments() method.");
        ArrayList<Department> departments = departmentService.getAllDepartments();
        LOGGER.info("END: getAllDepartments() method.");
        return departments;
    }
}