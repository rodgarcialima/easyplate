program EasyPlateMain;


uses
  Forms,
  SysUtils,
  Classes,
  Windows,
  Dialogs,
  IniFiles,
  untEasyUtilConst,
  untEasyDBConnection,
  untEasyPlateLoading in 'untEasyPlateLoading.pas' {frmEasyPlateLoading},
  EasyPlateHint in 'EasyPlateHint.pas' {Form1},
  untEasyLoginMain in 'untEasyLoginMain.pas' {frmEasyLoginMain},
  untEasyPlateMain in 'untEasyPlateMain.pas' {frmEasyPlateMain};

type
  TShowSplashForm = function (AHandle: THandle): Boolean; stdcall;

var
  AShowSplashForm: TShowSplashForm;         //������
  ASplashHandle  : THandle;
  {$R *.res}

begin
  Application.Initialize;

  //���������ʼ������
  if fileexists('Splash.ini') then
  begin
    //������
    if not FileExists('SplashForm.dll') then
    begin
      Application.MessageBox(PChar(EASY_SPLASH_NOTFILE), PChar(EASY_SYS_ERROR), MB_OK +
        MB_ICONSTOP);
      Application.Terminate;
    end;
    ASplashHandle := LoadLibrary(PChar('SplashForm.dll'));
    if ASplashHandle <> 0 then
    try
      AShowSplashForm := GetProcAddress(ASplashHandle, 'ShowSplashForm');
      if @AShowSplashForm <> nil then
        AShowSplashForm(Application.Handle);
    finally
      FreeLibrary(ASplashHandle);
    end;
  end;
  Application.CreateForm(TfrmEasyPlateMain, frmEasyPlateMain);
  Application.Run;
end.