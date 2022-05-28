CREATE TABLE [Integration].[AvgPerPeriode]
(
  [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [Period] NVARCHAR(6) NOT NULL,
  [sex] NVARCHAR(6) 
  , [no_employees] INT
  , [avg_salary] NUMERIC(15,4)
)
