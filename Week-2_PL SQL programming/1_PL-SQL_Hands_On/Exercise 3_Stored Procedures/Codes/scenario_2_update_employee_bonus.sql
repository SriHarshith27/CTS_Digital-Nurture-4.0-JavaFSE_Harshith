
--  Function: UpdateEmployeeBonus(dept TEXT, bonus_percent NUMERIC)
CREATE OR REPLACE FUNCTION UpdateEmployeeBonus(
    dept TEXT,
    bonus_percent NUMERIC
) RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * bonus_percent / 100)
    WHERE Department ILIKE dept;

    RAISE NOTICE '✅ Bonus of %%% applied to department "%".', bonus_percent, dept;
    RETURN format('✅ Bonus of %s%% applied to %s department', bonus_percent, dept);
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '❌ Error applying bonus: %', SQLERRM;
        RETURN '❌ Bonus update failed';
END;
$$;

--  Test Call
SELECT UpdateEmployeeBonus('IT', 5);

--  Verification
SELECT * FROM Employees WHERE Department ILIKE 'IT';
