unit untEasyPlateManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, StdCtrls, untEasyLabel,
  untEasyPageControl, ExtCtrls, untEasyGroupBox, untEasyProgressBar,
  untEasyEdit, untEasyEditExt, untEasyButtons, Grids, untEasyBaseGrid,
  untEasyGrid, ComCtrls, untEasyTreeView, untEasyMemo, DB, DBClient,
  Provider, ImgList, Menus, untEasyMenus, untEasyMenuStylers;

  //�����������
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type

  PEasytvDirectoryRecord = ^TEasytvDirectoryRecord;
  TEasytvDirectoryRecord = record
    sGUID,
    sEName,
    sCName,
    sParentGUID : string;     //���ڵ�GUID
    iOrder,                   //����
    iImage1,                  //�ڵ�\չ����ͼ��
    iImage2,
    bDir,                     //0Ŀ¼ 1���
    iFlag   : Integer;
    sPluginFileName: string; //Ҫ���õĲ���ļ�����
    sFlag: string;  //Add ���� Edit �༭ Del ɾ��
  end;

  PEasytvParamsRecord = ^TEasytvParamsRecord;
  TEasytvParamsRecord = record
    //��ȡ����
    ParamGUID,
    sPluginGUID,//GUID �ҿ��ڵ�
    sParamEName,
    sParamCName,
    sValueType,
    sValue,
    sFlag     : string;
  end;

  TfrmEasyPlateManage = class(TfrmEasyPlateDBBaseForm)
    EasyPanel1: TEasyPanel;
    EasyPanel2: TEasyPanel;
    pgcSystemManager: TEasyPageControl;
    tbsDirectoryManage: TEasyTabSheet;
    tbsModulesUpdate: TEasyTabSheet;
    tbsSystemFileUpdate: TEasyTabSheet;
    tbsReportUpdate: TEasyTabSheet;
    lblOperateHint: TEasyLabel;
    pgbOperate: TEasyProgressBar;
    EasyLabel1: TEasyLabel;
    EasyPanel3: TEasyPanel;
    EasyPanel4: TEasyPanel;
    EasyBitButton1: TEasyBitButton;
    EasyBitButton2: TEasyBitButton;
    EasyStringGrid1: TEasyStringGrid;
    EasyPanel5: TEasyPanel;
    EasyPanel6: TEasyPanel;
    EasyStringGrid2: TEasyStringGrid;
    EasyPanel11: TEasyPanel;
    Splitter2: TSplitter;
    EasyPanel12: TEasyPanel;
    tvSysDirectory: TEasyTreeView;
    EasyPanel13: TEasyPanel;
    btnAdd: TEasyBitButton;
    btnInsert: TEasyBitButton;
    btnEdit: TEasyBitButton;
    pgcDirOperate: TEasyPageControl;
    EasyTabSheet3: TEasyTabSheet;
    EasyLabel4: TEasyLabel;
    lvParamers: TListView;
    btnParamAdd: TEasyBitButton;
    btnParamEdit: TEasyBitButton;
    btnParamDelete: TEasyBitButton;
    EasyPanel8: TEasyPanel;
    Splitter1: TSplitter;
    EasyPanel9: TEasyPanel;
    tvModules: TEasyTreeView;
    EasyPanel10: TEasyPanel;
    EasyLabelEdit1: TEasyLabelEdit;
    EasyLabelEdit2: TEasyLabelEdit;
    EasyLabelEdit3: TEasyLabelEdit;
    EasyLabelEdit4: TEasyLabelEdit;
    EasyBitButton7: TEasyBitButton;
    EasyBitButton8: TEasyBitButton;
    EasyLabelEdit5: TEasyLabelEdit;
    EasyLabelEdit6: TEasyLabelEdit;
    rdgUpdateOptions: TEasyRadioGroup;
    EasyPanel7: TEasyPanel;
    EasyBitButton5: TEasyBitButton;
    EasyBitButton6: TEasyBitButton;
    EasyLabel6: TEasyLabel;
    lvDeleted: TListView;
    btnSave: TEasyBitButton;
    btnCancel: TEasyBitButton;
    btnRefresh: TEasyBitButton;
    EasyBitButton19: TEasyBitButton;
    EasyBitButton3: TEasyBitButton;
    EasyBitButton4: TEasyBitButton;
    cdsDirManager: TClientDataSet;
    btnDelete: TEasyBitButton;
    imgTv: TImageList;
    tbsOPLog: TEasyTabSheet;
    mmOPLog: TEasyMemo;
    tvNavPP: TEasyPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    ppTVRefresh: TMenuItem;
    EasyMenuOfficeStyler1: TEasyMenuOfficeStyler;
    imglv: TImageList;
    imglvDel: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tvSysDirectoryExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure tvSysDirectoryDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure tvSysDirectoryMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvSysDirectoryDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure ppTVRefreshClick(Sender: TObject);
    procedure tvSysDirectoryChange(Sender: TObject; Node: TTreeNode);
    procedure FormDestroy(Sender: TObject);
    procedure btnParamEditClick(Sender: TObject);
    procedure btnParamDeleteClick(Sender: TObject);
    procedure btnParamAddClick(Sender: TObject);
    procedure pgcSystemManagerChange(Sender: TObject);
  private
    { Private declarations }
    tvTmpData: array of PEasytvDirectoryRecord;  //�洢�����ݿⷵ�ص�����
    tvTmpParamsData: array of PEasytvParamsRecord; //�����б�
    
    AAddedTreeGUID: TStrings;
    //��ʼ������ֻ���ɵ�һ��ڵ�
    procedure GenerateTreeView(ATreeView: TEasyTreeView;
                               AData: array of PEasytvDirectoryRecord;
                               RootFlag: string);
    procedure GenerateTreeNode(ATreeView: TEasyTreeView;
                               AData: PEasytvDirectoryRecord;
                               ParentNode: TTreeNode);
    //�����ӽڵ�
    procedure LoadChildTreeNodes(ATreeView: TEasyTreeView;
                               AData: array of PEasytvDirectoryRecord;
                               ParentNode: TTreeNode);
    
    procedure InitDirectoryData;
    function InsertDirectory(AData: PEasytvDirectoryRecord): Boolean;
    function UpdateDirectory(AData: PEasytvDirectoryRecord): Boolean;
    function DeleteDirectory(AData: PEasytvDirectoryRecord): Boolean;

    function InsertParam(AData: PEasytvParamsRecord): Boolean;
    function UpdateParam(AData: PEasytvParamsRecord): Boolean;
    function DeleteParam(AData: PEasytvParamsRecord): Boolean;
    //ɾ�����ɵ���ʱ�ڵ�
    procedure DeleteTmpNode(AText: string = '����Ŀ¼�ṹ');
    //�ͷ�����  0 �ͷ��������� 1�ͷ�Ϊ������
    procedure DisposeArrayTvDirectory(AFlag: string = '0');
    //�ͷ�����  0 �ͷ��������� 1�ͷ�Ϊ������
    procedure DisposeArrayTvParams(AFlag: string = '0');

    //ģ������
    //��ʼ��ģ������ҳ
    procedure InitTvModules();
  public
    { Public declarations }
  end;

