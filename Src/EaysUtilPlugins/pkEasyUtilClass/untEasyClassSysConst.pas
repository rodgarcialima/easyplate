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
//    ϵͳ������
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyClassSysConst;

interface

uses
  Classes, DB, DBClient, Variants;

type
  TEasySysConst = class
  private
  { Private declarations } 
    FConstGUID: string;
    FCName: string;
    FEName: string;
    FValue: string;
    FCreateTime: TDateTime;
    FCreater: string;
    FUpdater: string;
    FUpdateTime: TDateTime;
  public
  { Public declarations } 
    property ConstGUID: string read FConstGUID write FConstGUID;
    property CName: string read FCName write FCName;
    property EName: string read FEName write FEName;
    property Value: string read FValue write FValue;
    property CreateTime: TDateTime read FCreateTime write FCreateTime;
    property Creater: string read FCreater write FCreater;
    property Updater: string read FUpdater write FUpdater;
    property UpdateTime: TDateTime read FUpdateTime write FUpdateTime;
    
    class procedure AppendClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
    class procedure EditClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
    class procedure DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
  end;
  
implementation

class procedure TEasySysConst.AppendClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
begin
  with ACds do
  begin
    Append;
      //1 ConstGUID
    FieldByName('ConstGUID').AsString := AObj.ConstGUID;
      //2 CName
    FieldByName('CName').AsString := AObj.CName;
      //3 EName
    FieldByName('EName').AsString := AObj.EName;
      //4 Value
    FieldByName('Value').AsString := AObj.Value;
      //5 CreateTime
    FieldByName('CreateTime').AsDateTime := AObj.CreateTime;
      //6 Creater
    FieldByName('Creater').AsString := AObj.Creater;
      //7 Updater
    FieldByName('Updater').AsString := AObj.Updater;
      //8 UpdateTime
    FieldByName('UpdateTime').AsDateTime := AObj.UpdateTime;
    post;
  end;
  AObjList.Add(AObj);
end;

class procedure TEasySysConst.EditClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
begin
  if ACds.Locate('ConstGUID', VarArrayOf([AObj.ConstGUID]), [loCaseInsensitive]) then
  begin
    with ACds do
    begin
      Edit;
      //1 ConstGUID
      FieldByName('ConstGUID').AsString := AObj.ConstGUID;
      //2 CName
      FieldByName('CName').AsString := AObj.CName;
      //3 EName
      FieldByName('EName').AsString := AObj.EName;
      //4 Value
      FieldByName('Value').AsString := AObj.Value;
      //5 CreateTime
      FieldByName('CreateTime').AsDateTime := AObj.CreateTime;
      //6 Creater
      FieldByName('Creater').AsString := AObj.Creater;
      //7 Updater
      FieldByName('Updater').AsString := AObj.Updater;
      //8 UpdateTime
      FieldByName('UpdateTime').AsDateTime := AObj.UpdateTime;
      post;
    end;
  end;
end;

class procedure TEasySysConst.DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
var
  I,
  DelIndex: Integer;
begin
  DelIndex := -1;
  if ACds.Locate('ConstGUID', VarArrayOf([AObj.ConstGUID]), [loCaseInsensitive]) then
    ACds.Delete;
  for I := 0 to AObjList.Count - 1 do
  begin
    if TEasySysConst(AObjList[I]).ConstGUID = TEasySysConst(AObj).ConstGUID then
    begin
      DelIndex := I;
      Break;
    end;
  end;
  if DelIndex <> -1 then
  begin
    TEasySysConst(AObjList[DelIndex]).Free;
    AObjList.Delete(DelIndex);
  end; 
end; 

end.
