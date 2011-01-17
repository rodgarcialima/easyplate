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
//    EasyPlate����Ĺ���������Ԫ
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyUtilMethod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, StdCtrls, ActiveX, FileCtrl, UrlMon, TlHelp32, ExtCtrls,
  ComObj, WinSock, ComCtrls, DB, ADODB, IdGlobal, ImageHlp, untEasyTabSet,
  Menus, DBClient, untEasyProgressBar;

type

  //���ݴ��෽ʽ
  TOpenClientDataSetStyle = (ocdOpen, ocdExecute);
   
  //�ر��Ӵ����¼���
  TMDICloseNotify = procedure (Sender: TObject; var Action: TCloseAction) of object;
  //�����������
  TShowBplForm = function (AParamList: TStrings): TForm; stdcall;

  TSearchType = (stCurrent, stSub, stAll);
  
  TCPUID = array[1..4] of Longint;
  TVendor = array [0..11] of char;
  
  TInformationStrings = ( isCompanyName,  isFileDescription, isFileVersion,
                          isInternalName, isLegalCopyright,  isOriginalFilename,
                          isProductName,  isProductVersion,  isComments,
                          isLegalTrademarks );

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

  TSrbIoControl = packed record 
    HeaderLength : ULONG;
    Signature : Array[0..7] of Char;
    Timeout : ULONG;
    ControlCode : ULONG;
    ReturnCode : ULONG;
    Length : ULONG;
  end;
  SRB_IO_CONTROL = TSrbIoControl;
  PSrbIoControl = ^TSrbIoControl; 

  TIDERegs = packed record
    bFeaturesReg : Byte; // Used for specifying SMART "commands".
    bSectorCountReg : Byte; // IDE sector count register
    bSectorNumberReg : Byte; // IDE sector number register
    bCylLowReg : Byte; // IDE low order cylinder value
    bCylHighReg : Byte; // IDE high order cylinder value
    bDriveHeadReg : Byte; // IDE drive/head register
    bCommandReg : Byte; // Actual IDE command.
    bReserved : Byte; // reserved. Must be zero.
  end;
    IDEREGS = TIDERegs;
    PIDERegs = ^TIDERegs;
    
  TSendCmdInParams = packed record
    cBufferSize : DWORD;
    irDriveRegs : TIDERegs;
    bDriveNumber : Byte;
    bReserved : Array[0..2] of Byte;
    dwReserved : Array[0..3] of DWORD;
    bBuffer : Array[0..0] of Byte;
  end;
  SENDCMDINPARAMS = TSendCmdInParams;
  PSendCmdInParams = ^TSendCmdInParams;

  TIdSector = packed record
    wGenConfig : Word;
    wNumCyls : Word;
    wReserved : Word;
    wNumHeads : Word;
    wBytesPerTrack : Word;
    wBytesPerSector : Word;
    wSectorsPerTrack : Word;
    wVendorUnique : Array[0..2] of Word;
    sSerialNumber : Array[0..19] of Char;
    wBufferType : Word;
    wBufferSize : Word;
    wECCSize : Word;
    sFirmwareRev : Array[0..7] of Char;
    sModelNumber : Array[0..39] of Char;
    wMoreVendorUnique : Word;
    wDoubleWordIO : Word;
    wCapabilities : Word;
    wReserved1 : Word;
    wPIOTiming : Word;
    wDMATiming : Word;
    wBS : Word;
    wNumCurrentCyls : Word;
    wNumCurrentHeads : Word;
    wNumCurrentSectorsPerTrack : Word;
    ulCurrentSectorCapacity : ULONG;
    wMultSectorStuff : Word;
    ulTotalAddressableSectors : ULONG;
    wSingleWordDMA : Word;
    wMultiWordDMA : Word;
    bReserved : Array[0..127] of Byte;
  end;
    PIdSector = ^TIdSector; 

