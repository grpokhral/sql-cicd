IF NOT EXISTS (SELECT 1 FROM Employees WHERE Email = 'alice@company.com')
BEGIN
    INSERT INTO Employees (Name, Department, Email)
    VALUES ('Alice Smith', 'Engineering', 'alice@company.com')
    PRINT 'Alice inserted.'
END
ELSE
    PRINT 'Alice already exists. Skipping.'