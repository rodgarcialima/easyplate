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
unit untEasySysCurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, untEasyToolBar, untEasyToolBarStylers,
  DB, ImgList, DBClient, ActnList, Grids, untEasyBaseGrid, untEasyGrid,
  untEasyDBGrid;

  //�����������
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyReportCenter = class(TfrmEasyPlateDBBaseForm)
    edpMain: TEasyDockPanel;
    tlbMain: TEasyToolBar;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton1: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    EasyToolBarSeparator2: TEasyToolBarSeparator;
    EasyToolBarButton9: TEasyToolBarButton;
    EasyToolBarButton11: TEasyToolBarButton;
    EasyToolBarButton15: TEasyToolBarButton;
    EasyToolBarButton7: TEasyToolBarButton;
    EasyToolBarButton4: TEasyToolBarButton;
    EasyDBGrid1: TEasyDBGrid;
    actDataList: TActionList;
    actNewMst: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actRedo: TAction;
    actUndo: TAction;
    actFind: TAction;
    actPrint: TAction;
    actExit: TAction;
    actAddDtl: TAction;
    actEditDtl: TAction;
    actDeleteDtl: TAction;
    actCopyDtl: TAction;
    actRedoDtl: TAction;
    actUndoDtl: TAction;
    actSave: TAction;
    actRefresh: TAction;
    cdsSysConstMain: TClientDataSet;
    imgToolBar: TImageList;
    dsSysConstMain: TDataSource;
    tbosMain: TEasyToolBarOfficeStyler;
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
