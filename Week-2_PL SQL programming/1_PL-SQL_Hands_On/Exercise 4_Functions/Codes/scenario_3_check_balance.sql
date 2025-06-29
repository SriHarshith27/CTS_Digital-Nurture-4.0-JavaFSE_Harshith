-- Scenario 3: Check if Account Has Enough Balance
-- Returns TRUE if balance >= input amount, else FALSE

CREATE OR REPLACE FUNCTION HasSufficientBalance(
    account_id INTEGER,
    required_amount NUMERIC
) RETURNS BOOLEAN
LANGUAGE plpgsql
AS
$$
DECLARE
    current_balance NUMERIC;
BEGIN
    -- Try to retrieve account balance
    SELECT Balance INTO current_balance
    FROM Accounts
    WHERE AccountID = account_id;

    -- Account not found → return FALSE
    IF NOT FOUND THEN
        RETURN FALSE;
    END IF;

    -- Compare balance with required threshold
    RETURN current_balance >= required_amount;
END;
$$;

--  Example Checks:
-- Should return TRUE if balance ≥ 500
SELECT HasSufficientBalance(1, 500) AS "CanTransact";

-- Should return FALSE if balance < 50000
SELECT HasSufficientBalance(1, 50000) AS "CanTransact";
