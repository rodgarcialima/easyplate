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
//
//��Ҫʵ�֣�
//
//-----------------------------------------------------------------------------}
unit untEasyUtilStream;

interface

uses
  Windows, SysUtils, Classes;

type

{ TEasyEncryptStream }

  TEasyEncryptStream = class (TStream)
  {* ���ܵ� TStream ������֧࣬�����ݶ�дʱ���м��ܴ���}
  private
    FStream: TStream;
    FOwned: Boolean;
  protected
    procedure DeEncrypt(var Buffer; Count: Longint); virtual; abstract;
    {* ���ܷ��������󷽷���}
    procedure Encrypt(var Buffer; Count: Longint); virtual; abstract;
    {* ���ܷ��������󷽷���}

    procedure DoBeforeEncrypt(const Buffer; Count: Longint); virtual; abstract;
    procedure DoAfterEncrypt(const Buffer; Count: Longint); virtual; abstract;
    procedure DoBeforeDeEncrypt(const Buffer; Count: Longint); virtual; abstract;
    procedure DoAfterDeEncrypt(const Buffer; Count: Longint); virtual; abstract;

    function GetSize: Int64; override;
    procedure SetSize(NewSize: Longint); override;
    procedure SetSize(const NewSize: Int64); overload; override;
  
    property Owned: Boolean read FOwned;
    property Stream: TStream read FStream;
  public
    constructor Create(AStream: TStream; AOwned: Boolean = False);
    {* �๹������AStream ����Ϊ��Ҫ���м��ܴ��������AOwned ��ʾ�Ƿ�
       ���ͷż�����ʱͬʱ�ͷ� AStream��}
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): LongInt; override;
    function Seek(Offset: Longint; Origin: Word): LongInt; override;
    function Write(const Buffer; Count: Longint): LongInt; override;
  end;

{ TEasyXorStream }

  TEasyXorStream = class (TEasyEncryptStream)
  {* Xor ���ܵ� TStream �֧࣬�����ݶ�дʱ���� Xor ���ܴ���}
  private
    FXorStr: AnsiString;
    FSeedPos: Integer;
  protected
    procedure DeEncrypt(var Buffer; Count: Longint); override;
    procedure Encrypt(var Buffer; Count: Longint); override;

    procedure DoBeforeEncrypt(const Buffer; Count: Longint); override;
    procedure DoAfterEncrypt(const Buffer; Count: Longint); override;
    procedure DoBeforeDeEncrypt(const Buffer; Count: Longint); override;
    procedure DoAfterDeEncrypt(const Buffer; Count: Longint); override;
  public
    constructor Create(AStream: TStream; const AXorStr: AnsiString;
      AOwned: Boolean = False);
    {* �๹����
     |<PRE>
       AStream: TStream         - ��Ҫ���м��ܴ������
       AXorStr: string          - ���ڼ��ܴ�����ַ���
       AOwned: Boolean          - �Ƿ����ͷż�����ʱͬʱ�ͷ� AStream
     |</PRE>}
    property XorStr: AnsiString read FXorStr write FXorStr;
    {* ���ڼ��ܴ�����ַ��� }
  end;

function EasyFastMemoryStreamCopyFrom(Dest, Source: TStream; Count: Int64): Int64;
{* ���ٵ� MemoryStream �� CopyFrom ���������� Dest �� Source ֮һ�� MemoryStream
   �������ֱ�Ӷ�д�ڴ棬�����˷��仺�������ظ���д�Ŀ������紫����� Stream ��
   ���� TCustomMemoryStream�������ԭ CopyFrom ������}

implementation

function EasyFastMemoryStreamCopyFrom(Dest, Source: TStream; Count: Int64): Int64;
var
  aNewSize: Longint;
