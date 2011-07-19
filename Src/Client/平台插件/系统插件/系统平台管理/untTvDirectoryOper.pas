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
unit untTvDirectoryOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untEasyEdit, untEasySpinEdit, untEasyEditExt,
  untEasyGroupBox, untEasyButtons, untEasyPlateManager, untEasyLabel,
  unEasyComboBox, ImgList, untEasyClassPluginDirectory, ExtCtrls,
  untEasyMemo;

type
  TfrmTvDirectoryOper = class(TForm)
    edtCName: TEasyLabelEdit;
    speOrder: TEasySpinEdit;
    edtImage1: TEasyButtonEdit;
    edtImage2: TEasyButtonEdit;
    rbDirectory: TEasyRadioButton;
    rbModules: TEasyRadioButton;
    btnSave: TEasyBitButton;
    btnCancel: TEasyBitButton;
    lblParentNode: TEasyLabel;
    ImageList1: TImageList;
    rgShowModal: TEasyRadioGroup;
    rgModuleEnable: TEasyRadioGroup;
    edtFileName: TEasyButtonEdit;
    dlgBpl: TOpenDialog;
    edtEName: TEasyLabelEdit;
    mmRemark: TEasyMemo;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtImage1ButtonClick(Sender: TObject);
    procedure edtImage2ButtonClick(Sender: TObject);
    procedure rbDirectoryClick(Sender: TObject);
    procedure rbModulesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFileNameButtonClick(Sender: TObject);
  private
    { Private declarations }
    FAData: TEasysysPluginsDirectory;
    function CheckNotNullControl: Boolean;
  public
    { Public declarations }
  end;

var
  frmTvDirectoryOper: TfrmTvDirectoryOper;

  procedure ShowfrmTvDirectoryOper(var AData: TEasysysPluginsDirectory; AFlag: string;
                                  ParentCName: string = '');

implementation

uses untEasyUtilMethod, untEasyImageSelect;

{$R *.dfm}

const
  Remark_NULL = '����˵��';
  
procedure ShowfrmTvDirectoryOper(var AData: TEasysysPluginsDirectory; AFlag: string;
                                  ParentCName: string = '');
begin
  try
    frmTvDirectoryOper := TfrmTvDirectoryOper.Create(Application);
    frmTvDirectoryOper.lblParentNode.Caption := '';
    if AFlag = 'Add' then
    begin
      frmTvDirectoryOper.Caption := frmTvDirectoryOper.Caption + '-[����]';
      if ParentCName <> '' then
        frmTvDirectoryOper.lblParentNode.Caption := '�ϼ��ڵ�: ��' + ParentCName +'��';
    end
    else if AFlag = 'Edit' then
    begin
      frmTvDirectoryOper.Caption := frmTvDirectoryOper.Caption + '-[�༭]';
      with frmTvDirectoryOper do
      begin
        edtCName.Text := AData.PluginCName;
        edtEName.Text := AData.PluginEName;
        speOrder.Value := AData.iOrder;
        edtImage1.Text := IntToStr(AData.ImageIndex);
        edtImage2.Text := IntToStr(AData.SelectedImageIndex);
        if AData.IsDirectory then
          rbDirectory.Checked := True
        else begin
          rbModules.Checked := True;
          edtFileName.Text := AData.PluginFileName;
        end;
        if AData.ShowModal then
          rgShowModal.ItemIndex := 0;
        if AData.IsEnable then
          rgModuleEnable.ItemIndex := 0;
        if Trim(AData.Remark) = '' then
          mmRemark.Text := Remark_NULL;
      end;
    end;
    //������������
    frmTvDirectoryOper.FAData := AData;
    frmTvDirectoryOper.ShowModal;
  finally
    FreeAndNil(frmTvDirectoryOper);
  end;
end; 
  
