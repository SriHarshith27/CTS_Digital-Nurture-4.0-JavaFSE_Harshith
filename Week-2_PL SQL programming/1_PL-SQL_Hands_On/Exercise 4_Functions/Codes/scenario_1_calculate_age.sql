-- Scenario 1: Calculate Customer Age from Date of Birth
-- Returns age in full years using PostgreSQL's AGE function

CREATE OR REPLACE FUNCTION CalculateAge(dob DATE)
RETURNS INTEGER
LANGUAGE plpgsql
AS
$$
DECLARE
    result_age INTEGER;
BEGIN
    -- Extract number of years from the age interval
    result_age := DATE_PART('year', AGE(dob));
    RETURN result_age;
END;
$$;

-- Get age for all customers
SELECT 
    CustomerID,
    Name,
    DOB,
    CalculateAge(DOB) AS AgeYears
FROM Customers;
