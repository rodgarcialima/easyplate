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
//    ����Ԫ�ǹ������ݼ�����Ļ�����Ԫ
//
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyPlateDBForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, DB, DBClient, ImgList, untEasyToolBar,
  untEasyToolBarStylers, untReconcileError, ExtCtrls, untEasyGroupBox, DBGrids,
  untEasyPageControl, untEasyDevExt, untEasyDBDevExt, Buttons, Grids, ComCtrls,
  StdCtrls, DBCtrls, dbcgrids, Tabs, cxGrid, cxGridDBTableView, cxGridCustomTableView,
  cxGridTableView;

type
  //��� �༭(����) �޼�¼ ������״̬
  TEasyDataState = (edsBrowse, edsInsert, edsEdit, edsNoRecord, edsInactive);
  
  TfrmEasyPlateDBForm = class(TfrmEasyPlateDBBaseForm)
    dkpDBForm: TEasyDockPanel;
    tlbDBForm: TEasyToolBar;
    tlbStyDBForm: TEasyToolBarOfficeStyler;
    btnNew: TEasyToolBarButton;
    imgTlbDBForm: TImageList;
    btnEdit: TEasyToolBarButton;
    btnCancel: TEasyToolBarButton;
    btnDelete: TEasyToolBarButton;
    btnCopy: TEasyToolBarButton;
    btnFind: TEasyToolBarButton;
    btnPrint: TEasyToolBarButton;
    btnExit: TEasyToolBarButton;
    btnRefresh: TEasyToolBarButton;
    btnSave: TEasyToolBarButton;
    cdsMain: TClientDataSet;
    pnlContainer: TEasyPanel;
    pgcContainer: TEasyPageControl;
    dsMain: TDataSource;
    procedure btnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cdsMainReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure __ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsMainStateChange(Sender: TObject);
  private
    { Private declarations }
    FMainClientDataSet: TClientDataSet;         //�����ݵ�ClientDataSet
    FMainDataSource   : TDataSource;
    FMainGrid         : TcxGrid;
    FMainSQL          : string;                 //�����ʼ��ʱִ�е�SQL���
    FDeleteMark: String;                    //ɾ����־

    FISSaveSuccessMsg     : Boolean;        //������ɹ�ʱ�Ƿ���ʾ��Ϣ
    FISDeleteSuccessMsg   : Boolean;        //��ɾ��ʱ��ʾ��Ϣ
    FISBtnNotVisibleHotKey: Boolean;        //��ť�ڷǿ���״̬���Ƿ���տ�ݼ�
    FISCanHotKey          : Boolean;
    
    FEasyDataState        : TEasyDataState; //���ݼ�״̬

    FNotNullFieldList     : TStrings;      //�ǿպͷǸ����ֶ��б�
    FNotCopyFieldList     : TStrings;
    FNotNullFieldColor    : TColor;        //�ǿ��ֶ���ɫ
    FDFMList              : TStrings;

    FNotNullControlList   : TList;
    //���÷ǿ��ֶε���ɫ�Ĺ���
    procedure SetEasyMainClientDataSet(const Value: TClientDataSet);
    function GetEasyMainClientDataSet: TClientDataSet;

    procedure DoShow; override;
    //����ģ������ý�������Ҫ�ĺ���
    procedure BindRoot(Form: TComponent; AFileName: string);
    procedure ReadError(Reader: TReader; const Message: string; var Handled: Boolean);
    function GetMainDataSource: TDataSource;
    procedure SetMainDataSource(const Value: TDataSource);
    function GetMainGrid: TcxGrid;
    procedure SetMainGrid(const Value: TcxGrid);
  protected
    { protected declarations }
    //�ı䰴ť����״̬�Ĺ���
    procedure SetAllControlStatus; virtual;
    //�����ݼ��޼�¼ʱ
    procedure SetBtnStatus_NoRecord; virtual;
    procedure SetSQL(AValue: string);
    procedure DoSetSQL(const Value: string); virtual;
    procedure DoSave(sender : TObject);

    function Append: Boolean; virtual;
    function Edit: Boolean; virtual;
    function Save: Boolean; virtual;
    function Cancel: Boolean; virtual;
    function Copy: Boolean; virtual;
    function Print: Boolean;virtual;

    //Save
    function BeforeSave(DataSet: TDataSet): Boolean; virtual;
    function AfterSave(DataSet: TDataSet): Boolean; virtual;
    function SaveError(DataSet: TDataSet): Boolean; virtual;

    // ɾ�����ݵĹ��̣���״̬���� ������Delete
    function DeleteClick(DataSet: TDataSet):Boolean;virtual;
    // ɾ�����ݵĹ��̣�����״̬����
    function Delete(AClientDataSet: TClientDataSet; ShowHint: Boolean): Boolean; virtual;
    function BeforeDelete(DataSet: TDataSet): Boolean; virtual;
    function ExecuteDelete(AClientDataSet: TClientDataSet): Boolean; virtual;
    function AfterDelete(DataSet: TDataSet): Boolean; virtual;
    function SetDeleteMark(AClientDataSet: TClientDataSet): Boolean; virtual;
    function GetMainClientDataSet: TClientDataSet;
    procedure SetClientDataSet(const Value: TClientDataSet);
    function GetMainSQL: string;
    procedure SetMainSQL(const Value: string);
    function GetNotNullFieldColor: TColor;
    procedure SetNullFieldColor(const Value: TColor);
    function GetMainDeleteMark: string;
    procedure SetMainDeleteMark(const Value: string);
    //���Ʋ������
    function BuildCopyList(AClientDataSet: TClientDataSet; ANotCopyFieldList: TStrings): TStrings;
    procedure CopyDataFromList(AClientDataSet: TClientDataSet; ACopyFieldList: TStrings);
    function GetEasyDataState: TEasyDataState;
    procedure SetEasyDataState(const Value: TEasyDataState);
    procedure SetNotNullFieldColor(const Value: TColor);
    //���÷ǿ��ֶεĿؼ���ɫ
    procedure SetNotNullFieldsControlColor; virtual;
    //����֮ǰ�������ֶ��Ƿ��п�
    function CheckNotNullFields: Boolean; virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    //�ǿպͷǸ����ֶδ���
    procedure AddNotNullField(FieldName: string);
    procedure AddNotNullFields(FieldList: array of string);
    procedure AddNotCopyField(FieldName: string);
    procedure AddNotCopyFields(FieldList: array of string);
    procedure AddDFMFile(FieldName: string);
    procedure AddDFMFiles(FieldList: array of string);
    //��������DFM�ļ�
    procedure LoadEasyDFM(DFMFile: string);
    //�ǿ��ֶε���ɫ
    property NotNullFieldColor: TColor read GetNotNullFieldColor write SetNotNullFieldColor default clBlue;
    //����ָ��EasyMainClientDataSet
    property EasyMainClientDataSet: TClientDataSet read GetEasyMainClientDataSet
                                    write SetEasyMainClientDataSet;
    //������ʾ
    property ISSaveSuccessMsg : Boolean read FISSaveSuccessMsg write FISSaveSuccessMsg;
    property ISDeleteSuccessMsg : Boolean read FISDeleteSuccessMsg write FISDeleteSuccessMsg;
    property ISBtnNotVisibleHotKey : Boolean read FISBtnNotVisibleHotKey write FISBtnNotVisibleHotKey;
    property ISCanHotKey : Boolean read FISCanHotKey write FISCanHotKey;
    //����ɾ����־
    property MainDeleteMark: string read GetMainDeleteMark write SetMainDeleteMark;
    property EasyDataState: TEasyDataState read GetEasyDataState write SetEasyDataState;
    //��ʼ�����ݼ���Ϣ
    property MainClientDataSet: TClientDataSet read GetMainClientDataSet write SetClientDataSet;
    property MainDataSource: TDataSource read GetMainDataSource write SetMainDataSource;
    property MainGrid: TcxGrid read GetMainGrid write SetMainGrid;
    property MainSQL: string read GetMainSQL write SetMainSQL;
  end;

