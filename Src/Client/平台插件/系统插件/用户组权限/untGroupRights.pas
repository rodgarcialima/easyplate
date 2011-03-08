unit untGroupRights;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, ExtCtrls, untEasyGroupBox, untGroupRightsObjects,
  untEasyToolBar, untEasyToolBarStylers, ComCtrls, untEasyTreeView, ImgList,
  DB, DBClient, StdCtrls;

  //�����������
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmGroupRights = class(TfrmEasyPlateDBBaseForm)
    EasyPanel1: TEasyPanel;
    EasyPanel3: TEasyPanel;
    EasyPanel4: TEasyPanel;
    EasyDockPanel1: TEasyDockPanel;
    EasyToolBar1: TEasyToolBar;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    Splitter1: TSplitter;
    tvUserGroups: TEasyTreeView;
    EasyToolBarButton1: TEasyToolBarButton;
    imgUserGroup: TImageList;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarButton4: TEasyToolBarButton;
    EasyToolBarButton5: TEasyToolBarButton;
    cdsGroups: TClientDataSet;
    cdsUsers: TClientDataSet;
    cdsResources: TClientDataSet;
    EasyPanel2: TEasyPanel;
    EasyPanel5: TEasyPanel;
    EasyPanel6: TEasyPanel;
    Splitter2: TSplitter;
    EasyPanel7: TEasyPanel;
    Splitter3: TSplitter;
    EasyPanel8: TEasyPanel;
    tvUserRoles: TEasyTreeView;
    EasyPanel9: TEasyPanel;
    tvUsers: TEasyTreeView;
    tvCheckRights: TEasyCheckTree;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tvUserGroupsClick(Sender: TObject);
    procedure tvUserRolesClick(Sender: TObject);
  private
    { Private declarations }
    FGroupCompanyList,
    FGroupDeptList,
    FGroupRoleList,
    FGroupUserList,
    FGroupRightList: TList;
//    procedure GenerateTree(ATree: TEasyTreeView; AClientDataSet: TClientDataSet;
//                            ARoot)
    //�û���--��˾
    procedure InitGroupsTree(AClientDataSet: TClientDataSet);
    function InitRootGroupTree(AClientDataSet: TClientDataSet): TTreeNode;
    function ExistsGroupCompany(AKeyStr: string): Boolean;
    //�û���--����
    function InitRootDeptTree(AClientDataSet: TClientDataSet): TTreeNode;
    function FindGroupCompany(ACompanyGUID: string): TTreeNode;
    function InitDeptTree(AClientDataSet: TClientDataSet): TTreeNode;
    function FindGroupDept(ADeptGUID: string): TTreeNode;
    //�û���--��ɫ
    procedure InitRoleTree(AClientDataSet: TClientDataSet; ADeptGUID: string);

    //��ʾ�����µĽ�ɫ��Ϣ
    function GetDeptGUID(APointer: Pointer): string;
    procedure DisplayRoles(ADeptGUID: string);
    procedure DisposeGroupRoleList;

    //��ʾ��ɫ�¶�Ӧ��Ա��
    function GetRoleGUID(APointer: Pointer): string;
    procedure DisplayUsers(ARoleGUID: string);
    procedure InitUserTree(AClientDataSet: TClientDataSet; ARoleGUID: string);
    procedure DisposeGroupUserList;

    //��ʾ��ɫ����Ӧ��Ȩ����Դ
    procedure DisplayRole_Resources(ARoleGUID: string);
    //ϵͳȨ����
    procedure InitRightsTree(AClientDataSet: TClientDataSet);
    function FindRigthParentNode(AParentRightGUID: string): TTreeNode;
  public
    { Public declarations }
  end;

var
  frmGroupRights: TfrmGroupRights;

implementation

{$R *.dfm}

//��������ʵ��
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmGroupRights := TfrmGroupRights.Create(Application);
  if frmGroupRights.FormStyle <> fsMDIChild then
    frmGroupRights.FormStyle := fsMDIChild;
  if frmGroupRights.WindowState <> wsMaximized then
    frmGroupRights.WindowState := wsMaximized;
  Result := frmGroupRights;
end;

//�˹�˾�Ƿ������ɶ�Ӧ���ڵ�
function TfrmGroupRights.ExistsGroupCompany(AKeyStr: string): Boolean;
var
  J: Integer;
