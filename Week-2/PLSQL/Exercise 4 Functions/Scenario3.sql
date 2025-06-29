CREATE OR REPLACE FUNCTION HasSufficientBalance(
    p_account_id NUMBER,
    p_amount NUMBER
)
RETURN BOOLEAN
IS
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_account_id;
    RETURN v_balance >= p_amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/

SET SERVEROUTPUT ON;

DECLARE
    result BOOLEAN;
BEGIN
    result := HasSufficientBalance(1, 1000);
    IF result THEN
        DBMS_OUTPUT.PUT_LINE('Sufficient');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient');
    END IF;
END;
/
