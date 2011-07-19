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
//------------------------------------------------------------------------------}
unit untEasyImageSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, untEasyButtons, ExtCtrls, untEasyPlateBaseForm,
  untEasyDBConnection;

  //�����������
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmImagesSelect = class(TfrmEasyPlateBaseForm)
    imgVW16: TImageList;
    Panel1: TPanel;
    pnlBottom: TPanel;
    lvMain: TListView;
    btnCancel: TEasyBitButton;
    btnOk: TEasyBitButton;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FControlFlag: Integer;
  end;

  function EasySelectImage: Integer;
var
  frmImagesSelect: TfrmImagesSelect;

implementation

{$R *.dfm}

//��������ʵ��
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmImagesSelect := TfrmImagesSelect.Create(Application);
  Application.Handle := frmImagesSelect.EasyApplicationHandle;
  if frmImagesSelect.FormStyle <> fsMDIChild then
    frmImagesSelect.FormStyle := fsMDIChild;
  if frmImagesSelect.WindowState <> wsMaximized then
    frmImagesSelect.WindowState := wsMaximized;
  frmImagesSelect.FormId := '{1923B93B-574C-4BA3-BD52-60DCD672EE72}';
  Result := frmImagesSelect;
end;

function EasySelectImage: Integer;
begin
  Result := -1;
  frmImagesSelect := TfrmImagesSelect.Create(Application);
  frmImagesSelect.BorderStyle := bsDialog;
  frmImagesSelect.ShowModal;
  with frmImagesSelect do
  begin
    if lvMain.Selected <> nil then
      Result := lvMain.Selected.Index;
  end;
  frmImagesSelect.Free;
end;

procedure TfrmImagesSelect.FormCreate(Sender: TObject);
var
  I   : Integer;
  ATmpListItem: TListItem;
begin
  lvMain.Items.Clear;
  imgVW16.Assign(DMEasyDBConnection.img16);
  for I := 0 to imgVW16.Count - 1 do
  begin
    ATmpListItem := lvMain.Items.Add;
    ATmpListItem.Caption := IntToStr(I);
    ATmpListItem.ImageIndex := I;
  end;
end;

procedure TfrmImagesSelect.FormResize(Sender: TObject);
begin
  inherited;
  btnOk.Left := pnlBottom.Width - 106;
  btnCancel.Left := pnlBottom.Width - 184;
end;

procedure TfrmImagesSelect.btnOkClick(Sender: TObject);
var
  SelectIndex: Integer;
begin
  inherited;
  if lvMain.Selected <> nil then
  begin
    SelectIndex := lvMain.Selected.Index;
    if SelectIndex <> -1 then
      Close
    else
      Beep;
  end;
end;

procedure TfrmImagesSelect.btnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