var
  frmEasyPlateDBForm: TfrmEasyPlateDBForm;

implementation

{$R *.dfm}

uses
   untEasyUtilMethod, untEasyDBConnection, untEasyBaseConst, cxDBEdit, TypInfo,
   untEasyIODFM, untEasyStdCmpsReg;

{ TfrmEasyPlateDBForm }

procedure TfrmEasyPlateDBForm.AddNotCopyField(FieldName: string);
begin
  if not Assigned(FNotCopyFieldList) then
    FNotCopyFieldList := TStringList.Create;
  if FNotCopyFieldList.IndexOf(UpperCase(FieldName)) < 0 then
    FNotCopyFieldList.Add(UpperCase(FieldName));
end;

procedure TfrmEasyPlateDBForm.AddNotCopyFields(FieldList: array of string);
var
  I: Integer;
begin
  for I := Low(FieldList) to High(FieldList) do
    AddNotCopyField(FieldList[I]);
end;

procedure TfrmEasyPlateDBForm.AddNotNullField(FieldName: string);
begin
  if not Assigned(FNotNullFieldList) then
    FNotNullFieldList := TStringList.Create;
  if FNotNullFieldList.IndexOf(FieldName) < 0 then
    FNotNullFieldList.Add(FieldName);
end;

procedure TfrmEasyPlateDBForm.AddNotNullFields(FieldList: array of string);
var
  I: Integer;
