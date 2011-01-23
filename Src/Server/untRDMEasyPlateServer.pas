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
//    EasyPlate����ķ���˵�Ԫ
//��Ҫʵ�֣�
//    ���������ģ��
//+ 2011-01-07 ��ģ��Ҫ�ڳ����ʼ����Ԫ��ʼ��ʱ�ֹ���Ӵ���
//-----------------------------------------------------------------------------}
unit untRDMEasyPlateServer;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, EasyPlateServer_TLB, StdVcl, DB, ADODB, Provider, MConnect,
  ObjBrkr, IniFiles, untEasyUtilRWIni, ActiveX;

type
  TRDMEasyPlateServer = class(TRemoteDataModule, IRDMEasyPlateServer)
    EasyRDMADOConn: TADOConnection;
    EasyRDMQry: TADOQuery;
    EasyRDMDsp: TDataSetProvider;
    EasyRDMCds: TClientDataSet;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
    procedure EasyRDMDspUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure EasyRDMDspBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure EasyRDMDspGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure EasyRDMDspBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
  private
    { Private declarations }
    FTableName: string;
    Params   : OleVariant;
    OwnerData: OleVariant;
    //��ȡ������ MSSQL��ORACLE
    FDBType: String;
    //�������ͣ�innet ���� outnet ����
    FNetType: String;
    //��������ַ���û��������롢���ݿ⡢�˿�
    FDBHost,
    FDBUserName,
    FDBPassWord,
    FDBDataBase,
    FDBPort   : string;
    //��ȡ��������Ini
    FEasyDBIni: TEasyRWIni;
    FDBIniFilePath: string;
    //��ȡ�����ļ���Ϣ
    procedure ReadIniFile(AFileName, ASeed: string);
    //��ADOConnection
    function OpenEasyADOConnection(DBType, NetType: string): Integer;
    procedure GetDBType(const Value: string);
    procedure GetNetType(const Value: string);
    procedure SetDBDataBase(const Value: string);
    procedure SetDBHost(const Value: string);
    procedure SetDBPassWord(const Value: string);
    procedure SetDBPort(const Value: string);
    procedure SetDBUserName(const Value: string);
    function GetDBIniFilePath: string;
    procedure SetDBIniFilePath(const Value: string);

    // �ֹ�����
    function InnerGetData(strSQL: String): OleVariant;
    function InnerPostData(Delta: OleVariant; out ErrorCode: Integer): OleVariant;
    //��ȡ��ǰ����ʱ��
    function GetOperTime: string;
    procedure AddExecLog(ALogStr: string; AType: Integer = 0);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function EasyGetRDMData(const ASQL: WideString): OleVariant; safecall;
    function EasySaveRDMData(const ATableName: WideString; ADelta: OleVariant;
      const AKeyField: WideString; out AErrorCode: SYSINT): OleVariant;
      safecall;
    function EasySaveRDMDatas(ATableNameOLE, ADeltaOLE, AKeyFieldOLE,
      ACodeErrorOLE: OleVariant): OleVariant; safecall;
  public
    { Public declarations }
    property EasyDBIniFilePath: string read GetDBIniFilePath write SetDBIniFilePath;
    //��ǰ���ݿ�����������
    property EasyDBType: string read FDBType write GetDBType;
    property EasyNetType: string read FNetType write GetNetType;
    //��������ַ���û��������롢���ݿ⡢�˿�
    property EasyDBHost: string read FDBHost write SetDBHost;
    property EasyDBUserName: string read FDBUserName write SetDBUserName;
    property EasyDBPassWord: string read FDBPassWord write SetDBPassWord;
    property EasyDBDataBase: string read FDBDataBase write SetDBDataBase;
    property EasyDBPort: string read FDBPort write SetDBPort;
  end;

var
{ Need a reference to the ClassFactory so the pooler can create instances of the
  class. }
  RDMFactory: TComponentFactory;
  RDMEasyPlateServer: TRDMEasyPlateServer;
implementation

uses untEasyPlateServerMain, Variants;

{$R *.DFM}

