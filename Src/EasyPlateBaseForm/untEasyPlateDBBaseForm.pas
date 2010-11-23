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
//      1��EasyUtilADOConn
//         �����������ӣ����������ݿ�ͨ�ŵ�ģ����Ӵ˵�Ԫ���ADO����
//      2����ʼ��ָ���ؼ���IME
//-----------------------------------------------------------------------------}
unit untEasyPlateDBBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, untEasyGroupBox, untEasyWaterImage,
  untEasyPlateBaseForm, untEasyDBDevExt;

type
  TfrmEasyPlateDBBaseForm = class(TfrmEasyPlateBaseForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FEasyDBConn: TADOConnection;
    function GetUtilADOConn: TADOConnection;
    procedure SetUtilADOConn(const Value: TADOConnection);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //����ADO��������
    property EasyUtilADOConn: TADOConnection read GetUtilADOConn write SetUtilADOConn;
  end;

var
  frmEasyPlateDBBaseForm: TfrmEasyPlateDBBaseForm;

implementation

{$R *.dfm}

uses untEasyDBConnection;

constructor TfrmEasyPlateDBBaseForm.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfrmEasyPlateDBBaseForm.Destroy;
begin

  inherited;
end;

procedure TfrmEasyPlateDBBaseForm.FormCreate(Sender: TObject);
var
  I       : Integer;
begin
  inherited;
  FEasyDBConn := DMEasyDBConnection.EasyADOConn;
  for i := 0 to ComponentCount - 1 do
  begin
    if Self.Components[i] is TEasyDevDBTextEdit then
    begin
       (Components[i] as TEasyDevDBTextEdit).ImeName := '';
       (Components[i] as TEasyDevDBTextEdit).ImeMode := imDontCare
    end
    else if Components[i] is TEasyDevDBMemo then
    begin
       (Components[i] as TEasyDevDBMemo).ImeName := '';
       (Components[i] as TEasyDevDBMemo).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBDateEdit then
    begin
       (Components[i] as TEasyDevDBDateEdit).ImeName := '';
       (Components[i] as TEasyDevDBDateEdit).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBTimeEdit then
    begin
       (Components[i] as TEasyDevDBTimeEdit).ImeName := '';
       (Components[i] as TEasyDevDBTimeEdit).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBButtonEdit then
    begin
       (Components[i] as TEasyDevDBButtonEdit).ImeName := '';
       (Components[i] as TEasyDevDBButtonEdit).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBImageComboBox then
    begin
       (Components[i] as TEasyDevDBImageComboBox).ImeName := '';
       (Components[i] as TEasyDevDBImageComboBox).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBLookupComboBox then
    begin
       (Components[i] as TEasyDevDBLookupComboBox).ImeName := '';
       (Components[i] as TEasyDevDBLookupComboBox).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBSpinEdit then
    begin
       (Components[i] as TEasyDevDBSpinEdit).ImeName := '';
       (Components[i] as TEasyDevDBSpinEdit).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBCalcEdit then
    begin
       (Components[i] as TEasyDevDBCalcEdit).ImeName := '';
       (Components[i] as TEasyDevDBCalcEdit).ImeMode := imDontCare;
    end;
  end; 
end;

function TfrmEasyPlateDBBaseForm.GetUtilADOConn: TADOConnection;
begin
  Result := FEasyDBConn;
end;

procedure TfrmEasyPlateDBBaseForm.SetUtilADOConn(
  const Value: TADOConnection);
begin
  FEasyDBConn := Value;
end;

end.
