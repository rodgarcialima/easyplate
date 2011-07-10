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
//    ���ݿ������
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyDBTool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, untEasyPageControl, ImgList,
  untEasyStatusBar, untEasyStatusBarStylers, untEasyToolBar,
  untEasyToolBarStylers, ActnList, ComCtrls, untEasyTreeView, ExtCtrls,
  untEasyGroupBox, DB, DBClient, untEasyDBToolObject, untEasyDBToolUtil,
  StdCtrls, Grids, untEasyBaseGrid, untEasyGrid, untEasyMemo;

  //�����������
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyDBTool = class(TfrmEasyPlateDBBaseForm)
    pnlMain: TEasyPanel;
    Splitter1: TSplitter;
    EasyPanel1: TEasyPanel;
    tvDataBase: TEasyTreeView;
    EasyPanel2: TEasyPanel;
    EasyPanel4: TEasyPanel;
    actMain: TActionList;
    actAcceptMail: TAction;
    actSendMail: TAction;
    actLinkMans: TAction;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    imgImportance: TImageList;
    pgcDBDetail: TEasyPageControl;
    cdsDataBases: TClientDataSet;
    cdsTableField: TClientDataSet;
    tsbTableField: TEasyTabSheet;
    sgrdTableField: TEasyStringGrid;
    EasyDockPanel1: TEasyDockPanel;
    EasyToolBar1: TEasyToolBar;
    btnNew: TEasyToolBarButton;
    EasyTabSheet1: TEasyTabSheet;
    EasyDockPanel2: TEasyDockPanel;
    EasyToolBar2: TEasyToolBar;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarButton1: TEasyToolBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tvDataBaseDblClick(Sender: TObject);
    procedure sgrdTableFieldGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgrdTableFieldGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure btnNewClick(Sender: TObject);
    procedure EasyToolBarButton3Click(Sender: TObject);
    procedure EasyToolBarButton1Click(Sender: TObject);
  private
    { Private declarations }
    FEasyDataBase,
    FEasyTableField: TList;

    procedure GenerateObject(AObject: TObject; AClientDataSet: TClientDataSet);
    procedure InitFieldGrid;
    procedure DisplayTableFieldGrid(AClientDataSet: TClientDataSet; ANode: TTreeNode);
    //����Grid�е��ֶ��������ɶ���
    procedure GenerateObjFile(AObjPre: string);
    procedure GenerateObjValueFile(AObjPre: string);
  public
    { Public declarations }
  end;

var
  frmEasyDBTool: TfrmEasyDBTool;

implementation

{$R *.dfm}

uses
  untEasyUtilMethod, TypInfo, untEasyDBToolObjectPas;

//��������ʵ��
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyDBTool := TfrmEasyDBTool.Create(Application);
  if frmEasyDBTool.FormStyle <> fsMDIChild then
    frmEasyDBTool.FormStyle := fsMDIChild;
  if frmEasyDBTool.WindowState <> wsMaximized then
    frmEasyDBTool.WindowState := wsMaximized;
  Result := frmEasyDBTool;
end;

procedure TfrmEasyDBTool.FormCreate(Sender: TObject);
begin
  inherited;
  FEasyDataBase := TList.Create;
  FEasyTableField := TList.Create;
end;

procedure TfrmEasyDBTool.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  EasyFreeAndNilList(FEasyDataBase);
  EasyFreeAndNilList(FEasyTableField);
end;

procedure TfrmEasyDBTool.GenerateObject(AObject: TObject;
  AClientDataSet: TClientDataSet);
begin
end;

procedure TfrmEasyDBTool.FormShow(Sender: TObject);
var
  CurrDBNameSQL: string;
  ATmpRoot,
  ADBNode,
  ATableNode: TTreeNode;
  I      : Integer;
