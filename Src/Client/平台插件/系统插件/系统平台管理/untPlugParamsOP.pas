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
  Dialogs, StdCtrls, untEasyEdit, untEasyButtons, untEasyPlateManager,
  untEasyClassPluginDirectory;

type
  TfrmPlugParamsOP = class(TForm)
    edtCName: TEasyLabelEdit;
    edtParam: TEasyLabelEdit;
    btnOK: TEasyBitButton;
    btnCancel: TEasyBitButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FAData: TEasysysPluginParam;
  public
    { Public declarations }
  end;

var
  frmPlugParamsOP: TfrmPlugParamsOP;

  procedure ShowfrmPlugParamsOP(var AData: TEasysysPluginParam; AFlag: string);

implementation

{$R *.dfm}

uses
  untEasyUtilMethod;

procedure ShowfrmPlugParamsOP(var AData: TEasysysPluginParam; AFlag: string);
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
        edtCName.Text := AData.ParamName;
        edtParam.Text := AData.Value;
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
  if Trim(edtCName.Text) = '' then
  begin
    Application.MessageBox('�������Ʋ���Ϊ��!', '��ʾ', MB_OK +
      MB_ICONINFORMATION);
    Exit;
  end;
  if Trim(edtParam.Text) = '' then
  begin
    Application.MessageBox('����ֵ����Ϊ��!', '��ʾ', MB_OK +
      MB_ICONINFORMATION);
    Exit;
  end;
  FAData.ParamName := Trim(edtCName.Text);
  FAData.ValueType := 'S';
  FAData.Value := Trim(edtParam.Text);
  Close;
end;

end.