var
  frmEasyPlateManage: TfrmEasyPlateManage;

implementation

{$R *.dfm}

uses
  untTvDirectoryOper, ActiveX, untEasyUtilDLL, untPlugParamsOP,
  untEasyUtilMethod;


var
  //������Ӧ�����ֱ�־ ���� �޸� ɾ��
  Easy_Add :string= 'Add';
  Easy_Edit :string= 'Edit';
  Easy_Del :string= 'Del';

  ParentNodeFlag :string = '{00000000-0000-0000-0000-000000000000}';
//��������ʵ��
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyPlateManage := TfrmEasyPlateManage.Create(Application);
  if frmEasyPlateManage.FormStyle <> fsMDIChild then
    frmEasyPlateManage.FormStyle := fsMDIChild;
  if frmEasyPlateManage.WindowState <> wsMaximized then
    frmEasyPlateManage.WindowState := wsMaximized;
  frmEasyPlateManage.FormId := '{AC8E0BB3-2578-4D2A-8869-850891B8E5E8}';
  Result := frmEasyPlateManage;
end;

procedure TfrmEasyPlateManage.FormCreate(Sender: TObject);
var
  ABitMap: TBitmap;
begin
  inherited;
  //����ӵ����Ľڵ� ��ǰ����
  AAddedTreeGUID := TStringList.Create;

  //��ʼ����ҳ��ʾҳ��
  pgcSystemManager.ActivePageIndex := 0;
  pgcDirOperate.ActivePageIndex := 0;
  //����������Ҫ��ͼƬ
  ABitMap := TBitmap.Create;
  ABitMap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'images\Tree.bmp');
  imgTv.Add(ABitMap, nil);
  ABitMap.Free;
  //��ʼ������
  InitDirectoryData;
  //����Ŀ¼��
  GenerateTreeView(tvSysDirectory, tvTmpData, ParentNodeFlag);
  //
  tvSysDirectory.ReadOnly := True;
  mmOPLog.ReadOnly := True;

end;

procedure TfrmEasyPlateManage.GenerateTreeView(ATreeView: TEasyTreeView;
  AData: array of PEasytvDirectoryRecord; RootFlag: string);
var
  I       : Integer;
  ATmpNode: TTreeNode;
