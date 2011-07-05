-- =============================================
-- �������ݿ�
-- =============================================
USE master

-- ���ݿ��ļ����·��
DECLARE @data_path nvarchar(256)
SET @data_path = 'E:\MyProject\E1Dev\Data\'

-- ������ݿ��Ѿ�������ʾ�˳�
IF  EXISTS (SELECT name	FROM sys.databases	WHERE name = 'EasyERP')
BEGIN
	PRINT 'EasyERP�������ݿ��д���!'
	RETURN
END
-- =============================================
-- ����EasyERP���ݿ��ļ���
-- =============================================
EXECUTE ('CREATE DATABASE EasyERP
ON 
( NAME = EasyERP_dat,
    FILENAME = '''+ @data_path + 'EasyERP_dat.mdf'',
    SIZE = 100MB,
    FILEGROWTH = 20% )
LOG ON
( NAME = Sales_log,
    FILENAME = '''+ @data_path + 'EasyERP_log.ldf'',
    SIZE = 50MB,
    FILEGROWTH = 20% )'
);
GO

