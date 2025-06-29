-- Scenario 2: EmployeeManagement Package (Schema-Based)
-- Includes: hire_employee, update_employee, get_annual_salary

--  Create Schema
CREATE SCHEMA IF NOT EXISTS EmployeeManagement;

-- 🧑 Procedure: Hire new employee
CREATE OR REPLACE FUNCTION EmployeeManagement.hire_employee(
    empid INT,
    emp_name TEXT,
    emp_position TEXT,
    salary NUMERIC,
    dept TEXT,
    hire_date DATE
) RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Employees(EmployeeID, Name, Position, Salary, Department, HireDate)
    VALUES (empid, emp_name, emp_position, salary, dept, hire_date);

    RETURN '✅ Employee hired.';
EXCEPTION
    WHEN OTHERS THEN
        RETURN '❌ Hire failed: ' || SQLERRM;
END;
$$;

--  Procedure: Update employee
CREATE OR REPLACE FUNCTION EmployeeManagement.update_employee(
    empid INT,
    new_salary NUMERIC,
    new_dept TEXT
) RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Employees
    SET Salary = new_salary,
        Department = new_dept
    WHERE EmployeeID = empid;

    RETURN '✅ Employee updated.';
EXCEPTION
    WHEN OTHERS THEN
        RETURN '❌ Update failed: ' || SQLERRM;
END;
$$;

-- 📅 Function: Calculate annual salary
CREATE OR REPLACE FUNCTION EmployeeManagement.get_annual_salary(empid INT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    annual_salary NUMERIC;
BEGIN
    SELECT Salary * 12 INTO annual_salary FROM Employees WHERE EmployeeID = empid;
    RETURN annual_salary;
END;
$$;

--  Sample Test
 SELECT EmployeeManagement.hire_employee(3, 'Sneha Rao', 'Analyst', 45000, 'Finance', '2023-08-01');
SELECT EmployeeManagement.update_employee(3, 48000, 'Business');
 SELECT EmployeeManagement.get_annual_salary(3);
