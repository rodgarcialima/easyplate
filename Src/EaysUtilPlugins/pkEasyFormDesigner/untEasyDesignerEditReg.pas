unit untEasyDesignerEditReg;

{$I cxVer.inc}

interface

uses
  Classes, cxEdit;

procedure DesignerEditRegister;

implementation

uses
  DesignEditors, DesignIntf, VCLEditors, Windows, Controls, DB, Graphics, ImgList,
  cxControls, cxBlobEdit, cxButtonEdit, cxButtons, cxCalc, cxCalendar, cxCheckBox,
  cxContainer, cxCurrencyEdit, cxDB, cxDBEdit, cxDBEditRepository, cxDBLookupComboBox,
  cxDBNavigator, cxDropDownEdit, cxEditConsts, cxEditPropEditors, cxEditRepositoryEditor,
  cxEditRepositoryItems, cxGraphics, cxGroupBox, cxHyperLinkEdit, cxImage,
  cxImageComboBox, cxLibraryReg, cxListBox, cxLookAndFeels, cxLookupDBGrid,
  cxLookupGrid, cxMaskEdit, cxMemo, cxMRUEdit, cxNavigator, cxPropEditors,
  cxRadioGroup, cxSpinEdit, cxTextEdit, cxTimeEdit;

type
  { TcxLookupComboBoxPropertiesFieldNameProperty }

  TcxLookupComboBoxPropertiesFieldNameProperty = class(TFieldNameProperty)
    function GetDataSourcePropName: string; override;
  end;

  { TcxLookupDBGridColumnFieldNameProperty }

  TcxLookupDBGridColumnFieldNameProperty = class(TFieldNameProperty)
  public
    function GetDataSource: TDataSource; override;
  end;

  TcxGroupBoxSelectionEditor = class(TSelectionEditor)
  protected
    ComponentsList: TStringList;
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TcxLookupDBGridColumnAccess = class(TcxLookupDBGridColumn);

{ TcxLookupComboBoxPropertiesFieldNameProperty }

function TcxLookupComboBoxPropertiesFieldNameProperty.GetDataSourcePropName: string;
begin
  Result := 'ListSource';
end;

{ TcxLookupDBGridColumnFieldNameProperty }

function TcxLookupDBGridColumnFieldNameProperty.GetDataSource: TDataSource;
begin
  Result := TcxLookupDBGridColumnAccess(GetComponent(0) as TcxLookupDBGridColumn).DataController.DataSource;
end;

{ TcxGroupBoxSelectionEditor }

procedure TcxGroupBoxSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  Proc('cxLookAndFeelPainters');
end;

procedure RegisterEditRepositoryItems;
begin
  RegisterEditRepositoryItem(TcxEditRepositoryTextItem, scxSEditRepositoryTextItem);
  RegisterEditRepositoryItem(TcxEditRepositoryButtonItem, scxSEditRepositoryButtonItem);
  RegisterEditRepositoryItem(TcxEditRepositoryImageItem, scxSEditRepositoryImageItem);
  RegisterEditRepositoryItem(TcxEditRepositoryComboBoxItem, scxSEditRepositoryComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryMaskItem, scxSEditRepositoryMaskItem);
  RegisterEditRepositoryItem(TcxEditRepositoryPopupItem, scxSEditRepositoryPopupItem);
  RegisterEditRepositoryItem(TcxEditRepositoryCalcItem, scxSEditRepositoryCalcItem);
  RegisterEditRepositoryItem(TcxEditRepositoryDateItem, scxSEditRepositoryDateItem);
  RegisterEditRepositoryItem(TcxEditRepositoryCurrencyItem, scxSEditRepositoryCurrencyItem);
  RegisterEditRepositoryItem(TcxEditRepositorySpinItem, scxSEditRepositorySpinItem);
  RegisterEditRepositoryItem(TcxEditRepositoryMemoItem, scxSEditRepositoryMemoItem);
  RegisterEditRepositoryItem(TcxEditRepositoryImageComboBoxItem, scxSEditRepositoryImageComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryBlobItem, scxSEditRepositoryBlobItem);
  RegisterEditRepositoryItem(TcxEditRepositoryCheckBoxItem, scxSEditRepositoryCheckBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryTimeItem, scxSEditRepositoryTimeItem);
  RegisterEditRepositoryItem(TcxEditRepositoryMRUItem, scxSEditRepositoryMRUItem);
  RegisterEditRepositoryItem(TcxEditRepositoryHyperLinkItem, scxSEditRepositoryHyperLinkItem);
  RegisterEditRepositoryItem(TcxEditRepositoryLookupComboBoxItem, scxSEditRepositoryLookupComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryRadioGroupItem, scxSEditRepositoryRadioGroupItem);
