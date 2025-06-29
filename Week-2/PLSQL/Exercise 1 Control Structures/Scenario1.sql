BEGIN
    FOR loan_rec IN (
        SELECT L.LoanID, L.InterestRate, C.DOB
        FROM Loans L
        JOIN Customers C ON L.CustomerID = C.CustomerID
    ) LOOP
        
        IF MONTHS_BETWEEN(SYSDATE, loan_rec.DOB) / 12 > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE LoanID = loan_rec.LoanID;
        END IF;
    END LOOP;
    
    COMMIT;
END;
/