begin
  for I := Low(FieldList) to High(FieldList) do
    AddNotNullField(FieldList[I]);
end;

function TfrmEasyPlateDBForm.AfterDelete(DataSet: TDataSet): Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBForm.AfterSave(DataSet: TDataSet): Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBForm.Append: Boolean;
begin
  Result := False;
  MainClientDataSet.ReadOnly := False;
  if Assigned(MainClientDataSet) then
  begin
    MainClientDataSet.Append;
    //���ʱ��
    //�û�Ȩ�޿���
    Result := True;
  end;  
end;

function TfrmEasyPlateDBForm.BeforeDelete(DataSet: TDataSet): Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBForm.BeforeSave(DataSet: TDataSet): Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBForm.Cancel: Boolean;
begin
  Result := False;
  if Assigned(MainClientDataSet) then
  begin
    MainClientDataSet.CancelUpdates;
    Result := True;
  end;
end;

function TfrmEasyPlateDBForm.Copy: Boolean;
var
  CopyList    : TStrings;
  bCanContinue: Boolean;
begin
  Result := False;
  if Assigned(MainClientDataSet) then
  begin
    bCanContinue := True;
    if not GetUserRight then
    begin
      bCanContinue := False;
      EasyErrorHint(EasyErrorHint_NRight);
    end;
    if bCanContinue then
    begin
      CopyList := TStringList.Create;
      if not Assigned(FNotCopyFieldList) then
        FNotCopyFieldList := TStringList.Create;
      //��ȡ�˱�������ֶκͲ��ɸ����ֶ�
//      if FNotCopyFieldList.Count <= 0 then
//        FNotCopyFieldList.AddStrings(GetUniqueKeys(GetTableName(FClientDataSet), Self.Connection, [ikPrimary, ikUnique]));

      try
        CopyList := BuildCopyList(MainClientDataSet, FNotCopyFieldList);
        if Append then
        begin
          CopyDataFromList(MainClientDataSet, CopyList);
          Result := True;
        end;
      finally
        CopyList.Free;
      end; 
    end;
  end;
end;

constructor TfrmEasyPlateDBForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEasyDataState := edsInactive;

  if not Assigned(FNotNullFieldList) then
    FNotNullFieldList := TStringList.Create;
  if not Assigned(FNotCopyFieldList) then
    FNotCopyFieldList := TStringList.Create;
  if not Assigned(FDFMList) then
    FDFMList := TStringList.Create;
  //�����ݼ�
  if MainSQL <> '' then
  begin
    if DMEasyDBConnection.EasyAppType = 'CAS' then
    begin
      if MainClientDataSet <> nil then
      begin
        if EasyRDMDisp = nil then
          EasyErrorHint(EasyErrorHint_RDMDispNIL)
        else
        begin
          MainClientDataSet.Data := EasyRDMDisp.EasyGetRDMData(MainSQL);
          if MainClientDataSet.RecordCount > 0 then
            EasyDataState := edsBrowse
          else
            SetBtnStatus_NoRecord;
        end;
      end;
    end;
  end;  
end;

function TfrmEasyPlateDBForm.Delete(AClientDataSet: TClientDataSet;
  ShowHint: Boolean): Boolean;
var
  bCanContinue : Boolean;
begin
  Result := False;
  bCanContinue := True;
  //�жϵ�ǰ�û��Ĳ���Ȩ��
  if not GetUserRight then
  begin
    bCanContinue := False;
    EasyErrorHint(EasyErrorHint_NRight);
    Exit;
  end
  else
  begin
    if bCanContinue then
    begin
      if BeforeDelete(AClientDataSet) then
      begin
        //���ִ�гɹ���ʾ �� ��ʾ��Ϣ
        if ISDeleteSuccessMsg and ShowHint then
        begin
          if MessageDlg(EasyHint_ConfirmDelete, mtWarning, [mbYes, mbNo], 0) = mrYes then
          begin
            if Trim(MainDeleteMark) <> '' then
              Result := SetDeleteMark(MainClientDataSet)
            else
              Result := ExecuteDelete(MainClientDataSet);
          end;
        end
        else
        begin
          if Trim(MainDeleteMark) <> '' then
            Result := SetDeleteMark(MainClientDataSet)
          else
            Result := ExecuteDelete(MainClientDataSet);
        end;
      end;
    end;
  end;
  if Result then
    AfterDelete(MainClientDataSet);
