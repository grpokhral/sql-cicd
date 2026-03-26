IF NOT EXISTS (SELECT 1 FROM Employees WHERE Email = 'bob@company.com')
BEGIN
    INSERT INTO Employees (Name, Department, Email)
    VALUES ('Bob Jones', 'Marketing', 'bob@company.com')
    PRINT 'Bob inserted.'
END
ELSE
    PRINT 'Bob already exists. Skipping.'