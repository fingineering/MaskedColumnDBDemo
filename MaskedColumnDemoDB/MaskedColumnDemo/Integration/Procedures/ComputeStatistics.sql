CREATE PROCEDURE [Integration].[ComputeStatistics]
AS
BEGIN
    -- remove already available data
    IF OBJECT_ID('Integration.AvgPerPeriode') IS NOT NULL
        TRUNCATE TABLE Integration.AvgPerPeriode;

    INSERT INTO [Integration].[AvgPerPeriode] (
        [Period]
        , [sex]
        , [no_employees]
        , [avg_salary]
        )
    SELECT S.Period
        , E.sex
        , COUNT(E.EmployeeId) AS no_employees
        , AVG(S.Salary) AS salary
    FROM [StageA].[Employee] E
    LEFT JOIN [StageB].[Salaries] S
        ON E.EmployeeId = S.EmployeeID
    GROUP BY E.sex
        , S.Period

    RETURN 0
END
