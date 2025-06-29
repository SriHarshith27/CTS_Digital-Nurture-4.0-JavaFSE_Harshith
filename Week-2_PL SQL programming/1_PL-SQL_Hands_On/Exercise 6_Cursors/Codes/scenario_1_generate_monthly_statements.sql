-- Scenario 1: Generate Monthly Transaction Statements
-- For each customer, print transactions from current month

DO $$
DECLARE
    cust RECORD;
    tx RECORD;
    start_of_month DATE := DATE_TRUNC('month', CURRENT_DATE);
BEGIN
    FOR cust IN SELECT CustomerID, Name FROM Customers LOOP
        RAISE NOTICE '🧾 Statement for % (ID: %)', cust.Name, cust.CustomerID;

        FOR tx IN
            SELECT t.TransactionDate, t.TransactionType, t.Amount
            FROM Transactions t
            JOIN Accounts a ON a.AccountID = t.AccountID
            WHERE a.CustomerID = cust.CustomerID
              AND t.TransactionDate >= start_of_month
        LOOP
            RAISE NOTICE ' • % | % | ₹%', tx.TransactionDate, tx.TransactionType, tx.Amount;
        END LOOP;

        RAISE NOTICE '--------------------------------------------';
    END LOOP;
END;
$$;

SELECT * FROM Accounts;