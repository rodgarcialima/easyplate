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
//
//��Ҫ���ܣ�
//        ����ѹ�����ļ��н�ѹ��                               
//------------------------------------------------------------------------------}
unit untEasyUtilCompression;

interface

uses
  Windows, Messages, SysUtils, Classes, ShellAPI, ZLib;

const
  cBufferSize = $1000;
  cIdent = 'eas';
  cVersion = $02;

type
  TDirectoryDecompressionProgress = function( // ��ѹ����
    mFileCount: Integer; // �ļ��ܸ���
    mFileIndex: Integer; // ��ǰ��ѹ�ļ����
    mPackSize: Integer; // �ļ�ѹ����С
    mFileName: string; // ��ǰ��ѹ�ļ���
    mFileSize: Integer; // ��ǰ��ѹ�ļ���С
    mParam: Integer // ���Ӳ���
  ): Boolean; // �����Ƿ������ѹ

  TFileHead = packed record
    rIdent: array[0..2] of Char; //��ʶ
    rVersion: Byte; //�汾
  end;

  //��ѹ����
  procedure UnCompressionStream(var ASrcStream:TMemoryStream);
  //ѹ����
  procedure CompressionStream(var ASrcStream:TMemoryStream;ACompressionLevel:Integer = 2);

  // ���Ŀ¼�Ĵ�С���ļ�������Ŀ¼����
  //mDirectory Ŀ¼��
  //nFileSize �ܴ�С
  //nFileCount  �ļ�����
  //nDirectoryCount Ŀ¼����
  function DirectoryInfo(mDirectory: string; var nFileSize: Integer;
            var nFileCount: Integer; var nDirectoryCount: Integer): Boolean;

  // ���ļ�ѹ��������
  //mFileName �ļ���
  // mStream  Ŀ��
  //���ؽ�ѹ��Ĵ�С
  function FileCompression(mFileName: string; mStream: TStream): Integer;

  // �����н�ѹ�ļ�
  // mFileName Ŀ���ļ���
  // mStream  ��Դ
  // ���ؽ�ѹ��Ĵ�С
  function FileDecompression(mFileName: string; mStream: TStream): Integer;

  // ��Ŀ¼ѹ�����ļ�
  // mDirectory Ŀ¼��
  // mFileName ѹ������ļ���
  // ����ѹ����Ĵ�С //���Ϊ�������ʶ����
  function DirectoryCompression(mDirectory: string; mFileName: string): Integer; overload;

  // ��Ŀ¼ѹ������
  //mDirectory  Ŀ¼��
  //mStream ѹ�������
  //����ѹ����Ĵ�С //���Ϊ�������ʶ����
  function DirectoryCompression(mDirectory: string; mStream: TStream): Integer; overload;

  // ���ļ��н�ѹĿ¼
  //mDirectory Ŀ¼��
  //mFileName ѹ���ļ���
  //mProgress ���ȴ���
  //mParam  ���Ӳ���
  //���ؽ�ѹ��ĸ���
  function DirectoryDecompression(mDirectory: string; mFileName: string;
    mProgress: TDirectoryDecompressionProgress = nil; mParam: Integer = 0): Integer; overload;

  // �����н�ѹĿ¼
  //mDirectory  ָ��Ŀ¼��
  //mStream ѹ����
  //mProgress ���ȴ���
  //mParam ���Ӳ���
  //���ؽ�ѹ���ļ�����
  function DirectoryDecompression(mDirectory: string; mStream: TStream;
    mProgress: TDirectoryDecompressionProgress = nil; mParam: Integer = 0): Integer; overload;

implementation

//ȡ��ߵ��ַ���
//mStr ԭ�ַ���
//mDelimiter �ָ���
//mIgnoreCase �Ƿ���Դ�Сд
//���ص�һ���ָ�����ߵ��ַ���
function StrLeft(mStr: string; mDelimiter: string; mIgnoreCase: Boolean = False): string;
begin
  if mIgnoreCase then
    Result := Copy(mStr, 1, Pos(UpperCase(mDelimiter), UpperCase(mStr)) - 1)
  else Result := Copy(mStr, 1, Pos(mDelimiter, mStr) - 1);
