object frmEasyWorkFlowDiagramGradient: TfrmEasyWorkFlowDiagramGradient
  Left = 700
  Top = 199
  BorderStyle = bsToolWindow
  Caption = #28176#21464#33394#35774#32622
  ClientHeight = 314
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 99
    Height = 13
    Caption = #28176#21464#24320#22987#39068#33394'         '
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 96
    Height = 13
    Caption = #28176#21464#32467#26463#39068#33394'        '
  end
  object PaintBox1: TPaintBox
    Left = 8
    Top = 112
    Width = 337
    Height = 153
    OnPaint = PaintBox1Paint
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 36
    Height = 13
    Caption = #39044#35272'    '
  end
  object Label4: TLabel
    Left = 248
    Top = 24
    Width = 66
    Height = 13
    Caption = #28176#21464#31867#22411'      '
  end
  object Panel1: TPanel
    Left = 112
    Top = 16
    Width = 113
    Height = 25
    TabOrder = 0
    OnClick = Panel1Click
    object PaintBox2: TPaintBox
      Left = 1
      Top = 1
      Width = 111
      Height = 23
      Align = alClient
      OnClick = Panel1Click
      OnPaint = PaintBox2Paint
    end
  end
  object Panel2: TPanel
    Left = 112
    Top = 56
    Width = 113
    Height = 25
    TabOrder = 1
    OnClick = Panel2Click
    object PaintBox3: TPaintBox
      Left = 1
      Top = 1
      Width = 111
      Height = 23
      Align = alClient
      OnClick = Panel2Click
      OnPaint = PaintBox3Paint
    end
  end
  object ComboBox1: TComboBox
    Left = 248
    Top = 56
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = ComboBox1Change
    Items.Strings = (
      'Top Bottom'
      'Bottom Top'
      'Left Right'
      'Right Left'
      'Left Top'
      'Right Top'
      'Left Bottom'
      'Right Bottom'
      'In Out'
      'Out In'
      'Horz. In Out'
      'Horz. Out In'
      'Vert. In Out'
      'Vert. Out In')
  end
  object Button1: TButton
    Left = 104
    Top = 280
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 192
    Top = 280
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object ColorDialog1: TColorDialog
    Left = 304
    Top = 8
  end
end