const
  NumberArray: array[0..9] of string =
    ('��', 'Ҽ','�E','��','��','��','½','��','��','��');
  //���ܽ���
  C1 = 888888;
  C2 = 999999;
  {* �ַ��������� }
  XorKey:array[0..7] of Byte=(8,8,8,8,8,8,8,8); //$B2,$09,$AA,$55,$93,$6D,$84,$47
  //CPU
  IDE_ID_FUNCTION = $EC;
  IDENTIFY_BUFFER_SIZE = 512;
  DFP_RECEIVE_DRIVE_DATA = $0007c088;
  IOCTL_SCSI_MINIPORT = $0004d008;
  IOCTL_SCSI_MINIPORT_IDENTIFY = $001b0501;
  DataSize = sizeof(TSendCmdInParams)-1+IDENTIFY_BUFFER_SIZE;
  BufferSize = SizeOf(SRB_IO_CONTROL)+DataSize;
  W9xBufferSize = IDENTIFY_BUFFER_SIZE+16;
  
   PROCESSOR_INTEL_386     = 386;
   PROCESSOR_INTEL_486     = 486;
   PROCESSOR_INTEL_PENTIUM = 586;
   PROCESSOR_MIPS_R4000    = 4000;
   PROCESSOR_ALPHA_21064   = 21064;

   //XML
   //��XML�ļ���ȡģ����Ϣ ./plugins/plugins-config.xml
  {*********************  ����ת��������Ҵ�д ************}          //***********  ����ת��������Ҵ�д
  // ����ת���д
  function NumToRMB_0(AMoney: string): string;
  // ����ת����RMB ת��������ǧ��
  function NumToRMB(const S:WideString):WideString;
  
  //�õ�ϵͳ��ǰ���ڼ�
  function GetSystemWeek : string;
  
  //����ָ���ļ����µ������ļ�
  //FlagΪ0 --�����ļ� 1--�����ļ���
  procedure SearchFile(path: string; var AList : TStrings; AFileType: string = '*.*'; Flag: Integer = 0);
  //ע��,path����Ҫ��'\';
  //��ȡĿ¼�µ��ļ���
  procedure GetDirs(dirName: string; List: TStrings; ASerachType: TSearchType = stCurrent);

  //���Ҵ���
  function FindForm(FormClass: TFormClass): TForm;
  //������ʾ����
  function FindShowForm(FormClass: TFormClass; const Caption: string): TForm;
  //����ָ��CAPTION�Ĵ���
  function InternalFindShowForm(FormClass: TFormClass;const Caption: string; Restore: Boolean): TForm;

  //���ز��
  //AType = 0��ʾ����ӵ�MDITab
  function LoadPkg(APluginFile: string; ATmpStrings: TStrings; AMDITabSet: TEasyMDITabSet;
                  AEasyProgressBar: TEasyProgressBar;
                  AMDICloseNotify: TMDICloseNotify; AType: Integer = 0): Boolean; overload;
  //ShowModel���ز��
  function LoadPkg(APluginFile: string; ATmpStrings: TStrings): Boolean; overload;

  //��ȡӲ�����к�
  function GetIdeDiskSerialNumber(i:Integer) : String;
  function GetCPUID : TCPUID; assembler; register;
  function GetCPUVendor : TVendor; assembler; register;
  
  //�ַ�����  ����
  //s ��ʾҪ���ܵ��ַ�����KEY����Կ
  function Encrypt(const S: String; Key: Word): String;
  function Decrypt(const S: String; Key: Word): String;
  function EncStr(Str:String):String;//�ַ����ܺ��� �@���õ�һ���������
  function DecStr(Str:String):String;//�ַ����ܺ���
  
  //�����ļ���
  function CreateDir_H(APath: string): Boolean;
  //д����־�ĵ�����
  //����ı��ļ�����Base64����
  procedure WriteLog_H(ALogPath: String; AContent: String);

  //����GUID
  function GenerateGUID: string;

  //2010-11-06 16:19:43 +�����ݼ����÷���
  //ʧ�ܷ��� -1 �ɹ����� 1
  function OpenClientDataSet(AClientDataSet: TClientDataSet;
                              AOpenClientDataSetStyle: TOpenClientDataSetStyle = ocdOpen): string;
  //��ȡ�û�ģ��Ȩ��
  function getUserModuleRight(FormId, CurrUserID: string): string;

  //��ȡָ�������Ƿ����ĳ������ ����typinfo
  function FindProperty(AClass: TObject; sPropertyName: String): Boolean;
  //����ָ���ؼ�BondLabel��������ɫ
  function SetEditLabelColor(AClass: TObject; AColor: TColor): Boolean;
  //��ȡָ���ؼ�BondLabel�ı���
  function GetEditLabelCaption(AClass: TObject): string;

  //��ȡ�ؼ��İ������ֶ�
  function GetDBDataBinding(AClass: TObject; var ABondLabelCaption: string): string;
  //��ȡ�ؼ��İ����ݼ�
  function GetDBDataBindingDataSet(AClass: TObject): TDataSet;

  //����ָ���ؼ������ӿؼ���BonLabel��������ɫ
  procedure SetEditLabelsColor(AParentControl: TControl;
                              AColor: TColor; var ASetControlList: TList);
implementation

uses untEasyUtilConst, TypInfo, cxDBEdit;

function GenerateGUID: string;
var
  ATmp: TGUID;
begin
  Result := '';
  if CoCreateGuid(ATmp) = S_OK then
    Result := GUIDToString(ATmp);
end;

procedure ChangeByteOrder( var Data; Size : Integer );
var
  ptr : PChar;
  i : Integer;
  c : Char;
