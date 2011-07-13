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
//------------------------------------------------------------------------------}
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

  TEasyRefreshType = (ertSaveRefresh, ertNoSaveRefresh);

  TfrmEasyPlateManage = class(TfrmEasyPlateDBBaseForm)
    cdsDirManager: TClientDataSet;
    imgTv: TImageList;
    tvNavPP: TEasyPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    ppTVRefresh: TMenuItem;
    EasyMenuOfficeStyler1: TEasyMenuOfficeStyler;
    imglv: TImageList;
    imglvDel: TImageList;
    EasyPanel11: TEasyPanel;
    Splitter2: TSplitter;
    EasyPanel12: TEasyPanel;
    tvSysDirectory: TEasyTreeView;
    EasyPanel13: TEasyPanel;
    btnAdd: TEasyBitButton;
    btnInsert: TEasyBitButton;
    btnEdit: TEasyBitButton;
    btnRefresh: TEasyBitButton;
    btnDelete: TEasyBitButton;
    pgcDirOperate: TEasyPageControl;
    EasyTabSheet3: TEasyTabSheet;
    EasyLabel4: TEasyLabel;
    EasyLabel6: TEasyLabel;
    lvParamers: TListView;
    btnParamAdd: TEasyBitButton;
    btnParamEdit: TEasyBitButton;
    btnParamDelete: TEasyBitButton;
    lvDeleted: TListView;
    btnSave: TEasyBitButton;
    btnCancel: TEasyBitButton;
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
    procedure btnParamEditClick(Sender: TObject);
    procedure btnParamDeleteClick(Sender: TObject);
    procedure btnParamAddClick(Sender: TObject);
  private
    { Private declarations }
//    tvTmpData: array of PEasytvDirectoryRecord;  //�洢�����ݿⷵ�ص�����
//    tvTmpParamsData: array of PEasytvParamsRecord; //�����б�

    //��ʼ������ֻ���ɵ�һ��ڵ�
    procedure GenerateTreeView(ATreeView: TEasyTreeView;
                               var AData: TList;
                               RootFlag: string);
    //�����ӽڵ�
    procedure LoadChildTreeNodes(ATreeView: TEasyTreeView;
                               var AData: TList;
                               ParentNode: TTreeNode);
    //ˢ����
    procedure RefreshDirectoryTreeView(AEasyRefreshType: TEasyRefreshType);

    procedure InitDirectoryData;
    //���Ľڵ���ϼ��ڵ�
    procedure ChangePluginParentGUID(Data: Pointer; ClientDataSet: TClientDataSet);
    //ɾ�����ɵ���ʱ�ڵ�
    procedure DeleteTmpNode(AText: string = '����Ŀ¼�ṹ');
  public
    { Public declarations }
  end;

var
  frmEasyPlateManage: TfrmEasyPlateManage;

implementation

{$R *.dfm}

uses
  untTvDirectoryOper, ActiveX, untEasyUtilDLL, untPlugParamsOP, untEasyClassPluginDirectory,
  untEasyUtilMethod;


var
  //������Ӧ�����ֱ�־ ���� �޸� ɾ��
  Easy_Add :string= 'Add';
  Easy_Edit :string= 'Edit';
  Easy_Del :string= 'Del';

  ParentNodeFlag :string = '{00000000-0000-0000-0000-000000000000}';
  APluginDirectoryList: TList;
  
//��������ʵ��
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyPlateManage := TfrmEasyPlateManage.Create(Application);
  Application.Handle := frmEasyPlateManage.EasyApplicationHandle;
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
  //���Ŀ¼������
  APluginDirectoryList := TList.Create;
  
  //��ʼ����ҳ��ʾҳ��
  pgcDirOperate.ActivePageIndex := 0;

  //����������Ҫ��ͼƬ
  ABitMap := TBitmap.Create;
  ABitMap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'images\Tree.bmp');
  imgTv.Add(ABitMap, nil);
  ABitMap.Free;
  //��ʼ������
  InitDirectoryData;
  //����Ŀ¼��
  GenerateTreeView(tvSysDirectory, APluginDirectoryList, ParentNodeFlag);
  //Ŀ¼��ֻ��
  tvSysDirectory.ReadOnly := True;