class procedure TRDMEasyPlateServer.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TRDMEasyPlateServer.RemoteDataModuleCreate(Sender: TObject);
begin
  //������ѯ�����С
  EasyRDMQry.CacheSize :=1000;
  //����EasyRDMDsp��Զ��ִ��SQL���
  EasyRDMDsp.Options := EasyRDMDsp.Options + [poAllowCommandText];
  //DataProviderֻ����������
  EasyRDMDsp.UpdateMode := upWhereKeyOnly;
  FDBIniFilePath := 'DBConfig.ini';
  //�ȳ�ʼ�����ݿ�����
  ReadIniFile(EasyDBIniFilePath, 'ABC123_888888');
  //����������
  OpenEasyADOConnection(EasyDBType, EasyNetType);
//  MessageBox(0, PChar('create'), PChar('Hint'), 0);
end;

procedure TRDMEasyPlateServer.GetDBType(const Value: string);
begin
  FDBType := Value;
end;

procedure TRDMEasyPlateServer.GetNetType(const Value: string);
begin
  FNetType := Value;
end;

procedure TRDMEasyPlateServer.SetDBDataBase(const Value: string);
begin
  FDBDataBase := Value;
end;

procedure TRDMEasyPlateServer.SetDBHost(const Value: string);
begin
  FDBHost := Value;
end;

procedure TRDMEasyPlateServer.SetDBPassWord(const Value: string);
begin
  FDBPassWord := Value;
end;

procedure TRDMEasyPlateServer.SetDBPort(const Value: string);
begin
  FDBPort := Value;
end;

procedure TRDMEasyPlateServer.SetDBUserName(const Value: string);
begin
  FDBUserName := Value;
end;

procedure TRDMEasyPlateServer.ReadIniFile(AFileName, ASeed: string);
var
  Ini      : TEasyXorIniFile;
  Sections,
  Values   : TStrings;
begin
  Ini := nil;
  Sections := nil;
  Values := nil;
  try
    Ini := TEasyXorIniFile.Create(AFileName, ASeed);

    Sections := TStringList.Create;
    Values := TStringList.Create;

    Ini.ReadSections(Sections);
    //��ȡ���ݿ��������͡�������/����
    FDBType := ini.ReadString('DBTYPE', 'DBTYPE', 'MSSQL');
    FNetType := ini.ReadString('NETTYPE', 'NETTYPE', 'innet');
    //��������ַ���û��������롢���ݿ⡢�˿�
    FDBHost := ini.ReadString('DBCONFIG', 'HOST', '');
    FDBUserName := ini.ReadString('DBCONFIG', 'USERNAME', '');
    FDBPassWord := ini.ReadString('DBCONFIG', 'PASSWORD', '');
    FDBDataBase := ini.ReadString('DBCONFIG', 'DATABASE', '');
    FDBPort := ini.ReadString('DBCONFIG', 'PORT', '');
  finally
    Sections.Free;
    Ini.Free;
    Values.Free;
  end;
end;

function TRDMEasyPlateServer.OpenEasyADOConnection(DBType,
  NetType: string): Integer;
begin
  Result := 0;
  if EasyRDMADOConn.Connected then
    EasyRDMADOConn.Close;
  EasyRDMADOConn.LoginPrompt := False;
  EasyRDMADOConn.ConnectionString := '';
  begin
    if UpperCase(trim(DBType)) = 'MSSQL' then
    begin
      if UpperCase(trim(NetType)) = 'INNET' then
        EasyRDMADOConn.ConnectionString := 'Provider=SQLOLEDB.1;Password='
          + trim(EasyDBPassWord) + ';Persist Security Info=True;User ID='
          + trim(EasyDBUserName) + ';Initial Catalog='
          + trim(EasyDBDataBase) + ';Data Source='
          + trim(EasyDBHost) + ';' + Trim(EasyDBPort) + ''
      else
        EasyRDMADOConn.ConnectionString := 'Provider=SQLOLEDB.1;Password='
          + trim(EasyDBPassWord) + ';Persist Security Info=True;User ID='
          + trim(EasyDBUserName) + ';Initial Catalog='
          + trim(EasyDBDataBase) + ';Data Source=' 
          + trim(EasyDBDataBase) + ';NetWork Library=DBMSSOCN;NetWork Address='
          + trim(EasyDBHost) + ';' + trim(EasyDBPort) + '';
    end
    else if UpperCase(trim(DBType)) = 'ORACLE' then
      EasyRDMADOConn.ConnectionString := 'Provider=MSDAORA.1;Password='
          + trim(EasyDBPassWord) + ';User ID='
          + trim(EasyDBUserName) + ';Data Source='
          + trim(EasyDBDataBase) + ';Persist Security Info=False';
    try
      EasyRDMADOConn.Open;
    except on e: Exception do
      Result := -1
    end; 
  end;  