begin
  ATreeView.Items.Clear;
  with ATreeView do
  begin
    for I := Low(AData) to High(AData) do
    begin
      if (AData[I]^.sParentGUID = RootFlag) and  (AData[I]^.sCName <> '')
         and (AData[I]^.sFlag <> Easy_Del)
         and (AAddedTreeGUID.IndexOf(AData[I]^.sGUID) = -1) then
      begin
        ATmpNode := ATreeView.Items.AddChildObject(nil, AData[I]^.sCName, AData[I]);
        ATmpNode.ImageIndex := AData[I]^.iImage1;
        ATmpNode.SelectedIndex := AData[I]^.iImage2;
        
        AAddedTreeGUID.Add(AData[I]^.sGUID);
        //������ʱ�ڵ� ֻ��Ŀ¼
        if AData[I]^.bDir = 0 then
          ATreeView.Items.AddChildFirst(ATmpNode, 'TempChildNode');
      end;
    end;
  end;
  if ATreeView.Items.Count = 0 then
  begin
     Application.MessageBox('����Ŀ¼�ṹ���ݣ�', '��ʾ', MB_OK 
       + MB_ICONWARNING);
     Exit;
  end;
//    ATreeView.Items.AddChild(nil, '����Ŀ¼�ṹ');
end;

function TfrmEasyPlateManage.DeleteDirectory(
  AData: PEasytvDirectoryRecord): Boolean;
var
  DelSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    DelSQL := ' DELETE FROM sysPluginsDirectory WHERE GUID = ' + QuotedStr(AData^.sGUID);
    cdsDirManager.CommandText := DelSQL;
    cdsDirManager.Execute;
  //  AData^.sFlag := '';
    //ִ����־���
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '��ɾ����'
                      + AData^.sCName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('ɾ����' + AData^.sCName +'������,ԭ��:' + e.Message), '��ʾ',
                            MB_OK + MB_ICONSTOP);
  end;
end;

function TfrmEasyPlateManage.InsertDirectory(
  AData: PEasytvDirectoryRecord): Boolean;

  function Boolean2String(ABoolean: Boolean): string;
  begin
    if ABoolean then
      Result := 'True'
    else
      Result := 'False';
  end;  
var
  InsSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    InsSQL := ' INSERT INTO sysPluginsDirectory (GUID, sEName, sCName, iOrder,'
              + 'iImage1, iImage2, iFlag, bDir, sParentGUID, sPluginFileName) VALUES ('
              + QuotedStr(AData^.sGUID)
              + ',' + QuotedStr(AData^.sEName)
              + ',' + QuotedStr(AData^.sCName)
              + ',' + QuotedStr(IntToStr(AData^.iOrder))
              + ',' + QuotedStr(IntToStr(AData^.iImage1))
              + ',' + QuotedStr(IntToStr(AData^.iImage2))
              + ',' + QuotedStr(IntToStr(AData^.iFlag))
              + ',' + QuotedStr(IntToStr(AData^.bDir))
              + ',' + QuotedStr(AData^.sParentGUID)
              + ',' + QuotedStr(AData^.sPluginFileName)
              + ')';
    cdsDirManager.CommandText := InsSQL;
    cdsDirManager.Execute;
    AData^.sFlag := '';
    //ִ����־���
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '��������'
                        + AData^.sCName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('���롾' + AData^.sCName +'������,ԭ��:' + e.Message), '��ʾ',
                            MB_OK + MB_ICONSTOP);
  end;
end;

function TfrmEasyPlateManage.UpdateDirectory(
  AData: PEasytvDirectoryRecord): Boolean;
var
  UdpSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    UdpSQL := ' Update sysPluginsDirectory SET '
              + ' sEName = ' + QuotedStr(AData^.sEName) + ','
              + ' sCName = ' + QuotedStr(AData^.sCName) + ','
              + ' iOrder = ' + QuotedStr(IntToStr(AData^.iOrder)) + ','
              + ' iImage1 = ' + QuotedStr(IntToStr(AData^.iImage1))+ ','
              + ' iImage2 = ' + QuotedStr(IntToStr(AData^.iImage2))+ ','
              + ' iFlag = ' + QuotedStr(IntToStr(AData^.iFlag))  + ','
              + ' bDir = ' + QuotedStr(IntToStr(AData^.bDir))   + ','
              + ' sParentGUID = ' + QuotedStr(AData^.sParentGUID) + ','
              + ' sPluginFileName = ' + QuotedStr(AData^.sPluginFileName) + ' '
              + ' WHERE GUID = ' + QuotedStr(AData^.sGUID);
    cdsDirManager.CommandText := UdpSQL;
    cdsDirManager.Execute;
    AData^.sFlag := '';
    //ִ����־���
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '���޸ġ�'
                        + AData^.sCName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('���¡�' + AData^.sCName +'������,ԭ��:' + e.Message), '��ʾ',
                            MB_OK + MB_ICONSTOP);
  end;
end;

