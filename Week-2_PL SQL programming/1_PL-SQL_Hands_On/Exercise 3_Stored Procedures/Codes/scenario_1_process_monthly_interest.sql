
--  Function: ProcessMonthlyInterest
CREATE OR REPLACE FUNCTION ProcessMonthlyInterest()
RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01),
        LastModified = NOW()
    WHERE AccountType ILIKE 'Savings';

    RAISE NOTICE '✅ Interest applied to all Savings accounts.';
    RETURN '✅ Monthly interest processed';
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '❌ Error applying interest: %', SQLERRM;
        RETURN '❌ Interest processing failed';
END;
$$;

--  Test Call
SELECT ProcessMonthlyInterest();

--  Verification
SELECT * FROM Accounts WHERE AccountType ILIKE 'Savings';