procedure TfrmTvDirectoryOper.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTvDirectoryOper.btnSaveClick(Sender: TObject);
begin
  if CheckNotNullControl then Exit;
  if trim(FAData.PluginGUID) = '' then //����ʱ����GUID
    FAData.PluginGUID := GenerateGUID;
  FAData.PluginCName := Trim(edtCName.Text);
  FAData.PluginEName := Trim(edtEName.Text);
  FAData.iOrder := StrToInt(speOrder.Text);
  FAData.ImageIndex := StrToInt(edtImage1.Text);
  FAData.SelectedImageIndex := StrToInt(edtImage2.Text);
  if mmRemark.Lines.Text <> Remark_NULL then
    FAData.Remark := mmRemark.Lines.Text;
  //������ģ���Ƿ�Ŀ¼���ԣ�������ʹ��
  if rbDirectory.Checked then
    FAData.IsDirectory := True
  else
    FAData.IsDirectory := False;
  //ģ̬��ʾ
  if rgShowModal.ItemIndex = 0 then
    FAData.ShowModal := True
  else
    FAData.ShowModal := False;

  if not rbDirectory.Checked then
//    FAData.PluginFileName := edtFileName.Text;
    FAData.PluginFileName := ExtractFileName(edtFileName.Text);

  //Ŀ¼���ܱ�ͣ��
  if FAData.IsDirectory then
    FAData.IsEnable := True
  else
  begin
    if rgModuleEnable.ItemIndex = 0 then
      FAData.IsEnable := True
    else
      FAData.IsEnable := False;
  end;
  Close;
end;

procedure TfrmTvDirectoryOper.FormCreate(Sender: TObject);
begin
  edtImage1.Text := '-1';
  edtImage2.Text := '-1';
  rbDirectoryClick(Sender);
end;

procedure TfrmTvDirectoryOper.edtImage1ButtonClick(Sender: TObject);
begin
  edtImage1.Text := IntToStr(EasySelectImage);
end;

procedure TfrmTvDirectoryOper.edtImage2ButtonClick(Sender: TObject);
begin
  edtImage2.Text := IntToStr(EasySelectImage);
end;

procedure TfrmTvDirectoryOper.rbDirectoryClick(Sender: TObject);
begin
  if rbDirectory.Checked then
  begin
    edtFileName.Enabled := False;
    rgShowModal.Enabled := False;
    if Pos('����', Caption) > 0 then
    begin
      edtImage1.Text := '0';
      edtImage2.Text := '1';
    end;
  end else
  begin
    edtFileName.Enabled := True;
    rgShowModal.Enabled := True;
  end;
end;

procedure TfrmTvDirectoryOper.rbModulesClick(Sender: TObject);
begin
  if rbModules.Checked then
  begin
    edtFileName.Enabled := True;
    rgShowModal.Enabled := True;
    if Pos('����', Caption) > 0 then
    begin
      edtImage1.Text := '2';
      edtImage2.Text := '2';
    end;
  end else
  begin
    edtFileName.Enabled := False;
    rgShowModal.Enabled := False;
  end;
end;

function TfrmTvDirectoryOper.CheckNotNullControl: Boolean;
begin
  Result := False;
  if Trim(edtCName.Text) = '' then
  begin
    Application.MessageBox('ģ���������Ʋ���Ϊ��!', '��ʾ', MB_OK +
      MB_ICONWARNING);
    Result := True;
    Exit;  
  end;  
  if Trim(speOrder.Text) = '' then
  begin
    Application.MessageBox('ģ����Ų���Ϊ��!', '��ʾ', MB_OK + 
      MB_ICONWARNING);
    Result := True;
    Exit;  
  end;
  if not rbDirectory.Checked then
  begin
    if Trim(edtFileName.Text) = '' then
    begin
      Application.MessageBox('ģ���ļ�����Ϊ��!', '��ʾ', MB_OK +
        MB_ICONWARNING);
      Result := True;
      Exit;
    end;
  end;
end;

procedure TfrmTvDirectoryOper.FormShow(Sender: TObject);
begin
  edtCName.EditLabel.Font.Color  := clBlue;
  speOrder.EditLabel.Font.Color  := clBlue;
  edtFileName.EditLabel.Font.Color  := clBlue;

  edtCName.EditLabel.Transparent := True;
  speOrder.EditLabel.Transparent := True;
  edtFileName.EditLabel.Transparent := True;
  //Ĭ��ѡ��Ŀ¼ ���ļ�ѡ��򲻿���
  edtFileName.Enabled := False;
end;

procedure TfrmTvDirectoryOper.edtFileNameButtonClick(Sender: TObject);
begin
  if rbModules.Checked then
  begin
    dlgBpl.InitialDir := ExtractFilePath(Application.ExeName) + 'plugins\';
    if dlgBpl.Execute then
      edtFileName.Text := dlgBpl.FileName;
  end;    
end;

end.
