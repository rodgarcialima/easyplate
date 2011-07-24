unit untEasyDesignerLayOutReg;

{$I cxVer.inc}

interface

uses
  dxLayoutControl;

procedure DesingerLayoutRegister;

implementation

uses
  Windows, SysUtils, Classes, Graphics, Controls, Contnrs, Forms, StdCtrls, ExtCtrls,
  Messages, DesignIntf, DesignEditors, DesignMenus, VCLEditors, DesignWindows,
  ComponentDesigner, TypInfo, ImgList,
  dxCore, cxClasses, cxControls, cxContainer, cxLookAndFeels,
  dxCoreReg, cxLibraryReg, cxDesignWindows, dxRegEd,
  dxLayoutCommon, dxLayoutLookAndFeels, cxPropEditors, dxLayoutEditForm,
  dxLayoutLookAndFeelListDesignForm, dxLayoutSelection, dxLayoutImport;

const
  dxLayoutControlMajorVersion = '2';
  dxLayoutControlProductName = 'ExpressLayoutControl';

type
  TControlAccess = class(TControl);
  TLabelAccess = class(TCustomLabel);
  TdxLayoutGroupAcsess = class(TdxLayoutGroup);
  TdxLayoutControlAccess = class(TdxLayoutControl);
  TdxCustomLayoutItemAccess = class(TdxCustomLayoutItem);
  TdxLayoutItemAccess = class(TdxLayoutItem);
  TStaticTextAccess = class(TCustomStaticText);
  TdxCustomLayoutItemCaptionOptionsAccess = class(TdxCustomLayoutItemCaptionOptions);

  { TdxLayoutCustomControlEditor }

  TdxLayoutCustomControlEditor = class(TdxComponentEditor)
  protected
    function GetProductMajorVersion: string; override;
    function GetProductName: string; override;
  end;

  { TdxLayoutControlEditor }

  TdxLayoutControlEditor = class(TdxLayoutCustomControlEditor)
  protected
    function InternalGetVerb(AIndex: Integer): string; override;
    function InternalGetVerbCount: Integer; override;
    procedure InternalExecuteVerb(AIndex: Integer); override;
    function GetControl: TdxLayoutControl; virtual;
    procedure DoImport;

    property Control: TdxLayoutControl read GetControl;
  public
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem); override;
  end;

  { TdxLayoutControlItemsEditor }

  TdxLayoutControlItemsEditor = class(TdxLayoutControlEditor)
  private
    function GetItem: TdxCustomLayoutItem;
  protected
    function GetControl: TdxLayoutControl; override;

    property Item: TdxCustomLayoutItem read GetItem;
  end;

  { TdxLayoutDesignTimeSelectionHelper }

  TdxLayoutDesignTimeSelectionHelper = class(TdxLayoutRunTimeSelectionHelper, IcxDesignSelectionChanged)
  private
    FIsActive: Boolean;
    FDesignHelper: TcxDesignHelper;
    FLayoutControl: TdxCustomLayoutControl;
    FOldSelection: TcxComponentList;
  protected
    //IcxDesignSelectionChanged
    procedure DesignSelectionChanged(ASelection: TList);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;

    function IsActive: Boolean; override;
    procedure AddSelectionChangedListener(AListener: TPersistent); override;
    procedure RemoveSelectionChangedListener(AListener: TPersistent); override;
    function CanDeleteComponent(AComponent: TComponent): Boolean; override;
    procedure ClearSelection; override;
    procedure GetSelection(AList: TList); override;
    function IsComponentSelected(AComponent: TPersistent): Boolean; override;
    procedure SelectComponent(AComponent: TPersistent; AShift: TShiftState = []); override;
    procedure SetSelection(AList: TList); override;
    function UniqueName(const BaseName: string): string; override;
  end;

  TdxLayoutColorProperty = class(TColorProperty)
  public
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
    procedure ListDrawValue(const Value: string; ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
  end;

  TdxLayoutRegistryPathProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TdxLayoutLookAndFeelListEditor = class(TdxLayoutCustomControlEditor)
  private
    function GetLookAndFeelList: TdxLayoutLookAndFeelList;
  protected
    function InternalGetVerb(AIndex: Integer): string; override;
    function InternalGetVerbCount: Integer; override;
    procedure InternalExecuteVerb(AIndex: Integer); override;

    property LookAndFeelList: TdxLayoutLookAndFeelList read GetLookAndFeelList;
  end;

  { TdxLayoutLookAndFeelProperty }

  TdxLayoutLookAndFeelProperty = class(TComponentProperty)
  private
    FLookAndFeelLists: TComponentList;
    function GetLookAndFeelLists: TComponentList;
    procedure GetLookAndFeelListNameProc(const S: string);
  public
    function AutoFill: Boolean; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

  TdxLayoutItemSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  { TdxLayoutItemImageIndexProperty }

  TdxLayoutItemImageIndexProperty = class(TImageIndexProperty)
  private
    function GetControl: TdxCustomLayoutControl;
  public
    function GetImages: TCustomImageList; override;

    property Control: TdxCustomLayoutControl read GetControl;
  end;

const
  sCreateNewLookAndFeelInListBegin = '<Create a new LookAndFeel in ';
  sCreateNewLookAndFeelInListEnd = '>';
  sCreateNewLookAndFeelInNewList = '<Create a new LookAndFeel in the new list>';

{ TdxLayoutCustomControlEditor }

function TdxLayoutCustomControlEditor.GetProductMajorVersion: string;
begin
  Result := dxLayoutControlMajorVersion;
end;

function TdxLayoutCustomControlEditor.GetProductName: string;
begin
  Result := dxLayoutControlProductName;
end;

{ TdxLayoutControlEditor }

function TdxLayoutControlEditor.GetControl: TdxLayoutControl;
begin
  Result := TdxLayoutControl(Component);
end;

function TdxLayoutControlEditor.InternalGetVerb(AIndex: Integer): string;
begin
  case AIndex of
    0: Result := 'Designer...';
    1: Result := 'Import...';
    2: Result := 'Reset Look and Feel Settings';
  end;
end;

function TdxLayoutControlEditor.InternalGetVerbCount: Integer;
begin
  Result := 3;
end;

procedure TdxLayoutControlEditor.InternalExecuteVerb(AIndex: Integer);

  procedure DoCustomize;
  begin
    if Control.Customization then
      Control.CustomizeForm.BringToFront
    else
      Control.Customization := True;
  end;

  procedure DoReset;
  var
    I: Integer;
    AIntf: IcxLookAndFeelContainer;
  begin
    for I := 0 to Control.ControlCount - 1 do
      if Supports(Control.Controls[I], IcxLookAndFeelContainer, AIntf) then
        AIntf.GetLookAndFeel.AssignedValues := [];
    TdxLayoutControlAccess(Control).Modified;
  end;

begin
  case AIndex of
    0: DoCustomize;
    1: DoImport;
    2: DoReset;
  end;
end;

procedure TdxLayoutControlEditor.DoImport;
begin
  ImportLayout(Control);
end;

procedure TdxLayoutControlEditor.PrepareItem(Index: Integer; const AItem: IMenuItem);
begin
  inherited;
  if Index in [1, 2] then
    AItem.Enabled := not IsInInlined;
end;

{ TdxLayoutControlItemsEditor }

function TdxLayoutControlItemsEditor.GetControl: TdxLayoutControl;
begin
  Result := TdxLayoutControl(Item.Container);
end;

function TdxLayoutControlItemsEditor.GetItem: TdxCustomLayoutItem;
begin
  Result := TdxCustomLayoutItem(Component);
end;

{ TdxLayoutDesignTimeSelectionHelper }

constructor TdxLayoutDesignTimeSelectionHelper.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FLayoutControl := AOwner as TdxCustomLayoutControl;
  FOldSelection := TcxComponentList.Create(False);
  FDesignHelper := TcxDesignHelper.Create(Component);
end;

destructor TdxLayoutDesignTimeSelectionHelper.Destroy;
begin
  FDesignHelper := nil;
  FreeAndNil(FOldSelection);
  inherited Destroy;
end;

Function TdxLayoutDesignTimeSelectionHelper.IsActive: Boolean;
begin
  Result := FIsActive;
end;

procedure TdxLayoutDesignTimeSelectionHelper.AddSelectionChangedListener(AListener: TPersistent);
begin
  inherited AddSelectionChangedListener(AListener);
  if Listeners.Count > 0 then
    FDesignHelper.AddSelectionChangedListener(Self);
end;

procedure TdxLayoutDesignTimeSelectionHelper.RemoveSelectionChangedListener(AListener: TPersistent);
begin
  inherited RemoveSelectionChangedListener(AListener);
  if Listeners.Count = 0 then
    FDesignHelper.RemoveSelectionChangedListener(Self);
end;

function TdxLayoutDesignTimeSelectionHelper.CanDeleteComponent(AComponent: TComponent): Boolean;
begin
  Result := FDesignHelper.CanDeleteComponent(Component, AComponent);
end;

procedure TdxLayoutDesignTimeSelectionHelper.ClearSelection;
begin
  FDesignHelper.SelectObject(Component, Component);
end;

procedure TdxLayoutDesignTimeSelectionHelper.GetSelection(AList: TList);
begin
  FDesignHelper.GetSelection(AList);
end;

function TdxLayoutDesignTimeSelectionHelper.IsComponentSelected(AComponent: TPersistent): Boolean;
begin
  Result := FDesignHelper.IsObjectSelected(AComponent);
end;

procedure TdxLayoutDesignTimeSelectionHelper.SelectComponent(AComponent: TPersistent; AShift: TShiftState = []);
begin
  if (ssShift in AShift) and IsComponentSelected(AComponent) then
    FDesignHelper.UnselectObject(AComponent)
  else
    FDesignHelper.SelectObject(AComponent, not (ssShift in AShift));
end;

procedure TdxLayoutDesignTimeSelectionHelper.SetSelection(AList: TList);
begin
  FDesignHelper.SetSelection(AList);
end;

function TdxLayoutDesignTimeSelectionHelper.UniqueName(const BaseName: string): string;
begin
  Result := FDesignHelper.UniqueName(BaseName)
end;

//IcxDesignSelectionChanged
procedure TdxLayoutDesignTimeSelectionHelper.DesignSelectionChanged(ASelection: TList);

  procedure CopyList(AFrom, ATo: TList);
  var
    I: Integer;
  begin
    ATo.Clear;
    for I := 0 to AFrom.Count - 1 do
      ATo.Add(AFrom[I]);
  end;

  procedure GetSelectionDifference(AList: TList);
  var
    I: Integer;
  begin
    CopyList(FOldSelection, AList);
    for I := 0 to ASelection.Count - 1 do
      if AList.IndexOf(ASelection[I]) = -1 then
        AList.Add(ASelection[I])
      else
        AList.Extract(ASelection[I]);
  end;

  procedure UpdateItemControls(AList: TcxObjectList);
  var
    I: Integer;
  begin
    for I := 0 to AList.Count - 1 do
      if (AList[I] is TControl) and ((AList[I] as TControl).Parent = FLayoutControl) then
        (AList[I] as TControl).Invalidate;
  end;

  function IsChild(AObject: TObject): Boolean;
  var
    AIntf: IdxLayoutSelectableItem;
  begin
    Result := Supports(AObject, IdxLayoutSelectableItem, AIntf) and AIntf.IsChild(FLayoutControl);
  end;

var
  AList: TcxObjectList;
begin
  AList := TcxObjectList.Create(False);
  try
    GetSelectionDifference(AList);
    FIsActive := ((AList.Count > 0) and IsChild(AList.Last)) or
      ((AList.Count = 0) and (ASelection.Count > 0) and IsChild(ASelection.Last));
    UpdateItemControls(AList);
    NotifyListeners(ASelection, saChanged);
  finally
    AList.Free;
    CopyList(ASelection, FOldSelection);
  end;
end;

{ TdxLayoutLookAndFeelListEditor }

function TdxLayoutLookAndFeelListEditor.GetLookAndFeelList: TdxLayoutLookAndFeelList;
begin
  Result := TdxLayoutLookAndFeelList(Component);
end;

function TdxLayoutLookAndFeelListEditor.InternalGetVerb(AIndex: Integer): string;
begin
  Result := 'Designer...'
end;

function TdxLayoutLookAndFeelListEditor.InternalGetVerbCount: Integer;
begin
  Result := 1;
end;

procedure TdxLayoutLookAndFeelListEditor.InternalExecuteVerb(AIndex: Integer);
var
  AForm: TdxLayoutLookAndFeelListDesignForm;
begin
  if dxLayoutLookAndFeelsDesigner = nil then
  begin
    AForm := TdxLayoutLookAndFeelListDesignForm.Create(nil);
    AForm.Designer := Designer;
    AForm.Show;
  end;
  dxLayoutLookAndFeelsDesigner.Edit(LookAndFeelList);
end;

{ TdxLayoutColorProperty }

const
  DefaultColorText = 'clDefault';

function TdxLayoutColorProperty.GetValue: string;
begin
  if GetOrdValue = clDefault then
    Result := DefaultColorText
  else
    Result := inherited GetValue;
end;

procedure TdxLayoutColorProperty.GetValues(Proc: TGetStrProc);
begin
  Proc(DefaultColorText);
  inherited;
end;

procedure TdxLayoutColorProperty.SetValue(const Value: string);
begin
  if SameText(Value, DefaultColorText) then
    SetOrdValue(clDefault)
  else
    inherited;
end;

procedure TdxLayoutColorProperty.ListDrawValue(const Value: string;
  ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
begin
  if Value = DefaultColorText then
    with ARect do
      ACanvas.TextRect(ARect, Left + (Bottom - Top) + 1, Top + 1, Value)
  else
    inherited;
end;

procedure TdxLayoutColorProperty.PropDrawValue(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  if GetVisualValue = DefaultColorText then
    with ARect do
      ACanvas.TextRect(ARect, Left + 1, Top + 1, GetVisualValue)
  else
    inherited;
end;

{ TdxLayoutRegistryPathProperty }

procedure TdxLayoutRegistryPathProperty.Edit;
var
  AOptions: TdxStoringOptions;
  S: string;
begin
  AOptions := TdxStoringOptions(GetComponent(0));
  S := AOptions.RegistryPath;
  if dxGetRegistryPath(S) then
  begin
    AOptions.RegistryPath := S;
    Designer.Modified;
  end;
end;

function TdxLayoutRegistryPathProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;

{ TdxLayoutLookAndFeelProperty }

function TdxLayoutLookAndFeelProperty.AutoFill: Boolean;
begin
  Result := False;
end;

function TdxLayoutLookAndFeelProperty.GetLookAndFeelLists: TComponentList;
begin
  Result := TComponentList.Create(False);
  FLookAndFeelLists := Result;
  Designer.GetComponentNames(GetTypeData(TdxLayoutLookAndFeelList.ClassInfo),
    GetLookAndFeelListNameProc);
end;

procedure TdxLayoutLookAndFeelProperty.GetLookAndFeelListNameProc(const S: string);
begin
  FLookAndFeelLists.Add(Designer.GetComponent(S));
end;

procedure TdxLayoutLookAndFeelProperty.GetValues(Proc: TGetStrProc);
var
  ALookAndFeelLists: TList;
  I: Integer;
begin
  ALookAndFeelLists := GetLookAndFeelLists;
  try
    for I := 0 to ALookAndFeelLists.Count - 1 do
    begin
      Proc(sCreateNewLookAndFeelInListBegin +
        Designer.GetComponentName(ALookAndFeelLists.Items[I]) +
        sCreateNewLookAndFeelInListEnd);
    end;
  finally
    ALookAndFeelLists.Free;
  end;
  Proc(sCreateNewLookAndFeelInNewList);
  inherited GetValues(Proc);
end;

procedure TdxLayoutLookAndFeelProperty.SetValue(const Value: string);

  procedure CreateAndAssignNewLookAndFeel(ALookAndFeelList: TdxLayoutLookAndFeelList);
  var
    ALookAndFeel: TdxCustomLayoutLookAndFeel;
    ALookAndFeelClass: TdxCustomLayoutLookAndFeelClass;
  begin
    if dxLayoutControlSelectLookAndFeel(ALookAndFeelClass) then
    begin
      ALookAndFeel := ALookAndFeelList.CreateItem(ALookAndFeelClass);
      FindRootDesigner(ALookAndFeel).Modified;
      SetOrdValue(Integer(ALookAndFeel));
    end;
  end;

var
  ALookAndFeelList: TdxLayoutLookAndFeelList;
  AName: string;
begin
  if Value = sCreateNewLookAndFeelInNewList then
  begin
    ALookAndFeelList := TdxLayoutLookAndFeelList.Create(Designer.Root);
    ALookAndFeelList.Name := Designer.UniqueName(
      Copy(ALookAndFeelList.ClassName, 2, Length(ALookAndFeelList.ClassName)));
    CreateAndAssignNewLookAndFeel(ALookAndFeelList);
  end
  else
    if Copy(Value, 1, Length(sCreateNewLookAndFeelInListBegin)) = sCreateNewLookAndFeelInListBegin then
    begin
      AName := Copy(Value, Length(sCreateNewLookAndFeelInListBegin) + 1,
        Length(Value) - Length(sCreateNewLookAndFeelInListBegin) -
        Length(sCreateNewLookAndFeelInListEnd));
      CreateAndAssignNewLookAndFeel(Designer.GetComponent(AName) as TdxLayoutLookAndFeelList);
    end
    else
      inherited SetValue(Value);
end;

{ TdxLayoutItemSelectionEditor }

procedure TdxLayoutItemSelectionEditor.RequiresUnits(Proc: TGetStrProc);
var
  I: Integer;
  AComponent: TComponent;
  AItem: TdxLayoutItemAccess;
begin
  for I := 0 to Designer.Root.ComponentCount - 1 do
  begin
    AComponent := Designer.Root.Components[I];
    if AComponent is TdxLayoutItem then
    begin
      AItem := TdxLayoutItemAccess(AComponent);
      if AItem.ControlAdapter <> nil then
        Proc(dxShortStringToString(GetTypeData(PTypeInfo(AItem.ControlAdapter.ClassType.ClassInfo)).UnitName));
    end;
  end;
end;

{ TdxLayoutItemImageIndexProperty }

function TdxLayoutItemImageIndexProperty.GetImages: TCustomImageList;
begin
  Result := Control.OptionsImage.Images;
end;

function TdxLayoutItemImageIndexProperty.GetControl: TdxCustomLayoutControl;
var
  AOptions: TdxCustomLayoutItemCaptionOptions;
begin
  AOptions := GetComponent(0) as TdxCustomLayoutItemCaptionOptions;
  Result := TdxCustomLayoutItemCaptionOptionsAccess(AOptions).Item.Container;
end;

procedure DesingerLayoutRegister;
begin
{$IFDEF DELPHI9}
  ForceDemandLoadState(dlDisable);
{$ENDIF}

  RegisterComponentEditor(TdxLayoutControl, TdxLayoutControlEditor);
  RegisterComponentEditor(TdxCustomLayoutItem, TdxLayoutControlItemsEditor);
  RegisterComponentEditor(TdxLayoutLookAndFeelList, TdxLayoutLookAndFeelListEditor);

  RegisterPropertyEditor(TypeInfo(TColor), TdxCustomLayoutLookAndFeelOptions, '', TdxLayoutColorProperty);
  RegisterPropertyEditor(TypeInfo(TColor), TdxLayoutLookAndFeelCaptionOptions, '', TdxLayoutColorProperty);
  RegisterPropertyEditor(TypeInfo(TdxCustomLayoutLookAndFeel), nil, '', TdxLayoutLookAndFeelProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxStoringOptions, 'RegistryPath', TdxLayoutRegistryPathProperty);
  RegisterPropertyEditor(TypeInfo(TBitmap), TdxCustomLayoutItemCaptionOptions, 'Glyph', TcxBitmapProperty);
  RegisterPropertyEditor(TypeInfo(TBitmap), TdxLayoutGroupButton, 'Glyph', TcxBitmapProperty);
  RegisterPropertyEditor(TypeInfo(Integer), TdxCustomLayoutItemCaptionOptions, 'ImageIndex', TdxLayoutItemImageIndexProperty);

  RegisterSelectionEditor(TdxLayoutItem, TdxLayoutItemSelectionEditor);

  HideClassProperties(TdxLayoutControl, ['AutoContentSizes', 'AutoControlAlignment', 'AutoControlTabOrders', 'LookAndFeel',
    'CustomizeFormTabbedView', 'HighlightRoot', 'ShowDesignSelectors',
    'IniFileName', 'RegistryPath', 'StoreInIniFile', 'StoreInRegistry']);
  HideClassProperties(TdxCustomLayoutItem, ['AutoAligns', 'LookAndFeel', 'Caption', 'ShowCaption']);
  HideClassProperties(TdxLayoutGroup, ['LookAndFeelException']);
  HideClassProperties(TdxLayoutItemControlOptions, ['FixedSize', 'AutoAlignment']);

  RegisterNoIcon([
    TdxLayoutItem, TdxLayoutEmptySpaceItem, TdxLayoutLabeledItem, TdxLayoutSeparatorItem, TdxLayoutSplitterItem,
    TdxLayoutGroup, TdxLayoutAlignmentConstraint,
    TdxLayoutStandardLookAndFeel, TdxLayoutOfficeLookAndFeel, TdxLayoutWebLookAndFeel]);
  RegisterComponents('Easy LayOut', [TdxLayoutControl, TdxLayoutLookAndFeelList]);
end;

type

  { TdxLayoutDesignTimeHelper }

  TdxLayoutDesignTimeHelper = class(TInterfacedObject, IdxLayoutDesignTimeHelper)
  protected
    //IdxLayoutDesignTimeHelper
    function IsToolSelected: Boolean;
  end;

{ TdxLayoutDesignTimeHelper }

function TdxLayoutDesignTimeHelper.IsToolSelected: Boolean;
begin
  Result := {$IFDEF DELPHI9}(ActiveDesigner <> nil) and{$ENDIF}
    ActiveDesigner.Environment.GetToolSelected;
end;

initialization
  dxLayoutDesignTimeSelectionHelperClass := TdxLayoutDesignTimeSelectionHelper;
  dxLayoutDesignTimeHelper := TdxLayoutDesignTimeHelper.Create;
  DesingerLayoutRegister;
finalization
  dxLayoutDesignTimeHelper := nil;

end.
