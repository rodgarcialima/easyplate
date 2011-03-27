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
  ObjBrkr, IniFiles, untEasyUtilRWIni, ActiveX, Forms;

type
  TRDMEasyPlateServer = class(TRemoteDataModule, IRDMEasyPlateServer)
    EasyRDMADOConn: TADOConnection;
    EasyRDMQry: TADOQuery;
    EasyRDMDsp: TDataSetProvider;
    EasyRDMCds: TClientDataSet;
    EasyRDMDsp_Update: TDataSetProvider;
    EasyRDMQry_Update: TADOQuery;
    EasyRDMCds_Update: TClientDataSet;
    EasyRDMDsp_WhereAll: TDataSetProvider;
    EasyRDMQry_WhereAll: TADOQuery;
    EasyRDMCds_WhereAll: TClientDataSet;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
    procedure EasyRDMDspUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure EasyRDMDspBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure EasyRDMQryPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure EasyRDMQryEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure EasyRDMQryDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
    FTableName,
    FConnectString: string;
    Params   : OleVariant;
    OwnerData: OleVariant;
    //��������ַ���û��������롢���ݿ⡢�˿�
    FDBHost,
    FDBUserName,
    FDBPassWord,
    FDBDataBase,
    FDBPort   : string;
    //��ȡ�����ļ���Ϣ
    procedure LoadConnectString;
    //��ADOConnection
    function OpenEasyADOConnection(): Integer;
    procedure SetDBDataBase(const Value: string);
    procedure SetDBHost(const Value: string);
    procedure SetDBPassWord(const Value: string);
    procedure SetDBPort(const Value: string);
    procedure SetDBUserName(const Value: string);

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
    function EasyGetRDMDatas(ASQLOLE: OleVariant): OleVariant; safecall;
  public
    { Public declarations }
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

uses untEasyPlateServerMain, Variants, untEasyUtilMethod, untEasyUtilConst;

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
  //�ȳ�ʼ�����ݿ�����
  LoadConnectString;
  //����������
  OpenEasyADOConnection();
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

function TRDMEasyPlateServer.OpenEasyADOConnection(): Integer;
begin
  Result := 0;
  if EasyRDMADOConn.Connected then
    EasyRDMADOConn.Close;
  EasyRDMADOConn.LoginPrompt := False;
  EasyRDMADOConn.ConnectionString := '';
  begin
    EasyRDMADOConn.ConnectionString := FConnectString;
    try
      EasyRDMADOConn.Open;

      EasyDBHost := EasyRDMADOConn.Properties.Item['Data Source'].Value;
      EasyDBDataBase := EasyRDMADOConn.Properties.Item['Initial Catalog'].Value;
      EasyDBUserName := EasyRDMADOConn.Properties.Item['User ID'].Value;
    except on e: Exception do
      begin
        Application.MessageBox(PChar(EASY_DB_CONNECT_ERROR + e.Message),
                                EASY_SYS_ERROR, MB_OK + MB_ICONERROR);
        Application.Terminate;
      end;
    end;
  end;  
end;

procedure TRDMEasyPlateServer.RemoteDataModuleDestroy(Sender: TObject);
begin
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

function TRDMEasyPlateServer.EasyGetRDMDatas(
  ASQLOLE: OleVariant): OleVariant;
var
  ACount, I: Integer;
begin
  ACount := VarArrayHighBound(ASQLOLE, 1);
  Result := VarArrayCreate([0, ACount], varVariant);
  for I := VarArrayLowBound(ASQLOLE, 1) to VarArrayHighBound(ASQLOLE, 1) do
    Result[I] := EasyGetRDMData(ASQLOLE[I]);
end;

procedure TRDMEasyPlateServer.LoadConnectString;
var
  AList: TStrings;
  ATmpMMStream,
  ADestMMStream: TMemoryStream;
  AFile: string;
begin
  AFile := ExtractFilePath(Application.ExeName) + 'ConnectString.dll';
  AList := TStringList.Create;
  if FileExists(AFile) then
  begin
    ATmpMMStream := TMemoryStream.Create;
    ADestMMStream := TMemoryStream.Create;
    try
      ATmpMMStream.LoadFromFile(AFile);
      DeCompressFile_Easy(ATmpMMStream, ADestMMStream, AFile);
      AList.LoadFromStream(ADestMMStream);
      FConnectString := AList.Values['CONNECTSTRING'];
    finally
      ATmpMMStream.Free;
      ADestMMStream.Free;
    end;
  end;
  AList.Free;
end;

procedure TRDMEasyPlateServer.EasyRDMQryPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  AddExecLog('Post:' + e.Message, 1);
end;

procedure TRDMEasyPlateServer.EasyRDMQryEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  AddExecLog('Edit:' + e.Message, 1);
end;

procedure TRDMEasyPlateServer.EasyRDMQryDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  AddExecLog('Delete:' + e.Message, 1);
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
