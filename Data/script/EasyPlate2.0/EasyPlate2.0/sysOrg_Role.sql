/*==============================================================*/
/* Table: sysOrg_Role                                           */
/*==============================================================*/
create table sysOrg_Role (
   GUID                 varchar(50)          not null,
   DeptGUID             varchar(50)          not null,
   RoleGUID             varchar(50)          not null,
   constraint PK_SYSORG_ROLE primary key (GUID)
)
go

/*==============================================================*/
/* Index: Index_Org_Role                                        */
/*==============================================================*/
create index Index_Org_Role on sysOrg_Role (
DeptGUID ASC,
RoleGUID ASC
)
go

--����˫���Լ��
--�������
ALTER TABLE sysOrg_Role
	ADD CONSTRAINT FK_Org_Role_DEPT_GUID FOREIGN KEY (DeptGUID)
	REFERENCES infCompanyDept(DeptGUID)
--��ɫ���
ALTER TABLE sysOrg_Role
	ADD  CONSTRAINT FK_Org_Role_ROLE_GUID FOREIGN KEY (RoleGUID)
	REFERENCES sysRole(RoleGUID)
	
	
