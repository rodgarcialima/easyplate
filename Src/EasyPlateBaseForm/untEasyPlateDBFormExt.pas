unit untEasyPlateDBFormExt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, ImgList, untEasyToolBar, DB, DBClient,
  untEasyToolBarStylers, untEasyPageControl, ExtCtrls, untEasyGroupBox,
  ActnList, IniFiles, atScripter, atScript, atPascal, untEasyUtilConst;

type
  TfrmEasyPlateDBFormExt = class(TfrmEasyPlateDBBaseForm)
    dkpDBForm: TEasyDockPanel;
    tlbDBForm: TEasyToolBar;
    btnNew: TEasyToolBarButton;
    btnEdit: TEasyToolBarButton;
    btnCancel: TEasyToolBarButton;
    btnDelete: TEasyToolBarButton;
    btnCopy: TEasyToolBarButton;
    btnFind: TEasyToolBarButton;
    btnPrint: TEasyToolBarButton;
    btnExit: TEasyToolBarButton;
    btnRefresh: TEasyToolBarButton;
    btnSave: TEasyToolBarButton;
    pnlContainer: TEasyPanel;
    tlbStyDBForm: TEasyToolBarOfficeStyler;
    imgTlbDBForm: TImageList;
    actlstMain: TActionList;
    actNew: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUndo: TAction;
    actCopy: TAction;
    actSave: TAction;
    actRefresh: TAction;
    actFind: TAction;
    actPrint: TAction;
    actExit: TAction;
    atScripterMain: TatScripter;
    procedure FormShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
    //�����ļ���ű��ļ�
    FEasyDfmFile,
    FEasyScriptFile,
    FEasyDfmIniFile: string;
    //����״̬
    FEasyOperateType: TEasyOperateType;
    //Ψһֵ�ֶ�
    FUniqueFieldList,
    //��Ϊ���ֶ�
    FNotNullFieldList: TStrings;
    //����֮������ֶ�
    FAfterInsertOperFields: TStrings;
    FEasyDfmIni: TIniFile;
    //��������ť�Ƿ���ʾ����
    FToolBarShowCaption: Boolean;
    //PnlContainer ALClient
    FEasyPnlContainerClient: Boolean;
    //�����ݼ�
    FEasyClientDataSetMain: TClientDataSet;
    //�����ݼ���Ӧ�����ݱ��Լ������ֶ�
    FEasyClientDataSetMain_TableName,
    FEasyClientDataSetMain_KeyFieldName: string;
    //ɾ����¼ʱҪȷ�ϵ��ֶ�����
    FEasyClientDataSetMain_DeleteConfirmFieldName: string;
    //��������DFM�ļ�
    procedure LoadEasyDFM(DFMFile: string);
    procedure BindRoot(Form: TComponent; AFileName: string);
    //���ؽű��ļ�
    procedure LoadEasyScript(ScriptFile: string);
    //��������ť�Ƿ���ʾ����
    procedure ToolBarShowCaption(value: Boolean);
    //�����ؼ���������
    procedure InitComponents(AComponent: TComponent);
    procedure InitControls;
    //��ȡ�����ļ���Ϣ
    procedure ReadDfmIni;
    procedure __KeyPress(Sender: TObject; var Key: Char);
    //�ű�ִ�к���
    function EasyGenerateBoolean_True: Boolean;
    function EasyGenerateBoolean_False: Boolean;
    function EasyGetServerTime: TDateTime;

    function EasyGenerateInt(Value: Integer): Integer;
    procedure EasyGenerateIntProc(AMachine: TatVirtualMachine);
    {float}
    function EasyGenerateFloat(Value: Double): Double;
    procedure EasyGenerateFloatProc(AMachine: TatVirtualMachine);

    procedure EasyGenerateGUIDProc(AMachine: TatVirtualMachine);
    procedure EasyGenerateBoolean_TrueProc(AMachine: TatVirtualMachine);
    procedure EasyGenerateBoolean_FalseProc(AMachine: TatVirtualMachine);
    procedure EasyGetServerTimeProc(AMachine: TatVirtualMachine);
    procedure SetEasyOperateType(const Value: TEasyOperateType);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure OpenCdsData; virtual;
    function DoBeforeSaveData: Boolean; virtual;
    function DoSaveData: Boolean; virtual;
    function DoAfterSaveData: Boolean; virtual;
    //�����ļ���ű��ļ�
    property EasyDfmFile: string read FEasyDfmFile write FEasyDfmFile;
    property EasyScriptFile: string read FEasyScriptFile write FEasyScriptFile;
    property EasyDfmIniFile: string read FEasyDfmIniFile write FEasyDfmIniFile;
    property EasyDfmIni: TIniFile read FEasyDfmIni write FEasyDfmIni;
    //�����ݼ�
    property EasyClientDataSetMain: TClientDataSet read FEasyClientDataSetMain
              write FEasyClientDataSetMain;
    property EasyClientDataSetMain_TableName: string read FEasyClientDataSetMain_TableName
              write FEasyClientDataSetMain_TableName;
    property EasyClientDataSetMain_KeyFieldName: string read FEasyClientDataSetMain_KeyFieldName
              write FEasyClientDataSetMain_KeyFieldName;
    property EasyClientDataSetMain_DeleteConfirmFieldName: string read FEasyClientDataSetMain_DeleteConfirmFieldName
              write FEasyClientDataSetMain_DeleteConfirmFieldName;
    //Ψһֵ�ֶ�
    property EasyUniqueFieldList: TStrings read FUniqueFieldList write FUniqueFieldList;
    //��Ϊ���ֶ�
    property EasyNotNullFieldList: TStrings read FNotNullFieldList write FNotNullFieldList;
    //����ʱĬ�ϲ����ֶ�
    property EasyAfterInsertOperFieldList: TStrings read FAfterInsertOperFields
              write FAfterInsertOperFields;
    //
    property EasyPnlContainerClient: Boolean read FEasyPnlContainerClient
              write FEasyPnlContainerClient;
    //��ǰ����״̬
    property EasyOperateType: TEasyOperateType read FEasyOperateType write SetEasyOperateType;
  protected
    procedure __ControlEnterKeyPress(Sender: TObject; var Key: Char);
    procedure __ClientDataSetMainAfterInsert(DataSet: TDataSet); virtual;
    //��ʼ���ű�
    procedure InitEasyDefaultScript; virtual;
    procedure InitEasyScript; virtual;
    //�ı䰴ť״̬
    procedure ChangeButtonEnable(AType: TEasyOperateType); virtual;
  end;

