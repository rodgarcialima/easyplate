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
  untEasyStatusBar, untEasyStatusBarStylers, untEasyToolBar, TypInfo,  
  untEasyToolBarStylers, untEasyTabSet, untEasyOfficeTabSetStylers,
  untEasyPageControl, ExtCtrls, untEasyTrayIcon, ImgList, ComCtrls,
  untEasyTreeView, untEasyWaterImage, jpeg, StdCtrls, ActnList, Provider,
  DB, DBClient, xmldom, XMLIntf, msxmldom, XMLDoc, untEasyPlateDBBaseForm,
  AppEvnts, untEasyClassPluginDirectory;

type

//  PEasytvNavRecord = ^TEasytvNavRecord;
//  TEasytvNavRecord = record
//    sGUID,
//    sEName,
//    sCName,
//    sParentGUID  : string;
//    iOrder,
//    iImage1,
//    iImage2,
//    bDir,
//    iFlag        : Integer;
//    sPluginFileName: string;
//  end;

  TfrmEasyPlateMain = class(TfrmEasyPlateDBBaseForm)
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
    Help1: TMenuItem;
    About1: TMenuItem;
    EpResourceManage: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    Contents1: TMenuItem;
    Window1: TMenuItem;
    Show1: TMenuItem;
    Hide1: TMenuItem;
    N3: TMenuItem;
    ArrangeAll1: TMenuItem;
    Cascade1: TMenuItem;
    ile1: TMenuItem;
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
    actConnectDB: TAction;
    N2: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    procedure FormDestroy(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actVisibleNavExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvNavExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure tvNavDblClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure ppTVRefreshClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EpResourceManageClick(Sender: TObject);
    procedure actConnectDBExecute(Sender: TObject);
    procedure ile1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure ArrangeAll1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  private
    { Private declarations }
    //������رյ�Tab�б� ��CaptionΪ׼
    NotCloseTab: TStrings;
    //���ݵ�����еĲ����б�
    FPluginParams: TStrings;
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

    //��ʾ�û���¼����
    procedure ShowCheckLoginUser();
    //�����ӽڵ�
    procedure LoadChildTreeNodes(ATreeView: TEasyTreeView;
                               ADataList: TList;
                               ParentNode: TTreeNode);
    //�жϲ���Ƿ��Ѿ����ع���������ع��򼤻�
    function CheckHasLoaded(APluginFile: string): Boolean;
  public
    { Public declarations }
    EasyLoginUserID: string; //��¼�û����/��
  end;

var
  frmEasyPlateMain: TfrmEasyPlateMain;
implementation

{$R *.dfm}

uses
  untEasyUtilInit, untEasyDBConnection, untEasyUtilDLL, untEasyUtilMethod,
  untEasyUtilClasses, untEasyPlateLoading, untEasyUtilConst, 
  untEasyProgressBar, untEasyLoginMain, untEasyPlateResourceManage;

const
  PluginDirectorySQL = 'EXEC sp_SysPluginsDirectory';
  PluginParamSQL = 'EXEC sp_SysPluginParams';

procedure TfrmEasyPlateMain.DisplayCurrUserInfo(UserID: string);
begin
  //Ϊ��ʱ���µĿ�����ȡ�� �ڰ���ȡ��ʱ����¼�û����ÿ�
  if Trim(UserID) = '' then
  begin
    Application.Terminate;
  end;  
  with cdsMain do
  begin
    cdsMain.Data := EasyRDMDisp.EasyGetRDMData('SELECT * FROM vw_inituser  WHERE UserName = ' + QuotedStr(UserID));
    if cdsMain.RecordCount = 1 then
    begin
      stbMain.Panels[0].Text := '<p color="clblue">' + EASY_DISPLAYUSERINFO_WELCOME
                                + fieldbyname('EmployeeCName').AsString
                                + '</p>';
      stbMain.Panels[1].Text := '<p color="clblue">' + EASY_DISPLAYUSERINFO_DEPT
                                + '</p>';
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
begin
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
  I                    : Integer;
  //�ڲ˵��ϴ���ģ��ʱʹ��
  TmpMenuItem,
  DestMenuItem         : TMenuItem;
begin
  mmMain.BeginUpdate;
  for I := 0 to PluginDirectoryList.Count - 1 do
  begin
    with TEasysysPluginsDirectory(PluginDirectoryList[I]) do
    begin
      if ParentPluginGUID = EasyRootGUID then
      begin
        //����ģ��˵�
        TmpMenuItem := TMenuItem.Create(mmMain);
        with TmpMenuItem do
        begin
          Caption := PluginCName;
        end;
        DestMenuItem := mmMain.Items.Find('ģ��(&M)');
        if DestMenuItem <> nil then
        begin
          DestMenuItem.Add(TmpMenuItem);
        end;
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
  mmMain.EndUpdate;
end;

procedure TfrmEasyPlateMain.InitStbMain;
begin
  //����ʱ���ʼ��
  stbMain.Panels[2].Text:='<p color="clblue"> ' + GetChinaDay + '  ' + FormatDateTime('YYYY-MM-DD', Date)
            + '</p>';
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
  stbMain.Panels[8].Text := '<p color="clblue">' + EASY_STATUBAR_APP
                          + DMEasyDBConnection.EasyAppType

                         + EASY_STATUBAR_DBHOST
                         + DMEasyDBConnection.EasyDBHost
                         + ':' + DMEasyDBConnection.EasyDBPort + '</p>';
end;

procedure TfrmEasyPlateMain.InitToolBar;
begin

end;

procedure TfrmEasyPlateMain.InitTreeViewNav;
var
  I: Integer;
  ATmpNode: TTreeNode;
  AData: OleVariant;
begin
  //�����
  tvNav.Items.Clear;
  AData := EasyRDMDisp.EasyGetRDMData(PluginDirectorySQL);
  TEasysysPluginsDirectory.GeneratePluginDirectory(AData);
  for I := 0 to PluginDirectoryList.Count - 1 do
  begin
    with TEasysysPluginsDirectory(PluginDirectoryList[I]) do
    begin
      //������Ǹ��ڵ� ��ΪĿ¼ �˴��ɲ��жϣ��ڳ�������Ŀ¼ʱ������
      if (ParentPluginGUID = EasyRootGUID) and (IsDirectory = True) then
      begin
        ATmpNode := tvNav.Items.AddChildObject(nil, PluginCName, PluginDirectoryList[I]);
        ATmpNode.ImageIndex := ImageIndex;
        ATmpNode.SelectedIndex := SelectedImageIndex;
        //������ʱ�ӽڵ�
        tvNav.Items.AddChildFirst(ATmpNode, 'ChildTest');
      end;
    end;
  end;
  cdsMainTV.Close;
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

  //���ƴ�����С�� 870 ��500
  Self.Constraints.MinHeight := 500;
  Self.Constraints.MinWidth := 870;
end;

procedure TfrmEasyPlateMain.FormCreate(Sender: TObject);
begin
  inherited;
  //���ص���������Ҫ��ͼ��
  imgtv.Assign(DMEasyDBConnection.img16);
  
  //��˫����
  Self.DoubleBuffered := True;
  FPluginParams := TStringList.Create;

  //��ʼ���˵��͵�����ͳһ����Init_LoadPlugs���ɽ��ȴ��帺��
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

procedure TfrmEasyPlateMain.tvNavExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  if Node.HasChildren then
  begin
    if Node.Item[0].Text = 'ChildTest' then
    begin
      Node.Item[0].Delete;
      //����֮ǰTreeView�����PluginDirectoryList�ĳ�ʼ��
      LoadChildTreeNodes(tvNav, PluginDirectoryList, Node);
    end;
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

procedure TfrmEasyPlateMain.tvNavDblClick(Sender: TObject);
var
  TmpPlugFileName: string;
begin
  inherited;
  if tvNav.Selected = nil then
    Exit;
  if not TEasysysPluginsDirectory(tvNav.Selected.Data).IsDirectory then
  begin
    TmpPlugFileName := TEasysysPluginsDirectory(tvNav.Selected.Data).PluginFileName;
    if not CheckHasLoaded(TmpPlugFileName) then
    begin
      if FileExists(EasyPlugPath + TmpPlugFileName) then
        CreatePG_Plug(LoadPlugFile, '���ڼ��ز��,���Ժ�...', tvNav.Selected)
      else
      begin
        Application.MessageBox(PChar('����ļ���'+ TmpPlugFileName +'��δ�ҵ�,����ϵͳ�����Ի�֪ͨϵͳ����Ա��'),
          '��ʾ', MB_OK + MB_ICONSTOP);
        Exit;
      end;
    end;
  end;
end;

procedure TfrmEasyPlateMain.About1Click(Sender: TObject);
begin
  inherited;
  LoadPkg_Normal('pkEasyAboutUS.bpl', FPluginParams);
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

  //�ȳ�ʼ�������� �ٳ�ʼ�����˵�
  //��ʼ��������
  InitTreeViewNav; 
  //��ʼ�����˵�
  InitMainMenu;
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
  TmpPluginFile := EasyPlugPath + TEasysysPluginsDirectory(TmpNode.Data).PluginFileName;
  if Pos('.bpl', TmpPluginFile) = 0 then
    TmpPluginFile := TmpPluginFile + '.bpl';
  if (pos('.bpl', TmpPluginFile) > 0) and (FileExists(TmpPluginFile)) then
  begin
    try
      LoadPkg(TmpPluginFile, FPluginParams, EasyMDITabSet1,
              frmEasyPlateLoading.EasyProgressBar1, ChildFormClose, 1);
    except on E: Exception do
      begin
        raise Exception.Create(E.Message);
        Exit;
      end;
    end;
  end;
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

procedure TfrmEasyPlateMain.LoadChildTreeNodes(ATreeView: TEasyTreeView;
                               ADataList: TList; ParentNode: TTreeNode);
var
  I       : Integer;
  ATmpNode: TTreeNode;
begin
  with ATreeView do
  begin
    for I := 0 to ADataList.Count - 1 do
    begin
      with TEasysysPluginsDirectory(ADataList[I]) do
      begin
        if ParentPluginGUID = TEasysysPluginsDirectory(ParentNode.Data).PluginGUID then
        begin
          ATmpNode := ATreeView.Items.AddChildObject(ParentNode, PluginCName, ADataList[I]);
          ATmpNode.ImageIndex := ImageIndex;
          ATmpNode.SelectedIndex := SelectedImageIndex;

          //������ʱ�ڵ� ֻ��Ŀ¼
          if IsDirectory then
            ATreeView.Items.AddChildFirst(ATmpNode, 'ChildTest');
        end;
      end;
    end;
  end;
end;

procedure TfrmEasyPlateMain.ppTVRefreshClick(Sender: TObject);
begin
  inherited;
  InitTreeViewNav;
end;

procedure TfrmEasyPlateMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if Application.MessageBox('ȷ��Ҫ�˳�ϵͳ��?', '��ʾ', MB_OKCANCEL +
    MB_ICONQUESTION) = IDOK then
    Application.Terminate
  else
    CanClose := False;
end;

procedure TfrmEasyPlateMain.EpResourceManageClick(Sender: TObject);
begin
  inherited;
  frmEasyPlateResourceManage := TfrmEasyPlateResourceManage.Create(Application);
  frmEasyPlateResourceManage.ShowModal;
  frmEasyPlateResourceManage.Free;
//  for I := 0 to Screen.Forms[1].ComponentCount - 1 do
//  begin
//    if GetPropInfo(Screen.Forms[1].Components[I], 'Caption') <> nil then
//      Memo1.Lines.Add(Screen.Forms[1].Components[I].Name +'.Caption='+ GetPropValue(Screen.Forms[1].Components[I], 'Caption'));
//    if GetPropInfo(Screen.Forms[1].Components[I], 'Text') <> nil then
//      Memo1.Lines.Add(Screen.Forms[1].Components[I].Name +'.Text='+ GetPropValue(Screen.Forms[1].Components[I], 'Text'));
//    if GetPropInfo(Screen.Forms[1].Components[I], 'Hint') <> nil then
//      Memo1.Lines.Add(Screen.Forms[1].Components[I].Name +'.Hint='+ GetPropValue(Screen.Forms[1].Components[I], 'Hint'));
//  end;
//  for I := 0 to Screen.FormCount - 1 do
//  begin
//    Memo1.Clear;
//    Memo1.Lines.Add(Screen.Forms[I].Caption + TfrmEasyPlateBaseForm(Screen.Forms[I]).FormId);
//  end;
//  ShowMessage(IntToStr(Screen.FormCount));
end;

procedure TfrmEasyPlateMain.actConnectDBExecute(Sender: TObject);
begin
  inherited;
  LoadPkg_Normal('pkEasyconnDB.bpl', FPluginParams);
end;

procedure TfrmEasyPlateMain.ile1Click(Sender: TObject);
begin
  inherited;
  Self.Tile;
end;

procedure TfrmEasyPlateMain.Cascade1Click(Sender: TObject);
begin
  inherited;
  Self.Cascade;
end;

procedure TfrmEasyPlateMain.ArrangeAll1Click(Sender: TObject);
begin
  inherited;
  Self.ArrangeIcons;
end;

function TfrmEasyPlateMain.CheckHasLoaded(APluginFile: string): Boolean;
var
  ATabCollectionItem: TOfficeTabCollectionItem;
  I           : Integer;
begin
  Result := False;
  //�жϲ���Ƿ��Ѿ����ع���������ع��򼤻�
  for I := 0 to EasyMDITabSet1.EasyOfficeTabCount - 1 do
  begin
    ATabCollectionItem := EasyMDITabSet1.EasyOfficeTabs[I];
    if ATabCollectionItem.OfficeHint.Title = APluginFile then
    begin
      EasyMDITabSet1.ActiveTabIndex := I;
      Result := True;
      Break;
    end;
  end;
end;

procedure TfrmEasyPlateMain.N12Click(Sender: TObject);
begin
  inherited;
  if tvNav.Selected <> nil then
    tvNav.Selected.Expand(True);
end;

procedure TfrmEasyPlateMain.N13Click(Sender: TObject);
begin
  inherited;
  if tvNav.Selected <> nil then
    tvNav.Selected.Collapse(True);
end;

//  if E.ClassType.ClassName = 'ESocketConnectionError' then
//    Application.MessageBox('�������ʧȥ����,�����µ�¼�ͻ���!', '��ʾ', MB_OK +
//      MB_ICONINFORMATION)
//  else
//    raise Exception.Create(E.Message);

end.
