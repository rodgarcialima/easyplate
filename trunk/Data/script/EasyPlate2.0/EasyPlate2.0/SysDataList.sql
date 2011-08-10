/*==============================================================*/
/* Table: SysDataList                                           */
/*==============================================================*/
create table dbo.SysDataList (
   DataListGUID         varchar(50)          not null,
   SysDataName          varchar(100)         not null,
   SysDataValue         varchar(100)         not null,
   ParentDataListGUID   varchar(50)          not null,
   bEnable              bit                  not null default 0,
   iOrder               int                  not null default 0,
   Remark               varchar(255)         null,
   constraint PK_SysDataList primary key (DataListGUID)
)
go

/*==============================================================*/
/* Index: Index_SysData                                         */
/*==============================================================*/
create index Index_SysData on dbo.SysDataList (
SysDataName ASC,
ParentDataListGUID ASC
)
go