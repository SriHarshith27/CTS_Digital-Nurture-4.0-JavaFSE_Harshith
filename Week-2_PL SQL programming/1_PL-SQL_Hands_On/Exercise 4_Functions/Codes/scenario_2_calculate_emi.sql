-- Scenario 2: Calculate Monthly Installment for a Loan
-- Uses EMI formula based on compound interest
-- EMI = [P * r * (1 + r)^n] / [(1 + r)^n – 1]

CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    principal NUMERIC,
    annual_interest NUMERIC,
    years_duration INTEGER
) RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    monthly_rate NUMERIC := annual_interest / 12 / 100;
    total_months INTEGER := years_duration * 12;
    emi_amount NUMERIC;
BEGIN
    IF monthly_rate = 0 THEN
        -- Interest-free installment
        emi_amount := principal / total_months;
    ELSE
        -- Standard EMI formula
        emi_amount := principal * monthly_rate * POWER(1 + monthly_rate, total_months)
                      / (POWER(1 + monthly_rate, total_months) - 1);
    END IF;

    RETURN ROUND(emi_amount, 2);
END;
$$;

--  Sample 
SELECT CalculateMonthlyInstallment(5000, 5.0, 5) AS EMI_Rs;
