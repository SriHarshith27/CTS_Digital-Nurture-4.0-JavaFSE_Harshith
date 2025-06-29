-- Scenario 2: Apply Annual Maintenance Fee to Accounts
-- Deduct ₹100 if balance is sufficient

DO $$
DECLARE
    acc RECORD;
    annual_fee CONSTANT NUMERIC := 100.0;
BEGIN
    FOR acc IN SELECT AccountID, Balance FROM Accounts LOOP
        IF acc.Balance >= annual_fee THEN
            UPDATE Accounts
            SET Balance = Balance - annual_fee,
                LastModified = NOW()
            WHERE AccountID = acc.AccountID;

            RAISE NOTICE '✅ ₹% fee deducted from Account %', annual_fee, acc.AccountID;
        ELSE
            RAISE NOTICE '⚠️ Account % has insufficient funds. Fee not applied.', acc.AccountID;
        END IF;
    END LOOP;
END;
$$;

SELECT * FROM Loans;    