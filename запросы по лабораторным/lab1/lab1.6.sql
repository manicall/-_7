
SELECT counter, occurrence, 
value FROM sys.dm_exec_query_optimizer_info
WHERE value IS NOT NULL AND counter LIKE 'search 1%';


SELECT ecp.objtype AS 
Object_Type, (SELECT t. text FROM sys.dm_exec_sql_text(qs.sql_handle) AS t) 
AS Adhoc_Batch, qs. execution_count 
AS Counts, qs. total_worker_time 
AS Total_Worker_Time, (qs. total_worker_time / qs. execution_count) 
AS Avg_Worker_Time, (qs. total_physical_reads / qs. execution_count)
AS Avg_Physical_Reads, (qs. total_logical_writes / qs. execution_count)
AS Avg_Logical_Writes, (qs. total_logical_reads / qs. execution_count) 
AS Avg_Logical_Reads, qs. total_clr_time 
AS Total_CLR_Time, (qs. total_clr_time / qs. execution_count)
AS Avg_CLR_Time, qs. total_elapsed_time 
AS Total_Elapsed_Time, (qs. total_elapsed_time / qs. execution_count)
AS Avg_Elapsed_Time, qs. last_execution_time
AS Last_Exec_Time, qs. creation_time 
AS Creation_Time FROM sys.dm_exec_query_stats 
AS qs JOIN sys.dm_exec_cached_plans ecp ON qs.plan_handle = ecp.plan_handle 
ORDER BY Counts DESC;