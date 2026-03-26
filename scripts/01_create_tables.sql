-- Create table if it doesn't exist
IF NOT EXISTS (
    SELECT * FROM sysobjects WHERE name='Employees' AND xtype='U'
)
BEGIN
    CREATE TABLE Employees (
        EmployeeId   INT PRIMARY KEY IDENTITY(1,1),
        Name         NVARCHAR(100) NOT NULL,
        Department   NVARCHAR(100),
        Email        NVARCHAR(150),
        CreatedAt    DATETIME DEFAULT GETDATE()
    )
    PRINT 'Table Employees created.'
END
ELSE
BEGIN
    PRINT 'Table Employees already exists. Checking columns...'
END

-- Add Department column if missing
IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Employees' AND COLUMN_NAME = 'Department'
)
BEGIN
    ALTER TABLE Employees ADD Department NVARCHAR(100)
    PRINT 'Column Department added.'
END
ELSE
    PRINT 'Column Department already exists. Skipping.'

-- Add Email column if missing
IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Employees' AND COLUMN_NAME = 'Email'
)
BEGIN
    ALTER TABLE Employees ADD Email NVARCHAR(150)
    PRINT 'Column Email added.'
END
ELSE
    PRINT 'Column Email already exists. Skipping.'

-- Add CreatedAt column if missing
IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Employees' AND COLUMN_NAME = 'CreatedAt'
)
BEGIN
    ALTER TABLE Employees ADD CreatedAt DATETIME DEFAULT GETDATE()
    PRINT 'Column CreatedAt added.'
END
ELSE
    PRINT 'Column CreatedAt already exists. Skipping.'