end;

function TRDMEasyPlateServer.GetDBIniFilePath: string;
begin
   result := FDBIniFilePath;
end;

procedure TRDMEasyPlateServer.SetDBIniFilePath(const Value: string);
begin
   FDBIniFilePath := value;
end;

procedure TRDMEasyPlateServer.RemoteDataModuleDestroy(Sender: TObject);
begin
  if Assigned(FEasyDBIni) then
    FEasyDBIni.Free;
  if EasyRDMADOConn.Connected then
    EasyRDMADOConn.Close;
end;

function TRDMEasyPlateServer.EasyGetRDMData(const ASQL: WideString): OleVariant;
begin
  Result := Self.InnerGetData(ASQL);
end;

{
  ����ÿ���������ṩ��Ӧ�������ֶ���.
}
function TRDMEasyPlateServer.EasySaveRDMData(const ATableName: WideString;
  ADelta: OleVariant; const AKeyField: WideString;
  out AErrorCode: SYSINT): OleVariant;
var
  KeyField: TField;
begin
  //ִ��֮ǰ���Ҫ���µ��ֶ��Ƿ����
  EasyRDMCds.Data := ADelta;
  if EasyRDMCds.IsEmpty then Exit;
  KeyField := EasyRDMCds.FindField(AKeyField);
  if KeyField=nil then
  begin
    frmEasyPlateServerMain.mmErrorLog.Lines.Add('�����ֶ�:' + AKeyField + 'δ�ṩ');
    Exit;
  end;  
  EasyRDMQry.SQL.Text := 'SELECT * FROM ' + ATableName + ' WHERE 1 > 2';
  EasyRDMQry.Open;
  with EasyRDMQry.FieldByName(AKeyField) do
    ProviderFlags := ProviderFlags + [pfInKey];
  EasyRDMDsp.UpdateMode := upWhereKeyOnly;
  Result := InnerPostData(ADelta, AErrorCode);
end;

function TRDMEasyPlateServer.InnerGetData(strSQL: String): OleVariant;
var
  I: Integer;
begin
  // ������CLOSE״̬, ���򱨴�.
  if EasyRDMQry.Active then
    EasyRDMQry.Active := False;   
  Result := Self.AS_GetRecords('EasyRDMDsp', -1, I, ResetOption+MetaDataOption,   
    strSQL, Params, OwnerData);
end;

function TRDMEasyPlateServer.InnerPostData(Delta: OleVariant; out ErrorCode: Integer): OleVariant;
begin
  Result := Self.AS_ApplyUpdates('EasyRDMDsp', Delta, 0, ErrorCode, OwnerData);
end;

// ATableNameOLE��AKeyFieldOLE��ֵ����һ����ͬ����һ��Ҫ��������Ҫһһ��Ӧ
function TRDMEasyPlateServer.EasySaveRDMDatas(ATableNameOLE, ADeltaOLE,
  AKeyFieldOLE, ACodeErrorOLE: OleVariant): OleVariant;
var
  I, ErrorCode: Integer;
  CanCommit: Boolean;
