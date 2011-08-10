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
//    ����Ԫ�ǹ������ݼ�����Ļ�����Ԫ
//
//��Ҫʵ�֣�
//      1��EasyUtilADOConn
//         �����������ӣ����������ݿ�ͨ�ŵ�ģ����Ӵ˵�Ԫ���ADO����
//      2����ʼ��ָ���ؼ���IME
//-----------------------------------------------------------------------------}
unit untEasyPlateDBBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, untEasyGroupBox, untEasyWaterImage, DBClient,
  untEasyPlateBaseForm, EasyPlateServer_TLB, untEasyClasssysUser, untEasyClasshrEmployee;

type
  TfrmEasyPlateDBBaseForm = class(TfrmEasyPlateBaseForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FEasyDBConn: TADOConnection;
    function GetUtilADOConn: TADOConnection;
    procedure SetUtilADOConn(const Value: TADOConnection);
    function GetRDMEasyPlateServerDisp: IRDMEasyPlateServerDisp;
    function GetEasyCurrLoginSysUser: TEasysysUser;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //����ADO��������
    property EasyUtilADOConn: TADOConnection read GetUtilADOConn write SetUtilADOConn;
    //����Զ�����ݷ���ӿ�
    //�ͻ��˵��÷���˺�����ʹ�ô�����
    property EasyRDMDisp: IRDMEasyPlateServerDisp read GetRDMEasyPlateServerDisp;
    //��ǰ��¼�û�
    property EasyCurrLoginSysUser: TEasysysUser read GetEasyCurrLoginSysUser;
  end;

var
  frmEasyPlateDBBaseForm: TfrmEasyPlateDBBaseForm;

implementation

{$R *.dfm}

uses untEasyDBConnection;

constructor TfrmEasyPlateDBBaseForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TfrmEasyPlateDBBaseForm.Destroy;
begin
  inherited;
end;

procedure TfrmEasyPlateDBBaseForm.FormCreate(Sender: TObject);
begin
  inherited;
  FEasyDBConn := DMEasyDBConnection.EasyADOConn;
end;

function TfrmEasyPlateDBBaseForm.GetEasyCurrLoginSysUser: TEasysysUser;
begin
  Result := DMEasyDBConnection.EasyCurrLoginSysUser;
end;

function TfrmEasyPlateDBBaseForm.GetRDMEasyPlateServerDisp: IRDMEasyPlateServerDisp;
begin
  //��ȡCOM�ӿ�
  Result := DMEasyDBConnection.EasyIRDMEasyPlateServerDisp;
end;

function TfrmEasyPlateDBBaseForm.GetUtilADOConn: TADOConnection;
begin
  Result := FEasyDBConn;
end;

procedure TfrmEasyPlateDBBaseForm.SetUtilADOConn(
  const Value: TADOConnection);
begin
  FEasyDBConn := Value;
end;

end.
