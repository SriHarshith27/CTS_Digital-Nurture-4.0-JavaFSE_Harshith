-- Scenario 3: Update Interest Rates for All Loans
-- Policy: >10,000 = 6.5%, else = 5.0%

DO $$
DECLARE
    loan RECORD;
BEGIN
    FOR loan IN SELECT LoanID, LoanAmount, InterestRate FROM Loans LOOP
        IF loan.LoanAmount > 10000 THEN
            UPDATE Loans
            SET InterestRate = 6.5
            WHERE LoanID = loan.LoanID;

            RAISE NOTICE '📈 Loan % updated to 6.5%%', loan.LoanID;
        ELSE
            UPDATE Loans
            SET InterestRate = 5.0
            WHERE LoanID = loan.LoanID;

            RAISE NOTICE '📉 Loan % updated to 5.0%%', loan.LoanID;
        END IF;
    END LOOP;
END;
$$;

SELECT * FROM Transactions ORDER BY TransactionDate DESC;