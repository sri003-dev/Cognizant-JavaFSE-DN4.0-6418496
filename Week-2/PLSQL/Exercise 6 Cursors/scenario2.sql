SET SERVEROUTPUT ON;

DECLARE
    CURSOR cur_acc IS
        SELECT AccountID, Balance FROM Accounts;

    v_id Accounts.AccountID%TYPE;
    v_bal Accounts.Balance%TYPE;
    v_fee CONSTANT NUMBER := 100;
BEGIN
    OPEN cur_acc;
    LOOP
        FETCH cur_acc INTO v_id, v_bal;
        EXIT WHEN cur_acc%NOTFOUND;
        UPDATE Accounts SET Balance = v_bal - v_fee WHERE AccountID = v_id;
    END LOOP;
    CLOSE cur_acc;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Annual fees applied.');
END;
/
