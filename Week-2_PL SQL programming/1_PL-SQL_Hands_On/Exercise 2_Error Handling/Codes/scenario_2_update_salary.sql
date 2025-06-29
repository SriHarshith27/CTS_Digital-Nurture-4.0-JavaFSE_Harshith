-- SCENARIO 2: Update Employee Salary Safely with Error Handling

CREATE OR REPLACE FUNCTION UpdateSalary(
    employee_id INT,
    percent NUMERIC
) RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    old_salary NUMERIC;
BEGIN
    SELECT Salary INTO old_salary FROM Employees WHERE EmployeeID = employee_id;

    IF NOT FOUND THEN
        RAISE NOTICE '❌ Employee ID % not found.', employee_id;
        RETURN '❌ Employee not found';
    END IF;

    UPDATE Employees
    SET Salary = Salary + (Salary * percent / 100)
    WHERE EmployeeID = employee_id;

    RAISE NOTICE '✅ Salary updated for employee % from % to %.', employee_id, old_salary, old_salary + (old_salary * percent / 100);
    RETURN '✅ Salary updated';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '❌ Error: %', SQLERRM;
        RETURN '❌ Salary update failed';
END;
$$;

-- ✅ Test Call
SELECT UpdateSalary(1, 10);

-- 📸 Verification
SELECT * FROM Employees WHERE EmployeeID = 1;