end; { StrLeft }

//ȡ�ұߵ��ַ���
//mStr ԭ�ַ���
//mDelimiter �ָ���
//mIgnoreCase �Ƿ���Դ�Сд
//���ص�һ���ָ����ұߵ��ַ���
function StrRight(mStr: string; mDelimiter: string; mIgnoreCase: Boolean = False): string;
begin
  if mIgnoreCase then
  begin
    if Pos(UpperCase(mDelimiter), UpperCase(mStr)) > 0 then
      Result := Copy(mStr, Pos(UpperCase(mDelimiter), UpperCase(mStr)) +
        Length(mDelimiter), MaxInt)
    else Result := '';
  end else
  begin
    if Pos(mDelimiter, mStr) > 0 then
      Result := Copy(mStr, Pos(mDelimiter, mStr) + Length(mDelimiter), MaxInt)
    else Result := '';
  end;
end; { StrRight }

function DirectoryInfo(mDirectory: string; var nFileSize: Integer;
          var nFileCount: Integer; var nDirectoryCount: Integer): Boolean;
var
  vSearchRec: TSearchRec;
  vFileSize: Integer; // �ܴ�С
  vFileCount: Integer; // �ļ�����
  vDirectoryCount: Integer; // Ŀ¼����
begin
  Result := False;
  if not DirectoryExists(mDirectory) then Exit; // Ŀ¼������
  nFileSize := 0;
  nFileCount := 0;
  nDirectoryCount := 0;
  mDirectory := IncludeTrailingPathDelimiter(mDirectory);
  if FindFirst(mDirectory + '*.*',
    faAnyFile and not faHidden, vSearchRec) = NO_ERROR then
  begin
    repeat
      if vSearchRec.Attr and faDirectory = faDirectory then
      begin
        if Pos('.', vSearchRec.Name) <> 1 then
        begin
          Inc(nDirectoryCount);
          DirectoryInfo(mDirectory + vSearchRec.Name,
            vFileSize, vFileCount, vDirectoryCount);
          Inc(nFileSize, vFileSize);
          Inc(nFileCount, vFileCount);
          Inc(nDirectoryCount, vDirectoryCount);
        end;
      end else
      begin
        Inc(nFileCount);
        Inc(nFileSize, vSearchRec.Size);
      end;
    until FindNext(vSearchRec) <> NO_ERROR;
    FindClose(vSearchRec);
  end;
  Result := True;
end;

function FileCompression(mFileName: string; mStream: TStream): Integer;
var
  vFileStream: TFileStream;
  vBuffer: array[0..cBufferSize]of Char;
  vPosition: Integer;
  I: Integer;
begin
  Result := -1;
  if not FileExists(mFileName) then Exit;
  if not Assigned(mStream) then Exit;
  vPosition := mStream.Position;
  vFileStream := TFileStream.Create(mFileName, fmOpenRead or fmShareDenyNone);
  with TCompressionStream.Create(clMax, mStream) do
  try
    for I := 1 to vFileStream.Size div cBufferSize do
    begin
      vFileStream.Read(vBuffer, cBufferSize);
      Write(vBuffer, cBufferSize);
    end;
    I := vFileStream.Size mod cBufferSize;
    if I > 0 then
    begin
      vFileStream.Read(vBuffer, I);
      Write(vBuffer, I);
    end;
  finally
    Free;
    vFileStream.Free;
  end;
  Result := mStream.Size - vPosition; //����
end;  

function FileDecompression(mFileName: string; mStream: TStream): Integer; 
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
  vBuffer: array[0..cBufferSize]of Char;
  I: Integer;
