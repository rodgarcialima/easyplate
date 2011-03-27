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
//    ����Ԫ�ǹ��̵��������Ԫ��������µ����д��嶼����Ӵ˻�����̳�
//
//��Ҫʵ�֣�
//    1���س�->Tab
//       ����KeyPreViewΪTrue�����ڰ��»س�����ͬ�ڰ���Tab��
//    2��FormId
//       ���м̳еĴ��嶼����ָ��һ��FormId��ΪBpl������ʱ��Ψһ��ݱ�ʶ
//
//       ע��(Ctrl+Shift+G ��ϼ�����GUID) {} {�ϼ�38λ���� }
//       '{00000000-0000-0000-0000-000000000000}'  {��ʾ������ }
//       '{11111111-1111-1111-1111-111111111111}'  {��ʾ��ѯ����}
//    3����������Ϣ����
//       LegalCompanyName : String;     //��˾����   W
//       FileDescription  : String;     //�ļ�����   RW
//       FileVersion      : String;     //�ļ��汾   RW
//       LegalCopyright   : String;     //�Ϸ���Ȩ���� RW
//      4��TO-DO
//         �����Թ��ܣ�
//         ��Login��������û�ѡ������Ա�ţ����ݵ�DMEasyConnection��������
//         EasyLangID�У��ɸ�������Createʱ��̬��Lang�����ļ�INI�¶�ȡCaption
//      5����ʼ������ClientDataSet��Provider�����ԣ������½�Provider��̬����
//-----------------------------------------------------------------------------}
unit untEasyPlateBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ShlObj, IniFiles, DB, DBClient, TypInfo,
  Provider, ExtCtrls, untEasyGroupBox, untEasyWaterImage;

type
  TfrmEasyPlateBaseForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFormId      : String;
    FLangID      : string;           //�������
    FEasyAppPath : string;           //Ӧ�ó�������·��
    FEasyPlugPath: string;           //������·��
    FEasyImagePath: string;          //ϵͳ��ʹ�õ�ͼƬ���·��
    FIsKeyPreView: Boolean;
    FEasyRootGUID    : string;           //���ڵ�͸������GUID
    FLegalCompanyName : String;     //��˾����
    FFileDescription  : String;     //�ļ�����
    FFileVersion      : String;     //�ļ��汾
    FLegalCopyright   : String;     //�Ϸ���Ȩ����
    procedure SetFormId(const Value: string);
    procedure SetIsKeyPreView(const Value: Boolean);
    procedure SetFileDescription(const Value: string);
    function GetFormId: string;
    function GetKeyPreView: Boolean;
    function GetFileDescription: string;
    function GetFileVersion: string;
    function GetLegalCopyright: string;
    procedure SetFileVersion(const Value: string);
    procedure SetLegalCopyright(const Value: string);
    function GetLangID: string;
    procedure SetLangID(const Value: string);
    //���ÿؼ�����ʾ����
    procedure SetControlCaption(ALangINIFile: TStrings);
  protected
    procedure DoShow; override;
    procedure DoClose(var Action: TCloseAction); override;
    procedure KeyPress(var Key: Char); override;
    procedure CreateParams(var Params:TCreateParams);override;
    //�ı��������
    procedure ChangeLang(LanguageId: string); virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property FormId: string read GetFormId write SetFormId;
    property IsKeyPreView: Boolean read GetKeyPreView write SetIsKeyPreView;
    //ϵͳ��ʾ��Ϣ
    function EasyErrorHint(AHint: string): Integer; virtual;
    function EasyConfirmHint(AHint: string): Integer; virtual;
    function EasyWarningHint(AHint: string): Integer; virtual;
    function EasyHint(AHint: string): Integer; virtual;
    function EasySelectHint(AHint: string): Integer; virtual;
    //��ȡ�û�ָ��ģ��ָ��������Ȩ��
    function GetUserRight: Boolean; virtual;
    //���Դ���
    property LangID: string read GetLangID write SetLangID;
    //����Ϊ��˾��Ȩ��Ϣ
    property LegalCompanyName: string read FLegalCompanyName write FLegalCompanyName;
    property FileDescription: string read GetFileDescription write SetFileDescription;
    property FileVersion: string read GetFileVersion write SetFileVersion;
    property LegalCopyright: string read GetLegalCopyright write SetLegalCopyright;
    //ϵͳ·������
    property EasyApplicationPath: string read FEasyAppPath write FEasyAppPath;
    property EasyPlugPath: string read FEasyPlugPath write FEasyPlugPath;
    property EasyRootGUID: string read FEasyRootGUID write FEasyRootGUID;
    property EasyImagePath: string read FEasyImagePath write FEasyImagePath;
  end;