begin
  ptr := @Data;
  for i := 0 to (Size shr 1)-1 do
  begin
    c := ptr^;
    ptr^ := (ptr+1)^;
    (ptr+1)^ := c;
    Inc(ptr,2);
  end;
end;

function GetSystemWeek : string;
begin
  Result := FormatDateTime('ddd',Date);
end;

//�ַ�����
//s ��ʾҪ���ܵ��ַ�����KEY����Կ
function Encrypt(const S: String; Key: Word): String;
var
   I: Integer;
begin
  Result := S;
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(Result[I]) + Key) * C1 + C2;
  end;
end;

//�ַ�����
//s ��ʾҪδ���ܵ��ַ�����KEY����Կ
function Decrypt(const S: String; Key: Word): String;
var
   I: Integer;
begin
  Result := S;
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(S[I]) + Key) * C1 + C2;
  end;
end;

function EncStr(Str:String):String;//�ַ����ܺ��� �@���õ�һ���������
var
  i,j:Integer;
begin
  Result:='';
  j:=0;
  for i:=1 to Length(Str) do
  begin
    Result:=Result+IntToHex(Byte(Str[i]) xor XorKey[j],2);
    j:=(j+1) mod 8;
  end;
end;

function DecStr(Str:String):String;//�ַ����ܺ���
var
  i,j:Integer;
begin
  Result:='';
  j:=0;
  for i:=1 to Length(Str) div 2 do
  begin
    Result:=Result+Char(StrToInt('$'+Copy(Str,i*2-1,2)) xor XorKey[j]);
    j:=(j+1) mod 8;
  end;
end;

// ����ת���д
function NumToRMB_0(AMoney: string): string;
  // ȥ�����зָ���
  procedure ClearComma(var AValue: string);
  begin
    while Pos(',', AValue) > 0 do
      Delete(AValue, Pos(',', AValue), 1);
  end;
  // �������Ϊ�㽫������ֵ
  function FiltrateValue(const AValue, AStr: string): string;
  var
    IntValue: Integer;
  begin
    IntValue:= StrToIntDef(AValue, 0);
    if IntValue > 0 then Result:= AStr; 
  end;
  // ֱ�ӽ����ַ���ɴ�д
  function Direct(const AValue: string): string;
  var
    ResultStr: string;
    iCount: Integer;
  begin
    for iCount:= 1 to Length(AValue) do
      ResultStr:= ResultStr + NumberArray[StrToInt(AValue[iCount])];
    Result:= ResultStr;
  end;
  // ����λ���ȵ����ַ������д
  function FourBit(const AValue: string): string;
  var
    i, x, j: Integer;
    IntValue: Integer;
    ResultStr: string;
  begin
    IntValue:= StrToIntDef(AValue, 0);
    x:= IntValue;
    i := x div 1000;
    j := x mod 1000;
    if i <> 0 then ResultStr:= NumberArray[i] + 'Ǫ'
    else begin
      if Length(AValue) > 3 then ResultStr:= '��';
    end;
    i := j div 100;
    j := j mod 100;
    if i <> 0 then  ResultStr:= ResultStr + NumberArray[i] + '��'
    else begin
      if (ResultStr <> '') and (Length(AValue) > 2) and
        (Copy(ResultStr, Length(ResultStr)-1, 2) <> '��') then
        ResultStr:= ResultStr + '��';
    end;
    i := j div 10;
    j := j mod 10;
    if i <> 0 then ResultStr := ResultStr + NumberArray[i] + 'ʰ'
    else begin
      if (ResultStr <> '') and (Length(AValue) > 1) and
        (Copy(ResultStr, Length(ResultStr)-1, 2) <> '��') then
        ResultStr:= ResultStr + '��';
    end;
    ResultStr := ResultStr + NumberArray[j];
    while Copy(ResultStr, Length(ResultStr)-1, 2) = '��' do
      Delete(ResultStr, Length(ResultStr)-1, 2);
    Result := ResultStr;
  end;
var
  IntegerValue: string;   // �������ֵ�ֵ
  KilomegaValue: string;  // �洢����ǧ�׵�����
  AccountValue: string;   // ��ǧ�����ڵ���������
  DecimalValue: string;   // ����С������ֵ

  ResultKilomega: string; // ����ǧ�ײ������Ĵ�д�ַ�
  ResultAccount: string;  // ��ǧ�����ڵ��������ֲ������Ĵ�д�ַ�
  ResultDecimal: string;  // С������ֵ�������Ĵ�д�ַ�

  FourBitStr: string;     // �����λֵ���ַ�
