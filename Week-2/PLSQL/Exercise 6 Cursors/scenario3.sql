SET SERVEROUTPUT ON;

DECLARE
    CURSOR cur_loans IS
        SELECT LoanID, InterestRate FROM Loans;

    v_id Loans.LoanID%TYPE;
    v_rate Loans.InterestRate%TYPE;
BEGIN
    OPEN cur_loans;
    LOOP
        FETCH cur_loans INTO v_id, v_rate;
        EXIT WHEN cur_loans%NOTFOUND;
        UPDATE Loans SET InterestRate = v_rate + 0.5 WHERE LoanID = v_id;
    END LOOP;
    CLOSE cur_loans;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Loan interest rates updated.');
END;
/
