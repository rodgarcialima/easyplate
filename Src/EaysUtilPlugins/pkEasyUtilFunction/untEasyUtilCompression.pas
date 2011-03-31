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
  
// ���Ŀ¼�Ĵ�С���ļ�������Ŀ¼����
function DirectoryInfo(mDirectory: string; // Ŀ¼��
          var nFileSize: Integer; // �ܴ�С
          var nFileCount: Integer; // �ļ�����
          var nDirectoryCount: Integer // Ŀ¼����
        ): Boolean; // ����Ŀ¼�Ĵ�С

function FileCompression( // ���ļ�ѹ��������
          mFileName: string; // �ļ���
          mStream: TStream // Ŀ��
        ): Integer; // ����ѹ����Ĵ�С

function FileDecompression( // �����н�ѹ�ļ�
          mFileName: string; // Ŀ���ļ���
          mStream: TStream // ��Դ
        ): Integer; // ���ؽ�ѹ��Ĵ�С

function DirectoryCompression( // ��Ŀ¼ѹ�����ļ�
  mDirectory: string; // Ŀ¼��
  mFileName: string // ѹ������ļ���
): Integer; overload; // ����ѹ����Ĵ�С //���Ϊ�������ʶ����

function DirectoryCompression( // ��Ŀ¼ѹ������
  mDirectory: string; // Ŀ¼��
  mStream: TStream // ѹ�������
): Integer; overload; // ����ѹ����Ĵ�С //���Ϊ�������ʶ����

function DirectoryDecompression( // ���ļ��н�ѹĿ¼
  mDirectory: string; // Ŀ¼��
  mFileName: string; // ѹ���ļ���
  mProgress: TDirectoryDecompressionProgress = nil; // ���ȴ���
  mParam: Integer = 0 // ���Ӳ���
): Integer; overload; // ���ؽ�ѹ��ĸ���

function DirectoryDecompression( // �����н�ѹĿ¼
  mDirectory: string; // ָ��Ŀ¼��
  mStream: TStream; // ѹ����
  mProgress: TDirectoryDecompressionProgress = nil; // ���ȴ���
  mParam: Integer = 0 // ���Ӳ���
): Integer; overload; // ���ؽ�ѹ���ļ�����
        
implementation

function StrLeft( //ȡ��ߵ��ַ���
  mStr: string; //ԭ�ַ���
  mDelimiter: string; //�ָ���
  mIgnoreCase: Boolean = False //�Ƿ���Դ�Сд
): string; //���ص�һ���ָ�����ߵ��ַ���
begin
  if mIgnoreCase then
    Result := Copy(mStr, 1, Pos(UpperCase(mDelimiter), UpperCase(mStr)) - 1)
  else Result := Copy(mStr, 1, Pos(mDelimiter, mStr) - 1);
end; { StrLeft }

function StrRight( //ȡ�ұߵ��ַ���
  mStr: string; //ԭ�ַ���
  mDelimiter: string; //�ָ���
  mIgnoreCase: Boolean = False //�Ƿ���Դ�Сд
): string; //���ص�һ���ָ����ұߵ��ַ���
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

// ���Ŀ¼�Ĵ�С���ļ�������Ŀ¼����
function DirectoryInfo(mDirectory: string; // Ŀ¼��
          var nFileSize: Integer; // �ܴ�С
          var nFileCount: Integer; // �ļ�����
          var nDirectoryCount: Integer // Ŀ¼����
        ): Boolean; // ����Ŀ¼�Ĵ�С
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

function FileCompression( // ���ļ�ѹ��������
          mFileName: string; // �ļ���
          mStream: TStream // Ŀ��
        ): Integer; // ����ѹ����Ĵ�С
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

function FileDecompression( // �����н�ѹ�ļ�
          mFileName: string; // Ŀ���ļ���
          mStream: TStream // ��Դ
        ): Integer; // ���ؽ�ѹ��Ĵ�С
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

function DirectoryCompression( // ѹ��Ŀ¼
  mDirectory: string; // Ŀ¼��
  mFileName: string // ѹ������ļ���
): Integer; overload; // ����ѹ����Ĵ�С //���Ϊ�������ʶ����
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

function DirectoryCompression( // ��Ŀ¼ѹ������
  mDirectory: string; // Ŀ¼��
  mStream: TStream // ѹ�������
): Integer; overload; // ����ѹ����Ĵ�С //���Ϊ�������ʶ����
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

function DirectoryDecompression( // ���ļ��н�ѹĿ¼
  mDirectory: string; // Ŀ¼��
  mFileName: string; // ѹ���ļ���
  mProgress: TDirectoryDecompressionProgress = nil; // ���ȴ���
  mParam: Integer = 0 // ���Ӳ���
): Integer; overload; // ���ؽ�ѹ���ļ�����
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

function DirectoryDecompression( // �����н�ѹĿ¼
  mDirectory: string; // ָ��Ŀ¼��
  mStream: TStream; // ѹ����
  mProgress: TDirectoryDecompressionProgress = nil; // ���ȴ���
  mParam: Integer = 0 // ���Ӳ���
): Integer; overload; // ���ؽ�ѹ���ļ�����
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

end.