var
  frmEasyPlateBaseForm: TfrmEasyPlateBaseForm;

implementation

{$R *.dfm}

uses untEasyDBConnection;

{ TfrmEasyBaseFormExt }

function TfrmEasyPlateBaseForm.GetFormId: string;
begin
  Result := FFormId;
end;

function TfrmEasyPlateBaseForm.GetKeyPreView: Boolean;
begin
  Result := FIsKeyPreView;
end;

procedure TfrmEasyPlateBaseForm.SetFormId(const Value: string);
begin
  FFormId := Value;
end;

procedure TfrmEasyPlateBaseForm.SetIsKeyPreView(const Value: Boolean);
begin
  FIsKeyPreView := Value;
  if FIsKeyPreView then
    KeyPreview := FIsKeyPreView;
end;      

procedure TfrmEasyPlateBaseForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
//  if BorderStyle = bsNone then
//    Params.Style := Params.Style Xor WS_CAPTION ;
//  if BorderStyle <> bsNone then
//    Params.Style := WS_THICKFRAME or WS_POPUP or WS_BORDER;
end;

procedure TfrmEasyPlateBaseForm.DoClose(var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
end;

procedure TfrmEasyPlateBaseForm.DoShow;
begin
  inherited;

end;

procedure TfrmEasyPlateBaseForm.KeyPress(var Key: Char);
begin
  if ActiveControl <> nil then
  begin
    if (Key = #13) and KeyPreview then
    begin
      //����ؼ�Tagֵ��30����5�����ƶ����㵽��һ���ؼ�
      if (ActiveControl.Tag mod 30)=5 then
        Exit;

      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
  end;
  inherited KeyPress(Key);
end;

function TfrmEasyPlateBaseForm.GetFileDescription: string;
begin
  Result := FFileDescription;
end;

procedure TfrmEasyPlateBaseForm.SetFileDescription(const Value: string);
begin
  FFileDescription := Value;
end;

constructor TfrmEasyPlateBaseForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsKeyPreView := True;
  FFormId := '{00000000-0000-0000-0000-000000000000}';
  FLegalCompanyName := 'һ������з����޹�˾';
end;

function TfrmEasyPlateBaseForm.GetFileVersion: string;
begin
  Result := FileVersion;
end;

function TfrmEasyPlateBaseForm.GetLegalCopyright: string;
begin
  Result := LegalCopyright;
end;

procedure TfrmEasyPlateBaseForm.SetFileVersion(const Value: string);
begin
  FFileVersion := Value;
end;

procedure TfrmEasyPlateBaseForm.SetLegalCopyright(const Value: string);
begin
  FLegalCopyright := Value;
end;

procedure TfrmEasyPlateBaseForm.FormCreate(Sender: TObject);
var
  I       : Integer;
  cdsName,
  dspName : String;
  ATmpDsp : TDataSetProvider;
begin
  FEasyAppPath := ExtractFilePath(Application.ExeName);
  FEasyPlugPath := FEasyAppPath + 'plugins\';
  FEasyImagePath := FEasyAppPath + 'images\';
  FEasyRootGUID := '{00000000-0000-0000-0000-000000000000}';
  for i := 0 to ComponentCount - 1 do
  begin
    //����ClientDataSet���������
    //EasyAppType��ǰ��������ģʽ��CS���� CAS����
    if DMEasyDBConnection.EasyAppType = 'CS' then
    begin
      if (Components[I] is TClientDataSet) then
      begin
        cdsName := TClientDataSet(Components[I]).Name;
        dspName := TClientDataSet(Components[I]).ProviderName;
        //���TWaxDataSetProvider�����ڲ��Զ�����
        if FindComponent(dspName) = nil then
        begin
          if Trim(dspName) = '' then
            dspName := 'EasyDSP' + cdsName;
          ATmpDsp := TDataSetProvider.Create(Self);
          ATmpDsp.Name := dspName;
          ATmpDsp.DataSet := DMEasyDBConnection.EasyQry;
          ATmpDsp.Options := ATmpDsp.Options + [poAllowCommandText];
        end;

        (Components[I] as TClientDataSet).ProviderName := ATmpDsp.Name;
      end;
//    end
//    else if DMEasyDBConnection.EasyAppType = 'CAS' then
//    begin
//      if Components[I] is TClientDataSet then     
//      begin
//        with Components[I] as TClientDataSet do
//        begin
//          RemoteServer := DMEasyDBConnection.EasyScktConn;
//          ProviderName := 'EasyRDMDsp';
//        end;
//      end;
    end;                                               
  end;
end;

procedure TfrmEasyPlateBaseForm.ChangeLang(LanguageId: string);
var
  TmpCaptionList: TStrings;
  LangINIPath   : string;
begin
  LangINIPath := EasyApplicationPath + 'lang\' + LanguageId + '\' + FormId + '.ini';
  TmpCaptionList := TStringList.Create;
  if FileExists(LangINIPath) then
  begin
    TmpCaptionList.LoadFromFile(LangINIPath);
    SetControlCaption(TmpCaptionList);
  end;  
  TmpCaptionList.Free;
end;

function TfrmEasyPlateBaseForm.GetLangID: string;
var
  ATmpList: TStrings;
begin
  ATmpList := TStringList.Create;
  if FileExists(EasyApplicationPath + 'lang\lang.ini') then
  begin
    ATmpList.LoadFromFile(EasyApplicationPath + 'lang\lang.ini');
    if ATmpList.IndexOfName('lang') <> -1 then
      Result := ATmpList.Values['lang']
    else
      Result := 'Chinese';
  end
  else
    Result := 'Chinese';
  ATmpList.Free;
end;

procedure TfrmEasyPlateBaseForm.SetLangID(const Value: string);
begin
  FLangID := Value;
end;

procedure TfrmEasyPlateBaseForm.SetControlCaption(ALangINIFile: TStrings);
var
  I: Integer;
begin
  if ALangINIFile.IndexOfName(Self.Name) <> -1 then
    Self.Caption := ALangINIFile.Values[Self.Name];
  for I := 0 to ComponentCount - 1 do
  begin
    if GetPropInfo(Components[I], 'Caption') <> nil then
    begin
      if ALangINIFile.IndexOfName(Components[I].Name) <> -1 then
        SetPropValue(Components[I], 'Caption', ALangINIFile.Values[Components[I].Name]);
    end
    else
    if GetPropInfo(Components[I], 'Text') <> nil then
    begin
      if ALangINIFile.IndexOfName(Components[I].Name) <> -1 then
        SetPropValue(Components[I], 'Text', ALangINIFile.Values[Components[I].Name]);
    end;
  end;
end;

function TfrmEasyPlateBaseForm.EasyConfirmHint(AHint: string): Integer;
begin
  Result := Application.MessageBox(PChar(AHint), PChar(Application.Title),
                                    MB_OKCANCEL + MB_ICONQUESTION);
end;

function TfrmEasyPlateBaseForm.EasyErrorHint(AHint: string): Integer;
begin
  Result := Application.MessageBox(PChar(AHint), PChar(Application.Title), MB_OK + 
    MB_ICONSTOP);
end;

function TfrmEasyPlateBaseForm.EasyHint(AHint: string): Integer;
begin
  Result := Application.MessageBox(PChar(AHint), PChar(Application.Title), MB_OK + 
    MB_ICONINFORMATION);
end;

function TfrmEasyPlateBaseForm.EasySelectHint(AHint: string): Integer;
begin
  Result := Application.MessageBox(PChar(AHint), PChar(Application.Title),
    MB_YESNOCANCEL + MB_ICONQUESTION); 
end;

function TfrmEasyPlateBaseForm.EasyWarningHint(AHint: string): Integer;
begin
  Result := Application.MessageBox(PChar(AHint), PChar(Application.Title), MB_OK + 
    MB_ICONWARNING);
end;

function TfrmEasyPlateBaseForm.GetUserRight: Boolean;
begin
  Result := True;
end;

procedure TfrmEasyPlateBaseForm.FormShow(Sender: TObject);
begin
  //�ı���������
  ChangeLang(LangID);
end;

end.