begin
  // ����ָ���
  ClearComma(AMoney);
  // ��֤�ַ����Ƿ�Ϸ�
  try
    AMoney:= FloatToStr(StrToFloat(AMoney));
  except
    raise Exception.Create('��Ч����ֵ�ַ���');
  end;

  // ȡ��С���ݵ���ֵ
  // ȡ���������ֵ�ֵ
  if Pos('.', AMoney) > 0 then
  begin
    DecimalValue:= Copy(AMoney, Pos('.', AMoney) + 1, Length(AMoney));
    IntegerValue:= Copy(AMoney, 0, Pos('.', AMoney)-1);
    ResultDecimal:= '.' + Direct(DecimalValue);
  end
  else IntegerValue:= AMoney;

  // ȡ������ǧ�׵�����
  // ȡ����ǧ�����ڵ���������
  if Length(IntegerValue) > 16 then
  begin
    KilomegaValue:= Copy(IntegerValue, 0, Length(IntegerValue) - 12);
    AccountValue:= Copy(IntegerValue,
      Length(IntegerValue) - 11, Length(IntegerValue));
    ResultKilomega:= Direct(KilomegaValue) + '��';
  end
  else AccountValue:= IntegerValue;

  { ������ǧ�����ڵ��������� }

  // ����������Ǫ��֮��Ĳ���
  if Length(AccountValue) > 12 then
  begin
    FourBitStr:= Copy(AccountValue, 0, Length(AccountValue) - 12);
    ResultAccount:= ResultAccount +
      FourBit(FourBitStr) + FiltrateValue(FourBitStr, '��');
    Delete(AccountValue, 1, Length(AccountValue) - 12);
  end;
  // ����������Ǫ��֮��Ĳ���
  if Length(AccountValue) >= 8 then
  begin
    FourBitStr:= Copy(AccountValue, 0, Length(AccountValue) - 8);
    ResultAccount:= ResultAccount +
      FourBit(FourBitStr) + FiltrateValue(FourBitStr, '��');
    Delete(AccountValue, 1, Length(AccountValue) - 8);
  end;
  // ����������Ǫ��֮��Ĳ���
  if Length(AccountValue) >= 5 then
  begin
    FourBitStr:= Copy(AccountValue, 0, Length(AccountValue) - 4);
    ResultAccount:= ResultAccount +
      FourBit(FourBitStr) + FiltrateValue(FourBitStr, '��');
    Delete(AccountValue, 1, Length(AccountValue) - 4);
  end;
  // ���������µĲ���
  if Length(AccountValue) > 0 then
  begin
    ResultAccount:= ResultAccount +
      FourBit(Copy(AccountValue, 0, Length(AccountValue)));
  end;

  // ����ַ���
  Result:= ResultKilomega + ResultAccount + ResultDecimal;
  
end;

function NumToRMB(const S:WideString):WideString;
//[====��ֹ����000001�����
  procedure DeleZero(var S:WideString);
  begin
    if s[1]='0' then
    begin
      Delete(s,1,1);
      if Length(s)>1 then
        DeleZero(s);   //�ݹ�
    end;
  end;
//=======]
const
  ARmbUnits:WideString='Ǫ��ʰ��Ǫ��ʰ��Ǫ��ʰ��Ǫ��ʰԪԪ�Ƿ���';
  AUpper:WideString='��Ҽ��������½��ƾ�';
  AYuanPos=16;
  AKeyWordPos=[4,8,12,16];  //������Ԫ��λ��
var
  dotPos,Len,nUnitLen:integer;
  Amount,RMB,sNum,sUnit:WideString;
  i,n,k:integer;
begin
  Amount:=Trim(S);
  try
    DeleZero(Amount);   //�����ڲ�����
    len:=Length(Amount);
    dotPos:=pos('.',Amount);  //С�����λ��
    //===[�ж����ֳ����з�Խ��
    if dotPos>0 then
    begin
      if dotPos>AYuanPos+1 then
      begin
        Application.MessageBox('��ֵ����ǧ��λ!', '��ʾ', MB_OK +
          MB_ICONWARNING);
        Exit;
      end else nUnitLen:=AYuanPos-dotPos+1; //����Ԫ
    end else
    begin
      if Len>AYuanPos then
      begin
        Application.MessageBox('��ֵ����ǧ��λ!', '��ʾ', MB_OK +
          MB_ICONWARNING);
        Exit;
      end else nUnitLen:=AYuanPos-Len; //����Ԫ
    end; //======]
    RMB:='';