begin
  Result := False;
  for J := 0 to FGroupCompanyList.Count - 1 do
  begin
    if TGroupCompany(FGroupCompanyList.Items[J]).GUID = AKeyStr then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TfrmGroupRights.FormCreate(Sender: TObject);
var
  sGroupsSQL,
  sUsersSQL,
  sResourceSQL: string;
begin
  inherited;
  if not Assigned(FGroupCompanyList) then
    FGroupCompanyList := TList.Create;

  if not Assigned(FGroupDeptList) then
    FGroupDeptList := TList.Create;

  if not Assigned(FGroupRoleList) then
    FGroupRoleList := TList.Create;

  if not Assigned(FGroupUserList) then
    FGroupUserList := TList.Create;

  if not Assigned(FGroupRightList) then
    FGroupRightList := TList.Create;
    
  FormId := '{3477B007-80AE-414E-BF67-9709FEEB3DD8}';

  sGroupsSQL := 'SELECT * FROM vw_Groups ORDER BY sCompanyID, iDeptOrder, iRoleOrder';
  cdsGroups.Data := EasyRDMDisp.EasyGetRDMData(sGroupsSQL);

  sUsersSQL := 'SELECT  LoginGUID, sLoginName, sRoleGUID, sEmployeeGUID, sEmployeeCName,'
               +' sEmployeeEName, sSexGUID FROM vw_InitUser '
               +' WHERE bEnable = 1 ORDER BY iOrderNo';
  cdsUsers.Data := EasyRDMDisp.EasyGetRDMData(sUsersSQL);

  sResourceSQL := 'SELECT * FROM sysResource ORDER BY iOrder';
  cdsResources.Data := EasyRDMDisp.EasyGetRDMData(sResourceSQL);
end;

procedure TfrmGroupRights.InitGroupsTree(AClientDataSet: TClientDataSet);
var
  I            : Integer;
  ARootNode,
  AGroupRootNode: TTreeNode;
  AGroupCompany : TGroupCompany;
begin
  {
    �������
    |--��˾
    |  --����
    |    --��ɫ

    ����һ��
    |--��˾
    |  --����
    |    --����
    |       --��ɫ
    |    --��ɫ
    
    ��ɫ�ĸ��ڵ���Ҫ�����Ȩ�޵ļ̳С����⡢��ʵ�����ṹ
    ��������� ����һ�� ��ʵ��
  }
  //��˾��Ϣ��ʼ������
  //ֻ�����ܹ�˾�ͷֹ�˾���ֹ�ϵ����˾Ƕ��δʵ��
  //��ʼ���ܹ�˾
  tvUserGroups.Items.BeginUpdate;

  AGroupRootNode := InitRootGroupTree(AClientDataSet);

  if AGroupRootNode <> nil then
  begin
    AClientDataSet.Filtered := False;
    AClientDataSet.Filter := 'sParentCompanyGUID <> ' + QuotedStr('{00000000-0000-0000-0000-000000000001}');
    AClientDataSet.Filtered := True;

    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      if not ExistsGroupCompany(AClientDataSet.fieldbyname('CompanyGUID').AsString) then
      begin
        AGroupCompany := TGroupCompany.Create;
        with AGroupCompany do
        begin
          GUID := AClientDataSet.fieldbyname('CompanyGUID').AsString;
          CompanyCName := AClientDataSet.fieldbyname('sCompanyCName').AsString;
          CompanyEName := AClientDataSet.fieldbyname('sCompanyEName').AsString;
          CompanyID := AClientDataSet.fieldbyname('sCompanyID').AsString;
          ParentCompanyGUID := AClientDataSet.fieldbyname('sParentCompanyGUID').AsString;
        end;
        FGroupCompanyList.Add(AGroupCompany);
        ARootNode := tvUserGroups.Items.AddChild(AGroupRootNode, AGroupCompany.CompanyCName);

        ARootNode.ImageIndex := 16;
        ARootNode.SelectedIndex := ARootNode.ImageIndex + 1;

        ARootNode.Data := AGroupCompany;
      end;
      AClientDataSet.Next;
    end;

    AClientDataSet.Filtered := False;
  end
  else
  begin
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      if not ExistsGroupCompany(AClientDataSet.fieldbyname('CompanyGUID').AsString) then
      begin
        AGroupCompany := TGroupCompany.Create;
        with AGroupCompany do
        begin
          GUID := AClientDataSet.fieldbyname('CompanyGUID').AsString;
          CompanyCName := AClientDataSet.fieldbyname('sCompanyCName').AsString;
          CompanyEName := AClientDataSet.fieldbyname('sCompanyEName').AsString;
          CompanyID := AClientDataSet.fieldbyname('sCompanyID').AsString;
          ParentCompanyGUID := AClientDataSet.fieldbyname('sParentCompanyGUID').AsString;
        end;
        FGroupCompanyList.Add(AGroupCompany);
        ARootNode := tvUserGroups.Items.AddChild(nil, AGroupCompany.CompanyCName);

        ARootNode.ImageIndex := 16;
        ARootNode.SelectedIndex := ARootNode.ImageIndex + 1;

        ARootNode.Data := AGroupCompany;
      end;
      AClientDataSet.Next;
    end;
  end;
  //��ʼ��������
  //ʵ�ֲ���Ƕ��
  InitRootDeptTree(cdsGroups);
  //Ƕ�׶�������
  InitDeptTree(cdsGroups);

  tvUserGroups.Items.EndUpdate;
