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
//    ��������
//��Ҫʵ�֣�
//    ��������ӡ���Ƶ�
//    ϵͳ�����б�����ڴ˹���
//-----------------------------------------------------------------------------}
unit untEasyReportTemplateDesign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm;

  //�����������
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyReportTemplateDesign = class(TfrmEasyPlateDBBaseForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEasyReportTemplateDesign: TfrmEasyReportTemplateDesign;

implementation

{$R *.dfm}

//��������ʵ��
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyReportTemplateDesign := TfrmEasyReportTemplateDesign.Create(Application);
  if frmEasyReportTemplateDesign.FormStyle <> fsMDIChild then
    frmEasyReportTemplateDesign.FormStyle := fsMDIChild;
  if frmEasyReportTemplateDesign.WindowState <> wsMaximized then
    frmEasyReportTemplateDesign.WindowState := wsMaximized;
  Result := frmEasyReportTemplateDesign;
end;

end.
