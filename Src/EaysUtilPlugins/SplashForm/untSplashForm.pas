{
  +2010-02-03 20:51:28 �����������Ч��
}
unit untSplashForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, untEasyWaterImage, StdCtrls, untEasyLabel;

type
  TfrmSplashForm = class(TForm)
    Timer1: TTimer;
    lblTitle: TEasyLabel;
    lblDes1: TEasyLabel;
    lblVersion: TEasyLabel;
    lblCopyRight: TEasyLabel;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ShowSplashForm(AHandle: THandle): Boolean;stdcall;

var
  frmSplashForm: TfrmSplashForm;

implementation

{$R *.dfm}
var
  Flag: Boolean;    //����Ƿ��Ѿ������

function ShowSplashForm(AHandle: THandle): Boolean;stdcall;
begin
  Result := False;
  try
    Application.Handle := AHandle;
    frmSplashForm := TfrmSplashForm.Create(Application);
    frmSplashForm.ShowModal;
    frmSplashForm.Free;
  finally
    Result := True;
  end;
end;

procedure TfrmSplashForm.Timer1Timer(Sender: TObject);
begin
  //���   ����ֵΪ5ʱ̫��������10�պ�--hehf
  if not Flag then
    AlphaBlendValue := AlphaBlendValue + 10;
  //���
  if AlphaBlendValue >= 250 then
    Flag := True;

  if Flag then
  begin
    AlphaBlendValue := AlphaBlendValue - 10;
    if AlphaBlendValue <= 40 then
    //�ر�
      Close;
  end;
end;

procedure TfrmSplashForm.FormShow(Sender: TObject);
begin
  lblCopyRight.Caption := Format('��Ȩ���� (C) 2008 ~ %s', [FormatDateTime('YYYY', Date)]);
end;

procedure TfrmSplashForm.FormCreate(Sender: TObject);
begin
  Flag := False;   
  AlphaBlend := True;
  AlphaBlendValue := 40;
end;

end.