end;

procedure TfrmGroupRights.FormShow(Sender: TObject);
begin
  inherited;

  InitGroupsTree(cdsGroups);

  //��ʼ��Ȩ��
  InitRightsTree(cdsResources);
end;

procedure TfrmGroupRights.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := FGroupCompanyList.Count - 1 downto 0 do
    TObject(FGroupCompanyList.Items[I]).Free;

  for I := FGroupDeptList.Count - 1 downto 0 do
    TObject(FGroupDeptList.Items[I]).Free;

  for I := FGroupUserList.Count - 1 downto 0 do
    TObject(FGroupUserList.Items[I]).Free;

  DisposeGroupRoleList;

  for I := FGroupRightList.Count - 1 downto 0 do
    TObject(FGroupRightList.Items[I]).Free; 
end;

function TfrmGroupRights.InitRootGroupTree(
  AClientDataSet: TClientDataSet): TTreeNode;
var
  AGroupCompany: TGroupCompany;
begin
  Result := nil;
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentCompanyGUID = ' + QuotedStr('{00000000-0000-0000-0000-000000000001}');
  AClientDataSet.Filtered := True;
  //�����ܹ�˾ֻ�������һ�����˴�û���ж�����ֻΪ1������
  if AClientDataSet.RecordCount > 0 then
  begin
    AGroupCompany := TGroupCompany.Create;
    with AGroupCompany do
    begin
      GUID := AClientDataSet.fieldbyname('sCompanyCName').AsString;
      CompanyCName := AClientDataSet.fieldbyname('sCompanyCName').AsString;
      CompanyEName := AClientDataSet.fieldbyname('sCompanyCName').AsString;
      CompanyID := AClientDataSet.fieldbyname('sCompanyCName').AsString;
      ParentCompanyGUID := AClientDataSet.fieldbyname('sParentCompanyGUID').AsString;
    end;
    FGroupCompanyList.Add(AGroupCompany);
    Result := tvUserGroups.Items.AddChild(nil, AGroupCompany.CompanyCName);

    Result.ImageIndex := 12;
    Result.SelectedIndex := Result.ImageIndex + 1;

    Result.Data := AGroupCompany;
  end;
  AClientDataSet.Filtered := False;
end;

function TfrmGroupRights.InitRootDeptTree(
  AClientDataSet: TClientDataSet): TTreeNode;
var
  I         : Integer;
  AGroupDept: TGroupDept;
begin
  Result := nil;
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentDeptGUID = ' + QuotedStr('{00000000-0000-0000-0000-000000000002}')
                            + ' AND DeptGUID <> ' + QuotedStr('');
  AClientDataSet.Filtered := True;
  if AClientDataSet.RecordCount > 0 then
  begin
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      AGroupDept := TGroupDept.Create;
      with AGroupDept do
      begin
        DeptGUID := AClientDataSet.fieldbyname('DeptGUID').AsString;
        DeptCName := AClientDataSet.fieldbyname('sDeptCName').AsString;
        DeptEName := AClientDataSet.fieldbyname('sDeptEName').AsString;
        iOrder := AClientDataSet.fieldbyname('iDeptOrder').AsInteger;
        ParentDeptGUID := AClientDataSet.fieldbyname('sParentDeptGUID').AsString;
        CompanyGUID := AClientDataSet.fieldbyname('CompanyGUID').AsString;
      end;
      FGroupDeptList.Add(AGroupDept);
      //�����Žڵ�ҿ�����Ӧ�Ĺ�˾����
      Result := tvUserGroups.Items.AddChild(FindGroupCompany(AGroupDept.CompanyGUID),
                                            AGroupDept.DeptCName);
      Result.Data := AGroupDept;

      Result.ImageIndex := 17;
      Result.SelectedIndex := Result.ImageIndex + 1;
      
      AClientDataSet.Next;
    end;
  end;
  AClientDataSet.Filtered := False;
