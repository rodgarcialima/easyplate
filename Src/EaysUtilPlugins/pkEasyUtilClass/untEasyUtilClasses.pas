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
//     ����ϵͳ����ʹ�õ�һ���࣬��פ�ڴ�
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyUtilClasses;

interface

uses
  Windows, Classes, DB, DBClient;

type

  TEasyUpdateMode = (eumWhereKeyOnly, eumWhereUpdated, eumWhereAll);

  //�����
  PPLugin = ^TPlugin;
  TPlugin = record
    FileName: string; //����ļ�
    EName: string;   //Ӣ����
    CName: string;   //������
    image1: string;  //ͼƬ
    image2: string;  //���ʱͼƬ
    iOrder: Integer; //���
    Flag  : string; //��־��
  end;

  TEasyObject = class
  private
    FGUID         : string;
    FClientDataSet: TClientDataSet;
    FRecordList   : TStrings;
    FKeyField     : string;
    FUpdateMode   : TEasyUpdateMode;
    FTag          : Integer;
    FFlag         : string;
    FData         : Pointer;
    function GetClientDataSet: TClientDataSet;
    function GetEasyUpdateMode: TEasyUpdateMode;
    function GetFlag: string;
    function GetGUID: string;
    function GetKeyField: string;
    function GetRecordList: TStrings;
    function GetTag: Integer;
    procedure SetClientDataSet(const Value: TClientDataSet);
    procedure SetEasyUpdateMode(const Value: TEasyUpdateMode);
    procedure SetFlag(const Value: string);
    procedure SetGUID(const Value: string);
    procedure SetKeyField(const Value: string);
    procedure SetRecordList(const Value: TStrings);
    procedure SetTag(const Value: Integer);
    function GetData: Pointer;
    procedure SetData(const Value: Pointer);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure GenerateListByRecord(var AClientDataSet: TClientDataSet); virtual;
    property GUID: string read GetGUID write SetGUID;
    property ClientDataSet: TClientDataSet read GetClientDataSet write SetClientDataSet;
    property RecordList: TStrings read GetRecordList write SetRecordList;
    property KeyField: string read GetKeyField write SetKeyField;
    property UpdateMode: TEasyUpdateMode read GetEasyUpdateMode write SetEasyUpdateMode;
    property Tag: Integer read GetTag write SetTag;
    property Flag: string read GetFlag write SetFlag;
    property Data: Pointer read GetData write SetData;
  end;

implementation

{ TEasyObject }

constructor TEasyObject.Create;
begin
  inherited;
  FRecordList := TStringList.Create;
end;

destructor TEasyObject.Destroy;
begin
  FRecordList.Free;
  if FData <> nil then
    TObject(FData).Free;
  inherited;
end;

procedure TEasyObject.GenerateListByRecord(var AClientDataSet: TClientDataSet);
var
  J: Integer;
begin
  for J := 0 to AClientDataSet.FieldCount - 1 do
    FRecordList.Add(AClientDataSet.Fields[J].FieldName + '=' + AClientDataSet.Fields[J].Value);
end;

function TEasyObject.GetClientDataSet: TClientDataSet;
begin
  Result := FClientDataSet;
end;

function TEasyObject.GetData: Pointer;
begin
  Result := FData;
end;

function TEasyObject.GetEasyUpdateMode: TEasyUpdateMode;
begin
  Result := FUpdateMode;
end;

function TEasyObject.GetFlag: string;
begin
  Result := FFlag;
end;

function TEasyObject.GetGUID: string;
begin
  Result := FGUID;
end;

function TEasyObject.GetKeyField: string;
begin
  Result := FKeyField;
end;

function TEasyObject.GetRecordList: TStrings;
begin
  Result := FRecordList;
end;

function TEasyObject.GetTag: Integer;
begin
  Result := FTag;
end;

procedure TEasyObject.SetClientDataSet(const Value: TClientDataSet);
begin
  FClientDataSet := Value;
end;

procedure TEasyObject.SetData(const Value: Pointer);
begin
  FData := Value;
end;

procedure TEasyObject.SetEasyUpdateMode(const Value: TEasyUpdateMode);
begin
  FUpdateMode := Value;
end;

procedure TEasyObject.SetFlag(const Value: string);
begin
  FFlag := Value;
end;

procedure TEasyObject.SetGUID(const Value: string);
begin
  FGUID := Value;
end;

procedure TEasyObject.SetKeyField(const Value: string);
begin
  FKeyField := Value;
end;

procedure TEasyObject.SetRecordList(const Value: TStrings);
begin
  FRecordList := Value;
end;

procedure TEasyObject.SetTag(const Value: Integer);
begin
  FTag := Value;
end;

end.
