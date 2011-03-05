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
//    ϵͳ��¼����,�û�����ϵͳ�ڴ���֤
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyLoginMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateBaseForm, ExtCtrls, jpeg, StdCtrls, untEasyLabel,
  untEasyEdit, untEasyButtons, DB, ADODB, untEasyDBConnection,
  untEasyBallonControl, untEasyProgressBar, DBClient, Provider,
  untEasyPlateDBBaseForm;


type
  TLoadEasyDBPkg = function(AHandle: THandle): Integer; stdcall;

  TfrmEasyLoginMain = class(TfrmEasyPlateDBBaseForm)
    imgLoginBC: TImage;
    EasyLabel1: TEasyLabel;
    edtUserName: TEasyLabelEdit;
    bbtnCancel: TEasyBitButton;
    bbtnLogin: TEasyBitButton;
    lblCopyRight: TEasyLabel;
    EasyLabel2: TEasyLabel;
    hintBall: TEasyHintBalloonForm;
    cdsLogin: TClientDataSet;
    dspLogin: TDataSetProvider;
    edtPassWord: TEasyLabelEdit;
    procedure bbtnCancelClick(Sender: TObject);
    procedure bbtnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FLoginUserID: string;
    FApplicationHandle: Cardinal;
    procedure SetLoginUserID(const Value: string);
    function GetLoginUserID: string;
  public
    { Public declarations }
    property EasyLoginUserID: string read GetLoginUserID write SetLoginUserID;
  end;

var
  frmEasyLoginMain: TfrmEasyLoginMain;

implementation

uses untEasyUtilConst, untEasyUtilDLL, untEasyPlateMain;

{$R *.dfm}

procedure TfrmEasyLoginMain.bbtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEasyLoginMain.bbtnLoginClick(Sender: TObject);
var
  TmpSQL: string;
begin
  if Trim(edtUserName.Text) = '' then
  begin
    hintBall.ShowTextHintBalloon(bmtInfo, '��ʾ', '�û�������Ϊ��!', 500, 200,
                                 0, edtUserName, bapBottomRight);
    Exit;
  end;
  if Trim(edtPassWord.Text) = '' then
  begin
    hintBall.ShowTextHintBalloon(bmtInfo, '��ʾ', '���벻��Ϊ��!', 500, 200,
                                 0, edtPassWord, bapBottomRight);
    Exit;
  end;
  EasyLoginUserID := Trim(edtUserName.Text);
  try
    Screen.Cursor := crHourGlass;
    //��ʼ��֤���������� ��CS/CAS
    with cdsLogin do
    begin
      if UpperCase(DMEasyDBConnection.EasyAppType) = 'CAS' then
      begin
        cdsLogin.Data := EasyRDMDisp.EasyGetRDMData('SELECT sSQL FROM sysSQL WHERE iFlag = 1 AND sSQLEName = ''UserLoginCheck''');
//        cdsLogin.RemoteServer := DMEasyDBConnection.EasyScktConn;
//        cdsLogin.ProviderName := 'EasyRDMDsp';
      end
      else
      begin
        cdsLogin.ProviderName := 'DspLogin';
        if Active then Close;
        CommandText := 'SELECT sSQL FROM sysSQL WHERE iFlag = 1 AND sSQLEName = ''UserLoginCheck''';
        Open;
      end;

      if cdsLogin.RecordCount > 0 then
        TmpSQL := cdsLogin.fieldbyname('sSQL').AsString;
      close;
    end;
    if Trim(TmpSQL) <> '' then
    begin
      TmpSQL := Format(TmpSQL, [QuotedStr(edtUserName.Text)]);
      with cdsLogin do
      begin
        if UpperCase(DMEasyDBConnection.EasyAppType) = 'CAS' then
        begin
          cdsLogin.Data := EasyRDMDisp.EasyGetRDMData(TmpSQL);
        end
        else
        begin
          Close;
          CommandText := TmpSQL;
          cdsLogin.Data := EasyRDMDisp.EasyGetRDMData(TmpSQL);
          try
            Open;
          except on e:Exception do
          begin
            cdsLogin.Close;
            Application.MessageBox(PChar('ϵͳ����,ԭ��' + e.Message), '����', MB_OK +
              MB_ICONSTOP);
          end;
          end;
        end;

        if cdsLogin.RecordCount > 0 then
        begin
          if transfer(edtPassWord.Text) = LowerCase(FieldByName('sLoginPassWord').AsString) then
          begin
            frmEasyPlateMain.EasyLoginUserID := EasyLoginUserID;
            frmEasyLoginMain.Close;
          end
          else
          begin
            edtPassWord.Text := '';
            edtUserName.Text := '';
            hintBall.ShowTextHintBalloon(bmtError, '��ʾ', '�û��������벻��ȷ!',
                                         500, 200, 0, edtUserName, bapBottomRight);
            cdsLogin.Close;
          end;
        end
        else
        begin
          edtPassWord.Text := '';
          hintBall.ShowTextHintBalloon(bmtWarning, '��ʾ', '���û������ڻ���ͣ��!',
                                       500, 200, 0, edtUserName, bapBottomRight);
          cdsLogin.Close;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEasyLoginMain.SetLoginUserID(const Value: string);
begin
  FLoginUserID := Value;
end;

function TfrmEasyLoginMain.GetLoginUserID: string;
begin
  Result := FLoginUserID;
end;

procedure TfrmEasyLoginMain.FormCreate(Sender: TObject);
begin
//  inherited; �˾�Ҫɾ��
end;

end.
