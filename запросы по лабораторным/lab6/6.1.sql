--12.23
USE Hotel;
 EXECUTE sys.sp_cdc_enable_db 
 select is_cdc_enabled from sys.databases

--12.24
USE Hotel;
EXECUTE sys.sp_cdc_enable_table
@source_schema = N'dbo', @source_name = N'�����',
@role_name = N'cdc_admin';

 --12.25 
 USE Hotel;
 INSERT INTO ����� VALUES (102, 2, 1, 1000, N'����� � ������������');
 INSERT INTO ����� VALUES (103, 1, 3, 1500, N'����� � ������������');
 INSERT INTO ����� VALUES (104, 6, 8, 2000, N'����� � ������������'); 

 select * from �����

 --12.26
USE Hotel;
SELECT *
FROM cdc.fn_cdc_get_all_changes_dbo_�����(
sys.fn_cdc_get_min_lsn(N'dbo_�����'),
sys.fn_cdc_get_max_lsn(), 'all');

 --12.27
 USE Hotel;
 DECLARE @from_lsn binary(10), @to_lsn binary(10); 
 SELECT @from_lsn =
 sys.fn_cdc_map_time_to_lsn('smallest greater than', GETDATE() - 1);
 SELECT @to_lsn =
 sys.fn_cdc_map_time_to_lsn('largest less than or equal', GETDATE());
 SELECT * FROM
 cdc.fn_cdc_get_all_changes_dbo_�����(@from_lsn, @to_lsn, 'all'); 