procedure TfrmEasyPlateManage.btnAddClick(Sender: TObject);
begin
  inherited;
  DeleteTmpNode;
  SetLength(tvTmpData, Length(tvTmpData) + 1);
  New(tvTmpData[High(tvTmpData)]);
  tvTmpData[High(tvTmpData)]^.sGUID := GenerateGUID;
  tvTmpData[High(tvTmpData)]^.sParentGUID := ParentNodeFlag;
  tvTmpData[High(tvTmpData)]^.sFlag := Easy_Add;

  ShowfrmTvDirectoryOper(tvTmpData[High(tvTmpData)], Easy_Add);
  if tvTmpData[High(tvTmpData)]^.sCName <> '' then
    GenerateTreeNode(tvSysDirectory, tvTmpData[High(tvTmpData)], nil);
end;

procedure TfrmEasyPlateManage.GenerateTreeNode(ATreeView: TEasyTreeView;
  AData: PEasytvDirectoryRecord; ParentNode: TTreeNode);
var
  AResultNode: TTreeNode;
begin
  AResultNode := ATreeView.Items.AddChildObject(ParentNode, AData^.sCName, AData);
  AResultNode.ImageIndex := AData^.iImage1;
  AResultNode.SelectedIndex := AData^.iImage2;
  //����������ѡ�����ɽڵ�
  if AResultNode <> nil then
    ATreeView.Selected := AResultNode;
end;

procedure TfrmEasyPlateManage.btnInsertClick(Sender: TObject);
begin
  inherited;
  DeleteTmpNode;
  if tvSysDirectory.Selected = nil then
  begin
    Application.MessageBox('��ѡ��һ���ڵ���Ϊ�ҿ��ڵ㣡', '��ʾ', MB_OK + 
      MB_ICONINFORMATION);
    Exit;     
  end;  
  SetLength(tvTmpData, Length(tvTmpData) + 1);
  New(tvTmpData[High(tvTmpData)]);
  tvTmpData[High(tvTmpData)]^.sGUID := GenerateGUID;
  tvTmpData[High(tvTmpData)]^.sParentGUID := PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sGUID;
  tvTmpData[High(tvTmpData)]^.sFlag := Easy_Add;

  ShowfrmTvDirectoryOper(tvTmpData[High(tvTmpData)], Easy_Add,
                   PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sCName);
  if tvTmpData[High(tvTmpData)]^.sCName <> '' then
    GenerateTreeNode(tvSysDirectory, tvTmpData[High(tvTmpData)], tvSysDirectory.Selected);
end;

procedure TfrmEasyPlateManage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DisposeArrayTvDirectory;
  DisposeArrayTvParams;
end;

procedure TfrmEasyPlateManage.btnEditClick(Sender: TObject);
var
  ASelectedNode: TTreeNode;
  TmpData      : PEasytvDirectoryRecord;
begin
  inherited;
  DeleteTmpNode;
  ASelectedNode := tvSysDirectory.Selected;
  if ASelectedNode = nil then
  begin
    Application.MessageBox('��ѡ��һ��Ҫ�޸ĵĽڵ㣡', '��ʾ', MB_OK + 
      MB_ICONINFORMATION);
    Exit;     
  end;
  TmpData := PEasytvDirectoryRecord(ASelectedNode.Data);
  if TmpData^.sFlag <> Easy_Add then
    TmpData^.sFlag := Easy_Edit;
    
  ShowfrmTvDirectoryOper(TmpData, Easy_Edit);
  ASelectedNode.Text := TmpData^.sCName;
end;

procedure TfrmEasyPlateManage.btnSaveClick(Sender: TObject);
var
  I, J: Integer;
  ADivValue: Integer; //�������ķ���
