unit untEasyPlateDBFormExt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, ImgList, untEasyToolBar, DB, DBClient,
  untEasyToolBarStylers, untEasyPageControl, ExtCtrls, untEasyGroupBox,
  ActnList;

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
    procedure FormShow(Sender: TObject);
    procedure actNewUpdate(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actUndoUpdate(Sender: TObject);
    procedure actCopyUpdate(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actFindUpdate(Sender: TObject);
    procedure actPrintUpdate(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
  private
    { Private declarations }
    //�����ļ���ű��ļ�
    FEasyDfmFile,
    FEasyScriptFile: string;
    //��������ť�Ƿ���ʾ����
    FToolBarShowCaption: Boolean;
    //�����ݼ�
    FEasyClientDataSetMain: TClientDataSet;
    //��������DFM�ļ�
    procedure LoadEasyDFM(DFMFile: string);
    procedure BindRoot(Form: TComponent; AFileName: string);
    //��������ť�Ƿ���ʾ����
    procedure ToolBarShowCaption(value: Boolean);
    //�����ؼ���������
    procedure InitComponents(AComponent: TComponent);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure OpenCdsData; virtual;
    //�����ļ���ű��ļ�
    property EasyDfmFile: string read FEasyDfmFile write FEasyDfmFile;
    property EasyScriptFile: string read FEasyScriptFile write FEasyScriptFile;
    //�����ݼ�
    property EasyClientDataSetMain: TClientDataSet read FEasyClientDataSetMain
              write FEasyClientDataSetMain;
  protected
    procedure __ControlEnterKeyPress(Sender: TObject; var Key: Char);
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
      Show;
    end;
  end;
end;

constructor TfrmEasyPlateDBFormExt.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEasyDfmFile := '';
  FEasyScriptFile := '';
  FEasyClientDataSetMain := nil;
  FToolBarShowCaption := False;
end;

destructor TfrmEasyPlateDBFormExt.Destroy;
begin

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
  //�󶨽ű��ļ�
  //TO..DO..
  //ToolBarShowCaption
  ToolBarShowCaption(FToolBarShowCaption);
  //��ʼ�����
  InitComponents(pnlContainer);
end;

procedure TfrmEasyPlateDBFormExt.ToolBarShowCaption(value: Boolean);
var
  I: Integer;
begin
  for I := 0 to tlbDBForm.ComponentCount - 1 do
  begin
    if tlbDBForm.Components[I] is TEasyToolBarButton then
      (tlbDBForm.Components[I] as TEasyToolBarButton).ShowCaption := value;
  end;
end;

procedure TfrmEasyPlateDBFormExt.InitComponents(AComponent: TComponent);
var
  I: Integer;
begin
  for I := 0 to AComponent.ComponentCount - 1 do
  begin
    if AComponent.Components[I] is TClientDataSet then
    begin
      if (AComponent.Components[I] as TClientDataSet).Tag = 10001 then
        FEasyClientDataSetMain := (AComponent.Components[I] as TClientDataSet);
    end;  
  end;
  //��ʼ�����ݼ�
  if FEasyClientDataSetMain <> nil then
    OpenCdsData;
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

procedure TfrmEasyPlateDBFormExt.actNewUpdate(Sender: TObject);
begin
  inherited;
  actNew.Enabled := (FEasyClientDataSetMain.State <> dsInsert)
                    and (FEasyClientDataSetMain <> nil);
end;

procedure TfrmEasyPlateDBFormExt.actEditUpdate(Sender: TObject);
begin
  inherited;
  actEdit.Enabled := ((FEasyClientDataSetMain.State <> dsInsert) or
                      (FEasyClientDataSetMain.State <> dsEdit))
                      and (FEasyClientDataSetMain <> nil);
end;

procedure TfrmEasyPlateDBFormExt.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  actDelete.Enabled := (FEasyClientDataSetMain.RecordCount > 0)
                        and (FEasyClientDataSetMain <> nil);
end;

procedure TfrmEasyPlateDBFormExt.actUndoUpdate(Sender: TObject);
begin
  inherited;
  actUndo.Enabled := (FEasyClientDataSetMain.ChangeCount > 0)
                        and (FEasyClientDataSetMain <> nil);
end;

procedure TfrmEasyPlateDBFormExt.actCopyUpdate(Sender: TObject);
begin
  inherited;
  actCopy.Enabled := (FEasyClientDataSetMain.RecordCount > 0)
                        and (FEasyClientDataSetMain <> nil);
end;

procedure TfrmEasyPlateDBFormExt.actSaveUpdate(Sender: TObject);
begin
  inherited;
  actSave.Enabled := (FEasyClientDataSetMain.ChangeCount > 0)
                        and (FEasyClientDataSetMain <> nil);
end;

procedure TfrmEasyPlateDBFormExt.actRefreshUpdate(Sender: TObject);
begin
  inherited;
  actRefresh.Enabled := (FEasyClientDataSetMain.RecordCount > 0)
                        and (FEasyClientDataSetMain <> nil);
end;

procedure TfrmEasyPlateDBFormExt.actFindUpdate(Sender: TObject);
begin
  inherited;
  actFind.Enabled := (FEasyClientDataSetMain.RecordCount > 0)
                        and (FEasyClientDataSetMain <> nil);
end;

procedure TfrmEasyPlateDBFormExt.actPrintUpdate(Sender: TObject);
begin
  inherited;
  actPrint.Enabled := (FEasyClientDataSetMain.RecordCount > 0)
                        and (FEasyClientDataSetMain <> nil);
end;

procedure TfrmEasyPlateDBFormExt.actNewExecute(Sender: TObject);
begin
  inherited;
  FEasyClientDataSetMain.Append;
end;

end.