end;

function TfrmEasyPlateDBForm.DeleteClick(DataSet: TDataSet): Boolean;
begin
  Result := False;
  if Delete(MainClientDataSet, True) then
  begin
    if MainClientDataSet.RecordCount > 0 then
      EasyDataState := edsBrowse
    else
      SetBtnStatus_NoRecord;
    Result := True;
  end;
end;

destructor TfrmEasyPlateDBForm.Destroy;
begin
  if Assigned(FNotNullFieldList) then
    FNotNullFieldList.Free;
  if Assigned(FNotCopyFieldList) then
    FNotCopyFieldList.Free;
  if Assigned(MainClientDataSet) then
    MainClientDataSet.Free;
  if Assigned(FDFMList) then
    FDFMList.Free;
  inherited Destroy;
end;

procedure TfrmEasyPlateDBForm.DoSave(sender: TObject);
begin
  Self.Save;
end;

procedure TfrmEasyPlateDBForm.DoSetSQL(const Value: string);
begin

end;

procedure TfrmEasyPlateDBForm.DoShow;
begin
  inherited;
  SetNotNullFieldsControlColor;
end;

function TfrmEasyPlateDBForm.Edit: Boolean;
var
  bCanContinues : Boolean;
begin
  Result := False;
  //����Ƿ�ָ�����ݼ�
  if Assigned(MainClientDataSet) then
  begin
    if not MainClientDataSet.Active then
      MainClientDataSet.Open;
    bCanContinues := True;
    //����û�Ȩ��
    if not GetUserRight then
    begin
      bCanContinues := false;
      EasyErrorHint(EasyErrorHint_NRight);
    end;
    //���û�Ȩ�� ����Edit
    if bCanContinues then
    begin
      MainClientDataSet.Edit;
      Result := True;
    end
    else
      EasyErrorHint(EasyEditHint_Edit);
  end;
end;

function TfrmEasyPlateDBForm.ExecuteDelete(
  AClientDataSet: TClientDataSet): Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBForm.GetEasyMainClientDataSet: TClientDataSet;
begin
  Result := FMainClientDataSet;
end;

function TfrmEasyPlateDBForm.Print: Boolean;
begin
  Result := True;
  if Assigned(MainClientDataSet) then
  begin
    if not MainClientDataSet.Active then
      MainClientDataSet.Open;
    if not GetUserRight then
    begin
      EasyErrorHint(EasyErrorHint_NRight);
      Result := False
    end
    else
      Result := True;
  end;
end;

function TfrmEasyPlateDBForm.Save: Boolean;
begin
  Result := False;
  //�ڱ���֮ǰ����Ƿ�NOT NULL�ֶ�δ��Ƿ�ָ�����ݼ�
  if not CheckNotNullFields and Assigned(MainClientDataSet) then
  begin
  {  if DMEasyDBConnection.EasyNetType = 'CS' then
    begin
      Screen.Cursor := crHourGlass;
      try
        //����������Ӵ�����������ع����ٿ�ʼ�µ�������
        if DMEasyDBConnection.EasyADOConn.InTransaction then
          DMEasyDBConnection.EasyADOConn.RollbackTrans;
        DMEasyDBConnection.EasyADOConn.BeginTrans;
        //���ClientDataSet�����쳣��ع��˳�
        if not BeforeSave(MainClientDataSet) then
        begin
          DMEasyDBConnection.EasyADOConn.RollbackTrans;
          Screen.Cursor := crDefault;
          Exit;
        end;
        try
          //����ClientDataState״ִ̬����Ӧ����
//          if Assigned(FHhfRelateUpdates.Provider) then
//          begin
//            if HhfDataState = dsInsert then
//              FHhfRelateUpdates.RunUpdate(ukInsert, FClientDataSet)
//            else
//              FHhfRelateUpdates.RunUpdate(ukModify, FClientDataSet);
//          end
//          else
//          begin
//            FClientDataSet.ApplyUpdates(-1);
//          end;
          DMEasyDBConnection.EasyADOConn.CommitTrans;
          //�Ƿ���ʾHint��Ϣ
          if ISSaveSuccessMsg then
            EasyHint(EasySaveHint_Success);
        except
            on E:Exception do
            begin
              DMEasyDBConnection.EasyADOConn.RollbackTrans;
              ShowMessage(EasySaveHint_Error + E.Message);
            end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else
    if DMEasyDBConnection.EasyNetType = 'CAS' then
    begin
      try
//      EasyRDMDisp.EasySaveRDMDatas();
      finally
      end;
    end;   }
  end;
