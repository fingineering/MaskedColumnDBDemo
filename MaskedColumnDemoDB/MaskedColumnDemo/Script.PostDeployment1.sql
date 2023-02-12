IF OBJECT_ID('StageA.Employee') IS NOT NULL
    TRUNCATE TABLE [StageA].[Employee];

INSERT INTO StageA.Employee (
    EmployeeId
    , sex
    , FirstName
    , LastName
    )
VALUES (
    1
    , 'male'
    , 'John'
    , 'Doe'
    )
    , (
    2
    , 'female'
    , 'Jane'
    , 'Smith'
    );

IF OBJECT_ID('StageB.Salaries') IS NOT NULL
    TRUNCATE TABLE [StageB].[Salaries];

INSERT INTO StageB.Salaries (
    Id
    , EmployeeID
    , Period
    , Salary
    )
VALUES (
    1
    , 1
    , '012022'
    , 5000
    )
    , (
    2
    , 1
    , '022022'
    , 5000
    )
    , (
    3
    , 1
    , '032022'
    , 5000
    )
    , (
    4
    , 2
    , '012022'
    , 4500
    )
    , (
    5
    , 2
    , '022022'
    , 5400
    )
    , (
    6
    , 2
    , '032022'
    , 5300
    )