end;

function TfrmGroupRights.FindGroupCompany(ACompanyGUID: string): TTreeNode;
var
  I          : Integer;
  ATmpPointer: Pointer;
begin
  Result := nil;
  ATmpPointer := nil;
  for I := 0 to FGroupCompanyList.Count - 1 do
  begin
    if TGroupCompany(FGroupCompanyList.Items[I]).GUID = ACompanyGUID then
    begin
      ATmpPointer := FGroupCompanyList.Items[I];
      Break;
    end;
  end;
  if ATmpPointer <> nil then
  begin
    for I := 0 to tvUserGroups.Items.Count - 1 do
    begin
      if tvUserGroups.Items.Item[I].Data = ATmpPointer then
      begin
        Result := tvUserGroups.Items.Item[I];
        Break;
      end;
    end;
  end;
end;

function TfrmGroupRights.InitDeptTree(
  AClientDataSet: TClientDataSet): TTreeNode;
var
  I         : Integer;
  AGroupDept: TGroupDept;
  ATmpTreeNode: TTreeNode;
begin
  Result := nil;
  ATmpTreeNode := nil;
  
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentDeptGUID <> ' + QuotedStr('{00000000-0000-0000-0000-000000000002}')
                            + ' AND DeptGUID <> ' + QuotedStr('');
  AClientDataSet.Filtered := True;
  if AClientDataSet.RecordCount > 0 then
  begin
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      if FindGroupDept(AClientDataSet.fieldbyname('DeptGUID').AsString) = nil then
      begin
        AGroupDept := TGroupDept.Create;
        with AGroupDept do
        begin
          DeptGUID := AClientDataSet.fieldbyname('DeptGUID').AsString;
          DeptCName := AClientDataSet.fieldbyname('sDeptCName').AsString;
          DeptEName := AClientDataSet.fieldbyname('sDeptEName').AsString;
          iOrder := AClientDataSet.fieldbyname('iDeptOrder').AsInteger;
          ParentDeptGUID := AClientDataSet.fieldbyname('sParentDeptGUID').AsString;
          CompanyGUID := AClientDataSet.fieldbyname('CompanyGUID').AsString;
        end;
        FGroupDeptList.Add(AGroupDept);
        //�����Žڵ�ҿ�����Ӧ�ĸ����Žڵ�����  �ڶ���
        //��������ڸ��ڵ��ֱ�ӹҿ��ڶ�Ӧ�Ĳ�������
        ATmpTreeNode := FindGroupDept(AGroupDept.ParentDeptGUID);
        if ATmpTreeNode <> nil then
        begin
          Result := tvUserGroups.Items.AddChild(ATmpTreeNode, AGroupDept.DeptCName);
        end
        else
        begin
          Result := tvUserGroups.Items.AddChild(FindGroupCompany(AGroupDept.CompanyGUID),
                                                AGroupDept.DeptCName);
        end;
        Result.Data := AGroupDept;
      end;

      Result.ImageIndex := 17;
      Result.SelectedIndex := Result.ImageIndex + 1;

      AClientDataSet.Next;
    end;
  end;
  AClientDataSet.Filtered := False;
end;

function TfrmGroupRights.FindGroupDept(ADeptGUID: string): TTreeNode;
var
  I          : Integer;
  ATmpPointer: Pointer;
begin
  Result := nil;
  ATmpPointer := nil;
  for I := 0 to FGroupDeptList.Count - 1 do
  begin
    if TGroupDept(FGroupDeptList.Items[I]).DeptGUID = ADeptGUID then
    begin
      ATmpPointer := FGroupDeptList.Items[I];
      Break;
    end;
  end;
  if ATmpPointer <> nil then
  begin
    for I := 0 to tvUserGroups.Items.Count - 1 do
    begin
      if tvUserGroups.Items.Item[I].Data = ATmpPointer then
      begin
        Result := tvUserGroups.Items.Item[I];
        Break;
      end;
    end;
  end;
end;

procedure TfrmGroupRights.InitRoleTree(AClientDataSet: TClientDataSet; ADeptGUID: string);
var
  I         : Integer;
  AGroupRole: TGroupRole;
  ATmpRoleNode: TTreeNode;
