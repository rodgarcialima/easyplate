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
unit untEasyReportCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm;

  //�����������
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyReportCenter = class(TfrmEasyPlateDBBaseForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEasyReportCenter: TfrmEasyReportCenter;

implementation

{$R *.dfm}

//��������ʵ��
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyReportCenter := TfrmEasyReportCenter.Create(Application);
  if frmEasyReportCenter.FormStyle <> fsMDIChild then
    frmEasyReportCenter.FormStyle := fsMDIChild;
  if frmEasyReportCenter.WindowState <> wsMaximized then
    frmEasyReportCenter.WindowState := wsMaximized;
  Result := frmEasyReportCenter;
end;

end.
