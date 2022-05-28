CREATE PROCEDURE [Integration].[ComputeStatistics]
AS
INSERT INTO [Intergration].[AvgPerPeriode] (
    [Period]
    , [sex]
    , [no_employees]
    , [avg_salary]
    )
SELECT S.Period
    , E.sex
    , COUNT(E.EmployeeId) AS no_employees
    , AVG(salary) AS salary
FROM [StageA].[Employee] E
LEFT JOIN [StageB].[salary] S
    ON E.EmployeeId = S.EmployeeId
GROUP BY E.sex
    , S.Period

RETURN 0