begin
  if Count = 0 then
  begin
    Source.Position := 0;
    Count := Source.Size;
  end;
  Result := Count;
  //ע��˷����ܹ�������Ҫ������Dest, Source����֮һ��TCustomMemoryStream,�������ԭ����
  
  //�ж�Dest��Source�ǲ���TCustomMemoryStream,����ǵĻ���ֱ�Ӵ�Memory�ĵ�ַ�Ͻ��в��� ,
  //��ΪCustomMemoryStream ��read��writer���õ�System.move
  //����ʡȥ��ԭTStream��ͣ�ش�����дbuffer ������Capacity ,ԭcopyfrom�������˷�ʱ��
  //�ô˷�����ֱ�ӽ�Source���ڴ��׷�ӵ�Dest��Memory��ַ�ĺ���

  if Source is TCustomMemoryStream then     //ֱ��д�뵽Dest�ĵ�ַ��
    Dest.WriteBuffer(Pointer(Longint(TCustomMemoryStream(Source).Memory) + Source.Position)^,Count)
  else if Dest is TCustomMemoryStream then
  begin
    aNewSize := Dest.Position + Count;
    TCustomMemoryStream(Dest).Size := aNewSize; //�������ڴ�Ĵ�С����Dest.Memory����,��Ȼ�����Ҳ�����ַ
    //sourceֱ�Ӵ�Dest.memory����д
    Source.ReadBuffer(Pointer(Longint(TCustomMemoryStream(Dest).Memory) + Dest.Position)^, Count);
  end
  else
  begin
    Dest.CopyFrom(Source, Count);
  end;
end;

{ TEasyEncryptStream }

constructor TEasyEncryptStream.Create(AStream: TStream; AOwned: Boolean);
begin
  inherited Create;
  Assert(Assigned(AStream));
  FStream := AStream;
  FOwned := AOwned;
end;

destructor TEasyEncryptStream.Destroy;
begin
  if FOwned then
    FreeAndNil(FStream);
  inherited;
end;

function TEasyEncryptStream.GetSize: Int64;
begin
  Result := FStream.Size;
end;

function TEasyEncryptStream.Read(var Buffer; Count: Integer): LongInt;
begin
  Result := FStream.Read(Buffer, Count);
  DoBeforeDeEncrypt(Buffer, Count);
  DeEncrypt(Buffer, Count);
  DoAfterDeEncrypt(Buffer, Count);
end;

function TEasyEncryptStream.Seek(Offset: Integer; Origin: Word): LongInt;
begin
  Result := FStream.Seek(Offset, Origin);
end;

procedure TEasyEncryptStream.SetSize(NewSize: Integer);
begin
  FStream.Size := NewSize;
end;

procedure TEasyEncryptStream.SetSize(const NewSize: Int64);
begin
  FStream.Size := NewSize;
end;

function TEasyEncryptStream.Write(const Buffer; Count: Integer): LongInt;
var
  MemBuff: Pointer;
begin
  GetMem(MemBuff, Count);
  try
    DoBeforeEncrypt(Buffer, Count);
    CopyMemory(MemBuff, @Buffer, Count);
    Encrypt(MemBuff^, Count);
    DoAfterEncrypt(Buffer, Count);
    Result := FStream.Write(MemBuff^, Count);
  finally
    FreeMem(MemBuff);
  end;
end;

{ TEasyXorStream }

constructor TEasyXorStream.Create(AStream: TStream;
  const AXorStr: AnsiString; AOwned: Boolean);
begin
  inherited Create(AStream, AOwned);
  FXorStr := AXorStr;
end;

procedure TEasyXorStream.DeEncrypt(var Buffer; Count: Integer);
begin
  Encrypt(Buffer, Count);
end;

procedure TEasyXorStream.DoAfterDeEncrypt(const Buffer; Count: Integer);
begin
//  inherited;

end;

procedure TEasyXorStream.DoAfterEncrypt(const Buffer; Count: Integer);
begin
//  inherited;

end;

procedure TEasyXorStream.DoBeforeDeEncrypt(const Buffer; Count: Integer);
begin
  // ��дǰ����Ҫ��¼λ�ã������е�xor���ܵ������ַ�λ�öԵ��Ϻ�
  FSeedPos := Position - Count;
end;

procedure TEasyXorStream.DoBeforeEncrypt(const Buffer; Count: Integer);
begin
  // ��дǰ����Ҫ��¼λ�ã������е�xor���ܵ������ַ�λ�öԵ��Ϻ�
  FSeedPos := Position;
end;

procedure TEasyXorStream.Encrypt(var Buffer; Count: Integer);
var
  i, p, l: Integer;
begin
  l := Length(FXorStr);
  if l > 0 then
  begin
    p := FSeedPos;
    for i := 0 to Count - 1 do
      PByteArray(@Buffer)^[i] := PByteArray(@Buffer)^[i] xor
        Byte(FXorStr[(p + i) mod l + 1]);
  end;
end;

end.