begin
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := ' DeptGUID = ' + QuotedStr(ADeptGUID) + ' AND RoleGUID <> ' + QuotedStr('');
  AClientDataSet.Filtered := True;
  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupRole := TGroupRole.Create;
    with AGroupRole do
    begin
      RoleGUID := AClientDataSet.fieldbyname('RoleGUID').AsString;
      RoleName := AClientDataSet.fieldbyname('sRoleName').AsString;
      ParentRoleGUID := AClientDataSet.fieldbyname('sParentRoleGUID').AsString;
      iOrder := AClientDataSet.fieldbyname('iRoleOrder').AsInteger;
      Description := AClientDataSet.fieldbyname('sDiscription').AsString;
      DeptGUID := AClientDataSet.fieldbyname('DeptGUID').AsString;
    end;
    FGroupRoleList.Add(AGroupRole);
    //����ɫ�ڵ�ҿ�����Ӧ�Ĳ��Žڵ�����
    ATmpRoleNode := tvUserRoles.Items.AddChild(nil, AGroupRole.RoleName);
    ATmpRoleNode.Data := AGroupRole;

    ATmpRoleNode.ImageIndex := 3;
    ATmpRoleNode.SelectedIndex := ATmpRoleNode.ImageIndex + 1;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;
end;

procedure TfrmGroupRights.tvUserGroupsClick(Sender: TObject);
begin
  inherited;
  DisplayRoles(GetDeptGUID(tvUserGroups.Selected.Data));
end;

procedure TfrmGroupRights.DisplayRoles(ADeptGUID: string);
begin
  tvUserRoles.Items.BeginUpdate;
  tvUserRoles.Items.Clear;

  //���ͷ�֮ǰ�Ľ�ɫ����
  DisposeGroupRoleList;
  InitRoleTree(cdsGroups, ADeptGUID);
  
  tvUserRoles.Items.EndUpdate;
end;

function TfrmGroupRights.GetDeptGUID(APointer: Pointer): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to FGroupDeptList.Count - 1 do
  begin
    if APointer = FGroupDeptList.Items[I] then
      Result := TGroupDept(FGroupDeptList.Items[I]).DeptGUID;
  end;
end;

procedure TfrmGroupRights.tvUserRolesClick(Sender: TObject);
begin
  inherited;
  //��ʾ�˽�ɫ�µ������û�
  DisplayUsers(GetRoleGUID(tvUserRoles.Selected.Data));
  //��ʾ�˽�ɫ����Ӧ��Ȩ����Դ
  DisplayRole_Resources(GetRoleGUID(tvUserRoles.Selected.Data));
end;

procedure TfrmGroupRights.DisplayUsers(ARoleGUID: string);
begin
  tvUsers.Items.BeginUpdate;
  tvUsers.Items.Clear;

  DisposeGroupUserList;
  InitUserTree(cdsUsers, ARoleGUID);
  tvUsers.Items.EndUpdate;
end;

procedure TfrmGroupRights.InitUserTree(AClientDataSet: TClientDataSet;
  ARoleGUID: string);
var
  I           : Integer;
  AGroupUser  : TGroupUser;
  ATmpUserNode: TTreeNode;
begin
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := ' sRoleGUID = ' + QuotedStr(ARoleGUID);
  AClientDataSet.Filtered := True;

  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupUser := TGroupUser.Create;
    with AGroupUser do
    begin
      LoginGUID := AClientDataSet.fieldbyname('LoginGUID').AsString;
      LoginName := AClientDataSet.fieldbyname('sLoginName').AsString;
      RoleGUID := AClientDataSet.fieldbyname('sRoleGUID').AsString;
      EmployeeGUID := AClientDataSet.fieldbyname('sEmployeeGUID').AsString;
      EmployeeCName := AClientDataSet.fieldbyname('sEmployeeCName').AsString;
      EmployeeEName := AClientDataSet.fieldbyname('sEmployeeEName').AsString;
      SexGUID := AClientDataSet.fieldbyname('sSexGUID').AsString;
    end;
    FGroupUserList.Add(AGroupUser);
    //����ɫ�ڵ�ҿ�����Ӧ�Ĳ��Žڵ�����
    ATmpUserNode := tvUsers.Items.AddChild(nil, AGroupUser.EmployeeCName);
    ATmpUserNode.Data := AGroupUser;

    if AGroupUser.SexGUID = '{CEE37D8D-A822-459A-8352-A723C12C5294}' then
    begin
      ATmpUserNode.ImageIndex := 1;
      ATmpUserNode.SelectedIndex := ATmpUserNode.ImageIndex + 1;
    end
    else
    begin
      ATmpUserNode.ImageIndex := 0;
      ATmpUserNode.SelectedIndex := ATmpUserNode.ImageIndex + 1;
    end;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;
