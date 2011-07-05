/*==============================================================*/
/* Table: sysSQL                                                */
/*==============================================================*/
create table sysSQL (
   SQLGUID              varchar(50)          not null,
   SQLName              varchar(50)          not null,
   SQLContext           text                 null,
   ParentSQLGUID        varchar(50)          not null,
   Remark               varchar(255)         null,
   IsEnable             integer              null,
   constraint PK_SYSSQL primary key (SQLGUID)
)
go
--����ΨһSQL��������
CREATE UNIQUE INDEX ix_sqlname ON sysSQL(SQLName)