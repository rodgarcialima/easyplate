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
//    ��˾��Ϣ����
//��Ҫʵ�֣�
//    ��˾��Ϣ����
//-----------------------------------------------------------------------------}
unit untEasyCompanySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBFormExt, atScript, atScripter, ActnList, ImgList,
  untEasyToolBar, untEasyToolBarStylers, ExtCtrls, untEasyGroupBox;

  //�����������
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyCompanySet = class(TfrmEasyPlateDBFormExt)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEasyCompanySet: TfrmEasyCompanySet;

implementation

{$R *.dfm}

//��������ʵ��
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyCompanySet := TfrmEasyCompanySet.Create(Application);
  if frmEasyCompanySet.FormStyle <> fsMDIChild then
    frmEasyCompanySet.FormStyle := fsMDIChild;
  if frmEasyCompanySet.WindowState <> wsMaximized then
    frmEasyCompanySet.WindowState := wsMaximized;
  Result := frmEasyCompanySet;
end;

end.