end;

function TfrmGroupRights.GetRoleGUID(APointer: Pointer): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to FGroupRoleList.Count - 1 do
  begin
    if APointer = FGroupRoleList.Items[I] then
    begin
      Result := TGroupRole(FGroupRoleList.Items[I]).RoleGUID;
    end;
  end;
end;

procedure TfrmGroupRights.DisposeGroupRoleList;
var
  I: Integer;
begin
  for I := FGroupRoleList.Count - 1 downto 0 do
    TGroupRole(FGroupRoleList.Items[I]).Free;
  FGroupRoleList.Clear;
end;

procedure TfrmGroupRights.DisposeGroupUserList;
var
  I: Integer;
begin
  for I := FGroupUserList.Count - 1 downto 0 do
    TGroupUser(FGroupUserList.Items[I]).Free;
  FGroupUserList.Clear;
end;

procedure TfrmGroupRights.InitRightsTree(AClientDataSet: TClientDataSet);
var
  I: Integer;
  ATmpRightNode: TTreeNode;
  AGroupRight  : TGroupRight;
begin
  //�ȳ�ʼ��ģ��
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentResourceGUID = ' + QuotedStr('{00000000-0000-0000-0000-000000000003}');
  AClientDataSet.Filtered := True;

  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupRight := TGroupRight.Create;

    with AGroupRight do
    begin
      GUID := AClientDataSet.fieldbyname('GUID').AsString;
      ResourceGUID := AClientDataSet.fieldbyname('ResourceGUID').AsString;
      ResourceName := AClientDataSet.fieldbyname('sResourceName').AsString;
      ParentResourceGUID := AClientDataSet.fieldbyname('sParentResourceGUID').AsString;
      iOrder := AClientDataSet.fieldbyname('iOrder').AsInteger;
      Checked := False;
    end;  

    ATmpRightNode := tvCheckRights.Items.AddChild(nil, AGroupRight.ResourceName);
    ATmpRightNode.Data := AGroupRight;
    FGroupRightList.Add(AGroupRight);

    ATmpRightNode.ImageIndex := 15;
    ATmpRightNode.SelectedIndex := ATmpRightNode.ImageIndex + 1;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;

  //�ҿ��ɲ�����Դ
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentResourceGUID <> ' + QuotedStr('{00000000-0000-0000-0000-000000000003}');
  AClientDataSet.Filtered := True;

  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupRight := TGroupRight.Create;

    with AGroupRight do
    begin
      GUID := AClientDataSet.fieldbyname('GUID').AsString;
      ResourceGUID := AClientDataSet.fieldbyname('ResourceGUID').AsString;
      ResourceName := AClientDataSet.fieldbyname('sResourceName').AsString;
      ParentResourceGUID := AClientDataSet.fieldbyname('sParentResourceGUID').AsString;
      iOrder := AClientDataSet.fieldbyname('iOrder').AsInteger;
      Checked := False;
    end;  

    ATmpRightNode := tvCheckRights.Items.AddChild(FindRigthParentNode(AGroupRight.ParentResourceGUID),
                                                  AGroupRight.ResourceName);
    ATmpRightNode.Data := AGroupRight;
    FGroupRightList.Add(AGroupRight);

    ATmpRightNode.ImageIndex := 15;
    ATmpRightNode.SelectedIndex := ATmpRightNode.ImageIndex + 1;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;
end;

function TfrmGroupRights.FindRigthParentNode(
  AParentRightGUID: string): TTreeNode;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to tvCheckRights.Items.Count - 1 do
  begin
//    ShowMessage(TGroupRight(tvCheckRights.Items.Item[I]).GUID + '=' + AParentRightGUID);
    if TGroupRight(tvCheckRights.Items.Item[I].Data).GUID = AParentRightGUID then
    begin
      Result := tvCheckRights.Items.Item[I];
      Break;
    end;
  end;
end;

procedure TfrmGroupRights.DisplayRole_Resources(ARoleGUID: string);
begin

end;

end.
