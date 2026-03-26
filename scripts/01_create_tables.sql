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
    PRINT 'Table Employees already exists. Skipping.'
END