begin
  inherited;
  CurrDBNameSQL := 'SELECT DB_NAME() AS DBName';
  cdsDataBases.Data := EasyRDMDisp.EasyGetRDMData(CurrDBNameSQL);

  ATmpRoot := tvDataBase.Items.Item[0]; //��һ���ڵ�������
  //��ǰ���ݿ����ƵĽڵ�
  ADBNode := tvDataBase.Items.AddChild(ATmpRoot, cdsDataBases.fieldbyname('DBName').AsString);
  ADBNode.ImageIndex := 1;
  ADBNode.SelectedIndex := 1;
  //ȡ��ǰ���ݿ��µ��������ݱ�
  cdsDataBases.Data := EasyRDMDisp.EasyGetRDMData(EASY_TABLE);
  for I := 0 to cdsDataBases.RecordCount - 1 do
  begin
    ATableNode := tvDataBase.Items.AddChild(ADBNode, cdsDataBases.fieldbyname('Name').AsString);
    ATableNode.ImageIndex := 6;
    ATableNode.SelectedIndex := 7;
    cdsDataBases.Next;
  end;
  tvDataBase.FullExpand;
end;

procedure TfrmEasyDBTool.tvDataBaseDblClick(Sender: TObject);
var
  ATableName: string;
begin
  inherited;
  ATableName := tvDataBase.Selected.Text;
  if tvDataBase.Selected.Level = 2 then
  begin
    //���δ���ع���������ݿ��ȡ����
    if tvDataBase.Selected.Data = nil then
      cdsTableField.Data := EasyRDMDisp.EasyGetRDMData(Format(EASY_TABLEFIELD, [ATableName]));
    //ˢ����ʾ�ֶ�Grid
    DisplayTableFieldGrid(cdsTableField, tvDataBase.Selected);
  end;
end;

procedure TfrmEasyDBTool.InitFieldGrid;
begin
  with sgrdTableField do
  begin
    Clear;
    RowCount := 2;
    FixedRows := 1;

    ColumnHeaders.Add('');
    ColumnHeaders.Add('<p align="center">�ֶ�����</p>');
    ColumnHeaders.Add('<p align="center">����</p>');
    ColumnHeaders.Add('<p align="center">����</p>');
    ColumnHeaders.Add('<p align="center">С��λ��</p>');
    ColumnHeaders.Add('<p align="center">����</p>');
    ColumnHeaders.Add('<p align="center">�շ�</p>');
    ColumnHeaders.Add('<p align="center">Ĭ��ֵ</p>');
    ColumnHeaders.Add('<p align="center">˵��</p>');
  end;  
end;

procedure TfrmEasyDBTool.DisplayTableFieldGrid(AClientDataSet: TClientDataSet; ANode: TTreeNode);
var
  I: Integer;
begin
  InitFieldGrid;
  if ANode.Data = nil then
  begin
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      if I > 0 then sgrdTableField.AddRow;
      with sgrdTableField do
      begin
        Cells[0, I + 1] := IntToStr(I + 1);
        Cells[1, I + 1] := AClientDataSet.fieldbyname('FieldName').AsString;
        Cells[2, I + 1] := AClientDataSet.fieldbyname('Type').AsString;
        Cells[3, I + 1] := AClientDataSet.fieldbyname('Long').AsString;
        Cells[4, I + 1] := AClientDataSet.fieldbyname('percent').AsString;
        Cells[5, I + 1] := AClientDataSet.fieldbyname('PrimaryKey').AsString;
        Cells[6, I + 1] := AClientDataSet.fieldbyname('IsNull').AsString;
        Cells[7, I + 1] := AClientDataSet.fieldbyname('DefaultValue').AsString;
        //Cells[8, I + 1] := AClientDataSet.fieldbyname('Comment').AsString;
      end;
      AClientDataSet.Next;
    end;  
  end;  
end;

procedure TfrmEasyDBTool.sgrdTableFieldGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  VAlign := vtaCenter;
  //�ж��뷽ʽ
  if ACol in [0, 5, 6] then
    HAlign := taCenter;
end;

procedure TfrmEasyDBTool.sgrdTableFieldGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  if ACol = 2 then
  begin
    AEditor := edComboList;
    with sgrdTableField do
    begin
      ClearComboString;
      AddComboString('varchar');
      AddComboString('datetime');
    end;
  end;
end;

procedure TfrmEasyDBTool.btnNewClick(Sender: TObject);
begin
  inherited;
  sgrdTableField.Options := sgrdTableField.Options + [goEditing];
end;

procedure TfrmEasyDBTool.EasyToolBarButton3Click(Sender: TObject);
begin
  inherited;
  GenerateObjValueFile('Easy');
  //
end;

procedure TfrmEasyDBTool.GenerateObjFile(AObjPre: string);
var
  I: Integer;
  ATmpResult, ATmpPublicResult: TStrings;
