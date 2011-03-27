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
//    ����Ԫ���ṩ�������ӵĵ�Ԫ(�����),ֻ���һ����Ч��ADOConnection
//
//��Ҫʵ�֣�
//      1��EasyADOConnection
//         ���һ����Ч��
//      2����ʱ�������������Ч��
//-----------------------------------------------------------------------------}
unit untEasyDBConnection;

interface

uses
  Windows, SysUtils, Classes, DB, ADODB, IniFiles, Forms, untEasyUtilRWIni,
  Provider, MConnect, ObjBrkr, DBClient, SConnect, Dialogs, EasyPlateServer_TLB;

function GenrateEasyDBConnection(AHandle: THandle): Integer; stdcall;
         exports GenrateEasyDBConnection;

type
  TDMEasyDBConnection = class(TDataModule)
    EasyADOConn: TADOConnection;
    EasyScktConn: TSocketConnection;
    EasySOB: TSimpleObjectBroker;
    EasyQry: TADOQuery;
    EasyDsp: TDataSetProvider;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    //��ǰ��������ģʽ��CS���� CAS����
    FAppType: string;
    //��������ַ���û��������롢���ݿ⡢�˿�
    FDBHost,
    FDBUserName,
    FDBPassWord,
    FDBDataBase,
    FDBPort   : string;
    FConnectString: WideString;
    //ScktConnection������Ϣ
    FScktHost,
    FScktIGUID,
    FScktIName,
    FScktSGUID,
    FScktSName,
    FScktPort : string;
    //�洢��ǰ��¼���û�ID������ģ����
    FCurrLoginUserID: string;
    FCurrLoginDBHandle: Cardinal;
    //��ȡ��������Ini
    FEasyDBIni: TEasyRWIni;
    //��ADOConnection
    function OpenEasyADOConnection(): Integer;
    //��Sckt����
    function OpenEasyScktConnection: Integer;
    //���ؾ�����ؿ��õķ�����
    procedure LoadSOBServers;
    //��ȡ���ؾ��������
    procedure ReadSOBFile(AFileName, ASeed: string);
    
    procedure LoadConnectString;
    procedure SetDBDataBase(const Value: string);
    procedure SetDBHost(const Value: string);
    procedure SetDBPassWord(const Value: string);
    procedure SetDBPort(const Value: string);
    procedure SetDBUserName(const Value: string);
    function GetCurrLoginDBHandle: Cardinal;
    function GetCurrLoginUserID: string;
    procedure SetCurrLoginDBHandle(const Value: Cardinal);
    procedure SetCurrLoginUserID(const Value: string);
    function GetAppType: string;
    procedure SetAppType(const Value: string);
    function GetScktHost: string;
    function GetScktIGUID: string;
    function GetScktIName: string;
    function GetScktPort: string;
    function GetScktSGUID: string;
    function GetScktSName: string;
    procedure SetScktHost(const Value: string);
    procedure SetScktIGUID(const Value: string);
    procedure SetScktIName(const Value: string);
    procedure SetScktPort(const Value: string);
    procedure SetScktSGUID(const Value: string);
    procedure SetScktSName(const Value: string);
  public
    { Public declarations }
    EasyApplicationHandle: Cardinal;      //��Ӧ�ó�����
    //��������� ��ȡԶ�˵ķ���ӿ�
    EasyIRDMEasyPlateServerDisp: IRDMEasyPlateServerDisp;
    property EasyAppType: string read GetAppType write SetAppType;

    //��������ַ���û��������롢���ݿ⡢�˿�
    property EasyDBHost: string read FDBHost write SetDBHost;
    property EasyDBUserName: string read FDBUserName write SetDBUserName;
    property EasyDBPassWord: string read FDBPassWord write SetDBPassWord;
    property EasyDBDataBase: string read FDBDataBase write SetDBDataBase;
    property EasyDBPort: string read FDBPort write SetDBPort;

    //Socket������Ϣ
    property EasyScktHost: string read GetScktHost write SetScktHost;
    //����ѹ�����ݵ�COM GUID������
    property EasyScktIGUID: string read GetScktIGUID write SetScktIGUID;
    property EasyScktIName: string read GetScktIName write SetScktIName;
    //���������ƺ�GUID
    property EasyScktSGUID: string read GetScktSGUID write SetScktSGUID;
    property EasyScktSName: string read GetScktSName write SetScktSName;
    property EasyScktPort: string read GetScktPort write SetScktPort;

    //�洢��ǰ��¼���û�ID������ģ����
    property EasyCurrLoginUserID: string read GetCurrLoginUserID write SetCurrLoginUserID;
    property EasyCurrLoginDBHandle: Cardinal read GetCurrLoginDBHandle write SetCurrLoginDBHandle;

  end;

