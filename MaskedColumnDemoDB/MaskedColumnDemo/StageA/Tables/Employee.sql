CREATE TABLE [StageA].[Employee
] (
    [EmployeeId] INT NOT NULL PRIMARY KEY
    , [sex] NVARCHAR(6) MASKED WITH (FUNCTION = 'partial(0,"x",2)')
    , [FirstName] NVARCHAR(50) MASKED WITH (FUNCTION = 'default()')
    , [LastName] NVARCHAR(50) MASKED WITH (FUNCTION = 'default()')
    , CONSTRAINT chk_sex CHECK ([sex] IN ('female', 'male', 'divers'))
    )