//    if dotPos>0 then
//      nUnitLen:=AYuanPos-dotPos+1     //����Ԫ
//    else nUnitLen:=AYuanPos-Len;
    i:=1;
    while i<=Len do
    begin
      if i=dotPos then inc(i);  //����С����Ų����λ
      n:=nUnitLen+i;             //�����λ��λ��
      k:=strtoint(Amount[i]);
      sNum:=AUpper[k+1];      //������ֵ
      sUnit:=ARmbUnits[n];    //��λ
      if k=0 then             //Ϊ��Ĵ�дϰ��
      begin
        if i<Len then
        begin
          if i+1<>dotPos then
          begin
            k:=strtoint(Amount[i+1]);
            if (k=0) or (n in AKeyWordPos) then sNum:='';
          end else sNum:='';
        end else sNum:='';
        if not(n in AKeyWordPos)
          or (dotPos=2) then sUnit:='';
      end;
      RMB:=RMB+sNum+sUnit;
      inc(i);
    end;
    if Pos('��',RMB)=1 then Delete(RMB,1,1);//���0.09�������
    k:=Pos('����',RMB);   //�����������
    if k>0 then Delete(RMB,k+1,1);
    if RMB[1]='Ԫ' then
      Result:=' ' //�ų�0000ֻ����һ��Ԫ�ֵ�����
    else
      Result:=RMB; //���
  except
    Application.MessageBox('����Ƿ���ֵ������������!', '��ʾ', MB_OK +
      MB_ICONWARNING);
  end;
end;

function FindForm(FormClass: TFormClass): TForm;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I] is FormClass then
    begin
      Result := Screen.Forms[I];
      Break;
    end;
  end;
end;

function InternalFindShowForm(FormClass: TFormClass;
  const Caption: string; Restore: Boolean): TForm;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I].ClassNameIs(FormClass.ClassName) then
      if (Caption = '') or (Caption = Screen.Forms[I].Caption) then
      begin
        Result := Screen.Forms[I];
        Break;
      end;
  end;
  if Result = nil then
  begin
    Application.CreateForm(FormClass, Result);
    if Caption <> '' then
      Result.Caption := Caption;
  end;
  with Result do begin
    if Restore and (WindowState = wsMinimized) then
      WindowState := wsNormal;
    Show;
  end;
end;

function FindShowForm(FormClass: TFormClass; const Caption: string): TForm;
begin
  Result := InternalFindShowForm(FormClass, Caption, True);
end;

//ע��,path����Ҫ��'\';
procedure searchfile(path: string; var AList : TStrings; AFileType: string = '*.*'; Flag: Integer = 0);
var
  SearchRec : TSearchRec;
  found   : integer;      //,I
begin
  AList.Clear;
  found := FindFirst(path + AFileType, faAnyFile, SearchRec);
  while found = 0 do
  begin
    if Flag = 1 then
    begin
      if (SearchRec.Name<>'.') and (SearchRec.Name<>'..') and (SearchRec.Attr = faDirectory) then
        AList.Add(SearchRec.Name);
    end else if Flag = 2 then
    begin
      if (SearchRec.Name<>'.') and (SearchRec.Name<>'..') and (SearchRec.Attr <> faDirectory) then
        AList.Add(SearchRec.Name);
    end;
    found:=FindNext(SearchRec);
  end;
  FindClose(SearchRec);
end;

//��ȡӲ�����к�
function GetIdeDiskSerialNumber(i:Integer) : String;
var
  Buffer : Array[0..BufferSize - 1] of Byte;
  hDevice : THandle;
  srbControl : TSrbIoControl absolute Buffer;
  pInData : PSendCmdInParams; 
  pOutData : Pointer; // PSendCmdOutParams
  cbBytesReturned : DWORD; 