end;

procedure TfrmEasyPlateManage.GenerateTreeView(ATreeView: TEasyTreeView;
  var AData: TList; RootFlag: string);
var
  I       : Integer;
  ATmpNode: TTreeNode;
begin
  ATreeView.Items.Clear;
  with ATreeView do
  begin
    for I := 0 to AData.Count - 1 do
    begin
      with TEasysysPluginsDirectory(AData[I]) do
      begin
        if (ParentPluginGUID = RootFlag) and (PluginName <> '') then
        begin
          ATmpNode := ATreeView.Items.AddChildObject(nil, PluginName, AData[I]);
          ATmpNode.ImageIndex := ImageIndex;
          ATmpNode.SelectedIndex := SelectedImageIndex;

          //������ʱ�ڵ� ֻ��Ŀ¼
          if IsDirectory then
            ATreeView.Items.AddChildFirst(ATmpNode, 'TempChildNode');
        end;
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

procedure TfrmEasyPlateManage.btnAddClick(Sender: TObject);
var
  AEasysysPluginsDirectory: TEasysysPluginsDirectory;
begin
  inherited;
  DeleteTmpNode;
  AEasysysPluginsDirectory := TEasysysPluginsDirectory.Create;
  ShowfrmTvDirectoryOper(AEasysysPluginsDirectory, Easy_Add);
//  if tvTmpData[High(tvTmpData)]^.sCName <> '' then
//    GenerateTreeNode(tvSysDirectory, tvTmpData[High(tvTmpData)], nil);
  if frmEasyPlateManage.cdsDirManager.ChangeCount > 0 then
    frmEasyPlateManage.cdsDirManager.CancelUpdates;
end;

