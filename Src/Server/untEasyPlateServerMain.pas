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
//-----------------------------------------------------------------------------}
unit untEasyPlateServerMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untEasyToolBar, untEasyToolBarStylers, untEasyNavBar,
  ExtCtrls, Grids, untEasyBaseGrid, untEasyGrid, untEasyStatusBar, Registry,
  untEasyStatusBarStylers, untEasyGroupBox, Menus, untEasyMenus, IniFiles,
  untEasyMenuStylers, untEasyTrayIcon, SvcMgr, ScktComp, ScktCnst, ActnList,
  untEasyEdit, ComCtrls, ImgList, untEasyPageControl, DB, DBClient,
  untEasyMemo, untEasyNavBarExt;

const
  EApplicationName = 'EasyPlate�������';
  EAlreadyRunning = 'ϵͳ���Ѵ������еķ������ʵ��,�벻Ҫ�ظ�����!';
  ESQueryDisconnect = '�Ͽ��ͻ�������,�����¿ͻ����쳣�˳�,�Ƿ����ڶϿ�?';
type
  TfrmEasyPlateServerMain = class(TForm)
    dkpMain: TEasyDockPanel;
    tlbMain: TEasyToolBar;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    stbMain: TEasyStatusBar;
    EasyStatusBarOfficeStyler1: TEasyStatusBarOfficeStyler;
    EasyPanel1: TEasyPanel;
    Splitter1: TSplitter;
    mmMain: TEasyMainMenu;
    EasyMenuOfficeStyler1: TEasyMenuOfficeStyler;
    N1: TMenuItem;
    pmMain: TEasyPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ServerTrayIcon: TEasyTrayIcon;
    N5: TMenuItem;
    SN1: TMenuItem;
    N7: TMenuItem;
    XML1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ActionList1: TActionList;
    ApplyAction: TAction;
    DisconnectAction: TAction;
    ShowHostAction: TAction;
    RemovePortAction: TAction;
    RegisteredAction: TAction;
    AllowXML: TAction;
    EasyNavBarExt1: TEasyNavBarExt;
    nbpPort: TEasyNavBarExtPanel;
    PortList: TListBox;
    nbpSocketSet: TEasyNavBarExtPanel;
    PortNo: TEasyLabelEdit;
    ThreadSize: TEasyLabelEdit;
    Timeout: TEasyLabelEdit;
    InterceptGUID: TEasyLabelEdit;
    PortUpDown: TUpDown;
    ThreadUpDown: TUpDown;
    TimeoutUpDown: TUpDown;
    imgServer: TImageList;
    EasyToolBarButton1: TEasyToolBarButton;
    EasyToolBarButton2: TEasyToolBarButton;
    pgcServerMain: TEasyPageControl;
    tbsConnHost: TEasyTabSheet;
    tbsExecLog: TEasyTabSheet;
    ConnectionList: TListView;
    tbsErrorLog: TEasyTabSheet;
    mmExecLog: TEasyMemo;
    mmErrorLog: TEasyMemo;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    EasyToolBarSeparator2: TEasyToolBarSeparator;
    EasyToolBarButton4: TEasyToolBarButton;
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ApplyActionExecute(Sender: TObject);
    procedure DisconnectActionExecute(Sender: TObject);
    procedure RemovePortActionExecute(Sender: TObject);
    procedure RegisteredActionExecute(Sender: TObject);
    procedure AllowXMLExecute(Sender: TObject);
    procedure ShowHostActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PortListClick(Sender: TObject);
    procedure ApplyActionUpdate(Sender: TObject);
    procedure DisconnectActionUpdate(Sender: TObject);
    procedure RemovePortActionUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mmErrorLogChange(Sender: TObject);
    procedure mmExecLogChange(Sender: TObject);
    procedure EasyToolBarButton3Click(Sender: TObject);
    procedure EasyToolBarButton4Click(Sender: TObject);
  private
    { Private declarations }
    FMaxClientCount: Integer;
    FFromService: Boolean;
    NT351: Boolean;

    FClosing: Boolean;
    FCurItem: Integer;
    FSortCol: Integer;
    function GetItemIndex: Integer;
    procedure SetItemIndex(Value: Integer);
    function GetSelectedSocket: TServerSocket; //����˿��б�
    procedure CheckValues;
    procedure UpdateStatus;
    //�����־
    //App\log ������־App\log\ExecLog ������־ App\log\ErrorLog