begin
   Result := '';
   FillChar(Buffer,BufferSize,#0);
   if Win32Platform=VER_PLATFORM_WIN32_NT then
   begin // Windows NT, Windows 2000
   // Get SCSI port handle
      hDevice := CreateFile( pchar('\\.\Scsi'+inttostr(i)+':'),
                           GENERIC_READ or GENERIC_WRITE,
                           FILE_SHARE_READ or FILE_SHARE_WRITE,
                           nil, OPEN_EXISTING, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
         srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
         System.Move('SCSIDISK',srbControl.Signature,8);
         srbControl.Timeout := 2;
         srbControl.Length := DataSize;
         srbControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
         pInData := PSendCmdInParams(PChar(@Buffer)
                     +SizeOf(SRB_IO_CONTROL));
         pOutData := pInData;
         with pInData^ do
         begin
            cBufferSize := IDENTIFY_BUFFER_SIZE;
            bDriveNumber := 0;
            with irDriveRegs do
            begin
               bFeaturesReg := 0;
               bSectorCountReg := 1;
               bSectorNumberReg := 1;
               bCylLowReg := 0;
               bCylHighReg := 0;
               bDriveHeadReg := $A0;
               bCommandReg := IDE_ID_FUNCTION;
            end;
         end;
         if not DeviceIoControl( hDevice, IOCTL_SCSI_MINIPORT,
         @Buffer, BufferSize, @Buffer, BufferSize,
         cbBytesReturned, nil ) then Exit;
      finally
         CloseHandle(hDevice);
      end;
   end
   else
   begin // Windows 95 OSR2, Windows 98
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil,
      CREATE_NEW, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
         pInData := PSendCmdInParams(@Buffer);
         pOutData := @pInData^.bBuffer;
         with pInData^ do
         begin
            cBufferSize := IDENTIFY_BUFFER_SIZE;
            bDriveNumber := 0;
            with irDriveRegs do
            begin
               bFeaturesReg := 0;
               bSectorCountReg := 1;
               bSectorNumberReg := 1;
               bCylLowReg := 0;
               bCylHighReg := 0;
               bDriveHeadReg := $A0;
               bCommandReg := IDE_ID_FUNCTION;
            end;
         end;
         if not DeviceIoControl( hDevice, DFP_RECEIVE_DRIVE_DATA,
                                 pInData, SizeOf(TSendCmdInParams)-1, pOutData,
                                 W9xBufferSize, cbBytesReturned, nil ) then Exit;
      finally
         CloseHandle(hDevice);
      end;
   end;
   with PIdSector(PChar(pOutData)+16)^ do
   begin
      ChangeByteOrder(sSerialNumber,SizeOf(sSerialNumber));
      SetString(Result,sSerialNumber,SizeOf(sSerialNumber));
   end;
end;

function GetCPUID : TCPUID; assembler; register;
asm
  PUSH    EBX         {Save affected register}
  PUSH    EDI
  MOV     EDI,EAX     {@Resukt}
  MOV     EAX,1
  DW      $A20F       {CPUID Command}
  STOSD           {CPUID[1]}
  MOV     EAX,EBX
  STOSD               {CPUID[2]}
  MOV     EAX,ECX
  STOSD               {CPUID[3]}
  MOV     EAX,EDX
  STOSD               {CPUID[4]}
  POP     EDI {Restore registers}
  POP     EBX
end;

function GetCPUVendor : TVendor; assembler; register;
asm
  PUSH    EBX {Save affected register}
  PUSH    EDI
  MOV     EDI,EAX {@Result (TVendor)}
  MOV     EAX,0
  DW      $A20F {CPUID Command}
  MOV     EAX,EBX
  XCHG EBX,ECX     {save ECX result}
  MOV ECX,4
@1:
  STOSB
  SHR     EAX,8
  LOOP    @1
  MOV     EAX,EDX
  MOV ECX,4
@2:
  STOSB
  SHR     EAX,8
  LOOP    @2
  MOV     EAX,EBX
  MOV ECX,4
@3:
  STOSB
  SHR     EAX,8
  LOOP    @3
  POP     EDI {Restore registers}
  POP     EBX
end;

procedure GetDirs(dirName: string; List: TStrings; ASerachType: TSearchType = stCurrent);
const
 attr: Integer = faDirectory; {�ļ����Գ���, ��ʾ�����ļ���}
var
 SRec: TSearchRec;           {���� TSearchRec �ṹ����}
 dir : string;
begin
  dirName := ExcludeTrailingBackslash(dirName) + '\'; {��֪������ǲ��� \; ��ȥ��, �ټ���}
  dir := dirName + '*.*'; {���� \; *.* �� * ��ʾ�����ļ�, ϵͳ���Ŀ¼Ҳ����һ���ļ�}
  if FindFirst(dir, attr, SRec) = 0 then {��ʼ����,���� SRec ������Ϣ, ����0��ʾ�ҵ���һ��}
  begin
    repeat
      if (SRec.Attr = attr) and             {������ļ���}
          (SRec.Name <> '.') and             {�ų��ϲ�Ŀ¼}
          (SRec.Name <> '..') then           {�ų���Ŀ¼}
      begin
        case ASerachType of
          stCurrent:
             begin
               List.Add(dirName + SRec.Name);     {��List���½��}
             end;
          stSub:
             begin
               List.Add(dirName + SRec.Name);     {��List���½��}
               GetDirs(dirName + SRec.Name, List); {�����ǵݹ����, ���û�����, ֻ��������ǰĿ¼}
             end;
          stAll:
             begin
               List.Add(dirName + SRec.Name);     {��List���½��}
               GetDirs(dirName + SRec.Name, List); {�����ǵݹ����, ���û�����, ֻ��������ǰĿ¼}
             end;
        end;
      end;
    until(FindNext(SRec)<>0);               {����һ��, ����0��ʾ�ҵ�}
  end;
  FindClose(SRec);                           {��������}
end;

//���ز��
function LoadPkg(APluginFile: string; ATmpStrings: TStrings; AMDITabSet: TEasyMDITabSet;
                  AEasyProgressBar: TEasyProgressBar;
                  AMDICloseNotify: TMDICloseNotify; AType: Integer = 0): Boolean;
var
  BplHandle   : THandle;
  AShowBplForm: TShowBplForm;
  TmpForm     : TForm;
  ATmpMenuItem: TMenuItem;
  AExitsForm  : TForm; //�ж�һ�������Ƿ����
//  I           : Integer;
begin
  if not FileExists(APluginFile) then
  begin
    Application.MessageBox(PChar(Format(EASY_BPL_NOTFOUND, [APluginFile])),
                           PChar(EASY_SYS_ERROR), MB_OK + MB_ICONSTOP);
    Result := False;
    Exit;
  end;
  BplHandle := LoadPackage(APluginFile);
  //���ȴ������
  AEasyProgressBar.Position := 30;
  if BplHandle > 0 then
  begin
    try
      AShowBplForm := GetProcAddress(BplHandle, PChar('ShowBplForm'));
      //���ȴ������
      AEasyProgressBar.Position := 40;
      if @AShowBplForm = nil then
        raise Exception.Create('���ܼ��ز��:'+ APluginFile + ' ԭ��δ�ҵ������ں���!')
      else
      begin
        TmpForm := AShowBplForm(ATmpStrings);
      end;
      //�жϴ˴����Ƿ��Ѿ����ع�
//      for I := 0 to AMDITabSet.EasyOfficeTabCount - 1 do
//      begin
//        if TmpForm.Caption = TForm(AMDITabSet.GetChildForm(AMDITabSet.EasyOfficeTabs[I])).Caption then
//        begin
//          AExitsForm := AMDITabSet.GetChildForm(AMDITabSet.EasyOfficeTabs[I]);
//          Break;
//        end;
//      end;
//      if AExitsForm <> nil then
//      begin
//        Application.FreeNotification(TmpForm);
//        FreeAndNil(TmpForm);
//        AMDITabSet.ActiveTabIndex := I;
//        ���ȴ������
//        AEasyProgressBar.Position := 80;
//      end
//      else
      begin                       //�Ҳ����ͳ����½���
        //���ȴ������
        AEasyProgressBar.Position := 60;
        Application.FreeNotification(TmpForm);
        if AType <> 0 then
        begin
          //����MDITabSet
          AMDITabSet.AddTab(TmpForm);
          TmpForm.OnClose := AMDICloseNotify;
        end;
        //���ȴ������
        AEasyProgressBar.Position := 80;
        TmpForm.Show;
      end;
    finally
//      UnloadPackage(BplHandle);
    end;
  end;
  Result := True;
end;

//ShowModel���ز��
function LoadPkg(APluginFile: string; ATmpStrings: TStrings): Boolean;
var
  BplHandle   : THandle;
  AShowBplForm: TShowBplForm;
  TmpForm     : TForm;
begin
  if not FileExists(APluginFile) then
  begin
    Application.MessageBox(PChar(Format(EASY_BPL_NOTFOUND, [APluginFile])),
                           PChar(EASY_SYS_ERROR), MB_OK + MB_ICONSTOP);
    Result := False;
    Exit;
  end;
  BplHandle := LoadPackage(APluginFile);
  if BplHandle > 0 then
  begin
    try
      AShowBplForm := GetProcAddress(BplHandle, PChar('ShowBplForm'));
      if @AShowBplForm = nil then
        raise Exception.Create('cannot load:'+ APluginFile)
      else
      begin
         TmpForm := AShowBplForm(ATmpStrings);
      end;
      Application.FreeNotification(TmpForm);
      TmpForm.ShowModal;
    finally
//      UnloadPackage(BplHandle);
    end;
  end;
  Result := True;
end;

//�����ļ���
function CreateDir_H(APath: string): Boolean;
begin
  Result := False;
  if not DirectoryExists(APath) then
  begin
    try
      Result := ForceDirectories(APath);
    except on E: Exception do
      raise Exception.Create('�����ļ���:' + APath + ' ʧ��!');
    end;
  end;
end;
  
//д����־�ĵ�����
//����ı��ļ�����Base64����
procedure WriteLog_H(ALogPath: String; AContent: String);
var
  TmpPath,
  TmpLogFile: string;
  TmpFileLog: TextFile;
begin
  TmpPath := ALogPath;
  if not DirectoryExists(TmpPath) then
    CreateDir_H(TmpPath);
  if DirectoryExists(TmpPath) then
  begin
    TmpLogFile := TmpPath + '\' + FormatDateTime('YYYY-MM-DD', Date) + '.log';
    AssignFile(TmpFileLog, TmpLogFile);
    if not FileExists(TmpLogFile) then
      Rewrite(TmpFileLog)
    else
      Append(TmpFileLog);             

    Writeln(TmpFileLog, AContent);

    Flush(TmpFileLog);
    CloseFile(TmpFileLog);
  end;
end;

function OpenClientDataSet(AClientDataSet: TClientDataSet;
          AOpenClientDataSetStyle: TOpenClientDataSetStyle = ocdOpen): string;
begin
  Result := '-1';
  try
    if AOpenClientDataSetStyle = ocdExecute then
      AClientDataSet.Execute
    else
    if AOpenClientDataSetStyle = ocdOpen then
      AClientDataSet.Open;
    Result := '1';
  except on e:Exception do
    //
  end;
end;

//��ȡ�û�ģ��Ȩ��
function getUserModuleRight(FormId, CurrUserID: string): string;
begin
  Result := '';
end;

//��ȡָ�������Ƿ����ĳ������  ����typinfo
function FindProperty(AClass: TObject; sPropertyName: String): Boolean;
var
  PropList     : PPropList;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i            : integer;
begin
  Result := False;
  ClassTypeInfo := aClass.ClassType.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  if ClassTypeData.PropCount <> 0 then
  begin
    GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
    try
      GetPropInfos(AClass.ClassInfo, PropList);
      for i := 0 to ClassTypeData.PropCount - 1 do
        if (PropList[i]^.PropType^.Kind <> tkMethod)
          and (UpperCase(PropList[i]^.Name) = UpperCase(sPropertyName)) then
        begin
          Result := True;
          Break;
        end;
    finally
      FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
    end;
  end;
end;

//����ָ���ؼ�BondLabel��������ɫ
function SetEditLabelColor(AClass: TObject; AColor: TColor): Boolean;
var
  PropInfoPtr: PPropInfo;
  BoundLabel : TBoundLabel;
begin
  Result := False;
  PropInfoPtr:=GetPropInfo(AClass,'EditLabel');
  if PropInfoPtr=nil then exit;
  if PropInfoPtr^.PropType^.Kind = tkClass then
  begin
    if GetObjectPropClass(AClass, PropInfoPtr) = TBoundLabel then
    begin
      BoundLabel := TBoundLabel(GetObjectProp(AClass, PropInfoPtr));
      BoundLabel.Font.Color := AColor;
      Result := True;
    end;
  end;
end;

//����ָ���ؼ������ӿؼ���BonLabel��������ɫ
procedure SetEditLabelsColor(AParentControl: TControl;
                            AColor: TColor; var ASetControlList: TList);
var
  I: Integer;
  TmpComponent: TComponent;
begin
  ASetControlList.Clear;
  for I := 0 to AParentControl.ComponentCount - 1 do
  begin
    TmpComponent := AParentControl.Components[I];
    if SetEditLabelColor(TmpComponent, AColor) then
      ASetControlList.Add(TmpComponent);
  end;
end;

//��ȡ�ؼ��İ����ݼ�
function GetDBDataBindingDataSet(AClass: TObject): TDataSet;
var
  PropInfoPtr: PPropInfo;
  BoundLabel : TcxDBTextEditDataBinding;
begin
  Result := nil;
  PropInfoPtr := GetPropInfo(AClass,'DataBinding');
  if PropInfoPtr=nil then exit;
  if PropInfoPtr^.PropType^.Kind = tkClass then
  begin
    if GetObjectPropClass(AClass, PropInfoPtr) = TcxDBTextEditDataBinding then
    begin
      BoundLabel := TcxDBTextEditDataBinding(GetObjectProp(AClass, PropInfoPtr));
      Result := BoundLabel.DataSource.DataSet;
    end;
  end;
end;

//��ȡ�ؼ��İ������ֶ�
function GetDBDataBinding(AClass: TObject; var ABondLabelCaption: string): string;
var
  PropInfoPtr: PPropInfo;
  BoundLabel : TcxDBTextEditDataBinding;
begin
  Result := '';
  PropInfoPtr := GetPropInfo(AClass,'DataBinding');
  if PropInfoPtr=nil then exit;
  if PropInfoPtr^.PropType^.Kind = tkClass then
  begin
    if GetObjectPropClass(AClass, PropInfoPtr) = TcxDBTextEditDataBinding then
    begin
      BoundLabel := TcxDBTextEditDataBinding(GetObjectProp(AClass, PropInfoPtr));
      ABondLabelCaption := GetEditLabelCaption(AClass);
      Result := BoundLabel.DataField;
    end;
  end;
end;

//��ȡָ���ؼ�BondLabel�ı���
function GetEditLabelCaption(AClass: TObject): string;
var
  PropInfoPtr: PPropInfo;
  BoundLabel : TBoundLabel;
begin
  Result := '';
  PropInfoPtr := GetPropInfo(AClass,'EditLabel');
  if PropInfoPtr = nil then exit;
  if PropInfoPtr^.PropType^.Kind = tkClass then
  begin
    if GetObjectPropClass(AClass, PropInfoPtr) = TBoundLabel then
    begin
      BoundLabel := TBoundLabel(GetObjectProp(AClass, PropInfoPtr));
      Result := BoundLabel.Caption;
    end;
  end;
end;  

end.
