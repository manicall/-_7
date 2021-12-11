-- 1
USE master; 
SELECT spid, dbid, uid, cpu 
FROM master.dbo.sysprocesses order by cpu DESC;

-- 2
SELECT session_id, database_id, user_id, cpu_time, sql_handle 
FROM sys.dm_exec_requests order by cpu_time DESC;

-- 3
SELECT TOP 20 SUM(total_worker_time)
AS cpu_total, SUM(execution_count) 
AS exec_ct, COUNT(*) 
AS all_stmts, plan_handle
FROM sys.dm_exec_query_stats
GROUP BY plan_handle ORDER BY cpu_total;

-- 4
SELECT type, SUM(pages_kb) 
FROM sys.dm_os_memory_clerks 
WHERE pages_kb != 0 
GROUP BY type ORDER BY 2 DESC;

-- 5
SELECT type, SUM(pages_in_bytes)
AS total_memory
FROM sys.dm_os_memory_objects
GROUP BY type ORDER BY total_memory DESC;

-- 6
SELECT wait_type, waiting_tasks_count, wait_time_ms
FROM sys.dm_os_wait_stats 
ORDER BY wait_type;

-- 7
SELECT database_id, file_id, num_of_reads,
num_of_bytes_read, num_of_bytes_written 
FROM sys.dm_io_virtual_file_stats (NULL, NULL);

-- 8
SELECT net_transport, auth_scheme
FROM sys.dm_exec_connections
WHERE session_id=@@SPID;

-- 9
SELECT num_reads, num_writes
FROM sys.dm_exec_connections;





create database sample;
-- 10	
USE sample;
CREATE TABLE orders (
	orderid INTEGER NOT NULL,
	orderdate DATE, 
	shippeddate DATE,
	freight money); 
CREATE TABLE order_details (
	productid INTEGER NOT NULL,
	orderid INTEGER NOT NULL,
	unitprice money, 
	quantity INTEGER);

-- 11
USE sample;
declare @i int, @order_id integer
 declare @orderdate datetime
 declare @shipped_date datetime
 declare @freight money
 set @i = 1
 set @orderdate = getdate()
 set @shipped_date = getdate()
 set @freight = 100.00 while @i < 3001
 begin
 insert into orders (orderid, orderdate, shippeddate, freight)
 values(@i, @orderdate, @shipped_date, @freight)
 set @i = @i+1
 end

-- 12
USE sample; 
declare @i int, @j int 
set @i = 3000 
set @j = 10 
while @j > 0 begin
	if @i > 0 begin 
		insert into 
		order_details (productid, orderid, quantity) 
		values (@i, @j, 5)
		set @i = @i - 1 
	end else begin 
		set @j = @j - 1 
		set @i = 3000
		end 
end 
go
update order_details
set quantity = 3 
where productid in (1511, 2678)

 -- 13
 USE sample;
SELECT orders.orderid, orders.shippeddate
 FROM orders
 WHERE orders.orderid between 806 and 1600
 and not exists (SELECT order_details.orderid
 FROM order_details
 WHERE order_details.orderid = orders.orderid); 