
-- Needs to run on master db and not via deployment
CREATE LOGIN [demoUser] WITH PASSWORD = 'Fjedwaknfeu21';
GO

-- If you want to use this local SQL Server user for testing purposes, please make sure to deactivate 
-- "Azure Active Directory Authentication only" on the SQL Server in the Azure Portal
-- Run user creation manually or add master database as database reference
CREATE USER [demoUser] FROM LOGIN [demoUser];
GO

GRANT CONNECT TO [demoUser];
GO

ALTER ROLE [db_datareader] ADD MEMBER [demoUser];
GO

GRANT EXECUTE ON SCHEMA::Integration TO [demoUser];
GO
