{-------------------------------------------------------------------------------
//                       EasyComponents For Delphi 7                            
//                         һ�����е�����������                                 
//                         @Copyright 2010 hehf                                 
//                   ------------------------------------                       
//                                                                              
//           ���������ǹ�˾�ڲ�ʹ��,��Ϊ��������ʹ���κ�,�κ�����˸��𿪷�,�κ�
//       �˲�����й,�������Ը�.                                               
//                                                                              
//            ʹ��Ȩ���Լ���ؽ�������ϵ�κ���                                  
//                                                                              
//                                                                              
//            ��վ��ַ��http://www.YiXuan-SoftWare.com                          
//            �����ʼ���hehaifeng1984@126.com                                   
//                      YiXuan-SoftWare@hotmail.com                             
//            QQ      ��383530895                                               
//            MSN     ��YiXuan-SoftWare@hotmail.com                             
//------------------------------------------------------------------------------
//��Ԫ˵����                                                                    
//                                                                              
//��Ҫʵ�֣�                                                                    
//-----------------------------------------------------------------------------}
unit untEasyClasssysUser;

interface

uses
  Classes, DB, DBClient, Variants;

type

  TEasysysUser = class
  private
  { Private declarations } 
    FUserGUID: string;
    FUserName: string;
    FPassWord: string;
    FEmployeeGUID: string;
    FIsEnable: Boolean;
    FEndDate: TDateTime;
    FRoleGUID: string;
    FCreateTime: TDateTime;
    FCreaterGUID: string;
  public
  { Public declarations } 
    property UserGUID: string read FUserGUID write FUserGUID;
    property UserName: string read FUserName write FUserName;
    property PassWord: string read FPassWord write FPassWord;
    property EmployeeGUID: string read FEmployeeGUID write FEmployeeGUID;
    property IsEnable: Boolean read FIsEnable write FIsEnable;
    property EndDate: TDateTime read FEndDate write FEndDate;
    property RoleGUID: string read FRoleGUID write FRoleGUID;
    property CreateTime: TDateTime read FCreateTime write FCreateTime;
    property CreaterGUID: string read FCreaterGUID write FCreaterGUID;


    class procedure GeneratesysUser(var Data: OleVariant; AResult: TList);
    class procedure AppendClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
    class procedure EditClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
    class procedure DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
    class procedure InitSingleSysUser(AClientDataSet: TClientDataSet; AObj: TEasysysUser);
  end;

implementation

{TEasysysUser}
class procedure TEasysysUser.GeneratesysUser(var Data: OleVariant; AResult: TList);
var
  I: Integer;
  AEasysysUser: TEasysysUser;
  AClientDataSet: TClientDataSet;
begin
  //��������Դ������ȡ����
  AClientDataSet := TClientDataSet.Create(nil);
  AClientDataSet.Data := Data;
  AClientDataSet.First;
  try
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      //�˾�Ϊʵ����ָ���Ķ���
      AEasysysUser := TEasysysUser.Create;
      with AEasysysUser do
      begin
      //1 UserGUID
        UserGUID := AClientDataSet.FieldByName('UserGUID').AsString;
      //2 UserName
        UserName := AClientDataSet.FieldByName('UserName').AsString;
      //3 PassWord
        PassWord := AClientDataSet.FieldByName('PassWord').AsString;
      //4 EmployeeGUID
        EmployeeGUID := AClientDataSet.FieldByName('EmployeeGUID').AsString;
      //5 IsEnable
        IsEnable := AClientDataSet.FieldByName('IsEnable').AsBoolean;
      //6 EndDate
        EndDate := AClientDataSet.FieldByName('EndDate').AsDateTime;
      //7 RoleGUID
        RoleGUID := AClientDataSet.FieldByName('RoleGUID').AsString;
      //8 CreateTime
        CreateTime := AClientDataSet.FieldByName('CreateTime').AsDateTime;
      //9 CreaterGUID
        CreaterGUID := AClientDataSet.FieldByName('CreaterGUID').AsString;
      end;
      //�ڴ���ӽ������ŵ�ָ�������Ĵ���
      AResult.Add(AEasysysUser);
      //���Ҫ������Ҳ�ڴ������Ӧ����
      AClientDataSet.Next;
    end;
  finally
    AClientDataSet.Free;
  end;
end;

class procedure TEasysysUser.AppendClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
begin
  with ACds do
  begin
    Append;
      //1 UserGUID
    FieldByName('UserGUID').AsString := AObj.UserGUID;
      //2 UserName
    FieldByName('UserName').AsString := AObj.UserName;
      //3 PassWord
    FieldByName('PassWord').AsString := AObj.PassWord;
      //4 EmployeeGUID
    FieldByName('EmployeeGUID').AsString := AObj.EmployeeGUID;
      //5 IsEnable
    FieldByName('IsEnable').AsBoolean := AObj.IsEnable;
      //6 EndDate
    FieldByName('EndDate').AsDateTime := AObj.EndDate;
      //7 RoleGUID
    FieldByName('RoleGUID').AsString := AObj.RoleGUID;
      //8 CreateTime
    FieldByName('CreateTime').AsDateTime := AObj.CreateTime;
      //9 CreaterGUID
    FieldByName('CreaterGUID').AsString := AObj.CreaterGUID;
    post;
  end;
  AObjList.Add(AObj);
end;

class procedure TEasysysUser.EditClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
begin
  if ACds.Locate('UserGUID', VarArrayOf([AObj.UserGUID]), [loCaseInsensitive]) then
  begin
    with ACds do
    begin
      Edit;
      //1 UserGUID
      FieldByName('UserGUID').AsString := AObj.UserGUID;
      //2 UserName
      FieldByName('UserName').AsString := AObj.UserName;
      //3 PassWord
      FieldByName('PassWord').AsString := AObj.PassWord;
      //4 EmployeeGUID
      FieldByName('EmployeeGUID').AsString := AObj.EmployeeGUID;
      //5 IsEnable
      FieldByName('IsEnable').AsBoolean := AObj.IsEnable;
      //6 EndDate
      FieldByName('EndDate').AsDateTime := AObj.EndDate;
      //7 RoleGUID
      FieldByName('RoleGUID').AsString := AObj.RoleGUID;
      //8 CreateTime
      FieldByName('CreateTime').AsDateTime := AObj.CreateTime;
      //9 CreaterGUID
      FieldByName('CreaterGUID').AsString := AObj.CreaterGUID;
      post;
    end;
  end;
end;

class procedure TEasysysUser.DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
var
  I,
  DelIndex: Integer;
begin
  DelIndex := -1;
  if ACds.Locate('UserGUID', VarArrayOf([AObj.UserGUID]), [loCaseInsensitive]) then
    ACds.Delete;
  for I := 0 to AObjList.Count - 1 do
  begin
    if TEasysysUser(AObjList[I]).UserGUID = TEasysysUser(AObj).UserGUID then
    begin
      DelIndex := I;
      Break;
    end;
  end;
  if DelIndex <> -1 then
  begin
    TEasysysUser(AObjList[DelIndex]).Free;
    AObjList.Delete(DelIndex);
  end; 
end;

class procedure TEasysysUser.InitSingleSysUser(AClientDataSet: TClientDataSet;
  AObj: TEasysysUser);
begin
  with AObj do
  begin
  //1 UserGUID
    UserGUID := AClientDataSet.FieldByName('UserGUID').AsString;
  //2 UserName
    UserName := AClientDataSet.FieldByName('UserName').AsString;
  //3 PassWord
    PassWord := AClientDataSet.FieldByName('PassWord').AsString;
  //4 EmployeeGUID
    EmployeeGUID := AClientDataSet.FieldByName('EmployeeGUID').AsString;
  //5 IsEnable
    IsEnable := AClientDataSet.FieldByName('IsEnable').AsBoolean;
  //6 EndDate
    EndDate := AClientDataSet.FieldByName('EndDate').AsDateTime;
  //7 RoleGUID
    RoleGUID := AClientDataSet.FieldByName('RoleGUID').AsString;
  //8 CreateTime
    CreateTime := AClientDataSet.FieldByName('CreateTime').AsDateTime;
  //9 CreaterGUID
    CreaterGUID := AClientDataSet.FieldByName('CreaterGUID').AsString;
  end;
end;

end.
