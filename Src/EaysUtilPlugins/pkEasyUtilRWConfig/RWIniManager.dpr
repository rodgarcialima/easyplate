program RWIniManager;

uses
  Forms,
  untEasyRWIniMain in 'untEasyRWIniMain.pas' {frmEasyRWIniMain},
  untEasyUtilRWIni in 'untEasyUtilRWIni.pas',
  untEasyUtilStream in 'untEasyUtilStream.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '���ݿ��������ù���';
  Application.CreateForm(TfrmEasyRWIniMain, frmEasyRWIniMain);
  Application.Run;
end.
