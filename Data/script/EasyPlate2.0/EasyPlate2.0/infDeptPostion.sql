--ְλ��
CREATE TABLE infDeptPostion(
PostGUID		VARCHAR(50) NOT NULL PRIMARY KEY,
PostCName	    VARCHAR(100) NOT NULL, 
PostEName	    VARCHAR(100),
PostTypeGUID    VARCHAR(50) NOT NULL,--��λ����
DeptGUID		VARCHAR(50) NOT NULL,
PostBasePay     Float DEFAULT 0.0, --��λ��������
AssessTypeGUID  VARCHAR(50), --���˷�ʽ
PostRankHigh		INT DEFAULT 0,--�ȼ�����
PostRankLow		    INT DEFAULT 0,--�ȼ�����
PersonnelNumbers INT DEFAULT 0, --������Ա����
IsEnable        bit DEFAULT 1,
OrderNo			INT DEFAULT 0,
Remark          VARCHAR(255)
)

CREATE INDEX index_PostGUID ON infDeptPostion(PostGUID);
CREATE INDEX index_PostCName ON infDeptPostion(PostCName);
CREATE INDEX index_PostDeptGUID ON infDeptPostion(DeptGUID);
--����GUID���Լ��
ALTER TABLE infDeptPostion ADD CONSTRAINT FK_PostDeptGUID FOREIGN KEY(DeptGUID)
 REFERENCES infCompanyDept(DeptGUID)
 
 
 SELECT * FROM vw_infDeptPostion
 
  
 SELECT * FROM vw_infCompanyDept
 
 SELECT * FROM vw_SysDataList WHERE SysDataName LIKE '%����%'
 
 SELECT * FROM vw_SysDataList WHERE ParentDataListGUID = '{24E73232-9A89-465B-AE87-3D2510F0E4E5}' ORDER BY OrderNo
 SELECT * FROM vw_SysDataList WHERE ParentDataListGUID = '{2B8E69F4-2D06-4A3B-A9C2-B4B79E698649}' ORDER BY OrderNo
 