end;

procedure DesignerEditRegister;
begin
{$IFDEF DELPHI9}
  ForceDemandLoadState(dlDisable);
{$ENDIF}  

  RegisterComponents('Easy Standard', [TcxTextEdit, TcxMaskEdit, TcxMemo,
    TcxDateEdit, TcxButtonEdit, TcxCheckBox, TcxComboBox, TcxImageComboBox,
    TcxSpinEdit, TcxCalcEdit, TcxHyperLinkEdit, TcxTimeEdit, TcxCurrencyEdit,
    TcxImage, TcxBlobEdit, TcxMRUEdit, TcxPopupEdit, TcxLookupComboBox,
    TcxRadioButton, TcxRadioGroup, TcxListBox, TcxNavigator]);
  RegisterComponents('Easy DB', [TcxDBTextEdit, TcxDBMaskEdit, TcxDBMemo,
    TcxDBDateEdit, TcxDBButtonEdit, TcxDBCheckBox, TcxDBComboBox, TcxDBImageComboBox,
    TcxDBSpinEdit, TcxDBCalcEdit, TcxDBHyperLinkEdit, TcxDBTimeEdit, TcxDBCurrencyEdit,
    TcxDBImage, TcxDBBlobEdit, TcxDBMRUEdit, TcxDBPopupEdit, TcxDBLookupComboBox,
    TcxDBRadioGroup, TcxDBListBox, TcxDBNavigator]);
  RegisterComponents('Easy Utilities', [TcxButton, TcxGroupBox,
    TcxEditStyleController, TcxDefaultEditStyleController, TcxEditRepository]);

  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxCustomEdit, 'PropertiesEvents', TcxEditPropertiesEventEditor);
  RegisterPropertyEditor(TypeInfo(TcxEditRepositoryItem), TcxCustomEdit,
    'RepositoryItem', TcxEditRepositoryItemProperty);

  RegisterPropertyEditor(TypeInfo(TColor), TcxCustomGroupBox, 'CaptionBkColor', nil);
  RegisterPropertyEditor(TypeInfo(TColor), TcxCustomGroupBox, 'Color', nil);
  RegisterPropertyEditor(TypeInfo(TFont), TcxCustomGroupBox, 'Font', nil);

  RegisterPropertyEditor(TypeInfo(string), TcxEditDataBinding, 'DataField',
    TcxDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxCustomDBDataBinding, 'DataField',
    TcxDataFieldProperty);

  RegisterPropertyEditor(TypeInfo(TShortCut), TcxCustomEditProperties, 'ClickKey', TShortCutProperty);
  RegisterPropertyEditor(TypeInfo(TShortCut), TcxCustomHyperLinkEditProperties, 'StartKey', TShortCutProperty);
  RegisterPropertyEditor(TypeInfo(TShortCut), TcxCustomEditProperties, 'ClearKey', TShortCutProperty);

  RegisterPropertyEditor(TypeInfo(TImageIndex), TcxImageComboBoxProperties, 'DefaultImageIndex', TcxGEPropertiesImageIndexProperty);
  RegisterPropertyEditor(TypeInfo(TImageIndex), TcxImageComboBoxItem, 'ImageIndex', TcxGEItemImageIndexProperty);
  RegisterPropertyEditor(TypeInfo(TImageIndex), TcxNavigatorButton, 'ImageIndex', TcxNavigatorButtonImageIndexProperty);

  RegisterPropertyEditor(TypeInfo(string), TcxImageProperties, 'GraphicClassName', TGraphicClassNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxImageProperties, 'Caption', TCaptionProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxBlobEditProperties, 'PictureGraphicClassName', TGraphicClassNameProperty);

  RegisterComponentEditor(TcxCustomEdit, TcxEditComponentEditor);
  RegisterComponentEditor(TcxEditStyleController, TcxEditStyleControllerEditor);
  RegisterComponentEditor(TcxDefaultEditStyleController, TcxDefaultEditStyleControllerEditor);
  RegisterComponentEditor(TcxCustomButton, TcxCustomButtonComponentEditor);

  RegisterComponentEditor(TcxEditRepository, TcxEditRepositoryComponentEditor);
  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxEditRepositoryItem, 'PropertiesEvents', TcxEditRepositoryItemPropertiesEventEditor);
  RegisterClasses([TcxEditRepositoryItem, TcxEditRepositoryTextItem, TcxEditRepositoryButtonItem]);
  RegisterNoIcon([TcxEditRepositoryItem, TcxEditRepositoryTextItem, TcxEditRepositoryButtonItem]);

  RegisterEditRepositoryItems;

  RegisterPropertyEditor(TypeInfo(TcxEditMask), TcxCustomMaskEditProperties, 'EditMask', TcxEditMaskProperty);
  RegisterPropertyEditor(TypeInfo(TCaption), TcxCustomMaskEdit, 'Text', TcxTextProperty);

  RegisterPropertyEditor(TypeInfo(TCaption), TcxBlobEdit, 'Text', TCaptionProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxLookupComboBoxProperties, 'KeyFieldNames', TcxLookupComboBoxPropertiesFieldNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxLookupComboBoxProperties, 'ListFieldNames', TcxLookupComboBoxPropertiesFieldNameProperty);

  RegisterPropertyEditor(TypeInfo(string), TcxLookupDBGridColumn, 'FieldName', TcxLookupDBGridColumnFieldNameProperty);

  RegisterSelectionEditor(TcxControl, TcxControlSelectionEditor);
  RegisterSelectionEditor(TcxCustomEdit, TcxCustomEditSelectionEditor);
  RegisterSelectionEditor(TcxCustomButton, TcxButtonSelectionEditor);

  RegisterPropertyEditor(TypeInfo(TComponent), TcxCustomNavigatorControl,
    'Control', TcxNavigatorControlProperty);
  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxCustomNavigator, 'ButtonsEvents', TcxNavigatorButtonsEventEditor);
  RegisterComponentEditor(TcxRadioButton, TcxRadioButtonComponentEditor);
  RegisterComponentEditor(TcxCustomNavigator, TcxCustomNavigatorComponentEditor);
  RegisterComponentEditor(TcxContainer, TcxContainerComponentEditor);

  RegisterPropertyEditor(TypeInfo(TComponent), TcxCustomButton, 'PopupMenu', TcxControlPopupMenuProperty);
  RegisterPropertyEditor(TypeInfo(TBitmap), TcxCustomButton, 'Glyph', TcxBitmapProperty);
  RegisterPropertyEditor(TypeInfo(TComponent), TcxRadioButton, 'PopupMenu', TcxControlPopupMenuProperty);

  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxCustomImage, 'PropertiesEvents', TcxCustomImagePropertiesProperty);
  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxCustomBlobEdit, 'PropertiesEvents', TcxCustomImagePropertiesProperty);

  RegisterPropertyEditor(TypeInfo(TcxLookAndFeel), TcxCustomGroupBox, 'LookAndFeel', nil);
  RegisterPropertyEditor(TypeInfo(TImeMode), TcxCustomTextEdit, 'ImeMode', nil);
  RegisterPropertyEditor(TypeInfo(TImeName), TcxCustomTextEdit, 'ImeName', nil);
  RegisterPropertyEditor(TypeInfo(Boolean), TcxCustomTextEditProperties,
    'HideCursor', nil);
  RegisterPropertyEditor(TypeInfo(TcxEditRepositoryItem), TcxGroupBox,
    'RepositoryItem', nil);
  RegisterPropertyEditor(TypeInfo(Boolean), TcxCustomButton, 'UseSystemPaint', nil); // deprecated property
  RegisterPropertyEditor(TypeInfo(TcxCustomEditPropertiesValues),
    TcxCustomEditProperties, 'AssignedValues', TcxEditPropertiesAssignedValuesProperty);
  RegisterPropertyEditor(TypeInfo(TCaption), TcxCustomCheckBoxProperties, 'Caption', nil);
  RegisterPropertyEditor(TypeInfo(TcxEditStyle), TcxDefaultEditStyleController,
    '', TcxDefaultEditStyleControllerStyleProperty);
  RegisterPropertyEditor(TypeInfo(TColor), TcxHyperLinkStyle, 'TextColor', nil);
  RegisterPropertyEditor(TypeInfo(TcxEditStyle), TcxCustomGroupBox, 'StyleFocused', nil);
  RegisterPropertyEditor(TypeInfo(TcxEditStyle), TcxCustomGroupBox, 'StyleHot', nil);
  RegisterPropertyEditor(TypeInfo(string), TcxCustomNavigator, 'Hint', nil);
  RegisterPropertyEditor(TypeInfo(Boolean), TcxCustomEditProperties, 'Transparent', nil);
  RegisterPropertyEditor(TypeInfo(Boolean), TcxCustomHyperLinkEditProperties, 'AutoComplete', nil);
{$IFDEF DELPHI10}
  RegisterComponentGuidelines(TcxCustomEdit, TcxEditGuidelines);
{$ENDIF}
  RegisterSelectionEditor(TcxCustomGroupBox, TcxGroupBoxSelectionEditor);

  HideClassProperties(TcxButton, ['AllowAllUp', 'CanBeFocused', 'Down', 'GroupIndex']);

end;

initialization
  DesignerEditRegister;
  
end.