begin
  inherited;
  J := 0;
  ADivValue := 100 div High(tvTmpData);
  pgbOperate.Position := 0;
  //���� �޸� ɾ�� �������
  try
    for I := Low(tvTmpData) to High(tvTmpData) do
    begin
      if Trim(tvTmpData[I]^.sCName) <> '' then
      begin
        if tvTmpData[I]^.sFlag = Easy_Add then
        begin
          inc(J);
          InsertDirectory(tvTmpData[I]);
        end;
        if tvTmpData[I]^.sFlag = Easy_Del then
        begin
          inc(J);
          DeleteDirectory(tvTmpData[I]);
        end;
        if tvTmpData[I]^.sFlag = Easy_Edit then
        begin
          inc(J);
          UpdateDirectory(tvTmpData[I]);
        end;
      end;
      pgbOperate.Position := pgbOperate.Position + ADivValue;
    end;
    if J > 0 then
    begin
      Application.MessageBox('�ύ��ɣ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
      btnRefreshClick(Sender);
      pgbOperate.Position := 0;
      lvDeleted.Items.Clear;
    end
    else
    begin
      pgbOperate.Position := 0;
      Application.MessageBox('û��Ҫ�ύ�ĸ��ģ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    end;
  except on e:Exception do
    if Application.MessageBox(PChar('�ύ����,ԭ��' + e.Message
              + '����ɲ鿴��������־����'), '��ʾ', MB_OKCANCEL + MB_ICONWARNING) = IDOK then
    begin
      pgcSystemManager.ActivePage := tbsOPLog;
      pgbOperate.Position := 0;
      lvDeleted.Items.Clear;
    end
    else
    begin
      pgbOperate.Position := 0;
      lvDeleted.Items.Clear;
    end;  
    //��δ�������ݴ���                                
  end;
end;

procedure TfrmEasyPlateManage.DeleteTmpNode;
begin
  if tvSysDirectory.Items.Count = 1 then
  begin
    if tvSysDirectory.Items[0].Text = AText then
      tvSysDirectory.Items[0].Delete;
  end;
end;

procedure TfrmEasyPlateManage.btnDeleteClick(Sender: TObject);
var
  ASelectedNode: TTreeNode;
  TmpListItem  : TListItem;
  I            : Integer;
begin
  inherited;
  //�ж��Ƿ�����ʱ�ڵ㣬����ɾ��
  DeleteTmpNode;
  ASelectedNode := tvSysDirectory.Selected;
  if ASelectedNode = nil then
  begin
    Application.MessageBox('��ѡ��Ҫɾ���Ľڵ㣡', '��ʾ', MB_OK + 
      MB_ICONINFORMATION);
    Exit;  
  end;
  TmpListItem := lvDeleted.Items.Add;
  TmpListItem.Caption := PEasytvDirectoryRecord(ASelectedNode.Data)^.sCName;
  for I := Low(tvTmpData) to High(tvTmpData) do
  begin
    if tvTmpData[I]^.sGUID = PEasytvDirectoryRecord(ASelectedNode.Data)^.sGUID then
      tvTmpData[I]^.sFlag := Easy_Del;
  end;  
  tvSysDirectory.Items.Delete(ASelectedNode);
end;

procedure TfrmEasyPlateManage.btnRefreshClick(Sender: TObject);
begin
  inherited;
  tvSysDirectory.Items.Clear;
  AAddedTreeGUID.Clear;

  DisposeArrayTvDirectory('0');
  //2010-10-31 18:30:41 + 
  DisposeArrayTvParams('0');
  lvParamers.Items.Clear;

  InitDirectoryData;
  //����Ŀ¼��
  GenerateTreeView(tvSysDirectory, tvTmpData, ParentNodeFlag);
end;

procedure TfrmEasyPlateManage.btnCancelClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  DisposeArrayTvDirectory('1');

  lvParamers.Items.Clear;
  AAddedTreeGUID.Clear;
  lvDeleted.Items.Clear;

  for I := Low(tvTmpData) to High(tvTmpData) do
  begin
    if tvTmpData[I]^.sFlag <> '' then
      tvTmpData[I]^.sFlag := '';
  end;  

  //����Ŀ¼��
  GenerateTreeView(tvSysDirectory, tvTmpData, ParentNodeFlag);
end;

procedure TfrmEasyPlateManage.DisposeArrayTvDirectory(AFlag: string = '0');
var
  I: Integer;
begin
  if AFlag = '0' then
  begin
    for I := Low(tvTmpData) to High(tvTmpData) do
      Dispose(tvTmpData[I]);
    SetLength(tvTmpData, 0);
  end
  else
  if AFlag = '1' then
  begin
    for I := Low(tvTmpData) to High(tvTmpData) do
    begin
      if tvTmpData[I]^.sCName = '' then
        Dispose(tvTmpData[I]);
    end;
  end;
end;

procedure TfrmEasyPlateManage.InitDirectoryData;
var
  I: Integer;
begin
  if cdsDirManager.Active then
    cdsDirManager.Close;
  //��ʼ��ϵͳĿ¼����
  cdsDirManager.CommandText := '';
  cdsDirManager.CommandText := 'SELECT * FROM vw_sysPlugins ORDER BY bDir, iOrder';
  cdsDirManager.Open;
  cdsDirManager.First;  //*
  for I := 0 to cdsDirManager.RecordCount - 1 do
  begin
    SetLength(tvTmpData, Length(tvTmpData) + 1);
    New(tvTmpData[High(tvTmpData)]);

    tvTmpData[High(tvTmpData)]^.sGUID := cdsDirManager.fieldbyname('GUID').AsString;
    tvTmpData[High(tvTmpData)]^.sEName := cdsDirManager.fieldbyname('sEName').AsString;
    tvTmpData[High(tvTmpData)]^.sCName := cdsDirManager.fieldbyname('sCName').AsString;
    tvTmpData[High(tvTmpData)]^.iOrder := cdsDirManager.fieldbyname('iOrder').AsInteger;
    tvTmpData[High(tvTmpData)]^.iImage1 := cdsDirManager.fieldbyname('iImage1').AsInteger;
    tvTmpData[High(tvTmpData)]^.iImage2 := cdsDirManager.fieldbyname('iImage2').AsInteger;
    tvTmpData[High(tvTmpData)]^.iFlag := cdsDirManager.fieldbyname('iFlag').AsInteger;
    tvTmpData[High(tvTmpData)]^.sParentGUID := cdsDirManager.fieldbyname('sParentGUID').AsString;
    tvTmpData[High(tvTmpData)]^.bDir := cdsDirManager.fieldbyname('bDir').AsInteger;
    tvTmpData[High(tvTmpData)]^.sPluginFileName := cdsDirManager.fieldbyname('sPluginFileName').AsString;
    //����
    if cdsDirManager.fieldbyname('bDir').AsInteger = 1 then
    begin
      SetLength(tvTmpParamsData, Length(tvTmpParamsData) + 1);
      New(tvTmpParamsData[High(tvTmpParamsData)]);
      tvTmpParamsData[High(tvTmpParamsData)]^.ParamGUID := cdsDirManager.fieldbyname('ParamGUID').AsString;
      tvTmpParamsData[High(tvTmpParamsData)]^.sPluginGUID := cdsDirManager.fieldbyname('PlugGUID').AsString;
      tvTmpParamsData[High(tvTmpParamsData)]^.sParamEName := cdsDirManager.fieldbyname('sParamEName').AsString;
      tvTmpParamsData[High(tvTmpParamsData)]^.sParamCName := cdsDirManager.fieldbyname('sParamCName').AsString;
      tvTmpParamsData[High(tvTmpParamsData)]^.sValueType := cdsDirManager.fieldbyname('sValueType').AsString;
      tvTmpParamsData[High(tvTmpParamsData)]^.sValue := cdsDirManager.fieldbyname('sValue').AsString;
    end;

    cdsDirManager.Next;
  end;
end;

procedure TfrmEasyPlateManage.LoadChildTreeNodes(ATreeView: TEasyTreeView;
  AData: array of PEasytvDirectoryRecord; ParentNode: TTreeNode);
var
  I       : Integer;
  ATmpNode: TTreeNode;
begin
  with ATreeView do
  begin
    for I := Low(AData) to High(AData) do
    begin
      if (AData[I]^.sParentGUID = PEasytvDirectoryRecord(ParentNode.Data)^.sGUID) and
         (AData[I]^.sCName <> '') and (AData[I]^.sFlag <> Easy_Del)
          and (AAddedTreeGUID.IndexOf(AData[I]^.sGUID) = -1) then
      begin
        ATmpNode := ATreeView.Items.AddChildObject(ParentNode, AData[I]^.sCName, AData[I]);
        ATmpNode.ImageIndex := AData[I]^.iImage1;
        ATmpNode.SelectedIndex := AData[I]^.iImage2;
        
        AAddedTreeGUID.Add(AData[I]^.sGUID);
        //������ʱ�ڵ� ֻ��Ŀ¼
        if AData[I]^.bDir = 0 then
          ATreeView.Items.AddChildFirst(ATmpNode, 'TempChildNode');
      end;
    end;
  end;
end;

procedure TfrmEasyPlateManage.tvSysDirectoryExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  if Node.HasChildren then
  begin
    if Node.Item[0].Text = 'TempChildNode' then
    begin
      Node.Item[0].Delete;
      LoadChildTreeNodes(tvSysDirectory, tvTmpData, Node);
    end;
  end;
end;

procedure TfrmEasyPlateManage.tvSysDirectoryDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var 
  AnItem: TTreeNode;
  AttachMode: TNodeAttachMode;
  HT: THitTests;
begin
  if tvSysDirectory.Selected = nil then Exit;
  AttachMode := naAdd;
  HT := tvSysDirectory.GetHitTestInfoAt(X, Y);
  AnItem := tvSysDirectory.GetNodeAt(X, Y);
  if (HT - [htOnItem, htOnIcon, htNowhere, htOnIndent] <> HT) then 
  begin
    if (htOnItem in HT) or (htOnIcon in HT) then
      AttachMode := naAddChild
    else
    if htNowhere in HT then
      AttachMode := naAdd
    else
    if htOnIndent in HT then
      AttachMode := naInsert;
    tvSysDirectory.Selected.MoveTo(AnItem, AttachMode);
    //�����ƶ��ڵ���ϼ��ڵ� �����ø���״̬
    if AnItem.Data <> nil then
    begin
      PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sParentGUID :=
                             PEasytvDirectoryRecord(AnItem.Data)^.sGUID;
      //������������Ľڵ�ͽ�����־��Ϊ�༭״̬
      if PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sFlag <> Easy_Add then
        PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sFlag := Easy_Edit;
    end;
  end;
end;

procedure TfrmEasyPlateManage.tvSysDirectoryMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  //�ж�������²���������һ������Ͽ�ʼʵ����ק}
  if (Button = mbLeft) and (htOnItem in tvSysDirectory.GetHitTestInfoAt(X, Y)) then
    tvSysDirectory.BeginDrag(False);
end;

procedure TfrmEasyPlateManage.tvSysDirectoryDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var   
  Node: TTreeNode;   
begin
  if Source = tvSysDirectory then
  begin
    Node := tvSysDirectory.GetNodeAt(X, Y);   {ȡ��ǰ���}
    if Node <> nil then   {��ǰ��㲻Ϊ�ղ���ʵ����ק��accept:=true}
      Accept := True;
  end;   
end;

procedure TfrmEasyPlateManage.N6Click(Sender: TObject);
begin
  inherited;
  tvSysDirectory.FullExpand;
end;

procedure TfrmEasyPlateManage.N7Click(Sender: TObject);
begin
  inherited;
  tvSysDirectory.FullCollapse;
end;

procedure TfrmEasyPlateManage.ppTVRefreshClick(Sender: TObject);
begin
  inherited;
  btnRefreshClick(Sender);
end;

procedure TfrmEasyPlateManage.tvSysDirectoryChange(Sender: TObject;
  Node: TTreeNode);
var
  TmpListItem: TListItem;
  I          : Integer;
begin
  inherited;
  DeleteTmpNode();
  lvParamers.Items.Clear;

  if PEasytvDirectoryRecord(Node.Data)^.bDir = 1 then
  begin
    for I := Low(tvTmpParamsData) to High(tvTmpParamsData) do
    begin
      if (PEasytvParamsRecord(tvTmpParamsData[I])^.sPluginGUID
         = PEasytvDirectoryRecord(Node.Data)^.sGUID)
         and (PEasytvParamsRecord(tvTmpParamsData[I])^.sParamEName <> '') then
      begin
        TmpListItem := lvParamers.Items.Add;
        //2010-10-31 18:29:46  ������Ϊ��ʾӢ������
        TmpListItem.Caption := PEasytvParamsRecord(tvTmpParamsData[I])^.sParamEName;
        TmpListItem.SubItems.Add(PEasytvParamsRecord(tvTmpParamsData[I])^.sValue);
      end;
    end;
  end;
end;

procedure TfrmEasyPlateManage.FormDestroy(Sender: TObject);
begin
  inherited;
  AAddedTreeGUID.Free;
end;

procedure TfrmEasyPlateManage.btnParamEditClick(Sender: TObject);
var
  I       : Integer;
  ATmpParamData: PEasytvParamsRecord;
begin
  inherited;
  if lvParamers.Selected <> nil then
  begin
    for I := Low(tvTmpParamsData) to High(tvTmpParamsData) do
    begin
      if (tvTmpParamsData[I]^.sPluginGUID
        = PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sGUID)
        and (tvTmpParamsData[I]^.sParamEName = lvParamers.Selected.Caption) then
      begin
        ATmpParamData := tvTmpParamsData[I];
        Break;
      end;  
    end;
    if ATmpParamData <> nil then
      ShowfrmPlugParamsOP(ATmpParamData, Easy_Edit);
  end
  else
  begin
    Application.MessageBox('��ѡ��Ҫ���༭���Ĳ�����', '��ʾ', MB_OK + 
      MB_ICONINFORMATION);
    Exit;  
  end;
  if ATmpParamData <> nil then
  begin
    UpdateParam(ATmpParamData);
    lvParamers.Selected.Caption := ATmpParamData^.sParamEName;
    lvParamers.Selected.SubItems[0] := ATmpParamData^.sValue;
  end;  
end;

procedure TfrmEasyPlateManage.btnParamDeleteClick(Sender: TObject);
var
  I:  Integer;
  ATmpParamData: PEasytvParamsRecord;
begin
  inherited;
  if lvParamers.Selected <> nil then
  begin
    if Application.MessageBox(PChar('ȷ��Ҫɾ����' + lvParamers.Selected.Caption
             + '��������'), '��ʾ', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
    begin
      for I := Low(tvTmpParamsData) to High(tvTmpParamsData) do
      begin
        if (tvTmpParamsData[I]^.sPluginGUID
          = PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sGUID)
          and (tvTmpParamsData[I]^.sParamEName = lvParamers.Selected.Caption) then
        begin
          ATmpParamData := tvTmpParamsData[I];
          Break;
        end;
      end;
      if ATmpParamData <> nil then
      begin
        if DeleteParam(ATmpParamData) then
          lvParamers.DeleteSelected;
      end;  
    end;
  end
  else
  begin
    Application.MessageBox('��ѡ��Ҫ��ɾ�����Ĳ�����', '��ʾ', MB_OK +
      MB_ICONINFORMATION);
    Exit;
  end;
end;

procedure TfrmEasyPlateManage.btnParamAddClick(Sender: TObject);
var
  ATmpParamData: PEasytvParamsRecord;
  TmpListItem: TListItem;
begin
  inherited;
  if tvSysDirectory.Selected <> nil then
  begin
    if PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.bDir = 1 then
    begin
      SetLength(tvTmpParamsData, Length(tvTmpParamsData) + 1);
      New(tvTmpParamsData[High(tvTmpParamsData)]);
      ATmpParamData := tvTmpParamsData[High(tvTmpParamsData)];
      //����ʱ��ʼ��
      ATmpParamData^.ParamGUID := GenerateGUID;
      ATmpParamData^.sPluginGUID := PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sGUID;

      ShowfrmPlugParamsOP(ATmpParamData, Easy_Add);
    end
    else
    begin
      Application.MessageBox('ֻ�ܶԡ�������ļ���Ӳ�����', '��ʾ', MB_OK +
        MB_ICONWARNING);
      Exit;
    end;
  end
  else
  begin
      Application.MessageBox('��ѡ��Ҫ��Ӳ����ġ�������ļ���', '��ʾ', MB_OK +
        MB_ICONWARNING);
      Exit;
  end;
  //ִ�б���
  if Trim(tvTmpParamsData[High(tvTmpParamsData)]^.sParamEName) <> '' then
  begin
    if tvTmpParamsData[High(tvTmpParamsData)] <> nil then
    begin
      if InsertParam(tvTmpParamsData[High(tvTmpParamsData)]) then
      begin
        TmpListItem := lvParamers.Items.Add;
        TmpListItem.Caption := tvTmpParamsData[High(tvTmpParamsData)]^.sParamEName;
        TmpListItem.SubItems.Add(tvTmpParamsData[High(tvTmpParamsData)]^.sValue);
      end;
    end;
  end;   
end;

procedure TfrmEasyPlateManage.DisposeArrayTvParams(AFlag: string);
var
  I: Integer;
begin
  if AFlag = '0' then
  begin
    for I := Low(tvTmpParamsData) to High(tvTmpParamsData) do
      Dispose(tvTmpParamsData[I]);
    SetLength(tvTmpParamsData, 0);
  end
  else
  if AFlag = '1' then
  begin
    for I := Low(tvTmpParamsData) to High(tvTmpParamsData) do
    begin
      if tvTmpParamsData[I]^.sParamEName = '' then
        Dispose(tvTmpParamsData[I]);
    end;
  end;
end;

function TfrmEasyPlateManage.DeleteParam(
  AData: PEasytvParamsRecord): Boolean;
var
  DelSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    DelSQL := ' DELETE FROM sysPluginParams WHERE GUID = ' + QuotedStr(AData^.ParamGUID);
    cdsDirManager.CommandText := DelSQL;
    cdsDirManager.Execute;
    //ִ����־���
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '��ɾ��������'
                      + AData^.sParamEName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('ɾ����' + AData^.sParamEName +'������,ԭ��:' + e.Message), '��ʾ',
                            MB_OK + MB_ICONSTOP);
  end;
end;

function TfrmEasyPlateManage.InsertParam(
  AData: PEasytvParamsRecord): Boolean;
var
  InsSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    InsSQL := ' INSERT INTO sysPluginParams (GUID, PlugGUID, sEName, sCName, sValueType,'
              + ' sValue) VALUES ('
              + QuotedStr(AData^.ParamGUID)
              + ',' + QuotedStr(AData^.sPluginGUID)
              + ',' + QuotedStr(AData^.sParamEName)
              + ',' + QuotedStr(AData^.sParamCName)
              + ',' + QuotedStr(AData^.sValueType)
              + ',' + QuotedStr(AData^.sValue)
              + ')';
    cdsDirManager.CommandText := InsSQL;
    cdsDirManager.Execute;
    //ִ����־���
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '������������'
                        + AData^.sParamEName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('���롾' + AData^.sParamEName +'������,ԭ��:' + e.Message), '��ʾ',
                            MB_OK + MB_ICONSTOP);
  end;
end;

function TfrmEasyPlateManage.UpdateParam(
  AData: PEasytvParamsRecord): Boolean;
var
  UdpSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    UdpSQL := ' Update sysPluginParams SET '
              + ' sEName = ' + QuotedStr(AData^.sParamEName) + ','
              + ' sValue = ' + QuotedStr(AData^.sValue) + ' '
              + ' WHERE GUID = ' + QuotedStr(AData^.ParamGUID);
    cdsDirManager.CommandText := UdpSQL;
    cdsDirManager.Execute;
    //ִ����־���
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '���޸Ĳ�����'
                        + AData^.sParamEName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('���¡�' + AData^.sParamEName +'������,ԭ��:' + e.Message), '��ʾ',
                            MB_OK + MB_ICONSTOP);
  end;
end;

procedure TfrmEasyPlateManage.pgcSystemManagerChange(Sender: TObject);
begin
  inherited;
  //�л���ģ������
  if pgcSystemManager.ActivePage = tbsModulesUpdate then
  begin
    if tvModules.Items.Count <= 0 then
    begin
      AAddedTreeGUID.Clear;
      InitTvModules;
    end;
  end;
end;

procedure TfrmEasyPlateManage.InitTvModules;
begin
  //����Ŀ¼��
  GenerateTreeView(tvModules, tvTmpData, ParentNodeFlag);
end;

end.
