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
//    ��������
//��Ҫʵ�֣�
//    ��������ӡ���Ƶ�
//    ϵͳ�����б�����ڴ˹���
//-----------------------------------------------------------------------------}
unit untEasySysConst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, untEasyToolBar, untEasyToolBarStylers,
  DB, ImgList, DBClient, ActnList, Grids, untEasyBaseGrid, untEasyGrid,
  untEasyDBGrid, untEasyClassSysConst, untEasyUtilMethod, untEasyUtilConst;

  //�����������
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasySysConst = class(TfrmEasyPlateDBBaseForm)
    actDataList: TActionList;
    actNewMst: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actRedo: TAction;
    actUndo: TAction;
    actFind: TAction;
    actPrint: TAction;
    actExit: TAction;
    actAddDtl: TAction;
    actEditDtl: TAction;
    actDeleteDtl: TAction;
    actCopyDtl: TAction;
    actRedoDtl: TAction;
    actUndoDtl: TAction;
    actSave: TAction;
    actRefresh: TAction;
    cdsSysConstMain: TClientDataSet;
    imgToolBar: TImageList;
    dsSysConstMain: TDataSource;
    edpMain: TEasyDockPanel;
    tlbMain: TEasyToolBar;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton1: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    EasyToolBarSeparator2: TEasyToolBarSeparator;
    EasyToolBarButton9: TEasyToolBarButton;
    EasyToolBarButton11: TEasyToolBarButton;
    EasyToolBarButton15: TEasyToolBarButton;
    EasyToolBarButton7: TEasyToolBarButton;
    tbosMain: TEasyToolBarOfficeStyler;
    EasyDBGrid1: TEasyDBGrid;
    EasyToolBarButton4: TEasyToolBarButton;
    procedure FormShow(Sender: TObject);
    procedure actNewMstExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
  private
    { Private declarations }
    procedure InitData;
  public
    { Public declarations }
  end;

var
  frmEasySysConst: TfrmEasySysConst;

implementation

{$R *.dfm}

//��������ʵ��
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasySysConst := TfrmEasySysConst.Create(Application);
  if frmEasySysConst.FormStyle <> fsMDIChild then
    frmEasySysConst.FormStyle := fsMDIChild;
  if frmEasySysConst.WindowState <> wsMaximized then
    frmEasySysConst.WindowState := wsMaximized;
  Result := frmEasySysConst;
end;

{ TfrmEasySysConst }

procedure TfrmEasySysConst.InitData;
var
  ASQL: string;
begin
  ASQL := 'SELECT * FROM vw_SysConst';
  cdsSysConstMain.Data := EasyRDMDisp.EasyGetRDMData(ASQL);
end;

procedure TfrmEasySysConst.FormShow(Sender: TObject);
begin
  inherited;
  InitData;
  EasyDBGrid1.Options := EasyDBGrid1.Options - [goEditing];
end;

procedure TfrmEasySysConst.actNewMstExecute(Sender: TObject);
begin
  inherited;
  EasyDBGrid1.Options := EasyDBGrid1.Options + [goEditing];
  with cdsSysConstMain do
  begin
    Append;
    FieldByName('ConstGUID').AsString := GenerateGUID;
      //2 CName
    FieldByName('CName').AsString := '';
      //3 EName
    FieldByName('EName').AsString := '';
      //4 Value
    FieldByName('Value').AsString := '';
      //5 CreateTime
    FieldByName('CreateTime').AsDateTime := Now;
      //6 Creater
    FieldByName('Creater').AsString := '';
      //7 Updater
    FieldByName('Updater').AsString := '';
      //8 UpdateTime
    FieldByName('UpdateTime').AsDateTime := Now;
  end;
end;

procedure TfrmEasySysConst.actExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEasySysConst.actEditExecute(Sender: TObject);
begin
  inherited;
  EasyDBGrid1.Options := EasyDBGrid1.Options + [goEditing];
end;

procedure TfrmEasySysConst.actEditUpdate(Sender: TObject);
begin
  inherited;
  actEdit.Enabled := cdsSysConstMain.RecordCount > 0;
end;

procedure TfrmEasySysConst.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  actDelete.Enabled := cdsSysConstMain.RecNo > 0;
end;

procedure TfrmEasySysConst.actDeleteExecute(Sender: TObject);
begin
  inherited;
  cdsSysConstMain.Delete;
end;

procedure TfrmEasySysConst.actUndoExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('ȷ��Ҫȡ�������ĸ�����?', '��ʾ', MB_OKCANCEL + 
    MB_ICONQUESTION) = IDOK then
  begin
    cdsSysConstMain.CancelUpdates;
  end;
end;

procedure TfrmEasySysConst.actRefreshUpdate(Sender: TObject);
begin
  inherited;
  actRefresh.Enabled := cdsSysConstMain.RecordCount > 0;
end;

procedure TfrmEasySysConst.actSaveExecute(Sender: TObject);
var
  AResultOle: OleVariant;
  cdsError  : TClientDataSet;
  AErrorCode: Integer;
begin
  inherited;
  AErrorCode := 0;
  if cdsSysConstMain.ChangeCount > 0 then
  begin
    AResultOle := EasyRDMDisp.EasySaveRDMData('SysConst', cdsSysConstMain.Delta,
                                              'ConstGUID', AErrorCode);
    if AErrorCode <> 0 then
    begin
      cdsError := TClientDataSet.Create(Self);
      try
        cdsError.Data := AResultOle;
        Application.MessageBox(PChar(EASY_SYS_SAVE_FAILED + #13
           + cdsError.fieldbyname('ERROR_MESSAGE').AsString), EASY_SYS_HINT, MB_OK + MB_ICONERROR);
      finally
        cdsError.Free;
      end;
    end else
    begin
      if cdsSysConstMain.ChangeCount > 0 then
        cdsSysConstMain.MergeChangeLog;
      Application.MessageBox(EASY_SYS_SAVE_SUCCESS, EASY_SYS_HINT, MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmEasySysConst.actSaveUpdate(Sender: TObject);
begin
  inherited;
  actSave.Enabled := cdsSysConstMain.ChangeCount > 0;
end;

end.