var
  DMEasyDBConnection: TDMEasyDBConnection;

implementation

{$R *.dfm}

uses
  ActiveX, untEasyUtilMethod, untEasyUtilConst;
  
function GenrateEasyDBConnection(AHandle: THandle): Integer; stdcall;
begin
  Result := 0;
  Application.Handle := AHandle;
  try
    DMEasyDBConnection := TDMEasyDBConnection.Create(nil);
  except on e:Exception do
    begin
      Result := -1;
      Application.Terminate;
    end;
  end;
end;  

{ TDMEasyDBConnection }

procedure TDMEasyDBConnection.DataModuleCreate(Sender: TObject);
begin
  FAppType := 'CS';

  //������ѯ�����С
  EasyQry.CacheSize :=1000;
  //����EasyRDMDsp��Զ��ִ��SQL���
  EasyDsp.Options := EasyDsp.Options + [poAllowCommandText];

  //�ȳ�ʼ�����ݿ�����
  LoadConnectString;
  
  if UpperCase(EasyAppType) = 'CAS' then
  begin
    if OpenEasyScktConnection = 1 then
    //���������ͻ�ȡԶ�̵ķ���ӿ�
      EasyIRDMEasyPlateServerDisp := IRDMEasyPlateServerDisp((IDispatch(EasyScktConn.AppServer)));
  end
  else
    //��ADO������������
    OpenEasyADOConnection();
  //���ؿ��õķ�����
//  LoadSOBServers;
  //�������ؾ���
//  if not EasySOB.LoadBalanced then
//    EasySOB.LoadBalanced := True;
end;

procedure TDMEasyDBConnection.DataModuleDestroy(Sender: TObject);
begin
  if EasyADOConn.Connected then
    EasyADOConn.Close;
  if Assigned(FEasyDBIni) then
    FEasyDBIni.Free;
end;

procedure TDMEasyDBConnection.SetDBDataBase(const Value: string);
begin
  FDBDataBase := Value;
end;

procedure TDMEasyDBConnection.SetDBHost(const Value: string);
begin
  FDBHost := Value;
end;

procedure TDMEasyDBConnection.SetDBPassWord(const Value: string);
begin
  FDBPassWord := Value;
end;

procedure TDMEasyDBConnection.SetDBPort(const Value: string);
begin
  FDBPort := Value;
end;

procedure TDMEasyDBConnection.SetDBUserName(const Value: string);
begin
  FDBUserName := Value;
end;

//0�ɹ� -1ʧ��
function TDMEasyDBConnection.OpenEasyADOConnection(): Integer;
begin
  Result := 0;
  if EasyADOConn.Connected then
    EasyADOConn.Close;
  EasyADOConn.LoginPrompt := False;
  EasyADOConn.ConnectionString := '';
  begin
    EasyADOConn.ConnectionString := FConnectString;
    try
      EasyADOConn.Open;

      EasyDBHost := EasyADOConn.Properties.Item['Data Source'].Value;
      EasyDBDataBase := EasyADOConn.Properties.Item['Initial Catalog'].Value;
      EasyDBUserName := EasyADOConn.Properties.Item['User ID'].Value;
    except on e: Exception do
      begin
        Application.MessageBox(PChar(EASY_DB_CONNECT_ERROR + e.Message),
                                EASY_SYS_ERROR, MB_OK + MB_ICONERROR);
        Application.Terminate;
      end;
    end; 
  end;  
end;

function TDMEasyDBConnection.GetCurrLoginDBHandle: Cardinal;
begin
  Result := FCurrLoginDBHandle;
end;

function TDMEasyDBConnection.GetCurrLoginUserID: string;
begin
  Result := FCurrLoginUserID;
end;

procedure TDMEasyDBConnection.SetCurrLoginDBHandle(const Value: Cardinal);
begin
  FCurrLoginDBHandle := Value;
end;

procedure TDMEasyDBConnection.SetCurrLoginUserID(const Value: string);
begin
  FCurrLoginUserID := Value;
end;

function TDMEasyDBConnection.GetAppType: string;
begin
  Result := FAppType;
end;

