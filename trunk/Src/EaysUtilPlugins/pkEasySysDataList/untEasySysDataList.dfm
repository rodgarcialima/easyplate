inherited frmEasySysDataList: TfrmEasySysDataList
  Caption = #25968#25454#23383#20856
  KeyPreview = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object edpMain: TEasyDockPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 34
    MinimumSize = 3
    LockHeight = False
    Persistence.Location = plRegistry
    Persistence.Enabled = False
    ToolBarStyler = tbosMain
    UseRunTimeHeight = True
    object tlbMain: TEasyToolBar
      Left = 3
      Top = 1
      Width = 848
      Height = 32
      AllowFloating = True
      AutoDockOnClose = True
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'MS Sans Serif'
      CaptionFont.Style = []
      CompactImageIndex = -1
      FullSize = True
      TextAutoOptionMenu = 'Add or Remove Buttons'
      TextOptionMenu = 'Options'
      ToolBarStyler = tbosMain
      ParentOptionPicture = True
      ToolBarIndex = -1
      object EasyToolBarButton2: TEasyToolBarButton
        Left = 9
        Top = 2
        Width = 24
        Height = 24
        Action = actNewMst
        AutoSize = False
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 6
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton1: TEasyToolBarButton
        Left = 33
        Top = 2
        Width = 24
        Height = 24
        Action = actEdit
        AutoSize = False
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 5
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton3: TEasyToolBarButton
        Left = 57
        Top = 2
        Width = 24
        Height = 24
        Action = actDelete
        AutoSize = False
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 4
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarSeparator1: TEasyToolBarSeparator
        Left = 81
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarSeparator2: TEasyToolBarSeparator
        Left = 163
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton9: TEasyToolBarButton
        Left = 173
        Top = 2
        Width = 24
        Height = 24
        Action = actExit
        AutoSize = False
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 13
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton11: TEasyToolBarButton
        Left = 91
        Top = 2
        Width = 24
        Height = 24
        Action = actSave
        AutoSize = False
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 12
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton15: TEasyToolBarButton
        Left = 115
        Top = 2
        Width = 24
        Height = 24
        Action = actRefresh
        AutoSize = False
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 16
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton7: TEasyToolBarButton
        Left = 139
        Top = 2
        Width = 24
        Height = 24
        Action = actFind
        AutoSize = False
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 9
        ParentFont = False
        Position = daTop
      end
    end
  end
  object EasyPanel1: TEasyPanel
    Left = 0
    Top = 34
    Width = 854
    Height = 428
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 241
      Top = 0
      Height = 428
    end
    object EasyPanel2: TEasyPanel
      Left = 0
      Top = 0
      Width = 241
      Height = 428
      Align = alLeft
      BorderOuter = fsNone
      TabOrder = 0
      object tvDataListMain: TEasyTreeView
        Left = 0
        Top = 0
        Width = 241
        Height = 428
        SelectionPen.Color = clBtnShadow
        Align = alClient
        Images = imgDataList
        Indent = 19
        ShowLines = False
        StateImages = imgDataList
        TabOrder = 0
        OnChange = tvDataListMainChange
        OnKeyDown = tvDataListMainKeyDown
      end
    end
    object EasyPanel3: TEasyPanel
      Left = 244
      Top = 0
      Width = 610
      Height = 428
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 1
      object EasyDBGrid1: TEasyDBGrid
        Left = 0
        Top = 34
        Width = 610
        Height = 394
        Cursor = crDefault
        Align = alClient
        ColCount = 4
        RowCount = 2
        FixedRows = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        OnEditingDone = EasyDBGrid1EditingDone
        DragDropSettings.ShowCells = False
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          #24207#21495
          #21517#31216
          #21551#29992'/'#20572#29992)
        Filter = <>
        FixedColWidth = 20
        FixedRowHeight = 22
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurence'
        SearchFooter.HintFindPrev = 'Find previous occurence'
        SearchFooter.HintHighlight = 'Highlight occurences'
        SearchFooter.MatchCaseCaption = 'Match case'
        AutoCreateColumns = True
        AutoRemoveColumns = True
        Columns = <
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header = #24207#21495
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = []
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 20
          end
          item
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'sysDataName'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header = #21517#31216
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 160
          end
          item
            Alignment = taCenter
            Borders = []
            BorderPen.Color = clSilver
            CheckBoxField = True
            CheckFalse = 'False'
            CheckTrue = 'True'
            Color = clWindow
            FieldName = 'bEnable'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #21551#29992'/'#20572#29992
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 64
          end
          item
            Alignment = taCenter
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            Editor = edNumeric
            FieldName = 'iOrder'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #24207#21495
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'Tahoma'
            PrintFont.Style = []
            Width = 64
          end>
        DataSource = dsDataListMain
        InvalidPicture.Data = {
          055449636F6E0000010001002020040000000000E80200001600000028000000
          2000000040000000010004000000000000020000000000000000000000000000
          0000000000000000000080000080000000808000800000008000800080800000
          80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF000000000000777777777777000000000000000000777788FFFF887777
          000000000000007778F8887117788F877700000000000778F87111111111178F
          877000000000778871111111111999178877000000077F811111111111199999
          18F7700000778811111111111119999991887700007881111111111111119199
          99188700077F711111811111111198719997F7700788111118FF111111118FF7
          1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
          911918777881111118888FF1188888811111188778811111118888FF88888811
          111117877F7111111118888888888111111117F77F7999111111888888881111
          111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
          111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
          11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
          71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
          1117F77000788879978799999999787111188700007788879999999999999999
          1188770000077F88799999999999999778F77000000077888879999999999778
          8877000000000778F88877799777788F877000000000007778F8888878888F87
          7700000000000000777788FFFF88777700000000000000000077777777777700
          00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
          C000000380000001800000010000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000080000001
          80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
          FFC003FF}
        ShowUnicode = False
        ColWidths = (
          20
          160
          64
          64)
      end
      object EasyDockPanel1: TEasyDockPanel
        Left = 0
        Top = 0
        Width = 610
        Height = 34
        MinimumSize = 3
        LockHeight = False
        Persistence.Location = plRegistry
        Persistence.Enabled = False
        ToolBarStyler = tbosMain
        UseRunTimeHeight = True
        object EasyToolBar1: TEasyToolBar
          Left = 3
          Top = 1
          Width = 604
          Height = 32
          AllowFloating = True
          AutoDockOnClose = True
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'MS Sans Serif'
          CaptionFont.Style = []
          CompactImageIndex = -1
          FullSize = True
          TextAutoOptionMenu = 'Add or Remove Buttons'
          TextOptionMenu = 'Options'
          ToolBarStyler = tbosMain
          ParentOptionPicture = True
          ToolBarIndex = -1
          object EasyToolBarButton10: TEasyToolBarButton
            Left = 9
            Top = 2
            Width = 24
            Height = 24
            Action = actAddDtl
            AutoSize = False
            Appearance.CaptionFont.Charset = DEFAULT_CHARSET
            Appearance.CaptionFont.Color = clWindowText
            Appearance.CaptionFont.Height = -11
            Appearance.CaptionFont.Name = 'Tahoma'
            Appearance.CaptionFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 2
            ParentFont = False
            Position = daTop
          end
          object EasyToolBarButton12: TEasyToolBarButton
            Left = 56
            Top = 2
            Width = 24
            Height = 24
            Action = actDeleteDtl
            AutoSize = False
            Appearance.CaptionFont.Charset = DEFAULT_CHARSET
            Appearance.CaptionFont.Color = clWindowText
            Appearance.CaptionFont.Height = -11
            Appearance.CaptionFont.Name = 'Tahoma'
            Appearance.CaptionFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 3
            ParentFont = False
            Position = daTop
          end
          object EasyToolBarButton14: TEasyToolBarButton
            Left = 33
            Top = 2
            Width = 23
            Height = 24
            Action = actEditDtl
            AutoSize = False
            Appearance.CaptionFont.Charset = DEFAULT_CHARSET
            Appearance.CaptionFont.Color = clWindowText
            Appearance.CaptionFont.Height = -11
            Appearance.CaptionFont.Name = 'Tahoma'
            Appearance.CaptionFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 15
            ParentFont = False
            Position = daTop
          end
        end
      end
    end
  end
  object tbosMain: TEasyToolBarOfficeStyler
    BorderColorHot = 14731181
    ButtonAppearance.Color = 16640730
    ButtonAppearance.ColorTo = 14986888
    ButtonAppearance.ColorChecked = 9229823
    ButtonAppearance.ColorCheckedTo = 5812223
    ButtonAppearance.ColorDown = 5149182
    ButtonAppearance.ColorDownTo = 9556991
    ButtonAppearance.ColorHot = 13432063
    ButtonAppearance.ColorHotTo = 9556223
    ButtonAppearance.BorderDownColor = clNavy
    ButtonAppearance.BorderHotColor = clNavy
    ButtonAppearance.BorderCheckedColor = clNavy
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Tahoma'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = clHighlight
    CaptionAppearance.CaptionColorTo = clHighlight
    CaptionAppearance.CaptionBorderColor = clHighlight
    CaptionAppearance.CaptionColorHot = 13432063
    CaptionAppearance.CaptionColorHotTo = 9556223
    CaptionAppearance.CaptionTextColorHot = clBlack
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = 16640730
    Color.ColorTo = 14986888
    Color.Direction = gdVertical
    ColorHot.Color = 16773606
    ColorHot.ColorTo = 16444126
    ColorHot.Direction = gdVertical
    CompactGlowButtonAppearance.BorderColor = 14727579
    CompactGlowButtonAppearance.BorderColorHot = 10079963
    CompactGlowButtonAppearance.BorderColorDown = 4548219
    CompactGlowButtonAppearance.BorderColorChecked = clBlack
    CompactGlowButtonAppearance.Color = 15653832
    CompactGlowButtonAppearance.ColorTo = 16178633
    CompactGlowButtonAppearance.ColorChecked = 11918331
    CompactGlowButtonAppearance.ColorCheckedTo = 7915518
    CompactGlowButtonAppearance.ColorDisabled = 15921906
    CompactGlowButtonAppearance.ColorDisabledTo = 15921906
    CompactGlowButtonAppearance.ColorDown = 7778289
    CompactGlowButtonAppearance.ColorDownTo = 4296947
    CompactGlowButtonAppearance.ColorHot = 15465983
    CompactGlowButtonAppearance.ColorHotTo = 11332863
    CompactGlowButtonAppearance.ColorMirror = 15586496
    CompactGlowButtonAppearance.ColorMirrorTo = 16245200
    CompactGlowButtonAppearance.ColorMirrorHot = 5888767
    CompactGlowButtonAppearance.ColorMirrorHotTo = 10807807
    CompactGlowButtonAppearance.ColorMirrorDown = 946929
    CompactGlowButtonAppearance.ColorMirrorDownTo = 5021693
    CompactGlowButtonAppearance.ColorMirrorChecked = 10480637
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    CompactGlowButtonAppearance.ColorMirrorDisabled = 11974326
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = 16105376
    DockColor.ColorTo = 16440004
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    FloatingWindowBorderColor = 9516288
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 14727579
    GlowButtonAppearance.BorderColorHot = 10079963
    GlowButtonAppearance.BorderColorDown = 4548219
    GlowButtonAppearance.BorderColorChecked = clBlack
    GlowButtonAppearance.Color = 15653832
    GlowButtonAppearance.ColorTo = 16178633
    GlowButtonAppearance.ColorChecked = 11918331
    GlowButtonAppearance.ColorCheckedTo = 7915518
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7778289
    GlowButtonAppearance.ColorDownTo = 4296947
    GlowButtonAppearance.ColorHot = 15465983
    GlowButtonAppearance.ColorHotTo = 11332863
    GlowButtonAppearance.ColorMirror = 15586496
    GlowButtonAppearance.ColorMirrorTo = 16245200
    GlowButtonAppearance.ColorMirrorHot = 5888767
    GlowButtonAppearance.ColorMirrorHotTo = 10807807
    GlowButtonAppearance.ColorMirrorDown = 946929
    GlowButtonAppearance.ColorMirrorDownTo = 5021693
    GlowButtonAppearance.ColorMirrorChecked = 10480637
    GlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.BorderColor = 12763842
    GroupAppearance.Color = 16640730
    GroupAppearance.ColorTo = 15851212
    GroupAppearance.ColorMirror = 15851212
    GroupAppearance.ColorMirrorTo = 16640730
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Tahoma'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = clBlack
    GroupAppearance.CaptionAppearance.CaptionColor = 15915714
    GroupAppearance.CaptionAppearance.CaptionColorTo = 15784385
    GroupAppearance.CaptionAppearance.CaptionTextColor = clBlack
    GroupAppearance.CaptionAppearance.CaptionColorHot = 16769224
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 16772566
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = clBlack
    GroupAppearance.PageAppearance.BorderColor = 12763842
    GroupAppearance.PageAppearance.Color = 14086910
    GroupAppearance.PageAppearance.ColorTo = 16382457
    GroupAppearance.PageAppearance.ColorMirror = 16382457
    GroupAppearance.PageAppearance.ColorMirrorTo = 16382457
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.BorderColor = clHighlight
    GroupAppearance.TabAppearance.BorderColorHot = clHighlight
    GroupAppearance.TabAppearance.BorderColorSelected = 10534860
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 10534860
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = clNone
    GroupAppearance.TabAppearance.Color = clBtnFace
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 10412027
    GroupAppearance.TabAppearance.ColorSelectedTo = 12249340
    GroupAppearance.TabAppearance.ColorDisabled = clNone
    GroupAppearance.TabAppearance.ColorDisabledTo = clNone
    GroupAppearance.TabAppearance.ColorHot = 13432063
    GroupAppearance.TabAppearance.ColorHotTo = 13432063
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 13432063
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 9556223
    GroupAppearance.TabAppearance.ColorMirrorSelected = 12249340
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 13955581
    GroupAppearance.TabAppearance.ColorMirrorDisabled = clNone
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = clNone
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggVertical
    GroupAppearance.TabAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = clBlack
    GroupAppearance.TabAppearance.TextColorHot = clBlack
    GroupAppearance.TabAppearance.TextColorSelected = clBlack
    GroupAppearance.TabAppearance.TextColorDisabled = clWhite
    GroupAppearance.ToolBarAppearance.BorderColor = 13423059
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 15530237
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 16382457
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 15660277
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 16645114
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 14922381
    PageAppearance.Color = 16640730
    PageAppearance.ColorTo = 16440004
    PageAppearance.ColorMirror = 16440004
    PageAppearance.ColorMirrorTo = 16440004
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PagerCaption.BorderColor = 15780526
    PagerCaption.Color = 14986888
    PagerCaption.ColorTo = 14986888
    PagerCaption.ColorMirror = 14986888
    PagerCaption.ColorMirrorTo = 14986888
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clBlue
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -11
    PagerCaption.Font.Name = 'Tahoma'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 9516288
    QATAppearance.Color = 16640730
    QATAppearance.ColorTo = 14986888
    QATAppearance.FullSizeBorderColor = 14986888
    QATAppearance.FullSizeColor = 14986888
    QATAppearance.FullSizeColorTo = 14986888
    RightHandleColor = 15836789
    RightHandleColorTo = 9516288
    RightHandleColorHot = 13891839
    RightHandleColorHotTo = 7782911
    RightHandleColorDown = 557032
    RightHandleColorDownTo = 8182519
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = clHighlight
    TabAppearance.BorderColorSelected = 14922381
    TabAppearance.BorderColorSelectedHot = 6343929
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16709360
    TabAppearance.ColorSelectedTo = 16445929
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 13432063
    TabAppearance.ColorHotTo = 13432063
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 13432063
    TabAppearance.ColorMirrorHotTo = 9556223
    TabAppearance.ColorMirrorSelected = 16445929
    TabAppearance.ColorMirrorSelectedTo = 16181984
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = clBlack
    TabAppearance.TextColorHot = clBlack
    TabAppearance.TextColorSelected = clBlack
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.BackGround.Color = 14986888
    TabAppearance.BackGround.ColorTo = 16440004
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 445
    Top = 201
  end
  object cdsDataListMain: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 381
    Top = 201
  end
  object dsDataListMain: TDataSource
    DataSet = cdsCloneData
    Left = 413
    Top = 201
  end
  object imgDataList: TImageList
    Left = 349
    Top = 233
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000FDFFFF00FDFFFF00FDFF
      FF00FDFFFF00FDFFFF00FDFFFF00FDFFFF00FDFFFF00FDFFFF00FDFFFF00FDFF
      FF00FDFFFF00FDFFFF00FDFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4E0DC00A6978800A99B8D00AA9B
      8D00AA9B8D00AA9B8D00AA9B8D00AA9B8D00AA9B8D00AA9B8D00AA9B8D00AA9B
      8D00AA9B8D00A99B8D00A7978800E3E0DC000000000000000000000000000000
      00000000000000000000FFF2EA00FFFFFC000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFCF200FFFAE200FFF7
      DD00FFF5DB00FFF4DA00FFF4D900FFF3D700FFF3D700FFF2D600FFF2D700FFF3
      D700FFF4D800FFF6DE00FDF8F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FED7BB00FFD0A100FFCE9F00FDCD
      9E00FECD9E00FECD9E00FECD9E00FECD9E00FECD9E00FECD9E00FFCE9F00FFCE
      9F00FFCE9F00FFCE9F00FECC9C00FDD7BB000000000000000000000000000000
      000000000000BCDAE80000B2FC0048ADD900F8EEEA0000000000000000000000
      000000000000000000000000000000000000FFFFFC0096B9DE00135AD4001D5E
      D4001D5ED4001D5FD5001E5ED4001E5ED4001E5ED4001E5ED4001E5ED4001E5D
      D4001D5CD400165BD400C4CFDA00FFFFFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5C6A300FCD7B000F6CDA600F8D5
      B300F8D5B100F8D5B100F8D5B100F8D4B100F7D4B100F6D3AF00F6CEA600FBD1
      A900FAD1A900FAD1A900FAD2AA00F5C7A3000000000000000000000000000000
      000098CDE60024C8FF0000BCFF0014BEFF0076ABC400A9CBD900000000000000
      000000000000000000000000000000000000FFFFFE004E96E300297ADD002F7E
      DE002F7EDE002F7EDE00307CDD00307DDD00307EDD00307DDD00317DDD00317C
      DD00317BDD002573DB0081B2E700FFFFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0BE9800FBCDA300F3C39700FED6
      B100FDD4AF00FDD4AF00FDD4AF00FCD3AE00FBD2AD00F9D1AB00F5CBA500F2C3
      9800F8C79B00F8C79B00F8C99D00F0BE98000000000000000000FFFFFA007FC7
      EA0039D4FF0000BFFF0000BEFF000EC1FF00FEE4DB009ABAC80064AECE00FFF5
      F100000000000000000000000000000000000000000043A1E8002E97E5003299
      E5003299E5003299E5003298E5003299E5003299E5003299E5003299E5003298
      E5003299E5002994E40074B9EE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EBB08300F8BB8C00F0B18000F9C2
      9700F8C19500F8C19500F9C19500F8C09500F7BF9400F6BE9300F6BF9300F3BB
      8F00F0B28100F5B68400F6B78700EBB0830000000000FFF8F5006AC4EF0071E5
      FF0013CDFF0000C2FF0000BEFF0019C3FF00FFFFFB00FFF0EB00D7D0CD005CAA
      CC00BCD3DD000000000000000000000000000000000030A3E80033A6E90035A6
      E90035A6E90035A7E90035A5E90036A6E90036A6E90036A6E90036A6E90036A6
      E90036A6E9002FA3E80062B8ED00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5A06C00F4A77000EC9D6400F4AE
      7B00F4AC7900F4AD7900F4AD7900F4AC7900F3AB7800F2AB7700F0A87500F0A9
      7600EDA47000EE9F6600F3A36B00E49F6A00EAEFF2006AC9F40078EAFF0045DB
      FF0046D8FF0028CFFF0000BEFF001AC3FF0050D7FF009BE4FC00FFFFF600F2E4
      DF0093BDCF0072B4D000FFFBF50000000000000000001BA8EB0037B4ED0037B3
      ED0037B3ED0037B3ED0038B3ED0039B3ED003AB3ED003AB3ED003AB3ED003AB3
      ED003AB3ED0035B2EC004DB9EE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DD996300F4CBAA00F0C29F00F2C5
      A300F1C4A200F1C4A200F2C4A200F2C4A200F1C4A100F1C4A100F1C4A100F1C3
      A100F1C4A300F0C29F00F3C7A500E2A7780087D7FB00A8F4FF005DE2FF0053DE
      FF0047D9FF0040D5FF0017C9FF0000BCFF00B0ECFF0000B8FF0034CBFE00FFFE
      FA00FFF5EF00D6D6D60058AACE00F1EFEE00FAFCFE0022BBEF0035C0F10035C0
      F10036C0F10035C1F10036C0F00037C0F00037C0F00037C0F00038C0F00038C0
      F00038C0F00036BFF00037BEF000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4BE9E00CD742D00B5662300DFB3
      8F00DCAD8700DDAE8700DDAE8700DEAF8800DEAF8800DDAE8700DBAC8500DAAB
      8400DDB18D00B5662300CD742D00E3BD9C00A0E1FC00ABF2FF0072E6FF0058E0
      FF004EDBFF0040D6FF003BD3FF0000BDFF00BCECFF0064DBFF0000BCFF0000B5
      FF00BAEAFC00FFFFFA00F8EAE40083C4E100EBF9FD000FC6F30024CBF40024CB
      F40024CBF40024CBF40025CAF40025CAF40025CAF40026CAF40026CAF40026CA
      F40026CAF40026CAF4000EC4F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4985E00B6855B000000
      0000FDFFFF00FEFFFF0000000000000000000000000000000000000000000000
      000000000000B6845B00E4985E000000000092DDFE00B3EDFF008BECFF005CE3
      FF0046DBFF004FDAFF0036D3FF0028CCFF005ECFFF00BEF0FF0058D8FF001FC0
      F5006CC9E400A5DBED00FFFFFD00A0D5ED00E0F8FD0010CFF6002AD4F7002AD4
      F7002AD4F7002AD4F70029D3F7002AD4F7002AD4F7002AD4F7002AD4F7002AD4
      F7002AD4F70029D4F70019D1F600FFFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E59A6200BA8C6500FDFF
      FF00FAFAFA00FAFAFA00FBFBFB00FCFCFC00FCFCFC00FDFDFD00FDFDFD00FEFE
      FE0000000000BA8C6500E59A62000000000000000000B8E8FF007DD9FE0071D7
      FE00AEE4FE00A3E0FE0063D5FF003FD4FF0019C8FF000EB9FF00B7E2F300B3DC
      E2007ECEE20070CBE50081CEE70092D1EC00F0FCFE0045E6FE0026E0FD002AE0
      FC002AE0FC002AE0FC002AE0FC002CE0FC002CE0FC002CDFFC002CDFFC002CDF
      FC002CDFFC0026DEFC0055E7FD00F9FDFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E69E6900BE967400FBFF
      FF00F8F8F800F9F9F900FAFAFA00FBFBFB00FBFBFB00FCFCFC00FCFCFC00FCFC
      FC0000000000BC947200E59A6200000000000000000000000000000000000000
      00000000000000000000F4FAFF008BDBFF002EC3FD00FAFBFD00A1E2FF00CDE0
      E2009FDAE70088D0E30075CBE40072C6E800EAF8FE004FB0E20089D5F10084D5
      F20084D5F20084D6F20083D5F20083D5F20082D5F20081D7F30081D9F40080D9
      F40080D9F50082D9F4004CB3E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E79F6A00C1A08200F9FD
      FF00F6F6F600F8F8F800F9F9F900FAFAFA00FAFAFA00FAFAFA00FBFBFB00FBFB
      FB0000000000C49B7F00F4CAAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F3FCFF0092D8
      F700C4DEE0009AD8E60092D4E50076C6E600EFFFFF001A8BD000155CB3001865
      B9001768BB00166DBF001570C1001570C2001571C2001472C2001474C4001378
      C700137CCA000E7BC8001088D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5CDB100C49B7E00F6FB
      FC00F4F4F400F6F6F500F7F7F700F8F8F800F9F9F900F9F9F900FAFAFA00FAFA
      FA00FCFCFD00D4D8DB0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFE
      FF009AE2FF00A3D9EC009AD3DF007DC9E70000000000C1FAFF008FE3F8008CDF
      F5008BDFF6008CDDF5008EDDF5008EDCF5008EDCF5008FD9F4008FD9F4008ED7
      F3008DD6F2008CD9F600CDEFFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3D7DA00F6F6
      F500F5F5F400F6F6F600F7F7F700F8F8F800F9F9F900FAFAFA00FAFAFA00FBFB
      FB00FDFDFD00D1D1D10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DAF5FF0093DCFC0072C6E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFCFC00E6E6
      E600E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E6E6E600E6E6E600E6E6
      E600E5E5E500FCFCFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F3FCFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF008001FFFFFFFF00000000FCFF80010000
      0000F87F000000000000F03F000000000000C00F800100000000800780010000
      00000001800100000000000000010000000000000001000093F9000000000000
      80098000000000008009FC00000100008009FFC0000100008003FFE080010000
      C003FFF8FFFF0000C003FFFEFFFF000000000000000000000000000000000000
      000000000000}
  end
  object imgToolBar: TImageList
    Left = 477
    Top = 201
    Bitmap = {
      494C010111001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00D8EBD600018A0200018A0200D8EBD600FEFC
      FB00FEFCFB00C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFB
      F700FEFBF700018A0200D8EAD200018A0200D8EAD200D8EAD200018A0200FEFB
      F700FEFBF700C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF9
      F400FEF9F400018A0200018A0200D8E8D000FEF9F400FEF9F400D8E8D000FEF9
      F400FEF9F400C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000018A0200018A0200018A0200FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF5
      EC00FEF5EC00FEF5EC00FEF5EC00FEF5EC00018A0200018A0200018A0200FEF5
      EC00FEF5EC00C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF3
      E900FEF3E900D8E3C700FEF3E900FEF3E900D8E3C700018A0200018A0200FEF3
      E900FEF3E900C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFF1
      E500FFF1E500018A0200D9E2C300D9E2C300018A0200D9E2C300018A0200FFF1
      E500FFF1E500C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFF0
      E200FFF0E200D9E1C100018A0200018A0200D9E1C100DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00C5B5A900C3B4A800C2B3
      A700C1B2A600C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEC
      DA00FFECDA00FFECDA00FFECDA00FFECDA00FFECDA00B0A29600B0A29600B0A2
      9600B0A29600C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FBF8F400FBF8F400E6DA
      D900C2A6A4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE8
      D300FFE8D300FFE8D300FFE8D300FFE8D300C9B9AC00FBF8F400DFCEC700C2A6
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DFCEC700C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000001079F000313A9000418AE000419AE000313A9000108A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F40260081412500814125008141250081412500814125000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000006600000066
      0000B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B000066
      0000006600000000000000000000000000000000000000000000000000000104
      9D00041CB1000730C0000734C4000735C5000735C5000734C3000731C100041F
      B30001069E000000000000000000000000000000000000000000000000008241
      250081412500CB660000CB660000CB660000CB660000CB660000CB6600008141
      25008141250000000000000000000000000000000000000000000E80AA000E80
      AA000E80AA000E80AA0099330000FDFEFE00FDFEFE00FDFEFE008EA4FD00B8C6
      FD00FDFEFE009933000000000000000000000000000000660000009900000099
      0000E5DEDF000066000000660000E4E7E700E0E3E600D9DFE000CCC9CC000066
      0000037D030000660000000000000000000000000000000000000109A100052B
      C3000735C7000733C2000732C2000732C2000732C2000732C2000733C3000735
      C400062DBE00020CA400000000000000000000000000000000009B4E1800C562
      0300CA650000CA650000CA650000CA650000CA650000CB660000CB660000CB66
      0000C563030081412500000000000000000000000000078DBB0049D5EE0023D7
      FE0036D9FE006FE6FF0099330000FDFEFE00FDFEFE007E98FC000335FB00597A
      FC00FDFEFE009933000000000000000000000000000000660000009900000099
      0000E9E2E2000066000000660000E2E1E300E2E6E800DDE2E400CFCCCF000066
      0000037D03000066000000000000000000000000000001049B00052BCA000636
      D8000431CD000027C400032EC1000732C2000732C2000430C1000027BF00042F
      C1000735C400072EBE0001069E000000000000000000994D1900C4620200C863
      0000C6610000C6610000C6610000C6610000C8630000C9640000CB660000CB66
      0000CB660000C56303008141250000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF0099330000D6DEFE004368FC000335FB004368FC000335
      FB00D9E0FE009933000000000000000000000000000000660000009900000099
      0000ECE4E4000066000000660000DFDDDF00E1E6E800E0E5E700D3D0D2000066
      0000037D030000660000000000000000000000000000031ABA000537E7000331
      DD00123DD8006480E0001840CB00002CC100022DC0000F38C4006580D9001B43
      C700052FC1000735C500051FB3000000000000000000BB5D0600C6620100C460
      0200C25E0200BF5B0200CE833F00D6955A00D8975B00D68F4B00D0772000CB66
      0000CB660000CB6600008241250000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF00993300005274FC001442FB00BCC9FD00EFF2FE001A47
      FB004F72FC009733040000000000000000000000000000660000009900000099
      0000EFE6E600EDE5E500E5DEDF00E0DDDF00DFE0E200E0E1E300D6D0D2000066
      0000037D030000660000000000000000000001049E000430E4000436F100002A
      E4005070E900FFFFFF00B7C4F1000D36CA00042DC300A2B2E800FFFFFF006984
      DA000026BE000733C3000731C1000108A000A8541100C9670700C7680A00C568
      0900C2660800C1640500E7C3A000FEFEFE00FEFEFE00FEFEFE00FEFEFE00DB99
      5700CB660000CB660000CB6600007F402600078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF0099330000E4EAFE00D9E0FE00FDFEFE00FDFEFE0098AC
      FD000335FB006434590000000000000000000000000000660000009900000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000006600000000000000000000020FAF000336FA000335F8000232
      EE000A35E8008CA2F200FFFFFF00B4C2F100A9B8ED00FFFFFF00A7B7E900133A
      C400052FC1000732C2000734C4000313AA00AC570F00CD711400CA721800C872
      1A00C7711A00C56F1700C56F1800C6711C00C46E1A00C56D1E00E4B78D00FEFE
      FE00CA650000CB660000CB66000082412500078DBB00B3FCFE00B6F6FF00C6F5
      FF00E3FAFF00EBFBFF0099330000FDFEFE00FDFEFE00FDFEFE00FDFEFE00FDFE
      FE005274FC000335FB000000000000000000000000000066000000990000B1D0
      B100B1D0B100B1D0B100B1D0B100B1D0B100B1D0B100B1D0B100B1D0B100B1D0
      B100009900000066000000000000000000000619BC001747FE00093AFC000435
      F8000131F000002BE80091A5F400FFFFFF00FFFFFF00ABBAEF00062FC500022D
      C0000732C2000732C2000736C5000419AE00AB581200D4843400CF7F2E00CD7E
      2D00CD7F2F00CC7D2C00EACCAC00C6701900C2680C00BF600300C6691500FEFE
      FE00CA650000CB660000CB66000082412500078DBB00BAEEF60030BCDD0011A7
      D200129FCB0020A2CB0099330000993300009933000099330000993300009933
      00008F3311002235C8000335FB0000000000000000000066000000990000F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900009900000066000000000000000000000B1DBE004168FE001C49FC000335
      FB000031F9000531F200A4B5F700FFFFFF00FFFFFF00B9C6F2000D36D000002C
      C6000732C2000732C2000736C5000418AD00AC591500DEA26400D7934D00D38B
      4100D48D4400ECCFB100FEFEFE00CB7B2A00C6701900C3670B00D7985D00FEFE
      FE00CA650000CB660000CB66000082412500078DBB004AC5DD0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E3000682B6000E80AA00000000000000
      000000000000000000000335FB000335FB00000000000066000000990000F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900009900000066000000000000000000000613B4005B7CFC00486CFD000133
      FB00113CFB00A1B4FE00FFFFFF00A4B6F80092A7F500FFFFFF00B6C4F2001A41
      D300042FC8000732C4000734C3000212A900AA571100E6B48200E3B17C00DA98
      5400F4E0CC00FEFEFE00FEFEFE00F8EEE300F3E1CF00F2DFCC00FEFEFE00E5B8
      8D00CA650000CB660000CB66000082412500078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E300089DCF000E80AA00000000000000
      00000000000000000000000000000335FB00000000000066000000990000F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900009900000066000000000000000000000003A0004A6AF3008FA6FF001F46
      FB004C6FFC00FFFFFF00A7B8FE000733F600002AED008CA2F600FFFFFF00627F
      E7000028D0000734CC000730C30000069F00AA550E00E7B27D00F0D3B500E5B0
      7900F5E1CC00FEFEFE00FEFEFE00F4E2D000EBCBAB00E9C7A400DB9E6000C763
      0300CA650000CB660000CB6600007F402600078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E300089DCF000E80AA00000000000000
      000000000000000000000000000000000000000000000066000000990000F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F90000990000006600000000000000000000000000001A2FCB0099AFFF008BA2
      FE00214DFB004D71FC000E3DFB000030FB000031F7000636F1004C6EF100103C
      E3000432DB000636D700041CB5000000000000000000AF622100F3D9BF00F4D9
      BE00EABB8B00F2D8BD00FEFEFE00D58E4500D0823200CD772000CB6F1100CA66
      0400CA650000CB6600008241250000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E300089DCF000E80AA00000000000000
      000000000000000000000000000000000000000000000066000000990000F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F90000990000006600000000000000000000000000000004A000415EEC00B8C7
      FF009CAFFD003A5CFC000A3AFB000335FB000335FB000133F900052FF2000635
      EB000537E900052CCD0000049C000000000000000000AA550E00E9B78200F8E7
      D500F6DFC800E9BB8B00EFCFAE00D78F4500D3843300D07A2200CF741700CB68
      0800CB660000C56303007D3F270000000000078DBB0091FCFE0082F8FF006FF8
      FF007AFEFF0091FCFE00A0FCFE0063DAF5000DA2D4000E80AA00000000000000
      000000000000000000000000000000000000000000000066000000990000F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F9000099000000660000000000000000000000000000000000000309A5004260
      EC00A9BBFF00BDCAFF008EA5FE006483FD005073FC004A6EFD003961FD001444
      F900042CD7000109A20000000000000000000000000000000000AB561000EBB9
      8600F6E0CA00F7E6D400F0D1B100E8B98A00E3AA7100DFA06000D98F4400CE71
      1100C56303008F481E000000000000000000078DBB00FDFEFE00F4FFFF00D3FF
      FF00B3FCFE00B3FCFE00ADFFFF00ADFFFF006FF8FF000E80AA00000000000000
      000000000000000000000000000000000000000000000000000000660000F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900006600000000000000000000000000000000000000000000000000000004
      A0001E32CD005876F600859EFE008BA3FF007994FE005376FC00234AF000051E
      C50001049C00000000000000000000000000000000000000000000000000AC57
      0F00B3672800ECBC8B00F0CBA600EECAA400EABC8E00E1A26300D47E2800B05C
      150089452100000000000000000000000000000000000C92C000F4FFFF00E3FA
      FF00C7FFFF00ADFFFF00A0FCFE009BFBFC001385AF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000004A0000917B6001022C3000D1FC2000311B40001059F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AE591100B05D1700B2611D00B1601A00B05B14009C5019000000
      0000000000000000000000000000000000000000000000000000078DBB00078D
      BB00078DBB00078DBB00078DBB00078DBB000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000669A000066
      9A0000669A00B8898900B8898900B8898900B8898900B8898900B8898900B889
      8900B8898900B8898900B88989000000000000000000636E7B0000000000C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400000000000000000000000000000000000000
      0000868484008684840000000000000000008684840086848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000669A003CBEE30036BA
      E10030B6DF00B8898900FEFEFD00FEFEFE00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00B8898900000000005E98C7003489D0007F859D00C2A6
      A400FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00FEFCFB00C2A6A400000000000000000000000000000000008684
      8400BCBABA00B5B3B300868484008684840086848400EBEAEA00868484008684
      8400868484000000000000000000000000000000000000000000854200008240
      0000773A00006D35000069330000693400006934000069340000693400006A34
      00006A3400005A2B000000000000000000000000000000669A0045C4E6003FC0
      E40038BCE200B8898900FEFBF800B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEFBF800B889890000000000000000004BB6FF00288BE0008584
      9800FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00FEFCFB00C2A6A40000000000000000000000000086848400E3E2
      E200B5B3B300B5B3B300B5B3B300515050004F4F4F0086878700CDCDCD00E8E9
      E900C7C6C60086848400868484008684840000000000AB540000CB650000C561
      0000BC5D0000B5590000AF570000AD560000AE560000AE560000AE560000AE56
      0000B3590000954A00005A2C0000000000000000000000669A004DC9E90047C4
      E70041C0E500B8898900FEF8F300FFF4EC00FEF6EE00FEF8F100FFF9F400FEFB
      F600FEFCF900FEF8F300B88989000000000000000000000000004DB5FF00278B
      DE0079819A00FEFBF700FEFBF700FEFBF700FEFBF700FEFBF700FEFBF700FEFB
      F700FEFBF700FEFBF700C2A6A400000000000000000086848400DEDDDD00D6D6
      D600A4A3A300A4A3A300A4A3A300565555001615160012121200181818001212
      120093939300CACACA00868484000000000000000000C7630000E9730000DD6D
      0000D66A0000D0670000C8630000C1600000BF5F0000BE5E0000BF5E0000BF5E
      0000C4610000B35900006A340000000000000000000000669A0056CDED0050C9
      EA004AC5E800B8898900FEF6ED00B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEF6ED00B8898900000000000000000000000000000000004CB9
      FF005A91BF00E0CCC800C4A39F00B0878300C4A39F00E0CCC800FEF9F400FEF9
      F400FEF9F400FEF9F400C2A6A4000000000086848400D6D6D600D6D6D600A4A3
      A300E0DEDE00D9D7D700CDCBCB00C2C0C000B6B4B4009F9D9D00797677001212
      12001414140013131300868484008F8C8C0000000000D1680000ED760200E271
      0200DC6E0200DA7C2000DB934B00DB9A5B00D6975A00CC843F00B95C0000BA5C
      0000BF5E0000AE5600006A340000000000000000000000669A005ED2F00058CF
      ED0052CBEB00B8898900FFF0E300FFF0E300FFF0E300FFF1E500FFF2E600FFF3
      E900FFF5EB00FFF0E300B889890000000000000000000000000000000000C2A6
      A400D1B7B200B8908A00D3B5A800EFDBC300D2B1A000B78E8600E0CBC500FEF7
      F000FEF7F000FEF7F000C2A6A4000000000086848400D6D6D600A4A3A300F3F2
      F200FFFEFE00FCFBFB00EAE7E800E6E6E600E6E5E500DAD9D900CCCBCB00BFBD
      BD00A2A0A00073717100939191008E8C8C0000000000D66A0000F6821100EE7B
      0B00EEA45A00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E8C39F00BC5D0000BA5C
      0000BF5E0000AE56000069340000000000000000000000669A0066D7F30060D4
      F1005AD0EE00B8898900FFEDDD00B27E7300B27E7300B27E7300B27E7300CDA9
      9E00CCAA9E00D7C5BA00B889890000000000000000000000000000000000C2A6
      A400C4A29D00D4B9B100F9EADA00F8E7D200FFFFF700D2B0A000C4A29D00FEF5
      EC00FEF5EC00FEF5EC00C2A6A4000000000086848400A4A3A300FFFFFF00FEFD
      FD00FBFBFB00DFDEDF00ADA7A900B4ADAE00C3BDBE00D1CECF00E0E0E000E1E1
      E100D4D3D300C7C6C600A7A5A5008683830000000000D66A0000F8933000F485
      1900FEFEFE00F4C08E00E37F1D00DD7A1800D6751400CD690700C5620000BD5E
      0000BF5E0000AE56000069340000000000000000000000669A006DDBF60067D8
      F30062D4F200B8898900FFEBD800FFEAD700FFEBD800FFEBD800FFEBD800C4AA
      A700C5ABA800CDB5B000CD99990000000000000000000000000000000000C2A6
      A400B0868200F5EAE300F9EFE300F8EADA00FFFFF000F0DAC400B0868200FEF3
      E900FEF3E900FEF3E900C2A6A40000000000000000008684840086848400F1F0
      F000C2B9BA0093898B00A19B9F00ABA8AA00ABA6A700B1ACAD00AFA9AA00B2AD
      AE00CAC9C900DCDCDC00D0D0D0008684840000000000D66A0000F9A75600F48E
      2900FEFEFE00F2861A00EB740000E4710000DE6E0000EFC69E00CE660000C863
      0000C6620000B15700006A340000000000000000000000669A0074DFF8006FDC
      F6006ADAF400B8898900FFE8D200FFE8D200FFE8D200FFE8D200FBE4CF00C6AC
      A900FEFEFE00CD9999000000000000000000000000000000000000000000C2A6
      A400C4A19B00D6BFBA00FBF3EB00FAEFE200FFFFDE00D3B5A800C4A19B00FFF1
      E500FFF1E500FFF1E500C2A6A400000000000000000000000000000000008684
      8400CAA09700BA9E8700A2897E0095817B00897C7F00928C9200A5A2A400BBB6
      B700D7D6D600CFCFCF00868484000000000000000000D66A0000F9B36F00F494
      3500FEFEFE00F6AB6000F2780000EE760000E6720000FEFEFE00EFC29600D168
      0000CF660000B85B000073390000000000000000000000669A007AE3FA0076E1
      F80070DDF600B8898900FFE6CF00FFE6CF00FFE6CF00FFE6CF00E9CFBF00D2BA
      B400CD99990000669A000000000000000000000000000000000000000000C2A6
      A400E0C7BC00B8928F00D6BFBA00F5EAE200D4B9B100B8908A00CBB2A800DDCF
      C200DDCFC200DDCFC200C2A6A400000000000000000000000000000000000000
      0000CC9A9900FFEAC400FFDDB300EEC39900D5AE8C00C9A78600CC9A99009895
      96008684840086848400000000000000000000000000D66A0000FABA7B00F599
      3F00FACA9A00FEFEFE00FBE1C700FBE1C700FCECDC00FEFEFE00FEFEFE00F3D2
      B100D96B0000C260000082400000000000000000000000669A007FE6FC007BE4
      FA0077E1F900B8898900B8898900B8898900B8898900B8898900B8898900CD99
      990052CAEB0000669A000000000000000000000000000000000000000000C2A6
      A400FFEEDE00E0C5BA00C4A09900B0868200C4A09900E0C5BA00C5B5A900C3B4
      A800C2B3A700C1B2A600C2A6A400000000000000000000000000000000000000
      0000CC9A9900FFE7C800FFDDBA00FFDBB100FFD9A600FFD39F00CC9A99000000
      00000000000000000000000000000000000000000000D66A0000FABF8500F69F
      4B00F4933300F7B37100F9CDA100F9CB9D00FBDEC200FEFEFE00FEFEFE00F5CD
      A500E3700000CD65000090470000000000000000000000669A0083E8FE0080E6
      FC007DE5FC007DE5FC0078E2FA0072DFF8006BDAF50064D5F2005DD0EF0056CD
      ED0052CAEB0000669A000000000000000000000000000000000000000000C2A6
      A400FFECDA00FFECDA00FFECDA00FFECDA00FFECDA00FFECDA00B0A29600B0A2
      9600B0A29600B0A29600C2A6A40000000000000000000000000000000000CE9D
      9B00FFEDDA00FFE7CE00FFE2C300FFDDB800FFDBAE00CC9A9900000000000000
      00000000000000000000000000000000000000000000D66A0000FBC79400F7AB
      6100F5973B00F4933300F48B2400F3861B00F3841700FEFEFE00F9C18B00EE76
      0000EB750000D76A00009E4E0000000000000000000000669A0084E9FE0084E9
      FE007373730073737300737373007373730073737300737373007373730060D4
      F0005ACFEE0000669A000000000000000000000000000000000000000000C2A6
      A400FFEAD700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FBF8F400FBF8
      F400E6DAD900C2A6A4000000000000000000000000000000000000000000CC9A
      9900FEF0E100FFECD800FFE6CC00FFE1C200FEDDB700CC9A9900000000000000
      00000000000000000000000000000000000000000000D66A0000FBC99800F9C4
      9000F8B77700F7AF6900F6A55600F59C4400F4933300F9C18A00F27C0800F379
      0200F5790000E2700000AB540000000000000000000000669A0084E9FE0084E9
      FE0073737300CFC1BC00CFC1BB00CFC1BB00CFC1BB00CEBEB7007373730068D8
      F40062D4F10000669A000000000000000000000000000000000000000000C2A6
      A400FFE8D300FFE8D300FFE8D300FFE8D300FFE8D300C9B9AC00FBF8F400DFCE
      C700C2A6A4000000000000000000000000000000000000000000CC9A9900FFFF
      F500FFFFF500FFF0E100FFEBD600FFE8CC00F6D4BA00CC9A9900000000000000
      00000000000000000000000000000000000000000000D76A0000FBB97800FBCA
      9A00FBCC9E00FBC79400FABE8300F9B16A00F89E4600F78D2400F6800B00F67B
      0200FB7C0000EA740000B55A000000000000000000000000000000669A000066
      9A0073737300E2D8D300FAF9F800F9F8F700F9F8F700D0C5BF00737373000066
      9A0000669A00000000000000000000000000000000000000000000000000C2A6
      A400FFE6D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DFCEC700C2A6
      A400000000000000000000000000000000000000000000000000CC9A9900CC9A
      9900CC9A9900FCF3E900FCEADA00FCE5D000CC9A990000000000000000000000
      0000000000000000000000000000000000000000000000000000DA771700DE86
      3000DE883300DE883300DD842C00DC7F2400DA771700D8700B00D76C0400D66B
      0200D76B0000C963000000000000000000000000000000000000000000000000
      0000000000007373730073737300737373007373730073737300000000000000
      000000000000000000000000000000000000000000000000000000000000C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900CC9A9900CC9A99000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000732DE000732DE000000000000000000000000007F33
      1B00883313008A3712008A3B16008A3B16000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A400000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE000000000000000000000000000732DE000732DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000732DE000732DE00000000000000000084351E008E3210007C32
      1F0000000000000000000000000093411200853F1E0000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000078DBE0025A1D10072C7E70085D7
      FA0066CDF90065CDF90065CDF90065CDF90065CDF80065CDF90065CDF80066CE
      F90039ADD800078DBE000000000000000000000000000732DE000732DE000732
      DE00000000000000000000000000000000000000000000000000000000000000
      00000732DE000732DE00000000000000000035221D0035221D00000000000000
      0000000000000000000000000000000000008C421900984A1300984A13000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000078DBE004CBCE70039A8D100A0E2
      FB006FD4FA006FD4F9006ED4FA006FD4F9006FD4FA006FD4FA006FD4FA006ED4
      F9003EB1D90084D7EB00078DBE0000000000000000000732DE000732DD000732
      DE000732DE000000000000000000000000000000000000000000000000000732
      DE000732DE0000000000000000000000000035221D001C6378000076A9000069
      9A00004C880000000000000000000000000000000000000000009A4E1500A859
      0F00A55A1200A65C1400B3681000AA6214000000000000000000C2A6A400FEFA
      F500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFA
      F500FEFAF500C2A6A4000000000000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFB0079DCFB0079DCFB0079DCFB0079DCFB007ADCFB0079DCFA0079DC
      FA0044B5D900AEF1F900078DBE000000000000000000000000000534ED000732
      DF000732DE000732DE00000000000000000000000000000000000732DE000732
      DE00000000000000000000000000000000000000000002AAD80000B6EA00036C
      9700093094000B09830000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFA
      F500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFA
      F500FEFAF500C2A6A4000000000000000000078DBE0079DDFB001899C7009ADF
      F30092E7FB0084E4FB0083E4FC0083E4FC0084E4FC0083E4FC0083E4FB0084E5
      FC0048B9DA00B3F4F900078DBE00000000000000000000000000000000000000
      00000732DE000732DE000732DD00000000000732DD000732DE000732DE000000
      000000000000000000000000000000000000000000000281AB0000BEEE000316
      170007119C000C1698000B0C8300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A4000000000000000000078DBE0082E3FC0043B7DC0065C3
      E000ACF0FD008DEBFC008DEBFC008DEBFD008DEBFD008DEBFC008DEBFD000C85
      18004CBBDA00B6F7F9006DCAE000078DBE000000000000000000000000000000
      0000000000000732DD000633E6000633E6000633E9000732DC00000000000000
      000000000000000000000000000000000000000000000281AB00056AF200061C
      74000200000007119C000C1799000B0C83000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF3E900FEF7F000FEF7F000FEF3E900FEF7
      F000FEF7F000C2A6A4000000000000000000078DBE008AEAFC0077DCF300229C
      C600FDFFFF00C8F7FE00C9F7FE00C9F7FE00C9F7FE00C8F7FE000C8518003CBC
      5D000C851800DEF9FB00D6F6F900078DBE000000000000000000000000000000
      000000000000000000000633E3000732E3000534EF0000000000000000000000
      00000000000000000000000000000000000000000000000000000B1CBB002555
      FF00061C74000200000007119C000C169C000B0C820000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A4000000000000000000078DBE0093F0FE0093F0FD001697
      C500078DBE00078DBE00078DBE00078DBE00078DBE000C85180052D97F0062ED
      970041C465000C851800078DBE00078DBE000000000000000000000000000000
      0000000000000732DD000534ED000533E9000434EF000434F500000000000000
      0000000000000000000000000000000000000000000000000000000000000F26
      BF002455FF00061C74000200000007119C000C169C000B0C8300000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFF0
      E200FFF0E200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A4000000000000000000078DBE009BF5FE009AF6FE009AF6
      FE009BF5FD009BF6FE009AF6FE009BF5FE000C85180046CE6C0059E4880058E1
      880061EB940040C165000C851800000000000000000000000000000000000000
      00000434F4000534EF000533EB0000000000000000000434F4000335F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001028C2002455FF00061C74000200000007119C000C169C000A0C83000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A4000000000000000000078DBE00FEFEFE00A0FBFF00A0FB
      FE00A0FBFE00A1FAFE00A1FBFE000C8518000C8518000C8518000C85180056E1
      840047CD6E000C8518000C8518000C8518000000000000000000000000000335
      FC000534EF000434F800000000000000000000000000000000000335FC000335
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000001129C4002454FF00061C74000200000007119C000B169D000B0C
      8300000000000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A400000000000000000000000000078DBE00FEFEFE00A5FE
      FF00A5FEFF00A5FEFF00078CB60043B7DC0043B7DC0043B7DC000C8518004EDD
      790036BA54000C851800000000000000000000000000000000000335FB000335
      FB000335FC000000000000000000000000000000000000000000000000000335
      FB000335FB000000000000000000000000000000000000000000000000000000
      00000000000000000000112CC9002455FF00061C74000200000007119C000711
      9C000A0C83000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A40000000000000000000000000000000000078DBE00078D
      BE00078DBE00078DBE00000000000000000000000000000000000C85180040D0
      65000C851800000000000000000000000000000000000335FB000335FB000335
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000335FB0000000000000000000000000000000000000000000000
      0000000000000000000000000000132FCD002354FF00061C7400000000000711
      9C00999CD9001718950000000000000000000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A4000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C8518002AB743002DBA
      49000C8518000000000000000000000000000335FB000335FB000335FB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001531D1001E4EFF00061C7400A3A1
      9A007B7BD70000018F0000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C85180021B538000C85
      1800000000000000000000000000000000000335FB000335FB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001532D200ACBFFF006C76
      E1000000A6000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C8518000C8518000C8518000C8518000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F31A400020E
      AA00000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000C8518000C8518000C8518000C85180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8898900B8898900B8898900B8898900B8898900B8898900B889
      8900B8898900B8898900B8898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006D7C94006F7C88000000000000000000000000000000
      0000000000000000000000000000000000000000000008750D0008750D000875
      0D0008750D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8898900FEFEFD00FEFEFE00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00B88989000000000000000000000000000D7FA9000E80
      AA000D7FA9000E80AA000E80AA001081AB000000000000000000000000000000
      000000000000788295001F89E00059A9DC0000000000000000000E80AA000E80
      AA000E80AA000E80AA000E80AA000E80AA000000000008750D0013AA220010A6
      1D0008750D000000000000000000000000000000000000000000000000000D80
      AA000D80AA000D80AA000D80AA000D80AA000D80AA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8898900FEFBF800B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEFBF800B88989000000000000000000048CB90048D5EE0022D7
      FC0035D8FD006FE6FF008DE6FA0044BADD000E80AA0000000000000000000000
      0000788295002087DE004EB7FF0057AEF40000000000078DBB0049D5EE0023D7
      FE0036D8FD006FE6FF008DE7FA0044BADD000E80AA0008750D001AB12D0013AA
      220008750D000000000000000000000000000000000000000000078DBB0049D5
      EE0023D6FD0036D9FE006FE6FF008DE7FA0044BADD000D80AA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8898900FEF8F300FEFAF600FEF8F300FEF8F300FEF8F300FEF8
      F300FEF8F300FEF8F300B889890000000000048CB9008CFAFD0058E9FD0022D7
      FC0035D8FD0070E6FF008DE6FA004ABFE0000F9DCE001180A700000000008B86
      97001F7ECE004EB7FF0057AEF40000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF0008750D0008750D0008750D0008750D0025BD3E001CB4
      310008750D0008750D0008750D0008750D0000000000078DBB008CFBFE0059EA
      FE0023D6FD0035D3F70000009A0000009A0000009A0000009A0000009A000000
      9A0000009A0000009A000000000000000000B8898900B8898900B8898900B889
      8900B8898900B8898900FEF6ED00B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEF6ED00B889890000000000088EBC008CFAFD0058E9FD0022D7
      FC0035D8FD0075D3E900B1979400C2A69A00C6AEA000AE877C008C6B6C006092
      BD004EB7FF004EB7FF000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF0008750D003CD4620035CE590030C952002CC3490026BE
      410025BD3E001AB12D0017AF2A0008750D0000000000078DBB008CFBFE0059EA
      FE0023D6FD0035D3F70000009A003E6EFF00285BFF001248FF000236FF000029
      F900001DEC0000009A000000000000000000B8898900FEFEFD00FEFEFE00FEFE
      FD00FEFEFD00B8898900FEF3E800FFF4EA00FEF3E800FEF3E800FEF3E800FEF3
      E800FEF3E800FEF3E800B889890000000000088EBC008CFAFD0058E9FD0024D8
      FD0046C6E400AB939500ECDDCC00FEFED600FFFFE400F7F2D900CFB7A100AD85
      80004EB7FF00000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF0008750D0041DA6D0041DA6D0038D15E0035CE59002CC3
      49002AC1470025BD3E0020B8360008750D0000000000078DBB008CFBFE0059EA
      FE0023D6FD0035D4F80000009A004474FF003264FF001B50FF00083CFF000029
      F9000022F10000009A000000000000000000B8898900FEFBF800B27E7300B27E
      7300B27E7300B8898900FFF0E300B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FFF0E300B889890000000000048CB900B4FFFF00B6F6FF00C6F5
      FF00B5A09F00E8DDD600FFFFF400FEFED600FFFEDD00FEFED600FFF2BA00CAA0
      8C0000000000000000000000000000000000078DBB00B3FCFE00B6F6FF00C6F5
      FF00E3FAFF00E9F9FD0008750D0008750D0008750D0008750D003FD868003CD4
      620008750D0008750D0008750D0008750D0000000000078DBB00B3FCFE00B6F6
      FF00C6F5FF00E1F8FD0000009A0000009A0000009A0000009A0000009A000000
      9A0000009A0000009A000000000000000000B8898900FEF8F300FEFAF600FEF8
      F300FEF8F300B8898900FFEDDD00FFEDDD00FFEDDD00FFEDDD00FFEDDD00E9D5
      C900E7D6C900D7C5BA00B889890000000000048CB900B8EDF60030BCDC0011A7
      D1009C919000FFFFE400FFFEDD00FEFED600FFFEDD00FCF5CD00F8D09800ECD1
      AC00AD858000000000000000000000000000078DBB00BAEEF60030BCDD0011A7
      D200129FCB0020A1CA0035A7CD002692BF0092CEE40008750D0045DD710041DA
      6D0008750D0000000000000000000000000000000000078DBB00BAEEF60030BC
      DD0011A7D200129ECA0020A2CB0035A7CD002692BF0092CEE4000D80AA000000
      000000000000000000000000000000000000B8898900FEF6ED00B27E7300B27E
      7300B27E7300B8898900FFEBD800FFEAD700FFEBD800FFEBD800FFEBD800C4AA
      A700C5ABA800CDB5B000CD99990000000000088EBC004BC6DC0058E9FD0022D7
      FC00A49E9900FFFEDD00FFFEDD00FFFEDD00FFFEDD00F6DAAB00F3BE8000F5DE
      B500AD858000000000000000000000000000078DBB004AC5DD0059EAFE0023D7
      FE0036D8FD006FE6FF008DE7FA0049C1E3000682B60008750D004DE67F004DE6
      7F0008750D0000000000000000000000000000000000078DBB004AC5DD0059EA
      FE0023D6FD0036D9FE006FE6FF008DE7FA0049C1E3000682B6000D80AA000000
      000000000000000000000000000000000000B8898900FEF3E800FFF4EA00FEF3
      E800FEF3E800B8898900FFE8D200FFE8D200FFE8D200FFE8D200FBE4CF00C6AC
      A900FEFEFE00CD9999000000000000000000048CB9008CFAFD0058E9FD0024D8
      FD0096959400FAF6D600FFFEDD00FAF6D600F9E1B100F5CB9A00FEEAB900E4CC
      A900AD858000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF008DE7FA0049C1E300089CCE0008750D0008750D000875
      0D0008750D0000000000000000000000000000000000078DBB008CFBFE0059EA
      FE0023D6FD0036D9FE006FE6FF008DE7FA0049C1E300089DCF000D80AA000000
      000000000000000000000000000000000000B8898900FFF0E300B27E7300B27E
      7300B27E7300B8898900FFE6CF00FFE6CF00FFE6CF00FFE6CF00E9CFBF00D2BA
      B400CD999900000000000000000000000000048CB9008CFAFD0058E9FD0024D8
      FD005EA8BE00D3BBA200FFF7C600F8D09800F4C88E00FEF7E000F9F6F200AD85
      800000000000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF008DE7FA0049C1E300089CCE000E7FA900000000000000
      00000000000000000000000000000000000000000000078DBB008CFBFE0059EA
      FE0023D6FD0036D9FE006FE6FF008DE7FA0049C1E300089DCF000D80AA000000
      000000000000000000000000000000000000B8898900FFEDDD00FFEDDD00FFED
      DD00FFEDDD00B8898900B8898900B8898900B8898900B8898900B8898900CD99
      990000000000000000000000000000000000048CB9008CFAFD0058E9FD0024D8
      FD0039D7FB008AA5AD00CDAC9300ECD1AC00F5E1B600DAC5B700AD858000AD85
      800000000000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF008DE7FA0049C1E300089CCE000E80AA00000000000000
      00000000000000000000000000000000000000000000078DBB008CFBFE0059EA
      FE0023D6FD0036D9FE006FE6FF008DE7FA0049C1E300089DCF000D80AA000000
      000000000000000000000000000000000000B8898900FFEBD800FFEAD700FFEB
      D800FFEBD800FFEBD800C4AAA700C5ABA800CDB5B000CD999900000000000000
      000000000000000000000000000000000000088EBC008CFAFD0081F8FE0071F9
      FE007BFFFF0097FCFD00A1C6C8008F989B008683880087707000000000000000
      000000000000000000000000000000000000078DBB0091FCFE0082F8FF006FF8
      FF007AFEFF0091FCFE00A0FCFE0063DAF5000DA2D4000E80AA00000000000000
      00000000000000000000000000000000000000000000078DBB0091FCFE0082F8
      FF006FF8FF007AFEFF0091FCFE00A0FCFE0063DAF5000DA2D4000D80AA000000
      000000000000000000000000000000000000B8898900FFE8D200FFE8D200FFE8
      D200FFE8D200FBE4CF00C6ACA900FEFEFE00CD99990000000000000000000000
      000000000000000000000000000000000000048CB900FBFFFF00F5FFFE00D2FF
      FF00B4FFFF00ADFFFE00ADFFFE00ADFFFE0071F9FE000E80AA00000000000000
      000000000000000000000000000000000000078DBB00FCFFFF00F4FFFF00D3FF
      FF00B3FCFE00B3FCFE00ADFFFF00ADFFFF006FF8FF000E80AA00000000000000
      00000000000000000000000000000000000000000000078DBB00FCFFFF00F4FF
      FF00D3FFFF00B3FCFE00B3FCFE00ADFFFF00ADFFFF006FF8FF000D80AA000000
      000000000000000000000000000000000000B8898900FFE6CF00FFE6CF00FFE6
      CF00FFE6CF00E9CFBF00D2BAB400CD9999000000000000000000000000000000
      000000000000000000000000000000000000000000000A91C100F5FFFE00E3FE
      FF00C6FEFF00ADFFFE00A7FFFF009BFBFD001285B00000000000000000000000
      000000000000000000000000000000000000000000000C92C000F4FFFF00E3FA
      FF00C7FFFF00ADFFFF00A0FCFE009BFBFC001385AF0000000000000000000000
      00000000000000000000000000000000000000000000000000000C92C000F4FF
      FF00E1F8FD00C7FFFF00ADFFFF00A0FCFE009BFBFC001385AF00000000000000
      000000000000000000000000000000000000B8898900B8898900B8898900B889
      8900B8898900B8898900CD999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000088EBC00088E
      BC00048CB900088EBC00088EBC00088EBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000078DBB00078D
      BB00078DBB00078DBB00078DBB00078DBB000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000078D
      BB00078DBB00078DBB00078DBB00078DBB00078DBB0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00C003000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C003000000000000C007000000000000C00F000000000000
      C01F000000000000C03F000000000000FFFFF81FF81FFC03C007E007E007C003
      8003C003C0038003800380018001000380038001800100038003000000000003
      80030000000000038003000000000001800300000000003C800300000000003E
      800300000000003F800380018001003F800380018001003F8003C003C003003F
      C007E007E007807FFFFFF81FF81FC0FFC001A001F33FFFFF80010001E007C003
      80018001C00080018001C001800180018001E001000080018001E00100008001
      8001E001000080018001E001800080018003E001E00180018003E001F0038001
      8003E001F01F80018003E001E03F80018003E003E03F80018003E007C03F8001
      C007E00FC07FC003F83FE01FF8FFFFFFFFFCE0FFC00380039FF98E7FC0030003
      8FF33F1FC003000187E707C0C0030001C3CF83FFC0030001F11F81FFC0030000
      F83F80FFC0030000FC7FC07FC0030000F83FE03FC0030001F19FF01FC0030000
      E3CFF80FC0038003C7E7FC07C003C3C78FFBFE03C007FF871FFFFF03C00FFF8F
      3FFFFF87C01FFE1FFFFFFFCFC03FF87FF801FFFCFF87FFFFF801C0F8C087E07F
      F80180708007C03FF80100210000800300010003000080030001000700008003
      0001000F00008003000100070007801F000100070007801F000300070007801F
      0007000F003F801F000F000F003F801F003F003F003F801F007F003F003F801F
      00FF807F807FC03F01FFC0FFC0FFE07F00000000000000000000000000000000
      000000000000}
  end
  object actDataList: TActionList
    Images = imgToolBar
    Left = 349
    Top = 201
    object actNewMst: TAction
      Caption = #26032#24314
      Hint = #26032#24314
      ImageIndex = 6
      OnExecute = actNewMstExecute
    end
    object actEdit: TAction
      Caption = #32534#36753
      Hint = #32534#36753
      ImageIndex = 5
      OnExecute = actEditExecute
      OnUpdate = actEditUpdate
    end
    object actDelete: TAction
      Caption = #21024#38500
      Hint = #21024#38500
      ImageIndex = 4
      OnExecute = actDeleteExecute
      OnUpdate = actDeleteUpdate
    end
    object actCopy: TAction
      Caption = #22797#21046
      Hint = #22797#21046
      ImageIndex = 0
    end
    object actPaste: TAction
      Caption = #31896#36148
      Hint = #31896#36148
      ImageIndex = 8
    end
    object actRedo: TAction
      Caption = #37325#20570
      Hint = #37325#20570
      ImageIndex = 11
    end
    object actUndo: TAction
      Caption = #25764#38144
      Hint = #25764#38144
      ImageIndex = 14
    end
    object actFind: TAction
      Caption = #26597#25214
      Hint = #26597#25214
      ImageIndex = 9
      OnExecute = actFindExecute
      OnUpdate = actFindUpdate
    end
    object actPrint: TAction
      Caption = #25171#21360
      Hint = #25171#21360
      ImageIndex = 10
    end
    object actExit: TAction
      Caption = #20851#38381
      Hint = #20851#38381
      ImageIndex = 13
      OnExecute = actExitExecute
    end
    object actAddDtl: TAction
      Caption = #22686#21152
      Hint = #22686#21152
      ImageIndex = 2
      OnExecute = actAddDtlExecute
      OnUpdate = actAddDtlUpdate
    end
    object actEditDtl: TAction
      Caption = 'actEditDtl'
      ImageIndex = 15
      OnExecute = actEditDtlExecute
      OnUpdate = actEditDtlUpdate
    end
    object actDeleteDtl: TAction
      Caption = #21024#38500
      Hint = #21024#38500
      ImageIndex = 3
      OnExecute = actDeleteDtlExecute
      OnUpdate = actDeleteDtlUpdate
    end
    object actCopyDtl: TAction
      Caption = #22797#21046
      Hint = #22797#21046
      ImageIndex = 0
    end
    object actRedoDtl: TAction
      Caption = #37325#20570
      Hint = #37325#20570
      ImageIndex = 11
    end
    object actUndoDtl: TAction
      Caption = #25764#38144
      Hint = #25764#38144
      ImageIndex = 14
    end
    object actSave: TAction
      Caption = 'actSave'
      ImageIndex = 12
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
    object actRefresh: TAction
      Caption = #21047#26032
      Hint = #21047#26032
      ImageIndex = 16
      OnExecute = actRefreshExecute
    end
  end
  object cdsCloneData: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 381
    Top = 233
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 412
    Top = 236
  end
end
