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
  DB, DBClient, xmldom, XMLIntf, msxmldom, XMLDoc, untEasyPlateDBBaseForm;

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
    sPluginFileName: string;  
  end;

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
    Print1: TMenuItem;
    N2: TMenuItem;
    SaveAs1: TMenuItem;
    Save1: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
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
    procedure tvNavDblClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure ppTVRefreshClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EpResourceManageClick(Sender: TObject);
  private
    { Private declarations }
    //������رյ�Tab�б� ��CaptionΪ׼
    NotCloseTab: TStrings;
    //���ݵ�����еĲ����б�
    FPluginParams: TStrings;
    //�������
    FPluginsList: array of PEasytvNavRecord;
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
                               AData: array of PEasytvNavRecord;
                               ParentNode: TTreeNode);
    //�ͷŲ���������
    procedure DisposePlugArray;
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

procedure TfrmEasyPlateMain.DisplayCurrUserInfo(UserID: string);
begin
  //Ϊ��ʱ���µĿ�����ȡ�� �ڰ���ȡ��ʱ����¼�û����ÿ�
  if Trim(UserID) = '' then
  begin
    Application.Terminate;
  end;  
  with cdsMain do
  begin
    cdsMain.Data := EasyRDMDisp.EasyGetRDMData('SELECT * FROM vw_inituser  WHERE sLoginName = ' + QuotedStr(UserID));
//    Close;
//    CommandText := 'SELECT * FROM vw_inituser  WHERE sLoginName = ' + QuotedStr(UserID);
//    Open;
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
begin
  DisposePlugArray;
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

  for I := Low(FPluginsList) to High(FPluginsList) do
  begin
    if PEasytvNavRecord(FPluginsList[I])^.sParentGUID = EasyRootGUID then
    begin
      //����ģ��˵�
      TmpMenuItem := TMenuItem.Create(mmMain);
      with TmpMenuItem do
      begin
        Caption := PEasytvNavRecord(FPluginsList[I])^.sCName;
//        TmpMenuItem.
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
    cdsMainTV.Data := EasyRDMDisp.EasyGetRDMData('SELECT * FROM sysPluginsDirectory ORDER BY bDir, iOrder');
//    Close;
//    CommandText := 'SELECT * FROM sysPluginsDirectory ORDER BY bDir, iOrder';
//    Open;
    First;
    for I := 0 to RecordCount - 1 do
    begin
        SetLength(FPluginsList, Length(FPluginsList) + 1);
        New(FPluginsList[High(FPluginsList)]);
        FPluginsList[High(FPluginsList)]^.sGUID := FieldByName('GUID').AsString;
        FPluginsList[High(FPluginsList)]^.sEName := FieldByName('sEName').AsString;
        FPluginsList[High(FPluginsList)]^.sCName := FieldByName('sCName').AsString;
        FPluginsList[High(FPluginsList)]^.sParentGUID := FieldByName('sParentGUID').AsString;
        FPluginsList[High(FPluginsList)]^.iOrder := FieldByName('iOrder').AsInteger;
        FPluginsList[High(FPluginsList)]^.iImage1 := FieldByName('iImage1').AsInteger;
        FPluginsList[High(FPluginsList)]^.iImage2 := FieldByName('iImage2').AsInteger;
        FPluginsList[High(FPluginsList)]^.iFlag := FieldByName('iFlag').AsInteger;
        FPluginsList[High(FPluginsList)]^.sPluginFileName := FieldByName('sPluginFileName').AsString;
        FPluginsList[High(FPluginsList)]^.bDir := FieldByName('bDir').AsInteger;

      if (FieldByName('sParentGUID').AsString = EasyRootGUID)
         //������Ǹ��ڵ� ��ΪĿ¼ �˴��ɲ��жϣ��ڳ�������Ŀ¼ʱ������
         and (FieldByName('bDir').AsString = '0') then
      begin
        ATmpNode := tvNav.Items.AddChildObject(nil, FPluginsList[High(FPluginsList)]^.sCName,
                                              FPluginsList[High(FPluginsList)]);
        ATmpNode.ImageIndex := FPluginsList[High(FPluginsList)]^.iImage1;
        ATmpNode.SelectedIndex := FPluginsList[High(FPluginsList)]^.iImage2;
        //������ʱ�ӽڵ�
        tvNav.Items.AddChildFirst(ATmpNode, 'ChildTest');
      end;
      Next;
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
var
  ABitMap: TBitmap;
begin
  inherited;
  //���ص���������Ҫ��ͼ��
  ABitMap := TBitmap.Create;
  ABitMap.LoadFromFile(EasyImagePath + 'Tree.bmp');
  imgtv.Add(ABitMap, nil);
  ABitMap.Free;
  
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
      LoadChildTreeNodes(tvNav, FPluginsList, Node);
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
  if PEasytvNavRecord(tvNav.Selected.Data)^.bDir = 1 then
  begin
    TmpPlugFileName := PEasytvNavRecord(tvNav.Selected.Data)^.sPluginFileName;
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
  TmpPluginFile := EasyPlugPath + PEasytvNavRecord(TmpNode.Data)^.sPluginFileName;
  if (pos('.bpl', TmpPluginFile) > 0) and (FileExists(TmpPluginFile)) then
  begin
    LoadPkg(TmpPluginFile, FPluginParams, EasyMDITabSet1,
            frmEasyPlateLoading.EasyProgressBar1, ChildFormClose, 1);
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
  AData: array of PEasytvNavRecord; ParentNode: TTreeNode);
var
  I       : Integer;
  ATmpNode: TTreeNode;
begin
  with ATreeView do
  begin
    for I := Low(AData) to High(AData) do
    begin
      if AData[I]^.sParentGUID = PEasytvNavRecord(ParentNode.Data)^.sGUID then
      begin
        ATmpNode := ATreeView.Items.AddChildObject(ParentNode, AData[I]^.sCName, AData[I]);
        ATmpNode.ImageIndex := AData[I]^.iImage1;
        ATmpNode.SelectedIndex := AData[I]^.iImage2;
        
        //������ʱ�ڵ� ֻ��Ŀ¼
        if AData[I]^.bDir = 0 then
          ATreeView.Items.AddChildFirst(ATmpNode, 'ChildTest');
      end;
    end;
  end;
end;

procedure TfrmEasyPlateMain.DisposePlugArray;
var
  I: Integer;
begin
  //�Ӳ������FPluginsList�ͷ����в��
  for I := Low(FPluginsList) to High(FPluginsList) do
    Dispose(PEasytvNavRecord(FPluginsList[I])); 
end;

procedure TfrmEasyPlateMain.ppTVRefreshClick(Sender: TObject);
begin
  inherited;
  DisposePlugArray;
  SetLength(FPluginsList, 0);
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

end.