//    procedure SaveLogMemo(ALogFile: string);
    procedure RefreshTableCache;
  public
    { Public declarations }
    procedure Initialize(FromService: Boolean);
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property SelectedSocket: TServerSocket read GetSelectedSocket;
    function GetLocalTime: string;
    function GetLocalDate: string;
  protected
    procedure ReadSettings;
    procedure WriteSettings;
    procedure AddClient(Thread: TServerClientThread);
    procedure RemoveClient(Thread: TServerClientThread);
    procedure ClearModifications;
    //��������ģ��
    procedure RDMServerCreated(var msg: TMessage); message WM_USER + 99;
    //�ͷ�����ģ��
    procedure RDMServerDestroy(var msg: TMessage); message WM_USER + 100;
    procedure RDMServerPoolerCreate(var msg: TMessage); message WM_USER + 101;
  end;

  TSocketService = class(TService)
  protected
    procedure Start(Sender: TService; var Started: Boolean);
    procedure Stop(Sender: TService; var Stopped: Boolean);
  public
    function GetServiceController: TServiceController; override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
  end;
  
var
  frmEasyPlateServerMain: TfrmEasyPlateServerMain;
  SocketService: TSocketService;

implementation

uses
  untRDMEasyPlateServer, SConnect, ActiveX, MidConst, untEasyLocalDM,
  untEasyUtilMethod;

{$R *.dfm}

var
  AppServerPath, ExecLogPath, ErrorLogPath: string;

const
  mmLogLineCount = 20000;
  
{ TSocketDispatcherThread }

