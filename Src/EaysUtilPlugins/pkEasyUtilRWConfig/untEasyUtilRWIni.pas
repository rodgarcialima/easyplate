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
//    ����Ԫ���ṩ�������ӵĵ�Ԫ(�����),ֻ���һ����Ч��ADOConnection
//
//��Ҫʵ�֣�
//      1����ȡIni�����ļ���Ϣ
//-----------------------------------------------------------------------------}
unit untEasyUtilRWIni;

interface

uses
  SysUtils, Classes, Windows, IniFiles;

type

{ TEasyStreamIniFile }

  TEasyStreamIniFile = class (TMemIniFile)
  {* ֧���������� IniFile �࣬�ṩ�� LoadFromStream��SaveToStream ��������ж�ȡ
     Ini ���ݡ� }
  private
    FFileName: string;
  public
    constructor Create(const FileName: string = '');
    destructor Destroy; override;
    function LoadFromFile(const FileName: string): Boolean;
    function LoadFromStream(Stream: TStream): Boolean; virtual;
    function SaveToFile(const FileName: string): Boolean;
    function SaveToStream(Stream: TStream): Boolean; virtual;
    procedure UpdateFile; override;

    property FileName: string read FFileName;
  end;

{ TEasyXorIniFile }

  TEasyXorIniFile = class (TEasyStreamIniFile)
  {* ֧������ Xor ���ܼ��������� IniFile �࣬����� INI ���ݽ��� Xor ���ܡ� }
  private
    FXorStr: string;
  protected

  public
    constructor Create(const FileName: string; const XorStr: string);
    {* �๹������
     |<PRE>
       FileName: string     - INI �ļ���������ļ����ڽ��Զ�����
       XorStr: string       - ���� Xor �������ַ���
     |</PRE>}
    function LoadFromStream(Stream: TStream): Boolean; override;
    {* ������װ�� INI ���ݣ����е����ݽ��� Xor ���� }
    function SaveToStream(Stream: TStream): Boolean; override;
    {* ���� INI ���ݵ��������е����ݽ��� Xor ���� }
  end;

  TEasyRWIni = class(TComponent)
  private
    FIniFile: TIniFile;
  public
    //��INIȡֵ
    function ReadValueString(ASection, AIdent, ADefault: string): string; overload;
    function ReadValueBoolean(ASection, AIdent: string; ADefault: Boolean): Boolean; overload;
    function ReadValueInteger(ASection, AIdent: string; ADefault: Integer): Integer; overload;
    function ReadValueDateTime(ASection, AIdent: string; ADefault: TDateTime): TDateTime; overload;
    function ReadValueDouble(ASection, AIdent: string; ADefault: Double): Double; overload;
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; IniPath: string); reintroduce; overload;
    destructor Destroy; override;
  end;
implementation

uses untEasyUtilStream;

{ TEasyRWIni }

constructor TEasyRWIni.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);  
end;

constructor TEasyRWIni.Create(AOwner: TComponent; IniPath: string);
begin
  inherited Create(AOwner);
  FIniFile := TIniFile.Create(IniPath);
end;

destructor TEasyRWIni.Destroy;
begin
  if FIniFile <> nil then
    FreeAndNil(FIniFile);
  inherited;
end;

function TEasyRWIni.ReadValueBoolean(ASection, AIdent: string; ADefault: Boolean): Boolean;
begin
  Result := FIniFile.ReadBool(ASection, AIdent, ADefault);
end;

function TEasyRWIni.ReadValueDateTime(ASection, AIdent: string; ADefault: TDateTime): TDateTime;
begin
  Result := FIniFile.ReadDateTime(ASection, AIdent, ADefault);
end;

function TEasyRWIni.ReadValueDouble(ASection, AIdent: string; ADefault: Double): Double;
begin
  Result := FIniFile.ReadFloat(ASection, AIdent, ADefault);
end;

function TEasyRWIni.ReadValueInteger(ASection, AIdent: string; ADefault: Integer): Integer;
begin
  Result := FIniFile.ReadInteger(ASection, AIdent, ADefault);
end;

function TEasyRWIni.ReadValueString(ASection, AIdent, ADefault: string): string;
begin
  Result := FIniFile.ReadString(ASection, AIdent, ADefault);
end;

{ TEasyStreamIniFile }

constructor TEasyStreamIniFile.Create(const FileName: string);
begin
  inherited Create('');
  FFileName := FileName;
  if FileExists(FFileName) then
    LoadFromFile(FFileName);
end;

destructor TEasyStreamIniFile.Destroy;
begin
  UpdateFile;
  inherited;
end;

function TEasyStreamIniFile.LoadFromFile(const FileName: string): Boolean;
var
  Stream: TFileStream;
begin
  try
    Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
    try
      Result := LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
  except
    Result := False;
  end;
end;

function TEasyStreamIniFile.LoadFromStream(Stream: TStream): Boolean;
var
  Strings: TStrings;
begin
  try
    Strings := TStringList.Create;
    try
      Strings.LoadFromStream(Stream);
      SetStrings(Strings);
    finally
      Strings.Free;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TEasyStreamIniFile.SaveToFile(const FileName: string): Boolean;
var
  Stream: TFileStream;
begin
  try
    Stream := TFileStream.Create(FileName, fmCreate);
    try
      Stream.Size := 0;
      Result := SaveToStream(Stream);
    finally
      Stream.Free;
    end;
  except
    Result := False;
  end;
end;

function TEasyStreamIniFile.SaveToStream(Stream: TStream): Boolean;
var
  Strings: TStrings;
begin
  try
    Strings := TStringList.Create;
    try
      GetStrings(Strings);
      Strings.SaveToStream(Stream);
    finally
      Strings.Free;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TEasyStreamIniFile.UpdateFile;
begin
  if FileExists(FFileName) then
    SaveToFile(FFileName);
end;

{ TEasyXorIniFile }

constructor TEasyXorIniFile.Create(const FileName, XorStr: string);
begin
  FXorStr := XorStr;
  inherited Create(FileName);
end;

function TEasyXorIniFile.LoadFromStream(Stream: TStream): Boolean;
var
  XorStream: TEasyXorStream;
begin
  XorStream := TEasyXorStream.Create(Stream, AnsiString(FXorStr));
  try
    Result := inherited LoadFromStream(XorStream);
  finally
    XorStream.Free;
  end;
end;

function TEasyXorIniFile.SaveToStream(Stream: TStream): Boolean;
var
  XorStream: TEasyXorStream;
begin
  XorStream := TEasyXorStream.Create(Stream, AnsiString(FXorStr));
  try
    Result := inherited SaveToStream(XorStream);
  finally
    XorStream.Free;
  end;
end;

end.
