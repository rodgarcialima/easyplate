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
//    �ֵ������
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyClassSysDataList;

interface

uses
  Classes, DB, DBClient, Variants;

type
  TEasySysDataList = class
  private
  { Private declarations } 
    FDataListGUID: string;
    FSysDataName: string;
    FSysDataValue: string;
    FParentDataListGUID: string;
    FbEnable: Boolean;
    FiOrder: Integer;
    FRemark: string;
  public
  { Public declarations }
    property DataListGUID: string read FDataListGUID write FDataListGUID;
    property SysDataName: string read FSysDataName write FSysDataName;
    property SysDataValue: string read FSysDataValue write FSysDataValue;
    property ParentDataListGUID: string read FParentDataListGUID write FParentDataListGUID;
    property bEnable: Boolean read FbEnable write FbEnable;
    property iOrder: Integer read FiOrder write FiOrder;
    property Remark: string read FRemark write FRemark;
    //
    class procedure GenerateSysDataList(var Data: OleVariant; AResult: TList);
    class procedure AppendClientDataSet(ACds: TClientDataSet; AObj: TEasySysDataList; var AObjList: TList);
    class procedure EditClientDataSet(ACds: TClientDataSet; AObj: TEasySysDataList; var AObjList: TList);
    class procedure DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasySysDataList; var AObjList: TList);
  end;

implementation

class procedure TEasySysDataList.GenerateSysDataList(var Data: OleVariant; AResult: TList);
var
  I: Integer;
  AEasySysDataList: TEasySysDataList;
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
      AEasySysDataList := TEasySysDataList.Create;
      with AEasySysDataList do 
      begin
      //1 DataListGUID
        DataListGUID := AClientDataSet.FieldByName('DataListGUID').AsString;
      //2 SysDataName
        SysDataName := AClientDataSet.FieldByName('SysDataName').AsString;
      //3 SysDataValue
        SysDataValue := AClientDataSet.FieldByName('SysDataValue').AsString;
      //4 ParentDataListGUID
        ParentDataListGUID := AClientDataSet.FieldByName('ParentDataListGUID').AsString;
      //5 bEnable
        bEnable := AClientDataSet.FieldByName('bEnable').AsBoolean;
      //6 iOrder
        iOrder := AClientDataSet.FieldByName('iOrder').AsInteger;
      //7 Remark
        Remark := AClientDataSet.FieldByName('Remark').AsString;
      end;
      //�ڴ���ӽ������ŵ�ָ�������Ĵ���
      AResult.Add(AEasySysDataList);
      //���Ҫ������Ҳ�ڴ������Ӧ����
      AClientDataSet.Next;
    end;
  finally
    AClientDataSet.Free;
  end;
end;

class procedure TEasySysDataList.AppendClientDataSet(ACds: TClientDataSet; AObj: TEasySysDataList; var AObjList: TList);
begin
  with ACds do
  begin
    Append;
      //1 DataListGUID
    FieldByName('DataListGUID').AsString := AObj.DataListGUID;
      //2 SysDataName
    FieldByName('SysDataName').AsString := AObj.SysDataName;
      //3 SysDataValue
    FieldByName('SysDataValue').AsString := AObj.SysDataValue;
      //4 ParentDataListGUID
    FieldByName('ParentDataListGUID').AsString := AObj.ParentDataListGUID;
      //5 bEnable
    FieldByName('bEnable').AsBoolean := AObj.bEnable;
      //6 iOrder
    FieldByName('iOrder').AsInteger := AObj.iOrder;
      //7 Remark
    FieldByName('Remark').AsString := AObj.Remark;
    post;
  end;
  AObjList.Add(AObj);
end;

class procedure TEasySysDataList.EditClientDataSet(ACds: TClientDataSet; AObj: TEasySysDataList; var AObjList: TList);
begin
  if ACds.Locate('DataListGUID', VarArrayOf([AObj.DataListGUID]), [loCaseInsensitive]) then
  begin
    with ACds do
    begin
      Edit;
      //1 DataListGUID
      FieldByName('DataListGUID').AsString := AObj.DataListGUID;
      //2 SysDataName
      FieldByName('SysDataName').AsString := AObj.SysDataName;
      //3 SysDataValue
      FieldByName('SysDataValue').AsString := AObj.SysDataValue;
      //4 ParentDataListGUID
      FieldByName('ParentDataListGUID').AsString := AObj.ParentDataListGUID;
      //5 bEnable
      FieldByName('bEnable').AsBoolean := AObj.bEnable;
      //6 iOrder
      FieldByName('iOrder').AsInteger := AObj.iOrder;
      //7 Remark
      FieldByName('Remark').AsString := AObj.Remark;
      post;
    end;
  end;
end;

class procedure TEasySysDataList.DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasySysDataList; var AObjList: TList);
var
  I,
  DelIndex: Integer;
begin
  DelIndex := -1;
  if ACds.Locate('DataListGUID', VarArrayOf([AObj.DataListGUID]), [loCaseInsensitive]) then
    ACds.Delete;
  for I := 0 to AObjList.Count - 1 do
  begin
    if TEasySysDataList(AObjList[I]).DataListGUID = TEasySysDataList(AObj).DataListGUID then
    begin
      DelIndex := I;
      Break;
    end;
  end;
  if DelIndex <> -1 then
  begin
    TEasySysDataList(AObjList[DelIndex]).Free;
    AObjList.Delete(DelIndex);
  end; 
end; 

end.