begin
  Result := -1;
  if not Assigned(mStream) then Exit;
  ForceDirectories(ExtractFilePath(mFileName)); //����Ŀ¼
  { TODO : �ж��ļ��Ƿ���Դ��� }
  vFileHandle := FileCreate(mFileName);                                         //2006-09-25 ZswangY37 No.1 
  if Integer(vFileHandle) <= 0 then Exit;
  vFileStream := TFileStream.Create(vFileHandle);
  with TDecompressionStream.Create(mStream) do
  try
    repeat
      I := Read(vBuffer, cBufferSize);
      vFileStream.Write(vBuffer, I);
    until I = 0;
    Result := vFileStream.Size;
  finally
    Free;
    vFileStream.Free;
  end;
end;  

function DirectoryCompression(mDirectory: string; mFileName: string): Integer; overload;
var
  vFileStream: TFileStream;
begin
  vFileStream := TFileStream.Create(mFileName, fmCreate or fmShareDenyWrite);
  try
    Result := DirectoryCompression(mDirectory, vFileStream);
  finally
    vFileStream.Free;
  end;
end; { DirectoryCompression }

function DirectoryCompression(mDirectory: string; mStream: TStream): Integer; overload;
var
  vFileInfo: TStrings;
  vFileInfoSize: Integer;
  vFileInfoBuffer: PChar;
  vFileHead: TFileHead;

  vMemoryStream: TMemoryStream;

  procedure pAppendFile(mSubFile: string);
  begin
    vFileInfo.Append(Format('%s|%d',
      [StringReplace(mSubFile, mDirectory + '\', '', [rfReplaceAll, rfIgnoreCase]),
        FileCompression(mSubFile, vMemoryStream)]));
    Inc(Result);
  end; { pAppendFile }

  procedure pSearchFile(mPath: string);
  var
    vSearchRec: TSearchRec;
    K: Integer;
  begin
    K := FindFirst(mPath + '\*.*', faAnyFile and not faHidden, vSearchRec);
    while K = 0 do
    begin
      if (vSearchRec.Attr and faDirectory > 0) and
        (Pos(vSearchRec.Name, '..') = 0) then
        pSearchFile(mPath + '\' + vSearchRec.Name)
      else if Pos(vSearchRec.Name, '..') = 0 then
        pAppendFile(mPath + '\' + vSearchRec.Name);
      K := FindNext(vSearchRec);
    end;
    FindClose(vSearchRec);
  end; { pSearchFile }
begin
  Result := 0;
  if not Assigned(mStream) then Exit;
  if not DirectoryExists(mDirectory) then Exit;
  vFileInfo := TStringList.Create;
  vMemoryStream := TMemoryStream.Create;
  mDirectory := ExcludeTrailingPathDelimiter(mDirectory);

  try
    pSearchFile(mDirectory);
    vFileInfoBuffer := vFileInfo.GetText;
    vFileInfoSize := StrLen(vFileInfoBuffer);

    { DONE -oZswang -c��� : д��ͷ�ļ���Ϣ }
    vFileHead.rIdent := cIdent;
    vFileHead.rVersion := cVersion;
    mStream.Write(vFileHead, SizeOf(vFileHead));

    mStream.Write(vFileInfoSize, SizeOf(vFileInfoSize));
    mStream.Write(vFileInfoBuffer^, vFileInfoSize);
    vMemoryStream.Position := 0;
    mStream.CopyFrom(vMemoryStream, vMemoryStream.Size);
  finally
    vFileInfo.Free;
    vMemoryStream.Free;
  end;
end;

function DirectoryDecompression(mDirectory: string; mFileName: string;
  mProgress: TDirectoryDecompressionProgress = nil; mParam: Integer = 0): Integer; overload; 
var
  vFileStream: TFileStream;
begin
  vFileStream := TFileStream.Create(mFileName, fmOpenRead or fmShareDenyNone);
  try
    Result := DirectoryDecompression(
      mDirectory, vFileStream, mProgress, mParam);
  finally
    vFileStream.Free;
  end;
end; { DirectoryDeompression }

function DirectoryDecompression(mDirectory: string; mStream: TStream;
  mProgress: TDirectoryDecompressionProgress = nil; mParam: Integer = 0): Integer; overload; 
var
  vFileInfo: TStrings;
  vFileInfoSize: Integer;
  vFileHead: TFileHead;
  vFileCount: Integer;
  vFileName: string;
  vFileSize: Integer;
  vPackSize: Integer;
  
  vMemoryStream: TMemoryStream;
  I: Integer;
begin
  Result := 0;
  if not Assigned(mStream) then Exit;
  vFileInfo := TStringList.Create;
  vMemoryStream := TMemoryStream.Create;
  mDirectory := ExcludeTrailingPathDelimiter(mDirectory);
  try
    mStream.Position := 0;
    if mStream.Size < SizeOf(vFileHead) then Exit;
    { DONE -oZswang -c��� : ��ȡͷ�ļ���Ϣ }
    mStream.Read(vFileHead, SizeOf(vFileHead));
    if vFileHead.rIdent <> cIdent then Result := -1;
    if vFileHead.rVersion <> cVersion then Result := -2;
    if Result <> 0 then Exit;

    mStream.Read(vFileInfoSize, SizeOf(vFileInfoSize));
    vMemoryStream.CopyFrom(mStream, vFileInfoSize);
    vMemoryStream.Position := 0;
    vFileInfo.LoadFromStream(vMemoryStream);
    vFileCount := vFileInfo.Count;
    for I := 0 to vFileCount - 1 do
    begin
      vFileName := mDirectory + '\' + StrLeft(vFileInfo[I], '|');
      vPackSize := StrToIntDef(StrRight(vFileInfo[I], '|'), 0);

      vMemoryStream.Clear;
      vMemoryStream.CopyFrom(mStream, vPackSize);
      vMemoryStream.Position := 0;
      vFileSize := FileDecompression(vFileName, vMemoryStream);
      if Assigned(mProgress) then
        if not mProgress(vFileCount, I,
          vPackSize, vFileName, vFileSize, mParam) then Break;
    end;
    Result := vFileInfo.Count;
  finally
    vFileInfo.Free;
    vMemoryStream.Free;
  end;
end;

//��ѹ��
procedure UnCompressionStream(var ASrcStream:TMemoryStream);
var
  nTmpStream:TDecompressionStream;
  nDestStream:TMemoryStream;
  nBuf: array[1..512] of Byte;
  nSrcCount: integer;
begin
  ASrcStream.Position := 0;
  nDestStream := TMemoryStream.Create;
  nTmpStream := TDecompressionStream.Create(ASrcStream);
  try
    repeat
      //����ʵ�ʴ�С
      nSrcCount := nTmpStream.Read(nBuf, SizeOf(nBuf));
      if nSrcCount > 0 then
        nDestStream.Write(nBuf, nSrcCount);
    until (nSrcCount = 0);
    ASrcStream.Clear;
    ASrcStream.LoadFromStream(nDestStream);
    ASrcStream.Position := 0;
  finally
    nDestStream.Clear;
    nDestStream.Free;
    nTmpStream.Free;
  end;
end;

//ѹ����
procedure CompressionStream(var ASrcStream:TMemoryStream;ACompressionLevel:Integer = 2);
var
  nDestStream:TMemoryStream;
  nTmpStream:TCompressionStream;
  nCompressionLevel:TCompressionLevel;
begin
  ASrcStream.Position := 0;
  nDestStream := TMemoryStream.Create;
  try
    //����
    case ACompressionLevel of
      0:nCompressionLevel := clNone;
      1:nCompressionLevel := clFastest;
      2:nCompressionLevel := clDefault;
      3:nCompressionLevel := clMax;
    else
        nCompressionLevel := clMax;
    end;
    //��ʼѹ��
    nTmpStream := TCompressionStream.Create(nCompressionLevel,nDestStream);
    try
      ASrcStream.SaveToStream(nTmpStream);
    finally
      nTmpStream.Free;//�ͷź�nDestStream�Ż�������
    end;
    ASrcStream.Clear;
    ASrcStream.LoadFromStream(nDestStream);
    ASrcStream.Position := 0;
  finally
    nDestStream.Clear;
    nDestStream.Free;
  end;
end;

end.