procedure TDMEasyDBConnection.SetAppType(const Value: string);
begin
  FAppType := Value;
end;

procedure TDMEasyDBConnection.LoadSOBServers;
begin
  ReadSOBFile('Servers.ini', 'ABC123_888888');
end;

procedure TDMEasyDBConnection.ReadSOBFile(AFileName, ASeed: string);
var
  Ini      : TEasyXorIniFile;
  Sections : TStrings;
  I        : Integer;
  AHost,
  AEnable,
  APort     : string;
begin
  //����շ������б�
  EasySOB.Servers.Clear;
  Ini := nil;
  Sections := nil;
  try
    Ini := TEasyXorIniFile.Create(AFileName, ASeed);

    Sections := TStringList.Create;
    Ini.ReadSections(Sections);
    for I := 0 to Sections.Count - 1 do
    begin
      AHost := ini.ReadString(Sections.Strings[I], 'HOST', '');
      AEnable := ini.ReadString(Sections.Strings[I], 'ENABLE', '');
      APort := ini.ReadString(Sections.Strings[I], 'PORT', '');
      with EasySOB.Servers do
      begin
        Add.Index := I;
        Items[I].ComputerName := AHost;
        if UpperCase(AEnable) = 'TRUE' then
          Items[I].Enabled := True
        else
          Items[I].Enabled := False;
        Items[I].Port := StrToInt(APort);
      end;
    end;
  finally
    Sections.Free;
    Ini.Free;
  end;
end;

//����Sckt
function TDMEasyDBConnection.OpenEasyScktConnection: Integer;
begin
  Result := 0;
  with EasyScktConn do
  begin
    Address := EasyScktHost;
    if Trim(EasyScktIGUID) <> '' then
      InterceptGUID := EasyScktIGUID;
    if Trim(EasyScktIName) <> '' then
      InterceptName := EasyScktIName;
    Port := StrToInt(EasyScktPort);
    if Trim(EasyScktSGUID) <> '' then
      ServerGUID := EasyScktSGUID;
    ServerName := EasyScktSName;
    try
      Open;
      Result := 1;
    except on e:Exception do
      begin
        Application.MessageBox(PChar(EASY_DB_CONNECT_ERROR + e.Message),
                                EASY_SYS_ERROR, MB_OK + MB_ICONERROR);
        Application.Terminate;
      end
    end;
  end;
end;

function TDMEasyDBConnection.GetScktHost: string;
begin
  Result := FScktHost;
end;

function TDMEasyDBConnection.GetScktIGUID: string;
begin
  Result := FScktIGUID;
end;

function TDMEasyDBConnection.GetScktIName: string;
begin
  Result := FScktIName;
end;

function TDMEasyDBConnection.GetScktPort: string;
begin
  Result := FScktPort;
end;

function TDMEasyDBConnection.GetScktSGUID: string;
begin
  Result := FScktSGUID;
end;

function TDMEasyDBConnection.GetScktSName: string;
begin
  Result := FScktSName;
end;

procedure TDMEasyDBConnection.SetScktHost(const Value: string);
begin
  FScktHost := Value;
end;

procedure TDMEasyDBConnection.SetScktIGUID(const Value: string);
begin
  FScktIGUID := Value;
end;

procedure TDMEasyDBConnection.SetScktIName(const Value: string);
begin
  FScktIName := Value;
end;

procedure TDMEasyDBConnection.SetScktPort(const Value: string);
begin
  FScktPort := Value;
end;

procedure TDMEasyDBConnection.SetScktSGUID(const Value: string);
begin
  FScktSGUID := Value;
end;

procedure TDMEasyDBConnection.SetScktSName(const Value: string);
begin
  FScktSName := Value;
end;

procedure TDMEasyDBConnection.LoadConnectString;
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
      FAppType := AList.Values['APPTYPE'];
      
      EasyScktHost := AList.Values['HOST'];
      EasyScktPort := AList.Values['PORT'];
      EasyScktIGUID := AList.Values['IGUID'];
      EasyScktSName := AList.Values['SNAME'];

      FConnectString := AList.Values['CONNECTSTRING'];
    finally
      ATmpMMStream.Free;
      ADestMMStream.Free;
    end;
  end;
  AList.Free;
end;

initialization
  CoInitialize(nil);
  DMEasyDBConnection := TDMEasyDBConnection.Create(Application);
  Application.Handle := DMEasyDBConnection.EasyApplicationHandle;

finalization
  CoUninitialize;

end.                                   
