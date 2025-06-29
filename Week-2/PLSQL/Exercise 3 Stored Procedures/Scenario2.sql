CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
) IS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus_percent / 100)
    WHERE Department = p_department;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Bonus applied for department: ' || p_department);
END;
/
BEGIN
    UpdateEmployeeBonus('IT', 10);  -- Apply 10% bonus to IT department
END;
/