begin
  ATmpResult := TStringList.Create;
  ATmpPublicResult := TStringList.Create;
  ATmpResult.Add('  T' + AObjPre + tvDataBase.Selected.Text + ' = class');
  //����˽�б���
  ATmpResult.Add('  private');
  ATmpResult.Add('  { Private declarations } ');
  //���ӹ�������
  ATmpPublicResult.Add('  public');
  ATmpPublicResult.Add('  { Public declarations } ');
  for I := 0 to sgrdTableField.RowCount - 1 do
  begin
    with sgrdTableField do
    begin
      //�ֶ�����
      //varchar
      if Cells[2, I + 1] = 'varchar' then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'string');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //int bigint
      else if (Cells[2, I + 1] = 'int') or (Cells[2, I + 1] = 'bigint') then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'Integer');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //bit
      else if Cells[2, I + 1] = 'bit' then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'Boolean');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //decimal numeric
      else if (Cells[2, I + 1] = 'decimal') then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'Double');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //DateTime
      else if Cells[2, I + 1] = 'DateTime' then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'TDateTime');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end;
    end;
  end;
  ATmpResult.Add(ATmpPublicResult.Text);
  frmEasyDBToolObjectPas := TfrmEasyDBToolObjectPas.Create(Self);
  frmEasyDBToolObjectPas.mmResult.Lines.Text := ATmpResult.Text;
  frmEasyDBToolObjectPas.ShowModal;
  frmEasyDBToolObjectPas.Free;
  ATmpResult.Free;
  ATmpPublicResult.Free;
end;

procedure TfrmEasyDBTool.GenerateObjValueFile(AObjPre: string);
var
  I: Integer;
  ATmpResult: TStrings;
begin
  ATmpResult := TStringList.Create;

  ATmpResult.Add(' //�˾�Ϊʵ����ָ���Ķ���');
  ATmpResult.Add('A' + AObjPre + tvDataBase.Selected.Text
                  + ' := T' + AObjPre + tvDataBase.Selected.Text + '.Create');
  ATmpResult.Add(' AClientDataSet.First;');
  ATmpResult.Add('for I := 0 to AClientDataSet.RecordCount - 1 do');
  ATmpResult.Add('begin');
  ATmpResult.Add('  with ' + 'A' + AObjPre + tvDataBase.Selected.Text + ' do ');
  ATmpResult.Add('  begin');

  for I := 0 to sgrdTableField.RowCount - 1 do
  begin
    with sgrdTableField do
    begin
      //varchar
      if Cells[2, I + 1] = 'varchar' then
        ATmpResult.Add('    ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '' + Cells[1, I + 1] + '' +').AsString;')
      //int bigint
      else if (Cells[2, I + 1] = 'int') or (Cells[2, I + 1] = 'bigint') then
        ATmpResult.Add('    ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '' + Cells[1, I + 1] + '' +').AsInteger;')
      //bit
      else if Cells[2, I + 1] = 'bit' then
        ATmpResult.Add('    ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '' + Cells[1, I + 1] + '' +').AsBoolean;')
      //decimal numeric
      else if (Cells[2, I + 1] = 'decimal') then
        ATmpResult.Add('    ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '' + Cells[1, I + 1] + '' +').AsFloat;')
      //DateTime
      else if Cells[2, I + 1] = 'DateTime' then
        ATmpResult.Add('    ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '' + Cells[1, I + 1] + '' +').AsDateTime;');
    end;
  end;
  ATmpResult.Add('  end;');
  ATmpResult.Add(' AClientDataSet.Next;');
  ATmpResult.Add(' //�ڴ���ӽ������ŵ�ָ�������Ĵ���');
  ATmpResult.Add(' //���Ҫ������Ҳ�ڴ������Ӧ����');
  ATmpResult.Add('end;');
  
  frmEasyDBToolObjectPas := TfrmEasyDBToolObjectPas.Create(Self);
  frmEasyDBToolObjectPas.mmResult.Lines.Text := ATmpResult.Text;
  frmEasyDBToolObjectPas.ShowModal;
  frmEasyDBToolObjectPas.Free;

  ATmpResult.Free;
end;

procedure TfrmEasyDBTool.EasyToolBarButton1Click(Sender: TObject);
begin
  inherited;
  GenerateObjFile('Easy');
end;

end.
