unit untEasyPlateLoading;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untEasyLabel, untEasyProgressBar, untEasyButtons,
  untEasyTabSet, untEasyUtilMethod, untEasyTreeView, ComCtrls;

const
  WM_LoadPlug = WM_User + 100;
type
  TPlugLoading = function: Boolean of object;

  TPlugLoadForm = function: Boolean of object;

  TfrmEasyPlateLoading = class(TForm)
    EasyProgressBar1: TEasyProgressBar;
    EasyLabel1: TEasyLabel;
    lblDisplayloading: TEasyLabel;
    EasyBitButton1: TEasyBitButton;
    procedure FormShow(Sender: TObject);
    procedure EasyBitButton1Click(Sender: TObject);
  private
    { Private declarations }
    FProc : TPlugLoading;
    FProcForm : TPlugLoadForm;
    procedure WMUser(var Message : TMessage); message WM_LoadPlug;
  public
    { Public declarations }
    ATmpNode_Loading: TTreeNode;
  end;

var
  frmEasyPlateLoading: TfrmEasyPlateLoading;

  //���ز����ʾ���� ϵͳ��ʼ��ʱ����
  function CreatePG(work: TPlugLoading; const ADisplayStr: string): Boolean;

  //���ز����ʾ���� ���ص������ʱ����
  function CreatePG_Plug(work: TPlugLoadForm; const ADisplayStr: string;
                         ANode: TTreeNode): Boolean;

implementation

{$R *.dfm}

  //���ز����ʾ����
  function CreatePG(work: TPlugLoading; const ADisplayStr: string): Boolean;
  begin
    Result := False;
    frmEasyPlateLoading := TfrmEasyPlateLoading.Create(Application);
    try
      with frmEasyPlateLoading do
      begin
        FProc := work;
        lblDisplayloading.Caption := ADisplayStr;
        ShowModal;
      end;
    finally
      frmEasyPlateLoading.Release;
    end;
  end;

//  ���ز����ʾ���� ���ص������ʱ����
  function CreatePG_Plug(work: TPlugLoadForm; const ADisplayStr: string;
                         ANode: TTreeNode): Boolean;
  begin
    Result := False;
    frmEasyPlateLoading := TfrmEasyPlateLoading.Create(Application);
    try
      with frmEasyPlateLoading do
      begin
        ATmpNode_Loading := ANode;
        FProcForm := work;
        lblDisplayloading.Caption := ADisplayStr;
        ShowModal;
      end;
    finally
      frmEasyPlateLoading.Release;
    end;
  end;

{ TfrmLoading }

procedure TfrmEasyPlateLoading.WMUser(var Message: TMessage);
begin
  Application.ProcessMessages;
  try
    if Assigned(FProc) then
      FProc;
    if Assigned(FProcForm) then
      FProcForm;
  finally
//    Close;
  end;
end;

procedure TfrmEasyPlateLoading.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_LoadPlug, 0, 0);
end;

procedure TfrmEasyPlateLoading.EasyBitButton1Click(Sender: TObject);
begin
  close;
end;

end.
