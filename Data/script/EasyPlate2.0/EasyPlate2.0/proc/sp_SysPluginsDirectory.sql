/*
*���ز��Ŀ¼���ݼ�
*2011-07-15 hehf
*/
CREATE PROC sp_SysPluginsDirectory
AS
	SELECT * FROM vwSysPluginsDirectory ORDER BY IsDirectory, iOrder
	
	