{procedure TfrmEasyPlateManage.GenerateTreeNode(ATreeView: TEasyTreeView;
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
end;    }

procedure TfrmEasyPlateManage.btnInsertClick(Sender: TObject);
begin
  inherited;
 { DeleteTmpNode;
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
    GenerateTreeNode(tvSysDirectory, tvTmpData[High(tvTmpData)], tvSysDirectory.Selected); }
end;

procedure TfrmEasyPlateManage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  EasyFreeAndNilList(APluginDirectoryList);
end;

procedure TfrmEasyPlateManage.btnEditClick(Sender: TObject);
var
  ASelectedNode: TTreeNode;
//  TmpData      : PEasytvDirectoryRecord;
begin
  inherited;
 { DeleteTmpNode;
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
  ASelectedNode.Text := TmpData^.sCName;    }
end;

procedure TfrmEasyPlateManage.btnSaveClick(Sender: TObject);
var
  I, J: Integer;
  ADivValue: Integer; //�������ķ���
begin
  inherited;
{  J := 0;
  ADivValue := 100 div High(tvTmpData);
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
    end;
    if J > 0 then
    begin
      Application.MessageBox('�ύ��ɣ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
      btnRefreshClick(Sender);
      lvDeleted.Items.Clear;
    end
    else
    begin
      Application.MessageBox('û��Ҫ�ύ�ĸ��ģ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    end;
  except on e:Exception do
    if Application.MessageBox(PChar('�ύ����,ԭ��' + e.Message
              + '����ɲ鿴��������־����'), '��ʾ', MB_OKCANCEL + MB_ICONWARNING) = IDOK then
    begin
      pgcSystemManager.ActivePage := tbsOPLog;
      lvDeleted.Items.Clear;
    end
    else
    begin
      lvDeleted.Items.Clear;
    end;  
    //��δ�������ݴ���                                
  end;  }
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
//  TmpListItem.Caption := PEasytvDirectoryRecord(ASelectedNode.Data)^.sCName;
  {for I := Low(tvTmpData) to High(tvTmpData) do
  begin
    if tvTmpData[I]^.sGUID = PEasytvDirectoryRecord(ASelectedNode.Data)^.sGUID then
      tvTmpData[I]^.sFlag := Easy_Del;
  end;  
  tvSysDirectory.Items.Delete(ASelectedNode);   }
end;

procedure TfrmEasyPlateManage.btnRefreshClick(Sender: TObject);
begin
  inherited;
  if cdsDirManager.ChangeCount > 0 then
  begin
    case Application.MessageBox(PChar('Ŀ¼�ṹ�ѷ�������,�Ƿ񱣴�?'), PChar('��ʾ'),
      MB_YESNOCANCEL + MB_ICONQUESTION) of
      IDYES:
        begin
          //���沢ˢ����
          frmEasyPlateManage.RefreshDirectoryTreeView(ertSaveRefresh);
        end;
      IDNO:
        begin
          //ȡ�����²�ˢ����
          frmEasyPlateManage.RefreshDirectoryTreeView(ertNoSaveRefresh);
        end;
    end;
  end else
    RefreshDirectoryTreeView(ertNoSaveRefresh);
end;

procedure TfrmEasyPlateManage.btnCancelClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;

  lvParamers.Items.Clear;
  lvDeleted.Items.Clear;

//  for I := Low(tvTmpData) to High(tvTmpData) do
//  begin
//    if tvTmpData[I]^.sFlag <> '' then
//      tvTmpData[I]^.sFlag := '';
//  end;

  //����Ŀ¼��
//  GenerateTreeView(tvSysDirectory, PluginDirectoryList, ParentNodeFlag);
end;

procedure TfrmEasyPlateManage.InitDirectoryData;
var
  ATmpData: OleVariant;
begin
  if cdsDirManager.Active then
    cdsDirManager.Close;
  //��ʼ��ϵͳĿ¼����
  cdsDirManager.Data := EasyRDMDisp.EasyGetRDMData('SELECT * FROM vwSysPluginsDirectory ORDER BY IsDirectory, iOrder');
  cdsDirManager.Active := True;
  ATmpData := cdsDirManager.Data;
  TEasysysPluginsDirectory.GeneratePluginDirectoryList(ATmpData, APluginDirectoryList);
end;

procedure TfrmEasyPlateManage.LoadChildTreeNodes(ATreeView: TEasyTreeView;
                               var AData: TList; ParentNode: TTreeNode);
var
  I       : Integer;
  ATmpNode: TTreeNode;
begin
  with ATreeView do
  begin
    for I := 0 to AData.Count - 1 do
    begin
      with TEasysysPluginsDirectory(AData[I]) do
      begin
        if ParentPluginGUID = TEasysysPluginsDirectory(ParentNode.Data).PluginGUID then
        begin
          ATmpNode := ATreeView.Items.AddChildObject(ParentNode, PluginName, AData[I]);
          ATmpNode.ImageIndex := ImageIndex;
          ATmpNode.SelectedIndex := SelectedImageIndex;

          //������ʱ�ڵ� ֻ��Ŀ¼
          if IsDirectory then
            ATreeView.Items.AddChildFirst(ATmpNode, 'TempChildNode');
        end;
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
      LoadChildTreeNodes(tvSysDirectory, APluginDirectoryList, Node);
    end;
  end;
end;

procedure TfrmEasyPlateManage.tvSysDirectoryDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var 
  AnItem    : TTreeNode;            //Ŀ��ڵ�
  AttachMode: TNodeAttachMode;
  HT        : THitTests;
  SelectedPluginGUID,
  NewParentGUID: string;
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

    SelectedPluginGUID := TEasysysPluginsDirectory(tvSysDirectory.Selected.Data).PluginGUID;
    //�����ƶ��ڵ���ϼ��ڵ� �����ø���״̬
    if AnItem = nil then  //�ϼ��ڵ�Ϊ�գ���ѡ�нڵ�����Ϊ���ڵ�
    begin
      //���¶����ͬʱ�������ݼ�
      TEasysysPluginsDirectory(tvSysDirectory.Selected.Data).ParentPluginGUID := ParentNodeFlag;
      with cdsDirManager do
      begin
        if Locate('PluginGUID', VarArrayOf([SelectedPluginGUID]), [loCaseInsensitive]) then
        begin
          Edit;
          FieldByName('ParentPluginGUID').AsString := ParentNodeFlag;
          Post;
        end;
      end;
    end else //�ϼ��ڵ㲻Ϊ�գ���ѡ�нڵ�����Ϊ�ӽڵ�
    begin
      //���ϼ��ڵ�GUDI
      NewParentGUID := TEasysysPluginsDirectory(AnItem.Data).PluginGUID;
      //���¶����ͬʱ�������ݼ�
      TEasysysPluginsDirectory(tvSysDirectory.Selected.Data).ParentPluginGUID := NewParentGUID;
      with cdsDirManager do
      begin
        if Locate('PluginGUID', VarArrayOf([SelectedPluginGUID]), [loCaseInsensitive]) then
        begin
          Edit;
          FieldByName('ParentPluginGUID').AsString := NewParentGUID;
          Post;
        end;
      end;
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
//  DeleteTmpNode();
//  lvParamers.Items.Clear;

 { if PEasytvDirectoryRecord(Node.Data)^.bDir = 1 then
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
  end;  }
end;

procedure TfrmEasyPlateManage.btnParamEditClick(Sender: TObject);
var
  I       : Integer;
//  ATmpParamData: PEasytvParamsRecord;
begin
  inherited;
 { if lvParamers.Selected <> nil then
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
  end;   }
end;

procedure TfrmEasyPlateManage.btnParamDeleteClick(Sender: TObject);
var
  I:  Integer;
//  ATmpParamData: PEasytvParamsRecord;
begin
  inherited;
 { if lvParamers.Selected <> nil then
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
  end;  }
end;

procedure TfrmEasyPlateManage.btnParamAddClick(Sender: TObject);
var
//  ATmpParamData: PEasytvParamsRecord;
  TmpListItem: TListItem;
begin
  inherited;
{  if tvSysDirectory.Selected <> nil then
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
  end;}
end;

procedure TfrmEasyPlateManage.ChangePluginParentGUID(Data: Pointer;
  ClientDataSet: TClientDataSet);
begin

end;

procedure TfrmEasyPlateManage.RefreshDirectoryTreeView(AEasyRefreshType: TEasyRefreshType);
var
  ATmpData: OleVariant;
  AErrorCode: Integer;
begin
  //�����
  tvSysDirectory.Items.Clear;
  //����Ѽ��ز�������������ͷ�
  while (APluginDirectoryList.Count > 0) do
  begin
    TEasysysPluginsDirectory(APluginDirectoryList[0]).Free;
    APluginDirectoryList.Delete(0);
  end;
  //�ȱ��� ��ʼ������
  if AEasyRefreshType = ertSaveRefresh then
  begin   //sysPluginsDirectory
    cdsDirManager.Data := EasyRDMDisp.EasySaveRDMData('sysPluginsDirectory', cdsDirManager.Delta, 'PluginGUID', AErrorCode);
    cdsDirManager.SaveToFile('c:\error.xml', dfXMLUTF8);
    ShowMessage(IntToStr(AErrorCode));
    InitDirectoryData;
  end else
  if AEasyRefreshType = ertNoSaveRefresh then
  begin
    //ȡ�����£��������ɶ���
    frmEasyPlateManage.cdsDirManager.CancelUpdates;
    ATmpData := frmEasyPlateManage.cdsDirManager.Data;
    TEasysysPluginsDirectory.GeneratePluginDirectoryList(ATmpData, APluginDirectoryList);
  end;
  //����Ŀ¼��
  GenerateTreeView(tvSysDirectory, APluginDirectoryList, ParentNodeFlag);
  //2010-10-31 18:30:41 +
  //�����ɾ���Ĳ�����
  lvParamers.Items.Clear;
end;

end.