end;

function TfrmEasyPlateDBForm.SaveError(DataSet: TDataSet): Boolean;
begin
  Result := True;
end;

procedure TfrmEasyPlateDBForm.SetAllControlStatus;
  //����Grid�ı༭״̬
  {procedure SetDBTableViewState(AState: Boolean);
  var
    I: Integer;
  begin
    if MainGrid <> nil then
    begin
      for I := 0 to MainGrid.ViewCount - 1 do
      begin
        if MainGrid.Views[I] is TcxGridDBTableView then
        begin
//          ShowMessage(TcxGridDBTableView(MainGrid.Views[I]).Name);
          TcxGridDBTableView(MainGrid.Views[I]).OptionsData.Editing := AState;
        end;
      end;
    end;
  end;   }
  //�༭״̬
  procedure SetEditButtons;
  begin
    btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    btnCancel.Enabled := True;
    btnSave.Enabled := True;
    btnCopy.Enabled := False;
    btnFind.Enabled := False;
    btnPrint.Enabled := False;

//    SetDBTableViewState(True);
    //��������֮ǰ����
//    MainClientDataSet.ReadOnly := false;
  end;

  procedure SetBrowseButtons;
  begin
    btnNew.Enabled := True;
    btnEdit.Enabled := True;
    btnDelete.Enabled := True;
    btnCancel.Enabled := False;
    btnSave.Enabled := False;
    btnCopy.Enabled := True;
    btnFind.Enabled := True;
    btnPrint.Enabled := True;

//    SetDBTableViewState(False);
    MainClientDataSet.ReadOnly := True;
  end;

  procedure SetInactiveButtons;
  begin
    btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    btnCancel.Enabled := False;
    btnSave.Enabled := False;
    btnCopy.Enabled := False;
    btnFind.Enabled := True;
    btnPrint.Enabled := False;

//    SetDBTableViewState(False);
    MainClientDataSet.ReadOnly := True;
  end;

  procedure SetNoRecordButtons;
  begin
    btnNew.Enabled := True;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    btnCancel.Enabled := False;
    btnSave.Enabled := False;
    btnCopy.Enabled := False;
    btnFind.Enabled := True;
    btnPrint.Enabled := False;

//    SetDBTableViewState(False);
    MainClientDataSet.ReadOnly := True;
  end;

  procedure SetUserModuleButtonAuth;
  var
    iAuth: string;
  begin
    iAuth := getUserModuleRight(FormId, DMEasyDBConnection.EasyCurrLoginUserID);
    if iAuth[1] = '1' then
      btnNew.Enabled := True
    else
      btnNew.Enabled := False;   
    if iAuth[2] = '1' then
      btnEdit.Enabled := True
    else
      btnEdit.Enabled := False;
    if iAuth[3] = '1' then
      btnDelete.Enabled := True
    else
      btnDelete.Enabled := False;
    if iAuth[4] = '1' then
      btnCopy.Enabled := True
    else
      btnCopy.Enabled := False;
    if iAuth[5] = '1' then
      btnFind.Enabled := True
    else
      btnFind.Enabled := False;
    if iAuth[6] = '1' then
      btnPrint.Enabled := True
    else
      btnPrint.Enabled := False;
  end;
begin
  case EasyDataState of
    edsEdit, edsInsert:
      begin
        SetEditButtons;
      end;
    edsBrowse:
      begin
        SetBrowseButtons;
      end;
    edsInactive:
      begin
        SetInactiveButtons;
      end;
    edsNoRecord:
      begin
        SetNoRecordButtons;
      end;  
  end;
//  SetUserModuleButtonAuth;
end;

procedure TfrmEasyPlateDBForm.SetBtnStatus_NoRecord;
begin
  if MainClientDataSet.RecordCount = 0 then
  begin
    btnNew.Enabled := True;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    btnSave.Enabled := False;
    btnCopy.Enabled := False;
    btnFind.Enabled := False;
  end;
end;

function TfrmEasyPlateDBForm.SetDeleteMark(
  AClientDataSet: TClientDataSet): Boolean;