type
  TSocketDispatcherThread = class(TServerClientThread, ISendDataBlock)
  private
    FRefCount: Integer;
    FInterpreter: TDataBlockInterpreter;
    FTransport: ITransport;
    FInterceptGUID: string;
    FLastActivity: TDateTime;
    FTimeout: TDateTime;
    FRegisteredOnly: Boolean;
    FAllowXML: Boolean;
  protected
    function CreateServerTransport: ITransport; virtual;
    procedure AddClient;
    procedure RemoveClient;
    { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    { ISendDataBlock }
    function Send(const Data: IDataBlock; WaitForResult: Boolean): IDataBlock; stdcall;
  public
    constructor Create(CreateSuspended: Boolean; ASocket: TServerClientWinSocket;
      const InterceptGUID: string; Timeout: Integer; RegisteredOnly, AllowXML: Boolean);
    procedure ClientExecute; override;
    property LastActivity: TDateTime read FLastActivity;
  end;

{ TSocketDispatcher }

type
  //�׽��ַ�����
  TSocketDispatcher = class(TServerSocket)
  private
    FScktIniFile: TIniFile;
    FInterceptGUID: string;
    FTimeout: Integer;
    //��ȡ�׽����߳�
    procedure GetThread(Sender: TObject; ClientSocket: TServerClientWinSocket;
      var SocketThread: TServerClientThread);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ReadSettings(PortNo: Integer{; Reg: TRegINIFile});
    procedure WriteSettings({Reg: TRegINIFile});
    property InterceptGUID: string read FInterceptGUID write FInterceptGUID;
    property Timeout: Integer read FTimeout write FTimeout;
  end;

procedure TfrmEasyPlateServerMain.AddClient(Thread: TServerClientThread);
var
  Item: TListItem;
begin
  Item := ConnectionList.Items.Add;
  Item.Caption := IntToStr(Thread.ClientSocket.LocalPort);
  Item.SubItems.Add(Thread.ClientSocket.RemoteAddress);
  if ShowHostAction.Checked then
  begin
    Item.SubItems.Add(Thread.ClientSocket.RemoteHost);
    if Item.SubItems[1] = '' then Item.SubItems[1] := SHostUnknown;
  end
  else
    Item.SubItems.Add(SNotShown);
  if Thread is TSocketDispatcherThread then
    Item.SubItems.Add(DateTimeToStr(TSocketDispatcherThread(Thread).LastActivity));
  Item.Data := Pointer(Thread);
  //���ӿͻ���ʱ�����־��Ϣ
  frmEasyPlateServerMain.mmExecLog.Lines.Add(Format('%s �ͻ��� %s IP:%s:%s ���ӳɹ�!', [
              DateTimeToStr(TSocketDispatcherThread(Thread).LastActivity),
              Thread.ClientSocket.RemoteHost,
              Thread.ClientSocket.RemoteAddress, IntToStr(Thread.ClientSocket.LocalPort)]));
  UpdateStatus;
end;

procedure TfrmEasyPlateServerMain.FormCreate(Sender: TObject);
begin
  //�ж��Ƿ�װWinSock2
  if not LoadWinSock2 then
    raise Exception.CreateRes(@SNoWinSock2);
  FClosing := False;
  FCurItem := -1;
  FSortCol := -1;
end;

{ TSocketService }

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  SocketService.Controller(CtrlCode);
end;

constructor TSocketService.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited CreateNew(AOwner, Dummy);
  AllowPause := False;
  Interactive := True;
  DisplayName := EApplicationName;
  Name := SServiceName;
  OnStart := Start;
  OnStop := Stop;
end;

function TSocketService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TSocketService.Start(Sender: TService; var Started: Boolean);
begin
  Started := True;
end;

procedure TSocketService.Stop(Sender: TService; var Stopped: Boolean);
begin
  Stopped := True;
end;

procedure TfrmEasyPlateServerMain.ReadSettings;
var
//  Reg: TRegINIFile;
  Reg: TIniFile;

  procedure CreateItem(ID: Integer);
  var
    SH: TSocketDispatcher;
  begin
    SH := TSocketDispatcher.Create(nil);
    SH.ReadSettings(ID{, Reg});
    PortList.Items.AddObject(IntToStr(SH.Port), SH);
    try
      SH.Open;
    except
      on E: Exception do
        raise Exception.CreateResFmt(@SOpenError, [SH.Port, E.Message]);
    end;
  end;

var
  Sections: TStringList;
  pCount, //�Ѵ����˿ڼ�����ֻ������һ��
  i: Integer;
begin
//  Reg := TRegINIFile.Create('');
  pCount := 0;
  Reg := TIniFile.Create(ExtractFilePath(Forms.Application.ExeName) + '\ScktIni.ini');
  try
//    Reg.RootKey := HKEY_LOCAL_MACHINE;
//    Reg.OpenKey(KEY_SOCKETSERVER, True);
    Sections := TStringList.Create;
    try
      Reg.ReadSections(Sections);
      if Sections.Count > 1 then
      begin
        for i := 0 to Sections.Count - 1 do
        begin
          //ֻ�������ļ��ĵ�һ���˿ڽ�������Ч
          if (CompareText(Sections[i], csSettings) <> 0) and (pCount = 0) then
          begin
            CreateItem(StrToInt(Sections[i]));
            pCount := 1;
          end;
        end;
      end
      else
        CreateItem(-1);
      ItemIndex := 0;
      ShowHostAction.Checked := Reg.ReadBool(csSettings, ckShowHost, False);
      RegisteredAction.Checked := Reg.ReadBool(csSettings, ckRegistered, True);
    finally
      Sections.Free;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmEasyPlateServerMain.RemoveClient(
  Thread: TServerClientThread);
var
  Item: TListItem;
begin
  Item := ConnectionList.FindData(0, Thread, True, False);
  if Assigned(Item) then
  begin
    //���ӿͻ���ʱ�����־��Ϣ
    frmEasyPlateServerMain.mmExecLog.Lines.Add(Format('%s �ͻ��� %s IP:%s:%s �Ͽ�����!', [
                Item.SubItems[2], Item.SubItems[1],
                Item.SubItems[0], Item.Caption]));
    Item.Free;
  end;
  UpdateStatus;
end;

procedure TfrmEasyPlateServerMain.WriteSettings;
var
//  Reg: TRegINIFile;
  Reg: TIniFile;
  Sections: TStringList;
  i: Integer;
begin
//  Reg := TRegINIFile.Create('');
  Reg := TIniFile.Create(ExtractFilePath(Forms.Application.ExeName) + '\ScktIni.ini');
  try
//    Reg.RootKey := HKEY_LOCAL_MACHINE;
//    Reg.OpenKey(KEY_SOCKETSERVER, True);
    Sections := TStringList.Create;
    try
      Reg.ReadSections(Sections);
//      for i := 0 to Sections.Count - 1 do
//        TRegistry(Reg).DeleteKey(Sections[i]);
    finally
      Sections.Free;
    end;
    for i := 0 to PortList.Items.Count - 1 do
      TSocketDispatcher(PortList.Items.Objects[i]).WriteSettings({Reg});
    Reg.WriteBool(csSettings, ckShowHost, ShowHostAction.Checked);
    Reg.WriteBool(csSettings, ckRegistered, RegisteredAction.Checked);
  finally
    Reg.Free;
  end;
end;

{ TSocketDispatcher }

constructor TSocketDispatcher.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //
  FScktIniFile := TIniFile.Create(ExtractFilePath(Forms.Application.ExeName) + '\ScktIni.ini');
  //����ģʽ�߳̿���  
  ServerType := stThreadBlocking;
  //��ȡ�߳��¼���
  OnGetThread := GetThread;
  frmEasyPlateServerMain.mmExecLog.Lines.Add('SocketDispatcher�������!');
end;

destructor TSocketDispatcher.Destroy;
begin
  FScktIniFile.Free;
  inherited Destroy;
end;

procedure TSocketDispatcher.GetThread(Sender: TObject;
  ClientSocket: TServerClientWinSocket;
  var SocketThread: TServerClientThread);
begin
  SocketThread := TSocketDispatcherThread.Create(False, ClientSocket,
    InterceptGUID, Timeout, frmEasyPlateServerMain.RegisteredAction.Checked,
    frmEasyPlateServerMain.AllowXML.Checked);

  //�����ȡ�׽����߳���Ϣ
  //���ӿͻ���ʱ�����־��Ϣ
  frmEasyPlateServerMain.mmExecLog.Lines.Add(Format('%s �ͻ��� %s IP:%s:%s ��ȡSocket Thread, ThreadID:%d!', [
              DateTimeToStr(TSocketDispatcherThread(SocketThread).LastActivity),
              SocketThread.ClientSocket.RemoteHost,
              SocketThread.ClientSocket.RemoteAddress, IntToStr(SocketThread.ClientSocket.LocalPort),
              SocketThread.ThreadID]));
end;

procedure TSocketDispatcher.ReadSettings(PortNo: Integer{;
  Reg: TRegINIFile});
var
  Section: string;
begin
  if PortNo = -1 then
  begin
    Section := csSettings;
    //2011-01-05��Ĭ�϶˿ڵ���9090
//    Port := Reg.ReadInteger(Section, ckPort, 9090);
  end
  else
  begin
    Section := IntToStr(PortNo);
//    Port := PortNo;
  end;
  Port := FScktIniFile.ReadInteger(Section, ckPort, 9090);
  ThreadCacheSize := FScktIniFile.ReadInteger(Section, ckThreadCacheSize, 0);
  FInterceptGUID := FScktIniFile.ReadString(Section, ckInterceptGUID, '');
  FTimeout := FScktIniFile.ReadInteger(Section, ckTimeout, 0);
end;

procedure TSocketDispatcher.WriteSettings({Reg: TRegINIFile});
var
  Section: string;
begin
  Section := IntToStr(Port);
//  Reg.WriteInteger(Section, ckPort, Port);
//  Reg.WriteInteger(Section, ckThreadCacheSize, ThreadCacheSize);
//  Reg.WriteString(Section, ckInterceptGUID, InterceptGUID);
//  Reg.WriteInteger(Section, ckTimeout, Timeout);
  FScktIniFile.WriteInteger(Section, ckPort, Port);
  FScktIniFile.WriteInteger(Section, ckThreadCacheSize, ThreadCacheSize);
  FScktIniFile.WriteString(Section, ckInterceptGUID, InterceptGUID);
  FScktIniFile.WriteInteger(Section, ckTimeout, Timeout);
end;

{ TSocketDispatcherThread }

function TSocketDispatcherThread._AddRef: Integer;
begin
  Inc(FRefCount);
  Result := FRefCount;
end;

function TSocketDispatcherThread._Release: Integer;
begin
  Dec(FRefCount);
  Result := FRefCount;
end;

procedure TSocketDispatcherThread.AddClient;
begin
  frmEasyPlateServerMain.AddClient(Self);
  frmEasyPlateServerMain.FMaxClientCount := 5;
  if frmEasyPlateServerMain.ConnectionList.Items.Count > frmEasyPlateServerMain.FMaxClientCount then
  begin
    frmEasyPlateServerMain.mmExecLog.Lines.Add('�ѳ��������Ч�ͻ���������!');
    //Ҫ���ڿ���Ķ˿�
    with TServerSocket(frmEasyPlateServerMain.PortList.Items.Objects[0]).Socket do
    begin
      Lock;
      try
        with frmEasyPlateServerMain.ConnectionList.Items[frmEasyPlateServerMain.ConnectionList.Items.Count - 1] do
          TServerClientThread(Data).ClientSocket.Close;
      finally
        Unlock;
      end;
    end;
    frmEasyPlateServerMain.RemoveClient(Self);
  end;
end;

procedure TSocketDispatcherThread.ClientExecute;
var
  Data: IDataBlock;
  msg: TMsg;
  Obj: ISendDataBlock;
  Event: THandle;
  WaitTime: DWord;
begin
  CoInitialize(nil);
  try
    Synchronize(AddClient);
    FTransport := CreateServerTransport;
    try
      Event := FTransport.GetWaitEvent;
      PeekMessage(msg, 0, WM_USER, WM_USER, PM_NOREMOVE);
      GetInterface(ISendDataBlock, Obj);
      if FRegisteredOnly then
        FInterpreter := TDataBlockInterpreter.Create(Obj, SSockets)
      else
        FInterpreter := TDataBlockInterpreter.Create(Obj, '');
      try
        Obj := nil;
        if FTimeout = 0 then
          WaitTime := INFINITE
        else
          WaitTime := 60000;
        while not Terminated and FTransport.Connected do
        try
          case MsgWaitForMultipleObjects(1, Event, False, WaitTime, QS_ALLEVENTS) of
            WAIT_OBJECT_0:
            begin
              WSAResetEvent(Event);
              Data := FTransport.Receive(False, 0);
              if Assigned(Data) then
              begin
                FLastActivity := Now;
                FInterpreter.InterpretData(Data);
                Data := nil;
                FLastActivity := Now;
              end;
            end;
            WAIT_OBJECT_0 + 1:
              while PeekMessage(msg, 0, 0, 0, PM_REMOVE) do
                DispatchMessage(msg);
            WAIT_TIMEOUT:
              if (FTimeout > 0) and ((Now - FLastActivity) > FTimeout) then
                FTransport.Connected := False;
          end;
        except
          FTransport.Connected := False;
        end;
      finally
        FInterpreter.Free;
        FInterpreter := nil;
      end;
    finally
      FTransport := nil;
    end;
  finally
    CoUninitialize;
    Synchronize(RemoveClient);
  end;
end;

constructor TSocketDispatcherThread.Create(CreateSuspended: Boolean;
  ASocket: TServerClientWinSocket; const InterceptGUID: string;
  Timeout: Integer; RegisteredOnly, AllowXML: Boolean);
begin
  FInterceptGUID := InterceptGUID;
  FTimeout := EncodeTime(Timeout div 60, Timeout mod 60, 0, 0);
  FLastActivity := Now;
  FRegisteredOnly := RegisteredOnly;
  FAllowXML := AllowXML;
  inherited Create(CreateSuspended, ASocket);
end;

function TSocketDispatcherThread.CreateServerTransport: ITransport;
var
  SocketTransport: TSocketTransport;
begin
  SocketTransport := TSocketTransport.Create;
  SocketTransport.Socket := ClientSocket;
  SocketTransport.InterceptGUID := FInterceptGUID;
  Result := SocketTransport as ITransport;
end;

function TSocketDispatcherThread.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  if GetInterface(IID, Obj) then Result := 0 else Result := E_NOINTERFACE;
end;

procedure TSocketDispatcherThread.RemoveClient;
begin
  frmEasyPlateServerMain.RemoveClient(Self);
end;

function TSocketDispatcherThread.Send(const Data: IDataBlock;
  WaitForResult: Boolean): IDataBlock;
begin
  FTransport.Send(Data);
  if WaitForResult then
  begin
    while True do
    begin
      Result := FTransport.Receive(True, 0);
      if Result = nil then break;
      if (Result.Signature and ResultSig) = ResultSig then
        break
      else
        FInterpreter.InterpretData(Result);
    end;
  end;
end;

function TfrmEasyPlateServerMain.GetItemIndex: Integer;
begin
  Result := FCurItem;
end;

procedure TfrmEasyPlateServerMain.SetItemIndex(Value: Integer);
var
  Selected: Boolean;
begin
  if (FCurItem <> Value) then
  try
    if ApplyAction.Enabled then
      ApplyAction.Execute;
  except
    PortList.ItemIndex := FCurItem;
    raise;
  end
  else
    Exit;
  if Value = -1 then
    Value := 0;
  PortList.ItemIndex := Value;
  FCurItem := PortList.ItemIndex;
  Selected := FCurItem <> -1;
  if Selected then
    with TSocketDispatcher(PortList.Items.Objects[FCurItem]) do
    begin
      PortUpDown.Position := Port;
      ThreadUpDown.Position := ThreadCacheSize;
      Self.InterceptGUID.Text := FInterceptGUID;
      TimeoutUpDown.Position := Timeout;
      ClearModifications;
    end;
  PortNo.Enabled := Selected;
  ThreadSize.Enabled := Selected;
  Timeout.Enabled := Selected;
  InterceptGUID.Enabled := Selected;
end;

procedure TfrmEasyPlateServerMain.N5Click(Sender: TObject);
begin
  frmEasyPlateServerMain.WindowState := wsMaximized;
end;

procedure TfrmEasyPlateServerMain.Initialize(FromService: Boolean);
//  function IE4Installed: Boolean;
//  var
//    RegKey: HKEY;
//  begin
//    Result := False;
//    if RegOpenKey(HKEY_LOCAL_MACHINE, KEY_IE, RegKey) = ERROR_SUCCESS then
//    try
//      Result := RegQueryValueEx(RegKey, 'Version', nil, nil, nil, nil) = ERROR_SUCCESS;
//    finally
//      RegCloseKey(RegKey);
//    end;
//  end;
//
begin
  FFromService := FromService;
  NT351 := (Win32MajorVersion <= 3) and (Win32Platform = VER_PLATFORM_WIN32_NT);
  if NT351 then
  begin
    if not FromService then
      raise Exception.CreateRes(@SServiceOnly);
  end;
  ReadSettings;
//  if FromService then
//  begin
//    miClose.Visible := False;
//    N1.Visible := False;
//  end;
//  if IE4Installed then
//    FTaskMessage := RegisterWindowMessage('TaskbarCreated')
//  else
end;

procedure TfrmEasyPlateServerMain.ApplyActionExecute(Sender: TObject);
begin
  with TSocketDispatcher(SelectedSocket) do
  begin
    if Socket.ActiveConnections > 0 then
      if MessageDlg(SErrChangeSettings, mtConfirmation, [mbYes, mbNo], 0) = idNo then
        Exit;
    Close;
    Port := StrToInt(PortNo.Text);
    PortList.Items[ItemIndex] := PortNo.Text;
    ThreadCacheSize := StrToInt(ThreadSize.Text);
    InterceptGUID := Self.InterceptGUID.Text;
    Timeout := StrToInt(Self.Timeout.Text);
    Open;
  end;
  ClearModifications;
end;

function TfrmEasyPlateServerMain.GetSelectedSocket: TServerSocket;
begin
  Result := TServerSocket(PortList.Items.Objects[ItemIndex]);
end;

procedure TfrmEasyPlateServerMain.ClearModifications;
begin
  PortNo.Modified  := False;
  ThreadSize.Modified := False;
  Timeout.Modified := False;
  InterceptGUID.Modified := False;
end;

procedure TfrmEasyPlateServerMain.DisconnectActionExecute(Sender: TObject);
var
  i: Integer;
begin
  if MessageDlg(ESQueryDisconnect, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;
  with SelectedSocket.Socket do
  begin
    Lock;
    try
      for i := 0 to ConnectionList.Items.Count - 1 do
        with ConnectionList.Items[i] do
          if Selected then
            TServerClientThread(Data).ClientSocket.Close;
    finally
      Unlock;
    end;
  end;
end;

procedure TfrmEasyPlateServerMain.RemovePortActionExecute(Sender: TObject);
begin
  CheckValues;
  PortList.Items.Objects[ItemIndex].Free;
  PortList.Items.Delete(ItemIndex);
  FCurItem := -1;
  ItemIndex := 0;
end;

procedure TfrmEasyPlateServerMain.CheckValues;
begin
  StrToInt(PortNo.Text);
  StrToInt(ThreadSize.Text);
  StrToInt(Timeout.Text);
end;

procedure TfrmEasyPlateServerMain.RegisteredActionExecute(Sender: TObject);
begin
  RegisteredAction.Checked := not RegisteredAction.Checked;
  ShowMessage('����������������Ч!');
//  ShowMessage(SNotUntilRestart);
end;

procedure TfrmEasyPlateServerMain.AllowXMLExecute(Sender: TObject);
begin
  AllowXML.Checked := not AllowXML.Checked;
end;

procedure TfrmEasyPlateServerMain.ShowHostActionExecute(Sender: TObject);
var
  i: Integer;
  Item: TListItem;
begin
  ShowHostAction.Checked := not ShowHostAction.Checked;
  ConnectionList.Items.BeginUpdate;
  try
    for i := 0 to ConnectionList.Items.Count - 1 do
    begin
      Item := ConnectionList.Items[i];
      if ShowHostAction.Checked then
      begin
        Item.SubItems[1] := TServerClientThread(Item.Data).ClientSocket.RemoteHost;
        if Item.SubItems[1] = '' then Item.SubItems[1] := SHostUnknown;
      end
      else
        Item.SubItems[1] := SNotShown;
    end;
  finally
    ConnectionList.Items.EndUpdate;
  end;
end;

procedure TfrmEasyPlateServerMain.UpdateStatus;
begin
  stbMain.Panels[0].Text := Format('���߿ͻ�: %d ', [ConnectionList.Items.Count]);
end;

procedure TfrmEasyPlateServerMain.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to PortList.Items.Count - 1 do
    PortList.Items.Objects[i].Free;

  if not DirectoryExists(ExecLogPath + GetLocalDate) then
  try
    CreateDir(ExecLogPath + GetLocalDate);
  except on e:Exception do
    ShowMessage(e.Message);
  end;
  while not FileExists(ExecLogPath + GetLocalDate + '\' + GetLocalTime + '.log') do
    mmExecLog.Lines.SaveToFile(ExecLogPath + GetLocalDate + '\' + GetLocalTime + '.log');

  if not DirectoryExists(ErrorLogPath + GetLocalDate) then
  try
    CreateDir(ErrorLogPath + GetLocalDate);
  except on e:Exception do
    ShowMessage(e.Message);
  end;
  while not FileExists(ErrorLogPath + GetLocalDate + '\' + GetLocalTime + '.log') do
    mmErrorLog.Lines.SaveToFile(ErrorLogPath + GetLocalDate + '\' + GetLocalTime + '.log');
end;

procedure TfrmEasyPlateServerMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  try
    CanClose := False;
    if ApplyAction.Enabled then ApplyAction.Execute;
    if FClosing and (not FFromService) and (ConnectionList.Items.Count > 0) then
    begin
      FClosing := False;
      if MessageDlg(SErrClose, mtConfirmation, [mbYes, mbNo], 0) <> idYes then
        Exit;
    end;
    WriteSettings;
    CanClose := True;
  finally
  end;
end;

procedure TfrmEasyPlateServerMain.PortListClick(Sender: TObject);
begin
  ItemIndex := PortList.ItemIndex;  
end;

procedure TfrmEasyPlateServerMain.ApplyActionUpdate(Sender: TObject);
begin
  ApplyAction.Enabled := PortNo.Modified or ThreadSize.Modified or
    Timeout.Modified or InterceptGUID.Modified;
end;

procedure TfrmEasyPlateServerMain.DisconnectActionUpdate(Sender: TObject);
begin
  DisconnectAction.Enabled := ConnectionList.SelCount > 0;
end;

procedure TfrmEasyPlateServerMain.RemovePortActionUpdate(Sender: TObject);
begin
  RemovePortAction.Enabled := (PortList.Items.Count > 1) and (ItemIndex <> -1);
end;

procedure TfrmEasyPlateServerMain.FormShow(Sender: TObject);
begin
  pgcServerMain.ActivePageIndex := 0;
  mmExecLog.ReadOnly := True;
  mmErrorLog.ReadOnly := True;
  //�������Ŀ¼ ������־Ŀ¼
  AppServerPath := ExtractFilePath(Forms.Application.ExeName);
  ExecLogPath := AppServerPath + 'log\ExecLog\';
  ErrorLogPath := AppServerPath + 'log\ErrorLog\';
  if not DirectoryExists(AppServerPath + 'log') then
  begin
    try
      if CreateDir(AppServerPath + 'log') then
      begin
        if not DirectoryExists(ExecLogPath) then
        begin
          try
            CreateDir(ExecLogPath);
          except on e:Exception do
            ShowMessage('������־Ŀ¼������, ԭ��' + e.Message);
          end;
        end;
        if not DirectoryExists(ErrorLogPath) then
        begin
          try
            CreateDir(ErrorLogPath);
          except on e:Exception do
            ShowMessage('������־Ŀ¼������, ԭ��' + e.Message);
          end;
        end;
      end;
    except on e:Exception do
      ShowMessage('��־Ŀ¼������, ԭ��' + e.Message);
    end;
  end;
end;

function TfrmEasyPlateServerMain.GetLocalDate: string;
begin
  Result := FormatDateTime('YYYY-MM-DD', Now());
end;

function TfrmEasyPlateServerMain.GetLocalTime: string;
begin
  Result := FormatDateTime('YYYY-MM-DD HHNNSS', Now());
end;

procedure TfrmEasyPlateServerMain.mmErrorLogChange(Sender: TObject);
begin
  if TEasyMemo(Sender).Lines.Count > mmLogLineCount then
  begin
    if not DirectoryExists(ErrorLogPath + GetLocalDate) then
    try
      CreateDir(ErrorLogPath + GetLocalDate);
    except on e:Exception do
      ShowMessage(e.Message);
    end;
    while not FileExists(ErrorLogPath + GetLocalDate + '\' + GetLocalTime + '.log') do
      mmErrorLog.Lines.SaveToFile(ErrorLogPath + GetLocalDate + '\' + GetLocalTime + '.log');
  end;
end;

procedure TfrmEasyPlateServerMain.mmExecLogChange(Sender: TObject);
begin
  if TEasyMemo(Sender).Lines.Count > mmLogLineCount then
  begin
    if not DirectoryExists(ExecLogPath + GetLocalDate) then
    try
      CreateDir(ExecLogPath + GetLocalDate);
    except on e:Exception do
      ShowMessage(e.Message);
    end;
    while not FileExists(ExecLogPath + GetLocalDate + '\' + GetLocalTime + '.log') do
      mmExecLog.Lines.SaveToFile(ExecLogPath + GetLocalDate + '\' + GetLocalTime + '.log');
  end;
end;

procedure TfrmEasyPlateServerMain.RDMServerCreated(var msg: TMessage);
begin
  mmExecLog.Lines.Add('RDM�����ɹ�!');
  //
end;

procedure TfrmEasyPlateServerMain.RefreshTableCache;
var
  I: Integer;
  ASQL: string;
  ACds : TClientDataSet;
begin
  ASQL := 'SELECT [name] FROM sys.all_objects WHERE type = ' + QuotedStr('U');
  with DMLocal.EasyLocalCds do
  begin
    Close;
    CommandText := ASQL;
    Open;
    if RecordCount > 0 then
    begin
      ACds := TClientDataSet.Create(nil);
      ACds.Data := Data;
      try
        Screen.Cursor := crHourGlass;
        for I := 0 to ACds.RecordCount - 1 do
        begin
          with DMLocal.EasyLocalCds do
          begin
            Close;
            CommandText :=  'SELECT * FROM ' + ACds.fieldbyname('name').AsString
                                    + ' WHERE 1 = 2';
            Open;
            if not DirectoryExists(AppServerPath + 'Cache\Table\') then
            begin
              if CreateDir_H(AppServerPath + 'Cache\Table\') then
            end;
            SaveToFile(AppServerPath + 'Cache\Table\'
                       + ACds.fieldbyname('name').AsString + '.xml', dfXMLUTF8);
          end;
          ACds.Next;
        end;
        MessageDlg('������³ɹ�!',  mtInformation, [mbOK], 0);
      finally
        ACds.Free;
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmEasyPlateServerMain.EasyToolBarButton3Click(Sender: TObject);
begin
  RefreshTableCache;
end;

procedure TfrmEasyPlateServerMain.EasyToolBarButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmEasyPlateServerMain.RDMServerDestroy(var msg: TMessage);
begin
  mmExecLog.Lines.Add('RDM�������!');
end;

procedure TfrmEasyPlateServerMain.RDMServerPoolerCreate(var msg: TMessage);
begin
  mmExecLog.Lines.Add('IRDM New���!');
end;

end.
