USE [master]
GO

SELECT
	dbs.name AS [DB_name]
	,dbs.user_access_desc AS [Access_level]
	,dbs.state_desc AS [DB_State]
	,mfs.type_desc AS [Type]
	,mfs.name AS [File_name]
	,mfs.physical_name AS [Path]
	,mfs.state_desc AS [File_state]
	,mfs.size / 1024 * 8 AS [File_size_MB]
	,mfs.size / 1024 / 1024 * 8 AS [File_size_GB]
FROM
	sys.databases dbs
	LEFT JOIN sys.master_files mfs
	ON dbs.database_id = mfs.database_id
WHERE
	NOT dbs.name IN ('master', 'model', 'tempdb', 'msdb', 'utility')
ORDER BY dbs.name ASC