begin
  CanCommit := True;
  if EasyRDMADOConn.InTransaction then
    EasyRDMADOConn.RollbackTrans;

  if VarArrayHighBound(ATableNameOLE, 1) <> VarArrayHighBound(AKeyFieldOLE, 1) then
  begin
    AddExecLog('������<>��������', 1);
    Exit;
  end;
  if VarArrayHighBound(ATableNameOLE, 1) <> VarArrayHighBound(ADeltaOLE, 1) then
  begin
    AddExecLog('������<>�ύ���ݼ�����', 1);
    Exit;
  end;
  if VarArrayHighBound(ATableNameOLE, 1) <> VarArrayHighBound(ACodeErrorOLE, 1) then
  begin
    AddExecLog('������<>���󷵻�����', 1);
    Exit;
  end;
  
  EasyRDMADOConn.BeginTrans;
  AddExecLog('BeginTrans');
  try
    for I := VarArrayLowBound(ATableNameOLE, 1) to VarArrayHighBound(ATableNameOLE, 1) do
    begin
      Result := EasySaveRDMData(ATableNameOLE[I], ADeltaOLE[I], AKeyFieldOLE[I], ErrorCode);
      ACodeErrorOLE[I] := ErrorCode;
    end;
    for I := VarArrayLowBound(ACodeErrorOLE, 1) to VarArrayHighBound(ACodeErrorOLE, 1) do
    begin
      if ACodeErrorOLE[I] <> 0 then
        CanCommit := False;
    end;
    if CanCommit then
    begin
      EasyRDMADOConn.CommitTrans;
      AddExecLog('CommitTrans');
    end
    else
    begin
      EasyRDMADOConn.RollbackTrans;
      AddExecLog('RollbackTrans');
    end;
  except on e:Exception do
    begin
      EasyRDMADOConn.RollbackTrans;
      AddExecLog('RollbackTrans:' + e.Message);
    end;
  end;
end;

procedure TRDMEasyPlateServer.EasyRDMDspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  with frmEasyPlateServerMain do
    mmErrorLog.Lines.Add(GetLocalTime + ' ' + E.Message);
end;

//ִ��֮ǰ���Ҫ���µ��ֶ��Ƿ����
procedure TRDMEasyPlateServer.EasyRDMDspBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
  function FindField(AQuery: TADOQuery; AFieldName: string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to AQuery.FieldCount - 1 do
    begin
      if AQuery.Fields[I].FieldName = AFieldName then
      begin
        Result := True;
        Break;
      end;  
    end;  
  end;
var
  I: Integer;
  TmpString: string;
begin
  TmpString := '';
  for I := 0 to DeltaDS.FieldCount - 1 do
  begin
    if not FindField(EasyRDMQry, DeltaDS.Fields[I].FieldName) then
    begin
      DeltaDS.FieldByName(DeltaDS.Fields[I].FieldName).ProviderFlags := [];
    end;
    TmpString := DeltaDS.Fields[I].AsString + ';';
  end;
  case UpdateKind of
    ukInsert:
      begin
        AddExecLog('Insert' + FTableName + TmpString);
      end;
    ukModify:
      begin
        AddExecLog('Modify' + FTableName + TmpString);
      end;
    ukDelete:
      begin
        AddExecLog('Delete' + FTableName + TmpString);
      end;  
  end;
end;

function TRDMEasyPlateServer.GetOperTime: string;
begin
  Result := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
end;

procedure TRDMEasyPlateServer.AddExecLog(ALogStr: string; AType: Integer = 0);
begin
  if AType = 0 then
    frmEasyPlateServerMain.mmExecLog.Lines.Add(GetOperTime + ' ' + ALogStr)
  else
    frmEasyPlateServerMain.mmErrorLog.Lines.Add(GetOperTime + ' ' + ALogStr);
end;

procedure TRDMEasyPlateServer.EasyRDMDspGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  FTableName := TableName;
end;

procedure TRDMEasyPlateServer.EasyRDMDspBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  AddExecLog('GetRecords��' + FTableName);
end;

initialization
  TComponentFactory.Create(ComServer, TRDMEasyPlateServer,
    Class_RDMEasyPlateServer, ciMultiInstance, tmApartment);
  //�����Vista��Win7��Ҫִ�д˾䣬�ڴ�ȫ��ִ��
//  ComServer.UpdateRegistry(True);//���������������ע��ϵͳ

{initialization
  RDMFactory := TComponentFactory.Create(ComServer, TRDMEasyPlateServer,
    Class_RDMEasyPlateServer, ciInternal, tmApartment);
  //�����Vista��Win7��Ҫִ�д˾䣬�ڴ�ȫ��ִ��
  ComServer.UpdateRegistry(True);//���������������ע��ϵͳ  }

end.
