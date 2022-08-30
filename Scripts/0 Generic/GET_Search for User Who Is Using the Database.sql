SELECT 'KILL ' + CAST(session_id AS VARCHAR(10))
FROM sys.dm_exec_sessions
WHERE is_user_process = 1
       AND database_id = DB_ID('singtel_live');