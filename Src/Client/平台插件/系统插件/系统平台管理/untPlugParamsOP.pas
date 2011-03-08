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
unit untPlugParamsOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untEasyEdit, untEasyButtons, untEasyPlateManager;

type
  TfrmPlugParamsOP = class(TForm)
    edtEName: TEasyLabelEdit;
    edtCName: TEasyLabelEdit;
    edtParam: TEasyLabelEdit;
    btnOK: TEasyBitButton;
    btnCancel: TEasyBitButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FAData: PEasytvParamsRecord;
  public
    { Public declarations }
  end;

var
  frmPlugParamsOP: TfrmPlugParamsOP;

  procedure ShowfrmPlugParamsOP(var AData: PEasytvParamsRecord; AFlag: string);
  
implementation

{$R *.dfm}

uses
  untEasyUtilMethod;

procedure ShowfrmPlugParamsOP(var AData: PEasytvParamsRecord; AFlag: string);
begin
  try
    frmPlugParamsOP := TfrmPlugParamsOP.Create(Application);
    if AFlag = 'Add' then
    begin
      frmPlugParamsOP.FAData := AData;
      frmPlugParamsOP.Caption := frmPlugParamsOP.Caption + '-��������';
    end
    else
    if AFlag = 'Edit' then
    begin
      with frmPlugParamsOP do
      begin
        Caption := frmPlugParamsOP.Caption + '-���༭��';
        edtEName.Text := AData^.sParamEName;
        edtCName.Text := AData^.sParamCName;
        edtParam.Text := AData^.sValue;
      end;
      frmPlugParamsOP.FAData := AData;
    end;
    frmPlugParamsOP.ShowModal;
  finally
    FreeAndNil(frmPlugParamsOP);
  end;
end;
  
procedure TfrmPlugParamsOP.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlugParamsOP.btnOKClick(Sender: TObject);
begin
  FAData^.sParamEName := Trim(edtEName.Text);
  FAData^.sParamCName := Trim(edtCName.Text);
  FAData^.sValueType := 'S';
  FAData^.sValue := Trim(edtParam.Text);
  Close;
end;

end.
