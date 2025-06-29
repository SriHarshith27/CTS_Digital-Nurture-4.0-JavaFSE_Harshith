-- SCENARIO 3: Add New Customer with ID Uniqueness Check

CREATE OR REPLACE FUNCTION AddNewCustomer(
    id INT,
    name TEXT,
    dob DATE,
    balance NUMERIC
) RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Customers(CustomerID, Name, DOB, Balance, LastModified)
    VALUES (id, name, dob, balance, NOW());

    RAISE NOTICE '✅ Customer % added successfully.', id;
    RETURN '✅ Customer added';

EXCEPTION
    WHEN unique_violation THEN
        RAISE NOTICE '❌ Customer ID % already exists.', id;
        RETURN '❌ Duplicate ID – not inserted';
    WHEN OTHERS THEN
        RAISE NOTICE '❌ Unexpected error: %', SQLERRM;
        RETURN '❌ Customer insert failed';
END;
$$;

-- ✅ Test Call
SELECT AddNewCustomer(3, 'Emma Watson', '1992-04-15', 2000);
SELECT AddNewCustomer(3, 'Emma Watson', '1992-04-15', 2000); -- Duplicate

-- 📸 Verification
SELECT * FROM Customers;