begin
 { try
 //   SetHhfDeleteMark(AClientDataSet,DeleteMark);
    FHhfRelateUpdates.RunUpdate(ukModify, AClientDataSet);
//    SetCttRefreshDeleteMark(AClientDataSet);
    Result := True;
  except
    on E:Exception do
    begin
      SysErrorBox(NDeleteMark);
      Result := False;
    end;
  end; }
end;

procedure TfrmEasyPlateDBForm.SetEasyDataState(const Value: TEasyDataState);
begin
  FEasyDataState := Value;
  //���ð�ť״̬
  SetAllControlStatus;
end;

procedure TfrmEasyPlateDBForm.SetEasyMainClientDataSet(
  const Value: TClientDataSet);
begin
  FMainClientDataSet := Value;
end;

procedure TfrmEasyPlateDBForm.btnExitClick(Sender: TObject);
begin
  inherited;
  if MainClientDataSet.ChangeCount > 0 then
  begin
//    if 
  end;
//
  Close;
end;

procedure TfrmEasyPlateDBForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEasyPlateDBForm.FormCreate(Sender: TObject);
begin
  inherited;
  FISSaveSuccessMsg := True;
  FISDeleteSuccessMsg := True;
  FISBtnNotVisibleHotKey:=False;
  FISCanHotKey:=True;
  //KeyPreview
  IsKeyPreView := True;
  FMainClientDataSet := cdsMain;
  FMainDataSource := dsMain;
  //�ǿ��ֶ���ɫĬ��Ϊ��ɫ clBlue
  FNotNullFieldColor := clBlue;
  FNotNullControlList := TList.Create;
end;

procedure TfrmEasyPlateDBForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  function GetState(Value : TEasyToolBarButton): Boolean;
  begin
    Result :=  Value.Enabled ;
    if not FISBtnNotVisibleHotKey then
      Result:=(Result and Value.Visible);
  end;
begin
  inherited;
  if FISCanHotKey then
  case Key of
    112: if GetState(btnNew)  then btnNewClick(Sender);
    113: if GetState(btnEdit) then btnEditClick(Sender);
    114: if GetState(btnDelete) then btnDeleteClick(Sender);
    115: if GetState(btnSave) then DoSave(Sender);
    116: if GetState(btnCancel) then btnCancelClick(Sender);
    117: if GetState(btnCopy) then btnCopyClick(Sender);
    118: if GetState(btnFind) then btnFindClick(Sender);
    119: if GetState(btnPrint) then btnPrintClick(Sender);
    120: if GetState(btnExit) then btnExitClick(Sender);
  end;
end;

procedure TfrmEasyPlateDBForm.btnNewClick(Sender: TObject);
begin
  inherited;
  if Append then
    EasyDataState := edsInsert;
end;

procedure TfrmEasyPlateDBForm.btnEditClick(Sender: TObject);
begin
  inherited;
  if Edit then
    EasyDataState := edsEdit;
end;

procedure TfrmEasyPlateDBForm.btnDeleteClick(Sender: TObject);
begin
  inherited;
  DeleteClick(MainClientDataSet);
end;

procedure TfrmEasyPlateDBForm.btnCancelClick(Sender: TObject);
begin
  inherited;
  if Cancel then
  begin
    if MainClientDataSet.RecordCount > 0 then
      EasyDataState := edsBrowse
    else
      EasyDataState := edsNoRecord;
  end; 
end;

procedure TfrmEasyPlateDBForm.btnCopyClick(Sender: TObject);
begin
  inherited;
  if Copy then
    EasyDataState := edsInsert;
end;

procedure TfrmEasyPlateDBForm.btnSaveClick(Sender: TObject);
begin
  inherited;
  DoSave(Sender);
end;

