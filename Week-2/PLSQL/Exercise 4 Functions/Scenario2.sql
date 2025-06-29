CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    p_loan_amount NUMBER,
    p_annual_rate NUMBER,
    p_years NUMBER
)
RETURN NUMBER
IS
    v_monthly_rate NUMBER;
    v_months NUMBER;
    v_emi NUMBER;
BEGIN
    v_monthly_rate := p_annual_rate / 12 / 100;
    v_months := p_years * 12;
    v_emi := (p_loan_amount * v_monthly_rate) / (1 - POWER(1 + v_monthly_rate, -v_months));
    RETURN v_emi;
END;
/

SELECT CalculateMonthlyInstallment(50000, 6, 5) AS EMI FROM DUAL;
