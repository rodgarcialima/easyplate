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
//    ����DLL�����ĵ��õ�Ԫ
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyUtilDLL;

interface

uses
  Windows, SysUtils, Classes, Math;

type

  TTimeOfWhat = ( ftCreationTime, ftLastAccessTime, ftLastWriteTime );
  TFileTimeComparision = ( ftError, ftFileOneIsOlder, ftFileTimesAreEqual, ftFileTwoIsOlder );
  TDriveType = (dtUnknown, dtNoDrive, dtFloppy, dtFixed, dtNetwork, dtCDROM, dtRAM);

  TVolumeInfo = record
     Name               : String;
     SerialNumber       : DWORD;
     MaxComponentLength : DWORD;
     FileSystemFlags    : DWORD;
     FileSystemName     : String;
  end; // TVolumeInfo

  PFixedFileInfo = ^TFixedFileInfo;
  TFixedFileInfo = record
     dwSignature       : DWORD;
     dwStrucVersion    : DWORD;
     wFileVersionMS    : WORD;  // Minor Version
     wFileVersionLS    : WORD;  // Major Version
     wProductVersionMS : WORD;  // Build Number
     wProductVersionLS : WORD;  // Release Version
     dwFileFlagsMask   : DWORD;
     dwFileFlags       : DWORD;
     dwFileOS          : DWORD;
     dwFileType        : DWORD;
     dwFileSubtype     : DWORD;
     dwFileDateMS      : DWORD;
     dwFileDateLS      : DWORD;
  end; // TFixedFileInfo

  TWinVer = Packed Record
    dwVersion : DWORD;
    sVerSion  : String;   
  end;   

  TKeyBit = (kb128, kb192, kb256);
{$IFDEF VER130}            // This is a bit awkward 
    // 8-byte integer
    TInteger8 = Int64;     // Delphi 5 
{$ELSE} 
  {$IFDEF VER120} 
    TInteger8 = Int64;     // Delphi 4 
  {$ELSE} 
    TInteger8 = COMP;      // Delphi  2 or 3 
  {$ENDIF} 
{$ENDIF}

