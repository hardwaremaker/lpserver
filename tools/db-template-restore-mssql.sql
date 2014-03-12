RESTORE DATABASE [#{db.database.name}] FROM  DISK = N'#{file.db.restore}' WITH  FILE = 1,  NOUNLOAD ,  STATS = 10,  RECOVERY ,  REPLACE ,  
	MOVE N'#{db.database.name}' TO N'#{dir.db.data}\#{db.database.name}.mdf',  
	MOVE N'#{db.database.name}_log' TO N'#{dir.db.data}\#{db.database.name}_log.ldf'
GO

if not exists (select * from master.dbo.syslogins where loginname = N'lp5theapp')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'master', @loginlang = N'Deutsch'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'lp5theapp', null, @logindb, @loginlang
END
GO

if not exists (select * from master.dbo.syslogins where loginname = N'lpadmin')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'master', @loginlang = N'Deutsch'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'lpadmin', null, @logindb, @loginlang
END
GO

use #{db.database.name}
go
if exists (select * from dbo.sysusers where name = N'Logistik' and uid < 16382)
	exec sp_dropuser 'Logistik'
go
if exists (select * from dbo.sysusers where name = N'lp5theapp' and uid < 16382)
	exec sp_dropuser 'lp5theapp'
go
if exists (select * from dbo.sysusers where name = N'lpadmin' and uid < 16382)
	exec sp_dropuser 'lpadmin'
go
if not exists (select * from dbo.sysusers where name = N'lp5theapp' and uid < 16382)
	EXEC sp_grantdbaccess N'lp5theapp', N'lp5theapp'
GO

if not exists (select * from dbo.sysusers where name = N'lpadmin' and uid < 16382)
	EXEC sp_grantdbaccess N'lpadmin', N'lpadmin'
GO

exec sp_addrolemember N'db_datareader', N'lp5theapp'
GO

exec sp_addrolemember N'db_datawriter', N'lp5theapp'
GO

exec sp_addrolemember N'db_owner', N'lpadmin'
GO

QUIT