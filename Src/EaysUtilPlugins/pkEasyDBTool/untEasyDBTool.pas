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
//    ���ݿ������
//��Ҫʵ�֣�
//-----------------------------------------------------------------------------}
unit untEasyDBTool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm;

  //�����������
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyDBTool = class(TfrmEasyPlateDBBaseForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEasyDBTool: TfrmEasyDBTool;

implementation

{$R *.dfm}

//��������ʵ��
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyDBTool := TfrmEasyDBTool.Create(Application);
  if frmEasyDBTool.FormStyle <> fsMDIChild then
    frmEasyDBTool.FormStyle := fsMDIChild;
  if frmEasyDBTool.WindowState <> wsMaximized then
    frmEasyDBTool.WindowState := wsMaximized;
  Result := frmEasyDBTool;
end;

end.
