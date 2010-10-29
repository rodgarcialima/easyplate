unit untSysShell;

interface

uses
  Windows, SysUtils, Variants, Classes;

  //������Ļ�ֱ�����1024X768
  function SetScreen(x,y: Word): Boolean; stdcall;
  function CreateShortcut(Exe:string; Lnk:string = ''; Dir:string = '';
           ID:Integer = -1):Boolean; stdcall;

implementation
uses
  ShlObj, ActiveX, ComObj;

function SetScreen(x,y: Word): Boolean;
var
  DevMode: TDeviceMode;
begin
  Result := EnumDisplaySettings(nil, 0, DevMode);
  if Result then
  begin
    DevMode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
    DevMode.dmPelsWidth := x;
    DevMode.dmPelsHeight := y;
    Result := ChangeDisplaySettings(DevMode, 0) = DISP_CHANGE_SUCCESSFUL;
  end;
end;

{����˵��:}
{��һ��������Ҫ������ݷ�ʽ���ļ�, ���Ǳ����; �������ǿ�ѡ����}
{�ڶ��������ǿ�ݷ�ʽ����, ȱʡʹ�ò���һ���ļ���}
{������������ָ��Ŀ���ļ���, ȱʡĿ��������; ����е��ĸ�����, �ò�����������}
{���ĸ��������ó����ķ�ʽָ��Ŀ���ļ���; ��ϵ�г��������� ShlObj ��Ԫ, CSIDL_ ��ͷ}

function CreateShortcut(Exe:string; Lnk:string = ''; Dir:string = ''; ID:Integer = -1):Boolean;
var
  IObj: IUnknown;
  ILnk: IShellLink;
  IPFile: IPersistFile;
  PIDL: PItemIDList;
  InFolder: array[0..MAX_PATH] of Char;
  LinkFileName: WideString;
begin
  Result := False;
  if not FileExists(Exe) then
    Exit;
  if Lnk = '' then
    Lnk := ChangeFileExt(ExtractFileName(Exe), '');

  IObj := CreateComObject(CLSID_ShellLink);
  ILnk := IObj as IShellLink;
  ILnk.SetPath(PChar(Exe));
  ILnk.SetWorkingDirectory(PChar(ExtractFilePath(Exe)));

  if (Dir = '') and (ID = -1) then
    ID := CSIDL_DESKTOP;
  if ID > -1 then
  begin
    SHGetSpecialFolderLocation(0, ID, PIDL);
    SHGetPathFromIDList(PIDL, InFolder);
    LinkFileName := Format('%s\%s.lnk', [InFolder, Lnk]);
  end
  else
  begin
    Dir := ExcludeTrailingPathDelimiter(Dir);
    if not DirectoryExists(Dir) then
      Exit;
    LinkFileName := Format('%s\%s.lnk', [Dir, Lnk]);
  end;

  IPFile := IObj as IPersistFile;
  if IPFile.Save(PWideChar(LinkFileName), False) = 0 then
    Result := True;
end; {CreateShortcut ��������}


end.
