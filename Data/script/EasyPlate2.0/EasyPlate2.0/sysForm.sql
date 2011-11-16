/*==============================================================*/
/* Table: sysForm                                               */
/*==============================================================*/
create table sysForm (
   FormGUID             varchar(50)          not null,
   FormName             varchar(50)          not null,
   FormFile             text                 not null,
   FormScriptFile       text                 null,
   Status               bit                  not null default 1,
   constraint PK_SYSFORM primary key (FormGUID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '���ϵͳ��Ӧ�ı��Լ��ű��ļ�',
   'user', @CurrentUser, 'table', 'sysForm'
go

/*==============================================================*/
/* Index: Index_FormGUID                                        */
/*==============================================================*/
create index Index_FormGUID on sysForm (
FormGUID ASC
)
go