const
  START_YEAR=1901;
  END_YEAR=2050;

  DLLEasyOS = 'EasyOS.dll';
  CalendarDLL = 'EasyCalendar.dll';
  //----------------------------------------------------------------------------
  //EasyOS.dll
  //��ȡϵͳ�汾 �����ַ���
  function GetWindowsVersion: string; stdcall; external 'EasyOS.dll';
  //���ز���ϵͳ�汾��ʶ
 {Win3x    = $03000000;
  Win95    = $04000000;
  Win98ME  = $04010000;
  WinNT40  = $04020000;
  Win2000  = $05000000;
  WinXP    = $05010000;
  Win2003  = $05020000;
  WinVista = $06000000;
  Win2008  = $06000100;}
  function GetWindowsVersion_dw: DWORD; stdcall; external 'EasyOS.dll';

  //��ȡ������û���
  function GetComputerUserName: PChar; stdcall; external DLLEasyOS;
  
  //��ȡϵͳ�û���
  function GetSystemUserName: PChar; external DLLEasyOS;

  //���TCP/IPЭ���Ƿ�װ
  function IsIPInstalled : boolean; external DLLEasyOS;

  //�õ������ľ�����Ip��ַ
  Function GetLocalIp(var LocalIp:string): Boolean; external DLLEasyOS;

  //�������״̬
  Function CheckIPNetState(IpAddr : string): Boolean; external DLLEasyOS;

  //�������Ƿ�����
  Function NetInternetConnected: Boolean; external DLLEasyOS;  {ERROR}

  //��ȡ����MAC��ַ
  function GetLocalMAC:string; external DLLEasyOS;

  //��ȡ����MAC��ַ ����DLL
  function GetLocalMAC_DLL: string; external DLLEasyOS;

  //* hosttoip ���������ǽ�����������ip
  function HostToIP(Name: string; var Ip: string): Boolean; external DLLEasyOS;

  {*out��in���ָ����Window2000����Ring3(��ͨ����)������ʹ��,���Ҫʹ��,����
  ����Ring0ָ���(����ϵͳ��),������������Ring0������*}
  function GetPrinterStatus : byte; external DLLEasyOS;//�Ӳ��ж˿ڶ�ȡ��ӡ��״̬
  function CheckPrinter : boolean; external DLLEasyOS;//��ȡ��ӡ���Ƿ����

    function GetWindowsDirectory          : String; external DLLEasyOS;     //ϵͳwindows·��
    function GetSystemDirectory           : String; external DLLEasyOS;     //ϵͳsystem·��

    function GetSystemTime          : String; external DLLEasyOS;           //��ȡϵͳʱ��
    function GetLocalTime           : String; external DLLEasyOS;           //����ʱ�䣬��ϵͳʱ��һ��
    //�ļ�
    function GetCurrentDirectory        : String; external DLLEasyOS;       //��ǰ�ļ�·��
    function GetTempPath                : String; external DLLEasyOS;       //��ȡTEMP�ļ�·����Ϊ��·����ʽ
    function GetLogicalDrives           : String;  external DLLEasyOS;      //��ȡϵͳ�������̷������һ���ַ���

    //��ȡ�ļ��Ĵ������޸Ļ����һ�εĶ�ȡʱ��
    function GetFileTime( const FileName : String; ComparisonType : TTimeOfWhat ) : TFileTime; external DLLEasyOS;
    function GlobalMemoryStatus( const Index : Integer )                          : DWORD; external DLLEasyOS;
    //ϵͳ��Ϣ
    function GetSystemInfoWORD( const Index : Integer )                           : WORD; external DLLEasyOS;
    function GetSystemInfoDWORD( const Index : Integer )                          : DWORD; external DLLEasyOS;
    function GetSystemVersion           : String; external DLLEasyOS;

    function GetSystemInfoPtr( const Index : Integer )                            : Pointer; external DLLEasyOS;
    //��ȡָ���ļ�����Ϣ
    function GetFileInformation(const FileName, Value : String ): String; external DLLEasyOS;
    //��ȡ�ļ���С
    function FileSize(const FileName : String ) : LongInt; external DLLEasyOS;
    //�ж������ļ��Ĵ���ʱ�������
    function CompareFileTime(const FileNameOne, FileNameTwo : String; ComparisonType : TTimeOfWhat ): TFileTimeComparision; external DLLEasyOS;
    //��ȡ�ļ��Ĵ����޸ġ�������ʱ��
    function GetFileTime_0(const FileName : String; ComparisonType : TTimeOfWhat ): TDateTime; external DLLEasyOS;
    //��ȡ����ͼ��
    function ExtractIcon(const FileName : String ): HIcon; external DLLEasyOS;
    function ExtractAssociatedIcon( const FileName : String ): HIcon;  external DLLEasyOS;

    //����
    function GetFreeDiskSpace(const Drive : Char ) : LongInt; external DLLEasyOS;
    function GetAllDiskFreeSpace : string; external DLLEasyOS;
    function GetVolumeInformation(const Drive : Char ) : TVolumeInfo; external DLLEasyOS;
    function DriveType(const Drive : Char ) : TDriveType; external DLLEasyOS;
    function DisconnectNetworkDrive( const Drive : Char ): Boolean; external DLLEasyOS;
    function AddNetworkDrive( const Resource : String; const Drive : Char ): Boolean;  external DLLEasyOS;
    function GetUniversalName( const Drive : Char ): String; external DLLEasyOS;
    procedure FormatDrive( const Drive : Char ); external DLLEasyOS;

    //��·��
    function GetShortPathName(const Path : String ): String; external DLLEasyOS;
    function GetFullPathName(const Path : String ): String; external DLLEasyOS;
    //���ݿ�ִ���ļ��������ҿ�ִ���ļ�·��
    function FindExecutable(const FileName : String ): String; external DLLEasyOS;

    procedure ShellAbout( const TitleBar, OtherText : String );  external DLLEasyOS;
    procedure ShutDown; external DLLEasyOS;

    function FileInfo(const FileName : String ) : TFixedFileInfo;  external DLLEasyOS;

    //EMAIL��Ч���ж�
    procedure SendEMail_Hide; external DLLEasyOS;
    function CheckMailAddress(Value : string): boolean; external DLLEasyOS;//�ж�EMAIL��ַ�Ƿ�Ϸ�
    