var
  frmEasyPlateDBFormExt: TfrmEasyPlateDBFormExt;

implementation

{$R *.dfm}

uses
   untEasyUtilMethod, untEasyDBConnection, untEasyBaseConst, TypInfo,
   untEasyIODFM, untEasyStdCmpsReg;
   
{ TfrmEasyPlateDBFormExt }

procedure TfrmEasyPlateDBFormExt.BindRoot(Form: TComponent;
  AFileName: string);
begin
  if Form is TForm then // ֻ��Form������ܹҿ�
  begin
    with TForm(Form) do
    begin
      Parent := pnlContainer;
      BorderStyle := bsNone;
      Align := alClient;
      KeyPreview := True;
      OnKeyPress := __KeyPress;
      Show;
    end;
  end;
end;

constructor TfrmEasyPlateDBFormExt.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TfrmEasyPlateDBFormExt.Destroy;
begin
  FEasyDfmIni.Free;
  FNotNullFieldList.Free;
  FAfterInsertOperFields.Free;
  FUniqueFieldList.Free;
  inherited Destroy;
end;

procedure TfrmEasyPlateDBFormExt.LoadEasyDFM(DFMFile: string);
var
  fm: TForm;
begin
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

procedure TfrmEasyPlateDBFormExt.FormShow(Sender: TObject);
begin
  inherited;
  //��ȡ�����ļ���Ϣ
  ReadDfmIni;
  //�����ͻ���
  if FEasyPnlContainerClient then
    pnlContainer.Align := alClient;
  //���ش����ļ�
  if Trim(FEasyDfmFile) <> '' then
  begin
    if not DirectoryExists(EasyPlugPath + 'dfm') then
    begin
      try
        CreateDir(EasyPlugPath + 'dfm');
      except on e:Exception do
        EasyErrorHint(EasyErrorHint_DirCreate + e.Message);
      end;
    end;
    if FileExists(EasyPlugPath + 'dfm\' + FEasyDfmFile) then
      LoadEasyDFM(EasyPlugPath + 'dfm\' + FEasyDfmFile)
    else
      EasyErrorHint(EasyPlugPath + 'dfm\' + FEasyDfmFile + #13#10 + EasyErrorHint_NotFile);
  end;
  //ToolBarShowCaption
  ToolBarShowCaption(FToolBarShowCaption);
  //��ʼ�����
  InitControls;
  //�󶨽ű��ļ�
  //TO..DO..
  InitEasyDefaultScript;
  InitEasyScript;
  if FileExists(EasyPlugPath + 'dfm\' + FEasyScriptFile) then
    LoadEasyScript(EasyPlugPath + 'dfm\' + FEasyScriptFile);
  //�������ļ����ز�Ϊ���ֶΡ�����ʱĬ�ϲ����ֶ�
  EasyDfmIni.ReadSection('NotNullFields', FNotNullFieldList);
  EasyDfmIni.ReadSection('UniqueFields', FUniqueFieldList);
  EasyDfmIni.ReadSection('AfterInsertOperFields', FAfterInsertOperFields);
  //��ʼ�����ݼ�
  if FEasyClientDataSetMain <> nil then
    OpenCdsData;
  //�ı䰴ť״̬
  ChangeButtonEnable(FEasyOperateType);
end;

procedure TfrmEasyPlateDBFormExt.ToolBarShowCaption(value: Boolean);
begin
  btnNew.ShowCaption := value;
  btnEdit.ShowCaption := value;
  btnDelete.ShowCaption := value;
  btnCancel.ShowCaption := value;
  btnCopy.ShowCaption := value;
  btnSave.ShowCaption := value;
  btnRefresh.ShowCaption := value;
  btnFind.ShowCaption := value;
  btnPrint.ShowCaption := value;
  btnExit.ShowCaption := value;
end;

procedure TfrmEasyPlateDBFormExt.InitComponents(AComponent: TComponent);
var
  I: Integer;
  ARegObj: TStrings;
begin
  ARegObj := TStringList.Create;
  try
    for I := 0 to AComponent.ComponentCount - 1 do
    begin
      if AComponent.Components[I] is TClientDataSet then
      begin
        if (AComponent.Components[I] as TClientDataSet).Tag = 10001 then
        begin
          FEasyClientDataSetMain := (AComponent.Components[I] as TClientDataSet);
          FEasyClientDataSetMain.AfterInsert := __ClientDataSetMainAfterInsert;
        end;
      end;
      //ע�ᵽ�ű�������
      atScripterMain.AddObject(AComponent.Components[I].Name, AComponent.Components[I]);
      ARegObj.Add(AComponent.Components[I].Name);
      //
      if AComponent.Components[I].ComponentCount > 0 then
        InitComponents(AComponent.Components[I]);
      ARegObj.SaveToFile('c:\regobj.txt');
    end;
  finally
    ARegObj.Free;
  end;
end;

procedure TfrmEasyPlateDBFormExt.__ControlEnterKeyPress(Sender: TObject;
  var Key: Char);
begin

end;

procedure TfrmEasyPlateDBFormExt.OpenCdsData;
begin
  if Trim(FEasyClientDataSetMain.CommandText) <> '' then
    FEasyClientDataSetMain.Data := EasyRDMDisp.EasyGetRDMData(FEasyClientDataSetMain.CommandText);
end;

procedure TfrmEasyPlateDBFormExt.actNewExecute(Sender: TObject);
begin
  inherited;
  FEasyClientDataSetMain.Append;
  FEasyOperateType := eotAdd;
  ChangeButtonEnable(FEasyOperateType);
end;

procedure TfrmEasyPlateDBFormExt.actExitExecute(Sender: TObject);
begin
  inherited;
  if FEasyClientDataSetMain <> nil then
  begin
    if FEasyClientDataSetMain.ChangeCount > 0 then
    begin
      case Application.MessageBox('�����ѷ����ı��Ƿ񱣴�?', EASY_SYS_HINT,
        MB_YESNOCANCEL + MB_ICONQUESTION) of
        IDYES:
          begin
            actSaveExecute(Sender);
            Close;
          end;
        IDNO:
          begin
            Close;
          end;
      end;
    end else
      Close;
  end else
    Close;
end;

procedure TfrmEasyPlateDBFormExt.btnEditClick(Sender: TObject);
begin
  inherited;
  FEasyClientDataSetMain.Edit;
end;

procedure TfrmEasyPlateDBFormExt.InitControls;
var
  I: Integer;
begin
  for I := 0 to pnlContainer.ControlCount - 1 do
  begin
    if pnlContainer.Controls[I] is TForm then
      InitComponents(pnlContainer.Controls[I]);
  end;
end;

function TfrmEasyPlateDBFormExt.DoBeforeSaveData: Boolean;
var
  I, J: Integer;
  bHasNull: Boolean;
  ABk :TBookmark;
begin
  bHasNull := False;
  if (FEasyClientDataSetMain.State = dsEdit)
      or (FEasyClientDataSetMain.State = dsInsert) then
    FEasyClientDataSetMain.Post;
  //��鲻Ϊ�յ��ֶ�
  ABk := FEasyClientDataSetMain.GetBookmark;
  try
    FEasyClientDataSetMain.DisableControls;
    FEasyClientDataSetMain.First;
    for J := 0 to FEasyClientDataSetMain.RecordCount - 1 do
    begin
      for I := 0 to FNotNullFieldList.Count - 1 do
      begin
        if FEasyClientDataSetMain.FieldByName(FNotNullFieldList.Strings[I]).Value = null then
        begin
          Application.MessageBox(PChar('�� ' + IntToStr(J + 1) + ' �� ' + IntToStr(I + 1)
                            + ' �м�¼����Ϊ��?'), '��ʾ', MB_OK + MB_ICONWARNING);
          bHasNull := True;
          Break;
        end;
      end;
      if bHasNull then Break;
      FEasyClientDataSetMain.Next;
    end;
  finally
    FEasyClientDataSetMain.EnableControls;
    FEasyClientDataSetMain.FreeBookmark(ABk);
  end;
  Result := not bHasNull;
end;

function TfrmEasyPlateDBFormExt.DoAfterSaveData: Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBFormExt.DoSaveData: Boolean;
var
  AResultOle: OleVariant;
  cdsError  : TClientDataSet;
  AErrorCode: Integer;
begin
  inherited;
  Result := False;
  if (FEasyClientDataSetMain = nil) or (Trim(FEasyClientDataSetMain_TableName) = '')
      or (Trim(FEasyClientDataSetMain_KeyFieldName) = '') then
  begin
    Application.MessageBox('�����ݼ�/����/�ؼ��ֶβ�����,����!', EASY_SYS_HINT,
                          MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if FEasyClientDataSetMain.ChangeCount > 0 then
    AResultOle := EasyRDMDisp.EasySaveRDMData(FEasyClientDataSetMain_TableName,
                        FEasyClientDataSetMain.Delta, FEasyClientDataSetMain_KeyFieldName,
                        AErrorCode);
  if AErrorCode <> 0 then
  begin
    cdsError := TClientDataSet.Create(Self);
    try
      cdsError.Data := AResultOle;
      Application.MessageBox(PChar(EASY_SYS_SAVE_FAILED + #13
         + cdsError.fieldbyname('ERROR_MESSAGE').AsString), EASY_SYS_HINT, MB_OK + MB_ICONERROR);
      Exit;
    finally
      cdsError.Free;
    end;
  end else
  begin
    if FEasyClientDataSetMain.ChangeCount > 0 then
      FEasyClientDataSetMain.MergeChangeLog;
    Application.MessageBox(EASY_SYS_SAVE_SUCCESS, EASY_SYS_HINT, MB_OK + MB_ICONINFORMATION);
    Result := True;
  end;
end;

procedure TfrmEasyPlateDBFormExt.actSaveExecute(Sender: TObject);
begin
  inherited;
  if DoBeforeSaveData then
    if DoSaveData then
    begin
      FEasyOperateType := eotNone;
      ChangeButtonEnable(FEasyOperateType);
      DoAfterSaveData;
    end;
end;

procedure TfrmEasyPlateDBFormExt.__KeyPress(Sender: TObject; var Key: Char);
begin
  if ActiveControl <> nil then
  begin
    if (Key = #13) and KeyPreview then
    begin
      //����ؼ�Tagֵ��30����5�����ƶ����㵽��һ���ؼ�
      if (ActiveControl.Tag mod 30)=5 then
        Exit;

      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
  end;
end;

procedure TfrmEasyPlateDBFormExt.ReadDfmIni;
begin
  //��ȡ�����ļ�
  FEasyDfmIni := TIniFile.Create(EasyPlugPath + 'dfm\' + FEasyDfmIniFile);
  FEasyDfmFile := FEasyDfmIni.ReadString('INI', 'EasyDfmFile', '');
  FEasyScriptFile := FEasyDfmIni.ReadString('INI', 'EasyScriptFile', '');
  FEasyClientDataSetMain_TableName := FEasyDfmIni.ReadString('INI', 'EasyClientDataSetMain_TableName', '');
  FEasyClientDataSetMain_KeyFieldName := FEasyDfmIni.ReadString('INI', 'ClientDataSetMain_KeyFieldName', '');
  FEasyClientDataSetMain_DeleteConfirmFieldName := FEasyDfmIni.ReadString('INI', 'EasyClientDataSetMain_DeleteConfirmFieldName', '');
  FToolBarShowCaption := FEasyDfmIni.ReadBool('INI', 'ToolBarShowCaption', False);
end;

procedure TfrmEasyPlateDBFormExt.FormCreate(Sender: TObject);
begin
  inherited;
  FEasyDfmFile := '';
  FEasyScriptFile := '';
  FEasyDfmIniFile := FormId + '.ini';
  FEasyClientDataSetMain := nil;
  FEasyClientDataSetMain_TableName := '';
  FEasyClientDataSetMain_KeyFieldName := '';
  FEasyClientDataSetMain_DeleteConfirmFieldName := '';

  FToolBarShowCaption := False;
  //�����ͻ���
  FEasyPnlContainerClient := True;
  //
  FNotNullFieldList := TStringList.Create;
  FAfterInsertOperFields := TStringList.Create;
  FUniqueFieldList := TStringList.Create;
  //��ǰ����״̬
  FEasyOperateType := eotNone;
end;

procedure TfrmEasyPlateDBFormExt.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if Trim(FEasyClientDataSetMain_DeleteConfirmFieldName) = '' then
    FEasyClientDataSetMain.Delete
  else
  begin
    case Application.MessageBox(PChar('ȷ��Ҫɾ����¼��'
          + FEasyClientDataSetMain.FieldByName(FEasyClientDataSetMain_DeleteConfirmFieldName).AsString
          + '��?'), EASY_SYS_HINT, MB_YESNO + MB_ICONQUESTION) of
      IDYES:
        begin
          FEasyClientDataSetMain.Delete;
        end;
    end;
  end;
  if FEasyClientDataSetMain.ChangeCount = 0 then
    FEasyOperateType := eotNone;
  ChangeButtonEnable(FEasyOperateType);
end;

procedure TfrmEasyPlateDBFormExt.actUndoExecute(Sender: TObject);
begin
  inherited;
  FEasyClientDataSetMain.CancelUpdates;
  FEasyOperateType := eotNone;
  ChangeButtonEnable(FEasyOperateType);
end;

procedure TfrmEasyPlateDBFormExt.__ClientDataSetMainAfterInsert(
  DataSet: TDataSet);
var
  I, J: Integer;
  AParamList: TStrings;
  ParamArray: array of Variant;
begin
  AParamList := TStringList.Create;
  try
    for I := 0 to FAfterInsertOperFields.Count - 1 do
    begin
      AParamList.Clear;
      SetLength(ParamArray, 0);
      ExtractStrings([','], [' '],
        PAnsiChar(FEasyDfmIni.ReadString('AfterInsertOperFields', FAfterInsertOperFields.Strings[I], '')),
        AParamList);
      if AParamList.Count > 1 then
      begin
        for J := 1 to AParamList.Count - 1 do
        begin
          SetLength(ParamArray, High(ParamArray) + 2);
          ParamArray[High(ParamArray)] := AParamList[J];
        end;  
        DataSet.FieldByName(FAfterInsertOperFields.Strings[I]).Value :=
          atScripterMain.ExecuteSubroutine(AParamList[0], VarArrayOf(ParamArray));
      end else
        DataSet.FieldByName(FAfterInsertOperFields.Strings[I]).Value :=
          atScripterMain.ExecuteSubroutine(AParamList[0]);
    end;
  finally
    AParamList.Free;
  end;
end;

procedure TfrmEasyPlateDBFormExt.LoadEasyScript(ScriptFile: string);
begin
  atScripterMain.LoadCodeFromFile(ScriptFile);
end;

procedure TfrmEasyPlateDBFormExt.InitEasyScript;
begin
  atScripterMain.DefineMethod('EasyGenerateGUID_at', 0, atScript.tkString,
                              nil, EasyGenerateGUIDProc);
  atScripterMain.DefineMethod('EasyGenerateTrue_at', 0, atScript.tkString,
                              nil, EasyGenerateBoolean_TrueProc);
  atScripterMain.DefineMethod('EasyGenerateFalse_at', 0, atScript.tkString,
                              nil, EasyGenerateBoolean_FalseProc);
  atScripterMain.DefineMethod('EasyGetServerTime_at', 0, atScript.tkString,
                              nil, EasyGetServerTimeProc);
  atScripterMain.DefineMethod('EasyGenerateInt_at', 1, atScript.tkInteger,
                              nil, EasyGenerateIntProc);
  atScripterMain.DefineMethod('EasyGenerateFloat_at', 1, atScript.tkInteger,
                              nil, EasyGenerateFloatProc);
end;

procedure TfrmEasyPlateDBFormExt.EasyGenerateGUIDProc(
  AMachine: TatVirtualMachine);
begin
  AMachine.ReturnOutputArg(GenerateGUID);
end;

function TfrmEasyPlateDBFormExt.EasyGenerateBoolean_True: Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBFormExt.EasyGenerateBoolean_False: Boolean;
begin
  Result := False;
end;

function TfrmEasyPlateDBFormExt.EasyGetServerTime: TDateTime;
begin
  Result := Now;
end;

procedure TfrmEasyPlateDBFormExt.EasyGenerateBoolean_TrueProc(
  AMachine: TatVirtualMachine);
begin
  AMachine.ReturnOutputArg(EasyGenerateBoolean_True);
end;

procedure TfrmEasyPlateDBFormExt.EasyGenerateBoolean_FalseProc(
  AMachine: TatVirtualMachine);
begin
  AMachine.ReturnOutputArg(EasyGenerateBoolean_False);
end;

procedure TfrmEasyPlateDBFormExt.EasyGetServerTimeProc(
  AMachine: TatVirtualMachine);
begin
  AMachine.ReturnOutputArg(EasyGetServerTime);
end;

procedure TfrmEasyPlateDBFormExt.InitEasyDefaultScript;
var
  ADefaultStrings: TStrings;
begin
  ADefaultStrings := TStringList.Create;
  try
    ADefaultStrings.LoadFromFile('EasyCommonScript.ecs');
    atScripterMain.SourceCode.AddStrings(ADefaultStrings);
  finally
    ADefaultStrings.Free;
  end;
end;

function TfrmEasyPlateDBFormExt.EasyGenerateInt(Value: Integer): Integer;
begin
  Result := Value;
end;

procedure TfrmEasyPlateDBFormExt.EasyGenerateIntProc(AMachine: TatVirtualMachine);
begin        
  AMachine.ReturnOutputArg(EasyGenerateInt(AMachine.GetInputArgAsInteger(0)));
end;

function TfrmEasyPlateDBFormExt.EasyGenerateFloat(Value: Double): Double;
begin
  Result := Value;
end;

procedure TfrmEasyPlateDBFormExt.EasyGenerateFloatProc(
  AMachine: TatVirtualMachine);
begin
  AMachine.ReturnOutputArg(EasyGenerateFloat(AMachine.GetInputArgAsFloat(0)));
end;

procedure TfrmEasyPlateDBFormExt.SetEasyOperateType(
  const Value: TEasyOperateType);
begin
  if FEasyOperateType <> Value then
  begin
    FEasyOperateType := Value;
    ChangeButtonEnable(FEasyOperateType);
  end;
end;

procedure TfrmEasyPlateDBFormExt.ChangeButtonEnable(
  AType: TEasyOperateType);
begin
  case AType of
    eotAdd, eotEdit:
      begin
        actNew.Enabled := True;
        actEdit.Enabled := False;
        actDelete.Enabled := True;
        actCopy.Enabled := True;
        actRefresh.Enabled := True;
        actFind.Enabled := True;
        actPrint.Enabled := False;
        actUndo.Enabled := True;
        actSave.Enabled := True;
      end;
    eotDelete:
      begin

      end;
    eotNone:
      begin
        actNew.Enabled := True;
        if FEasyClientDataSetMain.RecordCount > 0 then
        begin
          actEdit.Enabled := True;
          actDelete.Enabled := True;
          actCopy.Enabled := True;
          actRefresh.Enabled := True;
          actFind.Enabled := True;
          actPrint.Enabled := True;
        end else
        begin
          actEdit.Enabled := False;
          actDelete.Enabled := False;
          actCopy.Enabled := False;
          actRefresh.Enabled := False;
          actFind.Enabled := False;
          actPrint.Enabled := False;
        end;
        actSave.Enabled := False;
        actUndo.Enabled := False;
      end;
  end;
end;

procedure TfrmEasyPlateDBFormExt.actEditExecute(Sender: TObject);
begin
  inherited;
  FEasyOperateType := eotEdit;
  ChangeButtonEnable(FEasyOperateType);
end;

procedure TfrmEasyPlateDBFormExt.actRefreshExecute(Sender: TObject);
begin
  inherited;
  if FEasyClientDataSetMain <> nil then
  begin
    if FEasyClientDataSetMain.ChangeCount > 0 then
    begin
      case Application.MessageBox('�����ѷ����ı��Ƿ񱣴�?', EASY_SYS_HINT,
        MB_YESNOCANCEL + MB_ICONQUESTION) of
        IDYES:
          begin
            actSaveExecute(Sender);
          end;
        IDNO:
          begin
            FEasyClientDataSetMain.Close;
            OpenCdsData;
            FEasyOperateType := eotNone;
            ChangeButtonEnable(FEasyOperateType);
          end;
      end;
    end;
  end;
end;

end.
