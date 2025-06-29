SET SERVEROUTPUT ON;

BEGIN
    FOR loan_rec IN (
        SELECT L.LoanID, L.CustomerID, C.Name, L.EndDate
        FROM Loans L
        JOIN Customers C ON L.CustomerID = C.CustomerID
        WHERE L.EndDate BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || loan_rec.LoanID ||
                             ' for customer ' || loan_rec.Name ||
                             ' is due on ' || TO_CHAR(loan_rec.EndDate, 'DD-MON-YYYY'));
    END LOOP;
END;
/