procedure TfrmEasyPlateDBForm.btnRefreshClick(Sender: TObject);
begin
  inherited;
  if EasyDataState in [edsInsert, edsEdit] then
  begin
    if MessageDlg(EasyRefreshHint_Save, mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      if Save then
        EasyDataState := edsBrowse;
    end;
  end;
end;

procedure TfrmEasyPlateDBForm.btnFindClick(Sender: TObject);
begin
  inherited;
  if EasyDataState in [edsInsert, edsEdit] then
  begin
    if MessageDlg(EasyFindHint_Save, mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      if Save then
        EasyDataState := edsBrowse;
    end;
  end;
end;

procedure TfrmEasyPlateDBForm.btnPrintClick(Sender: TObject);
begin
  inherited;
  if not Print then
    Exit;
end;

function TfrmEasyPlateDBForm.GetMainClientDataSet: TClientDataSet;
begin
  Result := FMainClientDataSet;
end;

procedure TfrmEasyPlateDBForm.SetClientDataSet(
  const Value: TClientDataSet);
begin
  FMainClientDataSet := Value;
end;

function TfrmEasyPlateDBForm.GetMainSQL: string;
begin
  Result := FMainSQL;
end;

procedure TfrmEasyPlateDBForm.SetMainSQL(const Value: string);
begin
  FMainSQL := Value;
end;

function TfrmEasyPlateDBForm.GetNotNullFieldColor: TColor;
begin
  Result := FNotNullFieldColor;
end;

procedure TfrmEasyPlateDBForm.SetNullFieldColor(const Value: TColor);
begin
  FNotNullFieldColor := Value;
end;

function TfrmEasyPlateDBForm.GetMainDeleteMark: string;
begin
  Result := FDeleteMark;
end;

procedure TfrmEasyPlateDBForm.SetMainDeleteMark(const Value: string);
begin
  FDeleteMark := Value;
end;

procedure TfrmEasyPlateDBForm.cdsMainReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  __ReconcileError(DataSet, E, UpdateKind, Action);
end;

procedure TfrmEasyPlateDBForm.__ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(DataSet, UpdateKind, E);
end;

function TfrmEasyPlateDBForm.BuildCopyList(AClientDataSet: TClientDataSet;
  ANotCopyFieldList: TStrings): TStrings;
begin

end;

procedure TfrmEasyPlateDBForm.CopyDataFromList(
  AClientDataSet: TClientDataSet; ACopyFieldList: TStrings);
begin

end;

function TfrmEasyPlateDBForm.GetEasyDataState: TEasyDataState;
begin
  Result := FEasyDataState;
end;

procedure TfrmEasyPlateDBForm.SetNotNullFieldColor(const Value: TColor);
begin
  FNotNullFieldColor := Value;
end;

function TfrmEasyPlateDBForm.CheckNotNullFields: Boolean;
var
  I, J: Integer;
  TmpComponent: TControl;
  ACaption: string;
begin
  Result := False;
  for I := 0 to FNotNullFieldList.Count - 1 do
  begin
    for J := 0 to pnlContainer.ControlCount - 1 do
    begin
      TmpComponent := pnlContainer.Controls[J];
      if GetDBDataBinding(TmpComponent, ACaption) = FNotNullFieldList[I] then
      begin
        if VarToStrDef(GetDBDataBindingDataSet(TmpComponent).FieldByName(FNotNullFieldList[I]).Value,
                        '') = '' then
        begin
          Result := True;
          EasyHint('��' + ACaption +'��' + EasyNotNullField_Hint);
          Break;
        end;  
      end;  
    end;  
  end;  
end;

procedure TfrmEasyPlateDBForm.SetSQL(AValue: string);
begin

end;

procedure TfrmEasyPlateDBForm.SetNotNullFieldsControlColor;
var
  I, J        : Integer;
  TmpComponent: TComponent;
  ACaption    : string;
begin
  if FDFMList.Count = 0 then Exit;
  if FDFMList.Count <= 1 then
  begin
    //1 ΪEasyPageControl 2 Ϊ�󸽼ӵĴ���
    if pnlContainer.ControlCount = 2 then
    begin
      for I := 0 to TForm(pnlContainer.Controls[1]).ComponentCount - 1 do
      begin
        TmpComponent := TForm(pnlContainer.Controls[1]).Components[I];
        //������Դ
        if MainDataSource <> nil then
          SetEditDataSource(TmpComponent, MainDataSource);
        //���÷ǿ��ֶ���ɫ
        if FNotNullFieldList.IndexOf(GetDBDataBinding(TmpComponent, ACaption)) <> -1 then
          SetEditLabelColor(TmpComponent, NotNullFieldColor);
      end;
    end;
  end
  else
  begin
    if pgcContainer.PageCount > 0 then
      pgcContainer.ActivePageIndex := 0;
    for I := 0 to pgcContainer.PageCount - 1 do
    begin
      if pgcContainer.ActivePage.ControlCount = 1 then
      begin
        for J := 0 to TForm(pgcContainer.Pages[I].Controls[0]).ComponentCount - 1 do
        begin
          TmpComponent := TForm(pgcContainer.Pages[I].Controls[0]).Components[J];
          //������Դ
          if MainDataSource <> nil then
            SetEditDataSource(TmpComponent, MainDataSource);
          //���÷ǿ��ֶ���ɫ
          if FNotNullFieldList.IndexOf(GetDBDataBinding(TmpComponent, ACaption)) <> -1 then
            SetEditLabelColor(TmpComponent, NotNullFieldColor);
        end;
      end;
      pgcContainer.ActivePageIndex := pgcContainer.ActivePageIndex + 1;
    end;  
    if pgcContainer.PageCount > 0 then
      pgcContainer.ActivePageIndex := 0;
  end;    
end;

procedure TfrmEasyPlateDBForm.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := FNotNullControlList.Count - 1 downto 0 do
    TObject(FNotNullControlList[I]).Free;
  if pgcContainer.Visible then
  begin
    while pgcContainer.PageCount > 0 do
      FreeComponent_Child(pgcContainer.Pages[0]);
  end
  else
    FreeComponent_NoChild(pnlContainer);
  inherited;
end;

procedure TfrmEasyPlateDBForm.BindRoot(Form: TComponent;
  AFileName: string);
var
  Page: TEasyTabSheet;
begin
  if FDFMList.Count <= 1 then
  begin
    if Form is TForm then // ֻ��Form������ܹҿ�
    begin
      with TForm(Form) do
      begin
        Parent := pnlContainer;
        BorderStyle := bsNone;
        Align := alClient;
        Show;
      end;
    end;
  end
  else
  begin
    if Form is TForm then // ֻ��Form������ܹҿ�
    begin
      Page := TEasyTabSheet.Create(Self);
      Page.Caption := TForm(Form).Caption;
      Page.PageControl := pgcContainer;

      with TForm(Form) do
      begin
        Parent := Page;
        BorderStyle := bsNone;
        Align := alClient;
        Show;
      end;
      pgcContainer.ActivePageIndex := 0;
    end;
  end;
end;

procedure TfrmEasyPlateDBForm.LoadEasyDFM(DFMFile: string);
var
  fm: TForm;
begin
  if FDFMList.Count = 0 then Exit;
  if FDFMList.Count = 1 then
    pgcContainer.Visible := False;
  fm := TForm.Create(nil);
  try
    EasyReadForm(fm, DFMFile);
  except on e: Exception do
    begin
      EasyErrorHint(e.Message);
      fm.Free;
    end;
  end;
  BindRoot(fm, DFMFile);
end;

procedure TfrmEasyPlateDBForm.ReadError(Reader: TReader;
  const Message: string; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TfrmEasyPlateDBForm.AddDFMFile(FieldName: string);
begin
  if not Assigned(FDFMList) then
    FDFMList := TStringList.Create;
  if FDFMList.IndexOf(FieldName) = -1 then
    FDFMList.Add(FieldName);
end;

procedure TfrmEasyPlateDBForm.AddDFMFiles(FieldList: array of string);
var
  I: Integer;
begin
  for I := Low(FieldList) to High(FieldList) do
    AddDFMFile(FieldList[I]);
end;

procedure TfrmEasyPlateDBForm.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if not DirectoryExists(EasyPlugPath + 'dfm') then
  begin
    try
      CreateDir(EasyPlugPath + 'dfm');
    except on e:Exception do
      EasyErrorHint(EasyErrorHint_DirCreate + e.Message);
    end;
  end;
  for I := 0 to FDFMList.Count - 1 do
  begin
    if FileExists(EasyPlugPath + 'dfm\' + FDFMList.Strings[I]) then
      LoadEasyDFM(EasyPlugPath + 'dfm\' + FDFMList.Strings[I])
    else
      EasyErrorHint(FDFMList.Strings[I] + EasyErrorHint_NotFile);
  end;
end;

function TfrmEasyPlateDBForm.GetMainDataSource: TDataSource;
begin
  Result := FMainDataSource;
end;

procedure TfrmEasyPlateDBForm.SetMainDataSource(const Value: TDataSource);
begin
  FMainDataSource := Value;
end;

function TfrmEasyPlateDBForm.GetMainGrid: TcxGrid;
begin
  Result := FMainGrid;
end;

procedure TfrmEasyPlateDBForm.SetMainGrid(const Value: TcxGrid);
begin
  FMainGrid := Value;
end;

procedure TfrmEasyPlateDBForm.dsMainStateChange(Sender: TObject);
begin
  inherited;
  case dsMain.State of
    dsEdit:
      EasyDataState := edsEdit;
    dsInsert:
      EasyDataState := edsInsert;
    dsInactive:
      EasyDataState := edsInactive;
    dsBrowse:
      begin
        if cdsMain.RecordCount <= 0 then
          EasyDataState := edsInactive
        else
          EasyDataState := edsBrowse;
      end;  
  end;
end;

end.