//----------------------------------------------------------------------------
  //EasySysShell.dll
  //ϵͳ��ز���
  //������Ļ�ֱ���
  function SetScreen(x,y: Word): Boolean; stdcall; external 'EasySysShell.dll';
  {����˵��:}
  {��һ��������Ҫ������ݷ�ʽ���ļ�, ���Ǳ����; �������ǿ�ѡ����}
  {�ڶ��������ǿ�ݷ�ʽ����, ȱʡʹ�ò���һ���ļ���}
  {������������ָ��Ŀ���ļ���, ȱʡĿ��������; ����е��ĸ�����, �ò�����������}
  {���ĸ��������ó����ķ�ʽָ��Ŀ���ļ���; ��ϵ�г��������� ShlObj ��Ԫ, CSIDL_ ��ͷ}
  {���� 1: �ѵ�ǰ�����������Ͻ�����ݷ�ʽ}
  //  procedure TForm1.Button1Click(Sender: TObject);
  //  begin
  //  CreateShortcut(Application.ExeName);
  //  end;
  //
  //  {���� 2: �������Ͻ�����ݷ�ʽ, ͬʱָ����ݷ�ʽ����}
  //  procedure TForm1.Button2Click(Sender: TObject);
  //  begin
  //  CreateShortcut(Application.ExeName, 'NewLinkName');
  //  end;
  //
  //  {���� 3: �� C:\ �½�����ݷ�ʽ}
  //  procedure TForm1.Button3Click(Sender: TObject);
  //  begin
  //  CreateShortcut(Application.ExeName, '', 'C:\');
  //  end;
  //
  //  {���� 3: �ڿ�ʼ�˵��ĳ����ļ����½�����ݷ�ʽ}
  //  procedure TForm1.Button4Click(Sender: TObject);
  //  begin
  //  CreateShortcut(Application.ExeName, '', '', CSIDL_PROGRAMS);
  //  end;
  function CreateShortcut(Exe:string; Lnk:string = ''; Dir:string = '';
           ID:Integer = -1):Boolean; stdcall; external 'EasySysShell.dll';

  //----------------------------------------------------------------------------
  //EasyString.dll
  //����ͷ��廥��
  function GB2Big(GB: string): string; stdcall; external 'EasyString.dll';
  function Big2GB(Big: string): string; stdcall; external 'EasyString.dll';

  //----------------------------------------------------------------------------
  //EasyIMCode.dll
  //��ȡ����ƴ�� ƴ��ת����
  function MakeSpellCode(stText: string; iMode, iCount: Integer): string; stdcall;
           external 'EasyIMCode.dll';
  { iMode �����ƹ���λ˵��
    X X X X X X X X X X X X X X X X
                             3 2 1
    1: 0 - ֻȡ����������ĸ�ĵ�һ����ĸ; 1 - ȫȡ
    2: 0 - �������ܷ�����ַ�������; 1 - ����� '?' (��ѡ��Ŀ���ȫ���ַ�)
    3: 0 - ���ɵĴ�������������, ��ĸ�������ַ�; 1 - ����
     (����ȫ�ǵ�Ҫ���������, ��ĸ�ַ���; ��ǵķ�����, ��ĸ�ַ�)
  }
  function GetSpellCode(szText: PChar; iMode, iCount: Integer): PChar; stdcall;
           external 'EasyIMCode.dll';
  function GetPY(hzchar: string):char; stdcall; external 'EasyIMCode.dll';

  //----------------------------------------------------------------------------
  //EasyEncrypt.dll
  //�ַ������ļ��ӽ���

  //AES
  function StrToHex(Value: string): string; stdcall; external 'EasyEncrypt.dll';
  function HexToStr(Value: string): string; stdcall; external 'EasyEncrypt.dll';

  function EncryptString(Value: string; Key: string;
    KeyBit: TKeyBit = kb128): string; stdcall; external 'EasyEncrypt.dll';
  function DecryptString(Value: string; Key: string;
    KeyBit: TKeyBit = kb128): string; stdcall; external 'EasyEncrypt.dll';

  function EncryptStream(Src: TStream; Key: string;
    var Dest: TStream; KeyBit: TKeyBit = kb128): Boolean; stdcall; external 'EasyEncrypt.dll';
  function DecryptStream(Src: TStream; Key: string;
    var Dest: TStream; KeyBit: TKeyBit = kb128): Boolean; stdcall; external 'EasyEncrypt.dll';

  procedure EncryptFile(SourceFile, DestFile: string;
    Key: string; KeyBit: TKeyBit = kb128); stdcall; external 'EasyEncrypt.dll';
  procedure DecryptFile(SourceFile, DestFile: string;
    Key: string; KeyBit: TKeyBit = kb128); stdcall; external 'EasyEncrypt.dll';

  //MD5
  function transfer(tran:widestring): widestring; external 'EasyEncrypt.dll';
  function GetCode(Afilename:String): String; external 'EasyEncrypt.dll';

  //Base64
  function StrToBase64(const str: string): string; stdcall; external 'EasyEncrypt.dll';
  function Base64ToStr(const Base64: string): string; stdcall; external 'EasyEncrypt.dll';

  //CRC16
  procedure CalcCRC16 (p:  pointer; nbyte:  WORD;
              var CRCvalue:  WORD); stdcall; external 'EasyEncrypt.dll';
  procedure CalcFileCRC16 (FromName:  string; var CRCvalue:  WORD;
              var IOBuffer:  pointer;  BufferSize:
              WORD; var error:  WORD); stdcall; external 'EasyEncrypt.dll';

  //CRC32
  procedure CalcCRC32(p: pointer; ByteCount: DWORD;
              var CRCvalue: DWORD); stdcall; external 'EasyEncrypt.dll';

  procedure CalcFileCRC32 (FromName: string; var CRCvalue:  DWORD;
              var TotalBytes: TInteger8;
              var error:  WORD); stdcall; external 'EasyEncrypt.dll';

  //����
  //----------------------------------------------------------------------------
  //   ==>   function   IsLeapYear(Year:   Word):   Boolean;   

  //����iYear,iMonth,iDay��Ӧ�����ڼ�   1��1��1��   ---   65535��12��31��   
  function   WeekDay(iYear,iMonth,iDay:Word):Integer; stdcall; external CalendarDLL;
  //   ==>   function   DayOfWeek(Date:   TDateTime):   Integer;
  //����ָ�����ڵ���������0Ϊ���꿪ʼ���һ�������쿪ʼ����
  function   WeekNum_A(const   TDT:TDateTime):Word;{overload; }stdcall; external CalendarDLL;
  function   WeekNum_B(const   iYear,iMonth,iDay:Word):Word;{overload; }stdcall; external CalendarDLL;
    
  //����iYear��iMonth�µ�����   1��1��   ---   65535��12��   
  function   MonthDays(iYear,iMonth:Word):Word; stdcall; external CalendarDLL;
    
  //��������iLunarYer������iLunarMonth�µ����������iLunarMonthΪ���£�   
  //����Ϊ�ڶ���iLunarMonth�µ��������������Ϊ0   
  //   1901��1��---2050��12��   
  function   LunarMonthDays(iLunarYear,iLunarMonth:Word):Longword; stdcall;  external CalendarDLL;
    
  //��������iLunarYear���������   
  //   1901��1��---2050��12��   
  function   LunarYearDays(iLunarYear:Word):Word; stdcall; external CalendarDLL;
    
  //��������iLunarYear��������·ݣ���û�з���0   
  //   1901��1��---2050��12��   
  function   GetLeapMonth(iLunarYear:Word):Word; stdcall; external CalendarDLL;
    
  //��iYear���ʽ������ɼ��귨��ʾ���ַ���   
  procedure   FormatLunarYear_A(iYear:Word;var   pBuffer:string);{overload;} stdcall; external CalendarDLL;
  function   FormatLunarYear_B(iYear:Word):string;{overload;} stdcall; external CalendarDLL;
    
  //��iMonth��ʽ���������ַ���   
  procedure   FormatMonth_A(iMonth:Word;var   pBuffer:string;bLunar:Boolean=True);{overload;} stdcall; external CalendarDLL;
  function   FormatMonth_B(iMonth:Word;bLunar:Boolean=True):string;{overload;} stdcall; external CalendarDLL;
    
  //��iDay��ʽ���������ַ���   
  procedure   FormatLunarDay_A(iDay:Word;var   pBuffer:string);{overload; }stdcall; external CalendarDLL;
  function   FormatLunarDay_B(iDay:Word):string;{overload; }stdcall; external CalendarDLL;
    
  //���㹫���������ڼ���������     1��1��1��   ---   65535��12��31��
  function   CalcDateDiff_A(iEndYear,iEndMonth,iEndDay:Word;iStartYear:Word=START_YEAR;
             iStartMonth:Word=1;iStartDay:Word=1):Longword;{overload; }stdcall; external CalendarDLL;
  function   CalcDateDiff_B(EndDate,StartDate:TDateTime):Longword;{overload; }stdcall; external CalendarDLL;
    
  //���㹫��iYear��iMonth��iDay�ն�Ӧ����������,���ض�Ӧ����������   0-24   
  //1901��1��1��---2050��12��31��   
  function   GetLunarDate_A(iYear,iMonth,iDay:Word;
             var iLunarYear,iLunarMonth,iLunarDay:Word):Word;{overload; }stdcall; external CalendarDLL;
  procedure   GetLunarDate_B(InDate:TDateTime;
             var iLunarYear,iLunarMonth,iLunarDay:Word);{overload; }stdcall; external CalendarDLL;
    
  function   GetLunarHolDay_A(InDate:TDateTime):string;{overload; }stdcall; external CalendarDLL;
  function   GetLunarHolDay_B(iYear,iMonth,iDay:Word):string;{overload; }stdcall; external CalendarDLL;

  //private   function--------------------------------------   
    
  //�����1901��1��1�չ�iSpanDays������������   
  procedure   l_CalcLunarDate(var iYear,iMonth,iDay:Word;iSpanDays:Longword); stdcall; external CalendarDLL;
    
  //���㹫��iYear��iMonth��iDay�ն�Ӧ�Ľ���   0-24��0���ǽ���   
  function   l_GetLunarHolDay(iYear,iMonth,iDay:Word):Word; stdcall; external CalendarDLL;

  //���ݵ�ǰ���ڷ����й������ַ�
  function GetChinaDay: PChar; stdcall; external CalendarDLL;
  
implementation

end.
