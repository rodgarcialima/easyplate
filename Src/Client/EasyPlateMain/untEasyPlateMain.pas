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
unit untEasyPlateMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateBaseForm, Menus, untEasyMenus, untEasyMenuStylers,
  untEasyStatusBar, untEasyStatusBarStylers, untEasyToolBar,  
  untEasyToolBarStylers, untEasyTabSet, untEasyOfficeTabSetStylers,
  untEasyPageControl, ExtCtrls, untEasyTrayIcon, ImgList, ComCtrls,
  untEasyTreeView, untEasyWaterImage, jpeg, StdCtrls, ActnList, Provider,
  DB, DBClient, xmldom, XMLIntf, msxmldom, XMLDoc;

type

  PEasytvNavRecord = ^TEasytvNavRecord;
  TEasytvNavRecord = record
    sGUID,
    sEName,
    sCName,
    sParentGUID  : string;
    iOrder,
    iImage1,
    iImage2,
    bDir,
    iFlag        : Integer;
    sPlugFileName: string;  //Add ���� Edit �༭ Del ɾ��
  end;

  TfrmEasyPlateMain = class(TfrmEasyPlateBaseForm)
    mmMain: TEasyMainMenu;
    pmMain: TEasyPopupMenu;
    mmstyleMain: TEasyMenuOfficeStyler;
    mmNew: TMenuItem;
    stbMain: TEasyStatusBar;
    stbStyleMain: TEasyStatusBarOfficeStyler;
    EasyDockPanel1: TEasyDockPanel;
    tlbMain: TEasyToolBar;
    tlbStyleMain: TEasyToolBarOfficeStyler;
    EasyMDITabSet1: TEasyMDITabSet;
    tbsStyleMain: TEasyTabSetOfficeStyler;
    EasyTrayIcon1: TEasyTrayIcon;
    pgcLeftNav: TEasyPageControl;
    Splitter1: TSplitter;
    tsbSysNav: TEasyTabSheet;
    tshWorkAssiant: TEasyTabSheet;
    tshEIM: TEasyTabSheet;
    imgNav: TImageList;
    tvNav: TEasyTreeView;
    actEasyMain: TActionList;
    img24: TImageList;
    actExit: TAction;
    EasyToolBarButton1: TEasyToolBarButton;
    img24_d: TImageList;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    PrintSetup1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    SaveAs1: TMenuItem;
    Save1: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    HowtoUseHelp1: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    Contents1: TMenuItem;
    Window1: TMenuItem;
    Show1: TMenuItem;
    Hide1: TMenuItem;
    N3: TMenuItem;
    ArrangeAll1: TMenuItem;
    Cascade1: TMenuItem;
    ile1: TMenuItem;
    NewWindow1: TMenuItem;
    T1: TMenuItem;
    img16: TImageList;
    img16_d: TImageList;
    actVisibleNav: TAction;
    EasyToolBarButton2: TEasyToolBarButton;
    cdsMain: TClientDataSet;
    ppMenuTrayIcon: TEasyPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    imgtv: TImageList;
    XMLDocMain: TXMLDocument;
    tvNavPP: TEasyPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    ppTVRefresh: TMenuItem;
    actAbout: TAction;
    ppTabList: TEasyPopupMenu;
    EasyWaterImage1: TEasyWaterImage;
    ppMDITab: TEasyPopupMenu;
    N11: TMenuItem;
    cdsMainTV: TClientDataSet;
    procedure FormDestroy(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actVisibleNavExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvNavExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure ppTVRefreshClick(Sender: TObject);
    procedure tvNavDblClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //������رյ�Tab�б� ��CaptionΪ׼
    NotCloseTab: TStrings;
    //���ݵ�����еĲ����б�
    FPluginParams: TStrings;
    //�������
    FPluginsList: TList;
    //չ�����νڵ��µ��ӽڵ�
    procedure ExpandChildNodes(ANode: TTreeNode);
    //��ȡPluginsĿ¼�µĲ��Ŀ¼
    procedure GetPluginsDirectoryList(AParentNode: TTreeNode; APath, AFileType: string;
                                      AType: Integer; AFlag: string = 'init');
    //��ʾ��ǰ�û���Ϣ
    procedure DisplayCurrUserInfo(UserID: string);
    //��ʼ��״̬��
    procedure InitStbMain;
    //������
    procedure InitTreeViewNav;
    //���˵�
    procedure InitMainMenu;
    //������
    procedure InitToolBar;
    //���칤��
    procedure InitWorks;
    //��ʱͨѶ
    procedure InitEIM;

    //�ر��Ӵ���ʱ���¼�
    procedure ChildFormClose(Sender: TObject; var Action: TCloseAction);
    //��ʼ��ϵͳ ȫ������Init_LoadPlugsͳһ���ȴ������
    function Init_LoadPlugs: Boolean;
    //����ָ���Ĳ���ļ�
    function LoadPlugFile: Boolean;

    //
    procedure ShowCheckLoginUser();
  public
    { Public declarations }
    EasyDBHandle : Cardinal; //��������ģ������
    EasyLoginUserID: string; //��¼�û����/��
  end;

var
  frmEasyPlateMain: TfrmEasyPlateMain;
implementation

{$R *.dfm}

uses
  untEasyUtilInit, untEasyDBConnection, untEasyUtilDLL, untEasyUtilMethod,
  untEasyUtilClasses, untEasyPlateLoading, untEasyUtilConst,
  untEasyProgressBar, untEasyLoginMain;

procedure TfrmEasyPlateMain.DisplayCurrUserInfo(UserID: string);
begin
  //Ϊ��ʱ���µĿ�����ȡ�� �ڰ���ȡ��ʱ����¼�û����ÿ�
  if Trim(UserID) = '' then
  begin
    Application.Terminate;
  end;  
  with cdsMain do
  begin
    Close;
    CommandText := 'SELECT * FROM vw_inituser  WHERE sLoginName = ' + QuotedStr(UserID);
    Open;
    if cdsMain.RecordCount = 1 then
    begin
      stbMain.Panels[0].Text := '<a color="clblue">' + EASY_DISPLAYUSERINFO_WELCOME
                                + '</a>'
                                + fieldbyname('sEmployeeCName').AsString;
      stbMain.Panels[1].Text := '<a color="clblue">' + EASY_DISPLAYUSERINFO_DEPT
                                + '</a>';
      Close;
    end else
    if cdsMain.RecordCount > 1 then
    begin    //һ���ʻ���Ӧ���Ա��ϵͳ��һ�㲻�ᷢ������ֹ�������ݿ����
      Close;
      Application.MessageBox(PChar(EASY_DISPLAYUSERINFO_MORE), PChar(EASY_SYS_HINT),
                             MB_OK + MB_ICONWARNING);
      Application.Terminate;
    end else  
    begin   //�ʻ���������Աʹ��
      Close;
      Application.MessageBox(PChar(EASY_DISPLAYUSERINFO_NULL), PChar(EASY_SYS_HINT),
                             MB_OK + MB_ICONWARNING);
      Application.Terminate;
    end;
  end;
end;

procedure TfrmEasyPlateMain.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  //�Ӳ������FPluginsList�ͷ����в��
  for I := FPluginsList.Count - 1  downto 0 do
  begin
    Dispose(PPlugin(FPluginsList.Items[I]));
  end;
  FPluginsList.Free;

  EasyDBHandle := DMEasyDBConnection.EasyCurrLoginDBHandle;
  if EasyDBHandle > 0 then
    UnloadPackage(EasyDBHandle);

  //
  FPluginParams.Free;
  //������رյ��Ӵ����б�
  NotCloseTab.Free;
  inherited;
end;

procedure TfrmEasyPlateMain.InitEIM;
begin

end;

procedure TfrmEasyPlateMain.InitMainMenu;
var
  APluginsDirectoryList: TStrings;
  I                    : Integer;
  //�ڲ˵��ϴ���ģ��ʱʹ��
  TmpMenuItem,
  DestMenuItem         : TMenuItem;
  APath                : string;
  TmpXMLNode           : IXMLNode;
begin
  mmMain.BeginUpdate;
  APath := ExtractFilePath(Application.ExeName) + 'plugins\';
  APluginsDirectoryList := TStringList.Create;
  //XML
  if XMLDocMain.Active then
    XMLDocMain.Active := False;
  //�˵�ģ��ֻ��ʾһ��ģ��
  XMLDocMain.LoadFromFile(ExtractFilePath(Application.ExeName) + 'plugins\plugins-dir.xml');
  XMLDocMain.Active := True;
  //�����ļ�
  SearchFile(APath, APluginsDirectoryList, '*.*', 1);

  for I := 0 to APluginsDirectoryList.Count - 1 do
  begin
    TmpXMLNode := XMLDocMain.DocumentElement.ChildNodes.FindNode('plugins_' + APluginsDirectoryList.Strings[I]);
    if TmpXMLNode <> nil then
    begin
      //����ģ��˵�
      TmpMenuItem := TMenuItem.Create(mmMain);
      with TmpMenuItem do
      begin
        Caption := IntToStr(I) + '��' + VarToStrDef(TmpXMLNode.Attributes['CName'], '');
        Hint :=  APath + APluginsDirectoryList.Strings[I];
      end;
      DestMenuItem := mmMain.Items.Find('ģ��(&M)');
      if DestMenuItem <> nil then
      begin
        DestMenuItem.Add(TmpMenuItem);
      end;
    end;
    //���ش���Ľ�����
    with frmEasyPlateLoading.EasyProgressBar1 do
    begin
      if Position > Max then
        Position := Max - 20;
      Position := Position + I*2;
    end;
  end;
  XMLDocMain.Active := False;
  APluginsDirectoryList.Free;
  mmMain.EndUpdate;
end;

procedure TfrmEasyPlateMain.InitStbMain;
begin
  //����ʱ���ʼ��
  stbMain.Panels[2].Text:='<a color="clblue">ũ��   ' + GetChinaDay + '  ' + FormatDateTime('YYYY-MM-DD', Date)
            + '</a>';
  //����������Ϣ
  with stbMain.Panels[7] do
  begin
    Width := 25;
    Style := psImage;
    Text := '';
    if NetInternetConnected then
      ImageIndex := 7
    else
      ImageIndex := 8;
  end;
  //��������Ϣ
  stbMain.Panels[8].Text := '<a color="clblue">' + EASY_STATUBAR_APP
                          + DMEasyDBConnection.EasyAppType

                         + EASY_STATUBAR_DBHOST
                         + DMEasyDBConnection.EasyDBHost
                         + ':' + DMEasyDBConnection.EasyDBPort + '</a>';
end;

procedure TfrmEasyPlateMain.InitToolBar;
begin

end;

procedure TfrmEasyPlateMain.InitTreeViewNav;
var
  I: Integer;
  ATmpNode: TTreeNode;
begin
  //�����
  tvNav.Items.Clear;
  with cdsMainTV do
  begin
    Close;
    CommandText := 'SELECT * FROM sysPluginsDirectory ';
    Open;
    First;
    for I := 0 to RecordCount - 1 do
    begin
      if FieldByName('sParentGUID').AsString = '{00000000-0000-0000-0000-000000000000}' then

    end;  
  end;
//  GetPluginsDirectoryList(nil, ExtractFilePath(Application.ExeName) + 'plugins\',
//                          '*.*', 1, 'init');
end;

procedure TfrmEasyPlateMain.InitWorks;
begin

end;

procedure TfrmEasyPlateMain.actExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEasyPlateMain.actVisibleNavExecute(Sender: TObject);
begin
  inherited;
  pgcLeftNav.Visible := not pgcLeftNav.Visible;
end;

procedure TfrmEasyPlateMain.FormShow(Sender: TObject);
begin
  //������¼���� ���е�¼��֤
  ShowCheckLoginUser;
  if Trim(EasyLoginUserID) = '' then
    Application.Terminate
  else
  begin
    inherited;
    //��ʾ���ȴ���
    CreatePG(Init_LoadPlugs, 'ϵͳ��ʼ��...');
    //��ʾ�û���Ϣ����ǰ��¼�û�������
    DisplayCurrUserInfo(EasyLoginUserID);
    //����״̬��λ
    InitStbMain;
  end;
end;

//+AFlag �ж��ǳ����ʼ�����뻹����������
//��ʼ������������ȴ��塢����������
procedure TfrmEasyPlateMain.GetPluginsDirectoryList(AParentNode: TTreeNode;
                            APath, AFileType: string; AType: Integer; AFlag: string = 'init');
var
  APluginsDirectoryList: TStrings;
  I                    : Integer;
  TmpNode              : TTreeNode;
  TmpPlugin            : PPLugin;
  TmpXMLNode           : IXMLNode;
begin
  APluginsDirectoryList := TStringList.Create;
  //XML
  if XMLDocMain.Active then
    XMLDocMain.Active := False;
  if AType = 1 then    //�����ļ���
    XMLDocMain.LoadFromFile(ExtractFilePath(Application.ExeName) + 'plugins\plugins-dir.xml')
  else if AType = 2 then //���ز��
    XMLDocMain.LoadFromFile(ExtractFilePath(Application.ExeName) + 'plugins\plugins-file.xml');
  XMLDocMain.Active := True;
  //�����ļ�
  SearchFile(APath, APluginsDirectoryList, AFileType, AType);

  for I := 0 to APluginsDirectoryList.Count - 1 do
  begin
    TmpXMLNode := XMLDocMain.DocumentElement.ChildNodes.FindNode('plugins_' + APluginsDirectoryList.Strings[I]);
    if TmpXMLNode <> nil then
    begin
      New(TmpPlugin);
      TmpPlugin.FileName := APath + APluginsDirectoryList.Strings[I];
      TmpPlugin.EName := VarToStrDef(TmpXMLNode.Attributes['EName'], '');
      TmpPlugin.CName := VarToStrDef(TmpXMLNode.Attributes['CName'], '');
      TmpPlugin.image1 := VarToStrDef(TmpXMLNode.Attributes['image1'], '');
      TmpPlugin.image2 := VarToStrDef(TmpXMLNode.Attributes['image2'], '');
      TmpPlugin.iOrder := StrToInt(VarToStrDef(TmpXMLNode.Attributes['Order'], '0'));
      TmpPlugin.Flag := VarToStrDef(TmpXMLNode.Attributes['Flag'], '');
      //�������Ĳ����ӵ����������
      FPluginsList.Add(TmpPlugin);

      //�������νڵ�
      TmpNode := tvNav.Items.AddChildObject(AParentNode, TmpPlugin.CName, TmpPlugin);
      with TmpNode do
      begin
        ImageIndex := StrToInt(PPLugin(Data).image1);
        SelectedIndex := StrToInt(PPLugin(Data).image2);
      end;
      //�ݴ�ڵ���ʾ��
      if Pos('.', PPLugin(TmpNode.Data).FileName) = 0 then
      begin
        tvNav.Items.AddChild(TmpNode, 'ChildTest');
      end;

    end;
    //���ش���Ľ�����
    if AFlag = 'init' then //��ֹ����չ��ʱ����
    begin
      with frmEasyPlateLoading.EasyProgressBar1 do
      begin
        if Position > Max then
          Position := Max - 20;
        Position := Position + I*2;
      end;
    end;
  end;
  XMLDocMain.Active := False;
  APluginsDirectoryList.Free;
end;

procedure TfrmEasyPlateMain.FormCreate(Sender: TObject);
begin
  inherited;
  //��˫����
  Self.DoubleBuffered := True;
  FPluginParams := TStringList.Create;
  //�����������
  FPluginsList := TList.Create;

//��ʼ���˵��͵�����ͳһ����Init_LoadPlugs���ɽ��ȴ��帺��
//  ��ʼ�����˵�
//  InitMainMenu;
//  ��ʼ��������
//  InitTreeViewNav;
  //������رյ�Tab����
  NotCloseTab := TStringList.Create;
  with NotCloseTab do
  begin
    Add('������');
    Add('����');
    Add('����̨');
    Add('������');
    Add('������̨');
    Add('��������');
    Add('��ҳ');
  end;
end;

procedure TfrmEasyPlateMain.ExpandChildNodes(ANode: TTreeNode);
begin
  ANode.DeleteChildren;
  //�Ȳ����ļ���
  GetPluginsDirectoryList(ANode, PPlugin(ANode.Data).FileName + '\', '*.*', 1, 'NO_INIT');
  //����ָ���ļ�
  GetPluginsDirectoryList(ANode, PPlugin(ANode.Data).FileName + '\', '*.bpl', 2, 'NO_INIT');
end;               

procedure TfrmEasyPlateMain.tvNavExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  if Node.HasChildren then
  begin
    if Node.Item[0].Text = 'ChildTest' then
      Node.Item[0].Delete;
    //ִ�м������񣬼����л���ɾ��ԭ���ľ���ֵ
    ExpandChildNodes(Node);
  end;
end;       

procedure TfrmEasyPlateMain.N6Click(Sender: TObject);
begin
  inherited;
  tvNav.FullExpand;
end;

procedure TfrmEasyPlateMain.N7Click(Sender: TObject);
begin
  inherited;
  tvNav.FullCollapse;
end;

procedure TfrmEasyPlateMain.ppTVRefreshClick(Sender: TObject);
var
  TmpNode: TTreeNode;
begin
  inherited;
  //ˢ��ʱ��������ӽڵ��ɾ���������¼���    
  TmpNode := tvNav.Selected;
  //�����Ժ����Զ���
  TmpNode.Expanded := True; 
end;

procedure TfrmEasyPlateMain.tvNavDblClick(Sender: TObject);
begin
  inherited;
  CreatePG_Plug(LoadPlugFile, '���ڼ��ز��,���Ժ�...', tvNav.Selected);
end;

procedure TfrmEasyPlateMain.About1Click(Sender: TObject);
begin
  inherited;
  LoadPkg('pkEasyAboutUS.bpl', FPluginParams);
end;

procedure TfrmEasyPlateMain.ChildFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //�жϵ�ǰҪ�رյ��Ӵ����Ƿ�����ر�
  if NotCloseTab.IndexOf(TForm(Sender).Caption) = - 1 then
  begin
    tlbMain.RemoveMDIChildMenu(TForm(Sender), TForm(Sender).Caption);

    Action := caFree;
  end;
end;

function TfrmEasyPlateMain.Init_LoadPlugs: Boolean;
begin
  frmEasyPlateLoading.EasyProgressBar1.Position := 10;
  //��ʼ�����˵�
  InitMainMenu;
  //��ʼ��������
  InitTreeViewNav;
  Result := True;
  //���ش���Ľ�����
  with frmEasyPlateLoading.EasyProgressBar1 do
  begin
    if Position < Max then
      Position := Max;
  end;
  frmEasyPlateLoading.Close;
end;

function TfrmEasyPlateMain.LoadPlugFile: Boolean;
var
  TmpPluginFile: String;
  TmpNode      : TTreeNode;
begin
  TmpNode := frmEasyPlateLoading.ATmpNode_Loading;
  //���ȴ������
  frmEasyPlateLoading.EasyProgressBar1.Position := 10;
  TmpPluginFile := PPlugin(TmpNode.Data).FileName;
  if (pos('.bpl', TmpPluginFile) > 0) and (FileExists(TmpPluginFile)) then
    LoadPkg(TmpPluginFile, FPluginParams, EasyMDITabSet1,
            frmEasyPlateLoading.EasyProgressBar1, ChildFormClose, 1);
  Result := True;
  //���ȴ������
  frmEasyPlateLoading.EasyProgressBar1.Position := 100;
  frmEasyPlateLoading.Close;
end;

procedure TfrmEasyPlateMain.N11Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to EasyMDITabSet1.ComponentCount - 1 do
    EasyMDITabSet1.Components[I].Free;
end;

procedure TfrmEasyPlateMain.ShowCheckLoginUser();
begin
  try
    frmEasyLoginMain := TfrmEasyLoginMain.Create(Application);
    frmEasyLoginMain.ShowModal;
  finally
    frmEasyLoginMain.Free;
  end;
end;

procedure TfrmEasyPlateMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Application.MessageBox('ȷ��Ҫ�˳�ϵͳ��?', '��ʾ', MB_OKCANCEL + 
    MB_ICONQUESTION) = IDOK then
  begin
    Application.Terminate;
  end;
end;

end.
