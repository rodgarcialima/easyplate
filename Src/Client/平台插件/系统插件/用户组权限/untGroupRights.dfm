inherited frmGroupRights: TfrmGroupRights
  Left = 245
  Top = 144
  Caption = 'frmGroupRights'
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object EasyPanel1: TEasyPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 473
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    object EasyPanel3: TEasyPanel
      Left = 0
      Top = 0
      Width = 862
      Height = 473
      Align = alClient
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 249
        Top = 30
        Height = 441
      end
      object EasyPanel4: TEasyPanel
        Left = 2
        Top = 30
        Width = 247
        Height = 441
        Align = alLeft
        TabOrder = 1
        object tvUserGroups: TEasyTreeView
          Left = 2
          Top = 2
          Width = 243
          Height = 437
          SelectionPen.Color = clBtnShadow
          Align = alClient
          Images = imgUserGroup
          Indent = 19
          ReadOnly = True
          ShowLines = False
          TabOrder = 0
          OnClick = tvUserGroupsClick
        end
      end
      object EasyDockPanel1: TEasyDockPanel
        Left = 2
        Top = 2
        Width = 858
        Height = 28
        MinimumSize = 3
        LockHeight = False
        Persistence.Location = plRegistry
        Persistence.Enabled = False
        ToolBarStyler = EasyToolBarOfficeStyler1
        UseRunTimeHeight = True
        object EasyToolBar1: TEasyToolBar
          Left = 3
          Top = 1
          Width = 852
          Height = 26
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
          ToolBarStyler = EasyToolBarOfficeStyler1
          Images = imgUserGroup
          ParentOptionPicture = True
          ToolBarIndex = -1
          object EasyToolBarButton1: TEasyToolBarButton
            Left = 9
            Top = 2
            Width = 64
            Height = 24
            Appearance.CaptionFont.Charset = DEFAULT_CHARSET
            Appearance.CaptionFont.Color = clWindowText
            Appearance.CaptionFont.Height = -11
            Appearance.CaptionFont.Name = 'Tahoma'
            Appearance.CaptionFont.Style = []
            Caption = #26032#22686#32452
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 3
            ParentFont = False
            Position = daTop
            ShowCaption = True
          end
          object EasyToolBarButton2: TEasyToolBarButton
            Left = 73
            Top = 2
            Width = 64
            Height = 24
            Appearance.CaptionFont.Charset = DEFAULT_CHARSET
            Appearance.CaptionFont.Color = clWindowText
            Appearance.CaptionFont.Height = -11
            Appearance.CaptionFont.Name = 'Tahoma'
            Appearance.CaptionFont.Style = []
            Caption = #32534#36753#32452
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 7
            ParentFont = False
            Position = daTop
            ShowCaption = True
          end
          object EasyToolBarButton3: TEasyToolBarButton
            Left = 137
            Top = 2
            Width = 64
            Height = 24
            Appearance.CaptionFont.Charset = DEFAULT_CHARSET
            Appearance.CaptionFont.Color = clWindowText
            Appearance.CaptionFont.Height = -11
            Appearance.CaptionFont.Name = 'Tahoma'
            Appearance.CaptionFont.Style = []
            Caption = #21024#38500#32452
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 2
            ParentFont = False
            Position = daTop
            ShowCaption = True
          end
          object EasyToolBarButton4: TEasyToolBarButton
            Left = 201
            Top = 2
            Width = 52
            Height = 24
            Appearance.CaptionFont.Charset = DEFAULT_CHARSET
            Appearance.CaptionFont.Color = clWindowText
            Appearance.CaptionFont.Height = -11
            Appearance.CaptionFont.Name = 'Tahoma'
            Appearance.CaptionFont.Style = []
            Caption = #20445#23384
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 13
            ParentFont = False
            Position = daTop
            ShowCaption = True
          end
          object EasyToolBarButton5: TEasyToolBarButton
            Left = 253
            Top = 2
            Width = 52
            Height = 24
            Appearance.CaptionFont.Charset = DEFAULT_CHARSET
            Appearance.CaptionFont.Color = clWindowText
            Appearance.CaptionFont.Height = -11
            Appearance.CaptionFont.Name = 'Tahoma'
            Appearance.CaptionFont.Style = []
            Caption = #20851#38381
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 14
            ParentFont = False
            Position = daTop
            ShowCaption = True
          end
        end
      end
      object EasyPanel2: TEasyPanel
        Left = 252
        Top = 30
        Width = 608
        Height = 441
        Align = alClient
        BorderOuter = fsNone
        TabOrder = 2
        object Splitter2: TSplitter
          Left = 317
          Top = 0
          Height = 441
          Align = alRight
        end
        object EasyPanel5: TEasyPanel
          Left = 320
          Top = 0
          Width = 288
          Height = 441
          Align = alRight
          TabOrder = 1
          object tvCheckResources: TEasyCheckTree
            Left = 2
            Top = 2
            Width = 284
            Height = 437
            Images = imgUserGroup
            Align = alClient
            Indent = 19
            SelectionPen.Color = clBtnShadow
            ShowLines = False
            StateImages = tvCheckResources.CheckImages
            TabOrder = 0
          end
        end
        object EasyPanel6: TEasyPanel
          Left = 0
          Top = 0
          Width = 317
          Height = 441
          Align = alClient
          TabOrder = 0
          object EasyPanel7: TEasyPanel
            Left = 2
            Top = 2
            Width = 313
            Height = 437
            Align = alClient
            TabOrder = 0
            object Splitter3: TSplitter
              Left = 2
              Top = 145
              Width = 309
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object EasyPanel8: TEasyPanel
              Left = 2
              Top = 2
              Width = 309
              Height = 143
              Align = alTop
              BorderOuter = fsNone
              TabOrder = 0
              object tvUserRoles: TEasyTreeView
                Left = 0
                Top = 0
                Width = 309
                Height = 143
                SelectionPen.Color = clBtnShadow
                Align = alClient
                Images = imgUserGroup
                Indent = 19
                ReadOnly = True
                ShowLines = False
                TabOrder = 0
                OnClick = tvUserRolesClick
              end
            end
            object EasyPanel9: TEasyPanel
              Left = 2
              Top = 148
              Width = 309
              Height = 287
              Align = alClient
              BorderOuter = fsNone
              TabOrder = 1
              object tvUsers: TEasyTreeView
                Left = 0
                Top = 0
                Width = 309
                Height = 287
                SelectionPen.Color = clBtnShadow
                Align = alClient
                Images = imgUserGroup
                Indent = 19
                ReadOnly = True
                ShowLines = False
                TabOrder = 0
                OnClick = tvUsersClick
              end
            end
          end
        end
      end
    end
  end
  object EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler
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
    Left = 424
    Top = 240
  end
  object imgUserGroup: TImageList
    Left = 456
    Top = 242
    Bitmap = {
      494C010112001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F8E8D008F8F8E008F8F8E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000918F8F00BDBCBC00EBEBEB00D2D2D1008F8F8E008F8F8E00878786000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009796
      9500C4C4C400FFFFFF00FAFAFA00EDEDED00EAECED00C5B4B200946D68008E76
      73008F8F8E008F8F8E000000000000000000A0502700954B2500944A2400944A
      2400944A2400944A2400944A2400944A2400944A2400944A2400944A2400944A
      2400944A2400964C2500A1512700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099989700D1D0
      D000FFFFFF00FFFFFF00FBFBFB00F0F0F000EEF1F100C9B8B600966862009665
      6000BDAEAD00C1C2C3008F8F8E0079797800AB4E2100FEF4E900FEF0E000FEEC
      D700FEE8CF00FEE4C700FEE1C100FEDEBB00FEDDB800FEDDB800FEDDB800FEDD
      B800FEDDB800FEDDB80091492300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009D9C9B00E0E0E000FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00F6F6F600F4F7F700CDBCBB00966863009566
      6100C2B3B200D6D8D800C3C3C30077777600AB4E2100FEF8F2004571FA004571
      FA004571FA00FEE9D200A23F0800A23F0800A23F0800FEDDB800059ACD00059A
      CD00059ACD00FEDDB8008F482300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009D9C9B00FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FBFEFE00D1C0BF00966863009565
      6000C6B7B600DADBDB00C4C4C30077777600AB4E2100FEFCF9004571FA004571
      FA004571FA00FEEEDC00A23F0800A23F0800A23F0800FEE0BE00059ACD00059A
      CD00059ACD00FEDDB8008F482300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009D9C9B00FEFEFE00FFFF
      FF00C8C2C200A5979700DEDBDB00FFFFFF00FFFFFF00D2C0BF00905F5900905F
      5A00C9BBBA00E1E2E200C9C9C90076777600AB4E2100FEFEFE004571FA004571
      FA004571FA00FEF3E700A23F0800A23F0800A23F0800FEE3C600059ACD00059A
      CD00059ACD00FEDDB8008F482300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009D9C9B00EDEDEE009688
      88007D555500855555006E535300D8D5D500FFFFFF00F2EDEC00D0BEBC00B698
      9500D4C9C700E6E7E700D3D4D400716B6B00AB4E2100FEFEFE00FEFEFE00FEFD
      FC00FEFBF700FEF7F000FEF4E800FEF0E100FEECD700FEE8D000FEE4C800FEE1
      C000FEDEBB00FEDDB8008F482300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009D9C9B00745B5B00A16F
      6F00EFABAB00E39D9D00946060006E535300D9D5D500FFFFFF00FFFFFF00F7F8
      F800EEEEEE00F2F3F300B8B2B2006B525200AB4E2100FEFEFE00CC9A9900CC9A
      9900CC9A9900FEFCF900E27E0300E27E0300E27E0300FEEDDA00029A0300029A
      0300029A0300FEDFBD008F482300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080616100D49D9E00FABB
      BB00F0ADAD00EDA4A400DB929300945F5F006B515100D9D5D500FFFFFF00FDFD
      FD00FFFFFF00C3BDBD005F4444008B626200AB4E2100FEFEFE00CC9A9900CC9A
      9900CC9A9900FEFEFE00E27E0300E27E0300E27E0300FEF2E500029A0300029A
      0300029A0300FEE2C4008F482300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000093686800FFCDCD00F4B6
      B600EFACAC00EAA2A200E99A9B00D88A8A00915C5C006B525200DBD7D700FFFF
      FF00B5ACAC00614545008B61610000000000AB4E2100FEFEFE00CC9A9900CC9A
      9900CC9A9900FEFEFE00E27E0300E27E0300E27E0300FEF7EE00029A0300029A
      0300029A0300FEE7CD008E472200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000093686800E3ACAC00F8BA
      BA00EFACAC00EAA2A200E5989900E28F8F00D1808000915C5C00715A5A008A7B
      7B005F4040008E6363000000000000000000AB4E2100E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E2E100E4E0
      DC00E4DED600E4DACF00944D2900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093686800E7AB
      AB00F4AFAF00EAA2A200E4989900E69A9B00FFCCCC00CF777700935A5A006341
      410090656500000000000000000000000000AE5C2700AE612200AD5F2000AD5F
      2000AD5F2000AD5F2000AD5F2000AD5F2000AD5F2100AF622500AE612200AF62
      2500AC602400AA6128008F482300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009368
      6800E4A3A300EEA4A400E69A9B00EEABAB00FFCCCC00E3848500936868000000
      000000000000000000000000000000000000AE5C2700EE973300EE973300EE97
      3300EE973300EE973300EE973300EE973300EE973300EE973300EE973300EE97
      3300EE973300EE973300B95D1900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000093686800EEA4A400E99C9D009368680093686800E3848500936868000000
      00000000000000000000000000000000000000000000CB731A00CC731A00CC73
      1A00CC731A00CC731A00CC731A00CC731A00CC741A00CD751B00CC731800CD75
      1B00CA721A00C8721E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009368680093686800000000009368680093686800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F8E8D009D9C9B009D9C9B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000001079F000313A9000418AE000419AE000313A9000108A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001EA1CD002CAAD3001585B000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000918F8F00BDBCBC00EBEBEB00D2D2D1009D9C9B009D9C9B009D9C9B000000
      000000000000000000000000000000000000000000000000000097433F009743
      3F00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B009330
      300097433F000000000000000000000000000000000000000000000000000104
      9D00041CB1000730C0000734C4000735C5000735C5000734C3000731C100041F
      B30001069E0000000000000000000000000000000000000000000000000027A5
      CF0023A4CE001585B0001E98C2002CABD3002CABD300178AB5001587B1002CAB
      D30029A7D1000000000000000000000000000000000000000000000000009796
      9500C4C4C400FFFFFF00FAFAFA00EDEDED00F2EDEA008DB2C500116895003F73
      8E007F8B8F009D9C9B0000000000000000000000000097433F00D6686800C660
      6000E5DEDF0092292A0092292A00E4E7E700E0E3E600D9DFE000CCC9CC008F20
      1F00AF46460097433F00000000000000000000000000000000000109A100052B
      C3000735C7000733C2000732C2000732C2000732C2000732C2000733C3000735
      C400062DBE00020CA400000000000000000000000000000000000000000027A5
      CF002CABD3002CABD3001DA0CC0020D0F8004AD7F70027A5CF005EC1DC0064C1
      DA0027A5CF00000000000000000000000000000000000000000099989700D1D0
      D000FFFFFF00FFFFFF00FBFBFB00F0F0F000F7F1EE0091B6C900006298000060
      980088ADBE00C7C3C1009D9C9B00797978000000000097433F00D0656600C25F
      5F00E9E2E20092292A0092292A00E2E1E300E2E6E800DDE2E400CFCCCF008F22
      2200AD46460097433F0000000000000000000000000001049B00052BCA000636
      D8000431CD000027C400032EC1000732C2000732C2000430C1000027BF00042F
      C1000735C400072EBE0001069E000000000000000000178CB6001E98C2004FC2
      E1007FDFF5004FC2E1003ACBEF001DD1FA003CD5F8005DD9F60074C1D600AEE2
      ED0091E3F500178AB5000000000000000000000000009D9C9B00E0E0E000FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00F6F6F600FDF7F40096BBCE00006398000061
      970091B2C200DBD8D600C3C3C300777776000000000097433F00D0656500C15D
      5D00ECE4E40092292A0092292A00DFDDDF00E1E6E800E0E5E700D3D0D2008A1E
      1E00AB44440097433F00000000000000000000000000031ABA000537E7000331
      DD00123DD8006480E0001840CB00002CC100022DC0000F38C4006580D9001B43
      C700052FC1000735C500051FB30000000000000000005EC1DC002CABD3004FC2
      E10096E4F5008BE2F5005DD9F60027D0F7001DD1FA0056D9F70076DEF5007FDF
      F5003ACBEF002CABD30027A5CF0000000000000000009D9C9B00FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FFFEFB009ABFD200006398000060
      970095B6C700DEDBDA00C4C4C300777776000000000097433F00D0656500C15B
      5C00EFE6E600EDE5E500E5DEDF00E0DDDF00DFE0E200E0E1E300D6D0D200962A
      2A00B24A4A0097433F00000000000000000001049E000430E4000436F100002A
      E4005070E900FFFFFF00B7C4F1000D36CA00042DC300A2B2E800FFFFFF006984
      DA000026BE000733C3000731C1000108A000000000001B91BC0023A4CE004FC2
      E1007FDFF50091E3F50070DCF5005EC1DC004FC2E1002DCFF4001DD1FA001DD1
      FA001DD1FA0020D0F8002CABD30000000000000000009D9C9B00FFFEFE00FFFF
      FF00B3C2CC00819CAE00D2DBE000FFFFFF00FFFFFF0097BFD30000599200005A
      920097BACA00E5E2E100C8C8C9007A7876000000000097433F00CD626300C860
      6000C9676700CC727200CA727100C6696900C4646400CC6D6C00CA666700C55D
      5D00CD65650097433F000000000000000000020FAF000336FA000335F8000232
      EE000A35E8008CA2F200FFFFFF00B4C2F100A9B8ED00FFFFFF00A7B7E900133A
      C400052FC1000732C2000734C4000313AA00000000001A8FBA002CABD30045C7
      E9006BDBF60089BECD00979696009796960097969600979696004FC2E1001DD1
      FA001DD1FA001DD1FA001D9EC90000000000000000009D9C9B00EBEDEE006A8C
      A000015B8800005B8E00195D8200CBD5DA00FFFFFF00E1ECF20094BCD2005495
      B700ADC7D400E9E7E600D7D3D10054656E000000000097433F00B6555300C27B
      7800D39D9C00D7A7A500D8A7A600D8A6A500D7A09F00D5A09F00D7A9A700D8AB
      AB00CC66670097433F0000000000000000000619BC001747FE00093AFC000435
      F8000131F000002BE80091A5F400FFFFFF00FFFFFF00ABBAEF00062FC500022D
      C0000732C2000732C2000736C5000419AE00000000001B91BC002CABD3002CAB
      D3005DD9F60097969600E2DFE300B0B4B700ACA3A200BEB2B2009796960056D9
      F7009DE3F200AEE2ED001E98C20000000000000000009D9C9B002A628300006D
      A0000097CC000092C60000679E001B5A7E00CCD5DA00FFFFFF00FFFFFF00F9F8
      F700EEEEEF00F2F0EF00CFCFCF00295369000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000B1DBE004168FE001C49FC000335
      FB000031F9000531F200A4B5F700FFFFFF00FFFFFF00B9C6F2000D36D000002C
      C6000732C2000732C2000736C5000418AD0000000000178CB6001EA1CD002CAB
      D30045C7E90097969600E2DFE300B0B4B700ACA3A200BEB2B200979696007FDF
      F500AEE2ED0089BECD0027A5CF000000000000000000126287000086BB00009D
      D0000097CA000095C800008DC10000669A001A587900CBD5DA00FFFFFF00FDFD
      FD00FFFFFF00C5CDD1002F648000005280000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000613B4005B7CFC00486CFD000133
      FB00113CFB00A1B4FE00FFFFFF00A4B6F80092A7F500FFFFFF00B6C4F2001A41
      D300042FC8000732C4000734C3000212A90000000000000000001585B00021A3
      CE003ACBEF0097969600E2DFE300B0B4B700ACA3A200BEB2B2009796960067DA
      F60064C1DA001585B000000000000000000000000000006EA200009FD3000099
      CC000097CA000094C7000091C400008BBE00006499001B577A00CED7DC00FFFF
      FF0099ACB8000B4B6E00005A8D00000000000000000097433F00CC666700F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900CC66670097433F0000000000000000000003A0004A6AF3008FA6FF001F46
      FB004C6FFC00FFFFFF00A7B8FE000733F600002AED008CA2F600FFFFFF00627F
      E7000028D0000734CC000730C30000069F000000000000000000000000001589
      B4001A8FBA0097969600E2DFE300B0B4B700ACA3A200BEB2B200979696001E98
      C2001B91BC0000000000000000000000000000000000006EA200008FC300009B
      CE000097CA000094C7000090C300008DC0000087BB0000669A00215E7F005B7C
      8E00004870000063970000000000000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F000000000000000000000000001A2FCB0099AFFF008BA2
      FE00214DFB004D71FC000E3DFB000030FB000031F7000636F1004C6EF100103C
      E3000432DB000636D700041CB500000000000000000000000000000000000000
      00000000000097969600E2DFE300BAAFAE00AAA1A100BEB2B200979696000000
      0000000000000000000000000000000000000000000000000000006DA1000095
      C8000098CB000094C7000190C3000B96CA001FA9DF000084B80000679A00004E
      7C00006599000000000000000000000000000000000097433F00CC666700F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900CC66670097433F000000000000000000000000000004A000415EEC00B8C7
      FF009CAFFD003A5CFC000A3AFB000335FB000335FB000133F900052FF2000635
      EB000537E900052CCD0000049C00000000000000000000000000000000000000
      00000000000097969600B0B4B700A6A0A00098969600A8A0A000979696000000
      0000000000000000000000000000000000000000000000000000000000000075
      A9000092C5000096C9000291C4001FA9DE001FA9DF000087BB000071A5000000
      0000000000000000000000000000000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F00000000000000000000000000000000000309A5004260
      EC00A9BBFF00BDCAFF008EA5FE006483FD005073FC004A6EFD003961FD001444
      F900042CD7000109A20000000000000000000000000000000000000000000000
      00000000000097969600E0E0E300BEB2B200A6A0A000B0A5A400979696000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000073A600008FC2000294C8000073A600058AB8000081B3000073A6000000
      000000000000000000000000000000000000000000000000000097433F00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F90097433F000000000000000000000000000000000000000000000000000004
      A0001E32CD005876F600859EFE008BA3FF007994FE005376FC00234AF000051E
      C50001049C000000000000000000000000000000000000000000000000000000
      00000000000097969600E2DFE300E2DFE300B9B3B400A39E9E00979696000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000074A7000073A600000000000073A6000073A600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000004A0000917B6001022C3000D1FC2000311B40001059F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000097969600979696009796960097969600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000A70D800000000000000000064707A00BF9E96000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000064707A00BCA2A3000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000159F
      C90046B9DA0062C1DE0055C1DE003DB5DA004BBEDC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000076DD400197FDE00076DD400076DD40063A8F1003879F40060758800C59D
      9500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D8EC9001D55F30060758800C6A4
      9F00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000016A4CD0016A4
      CD007DD4EE009EE1F90097E0F80092E0F7007DD4EE0072CDE80046B9DA000000
      000000000000000000000000000000000000000000000000000011EEED0000CC
      FF0000000000000000000000000000000000000000000000000000000000076D
      D4002F95ED004AAFFF00076DD40000000000559FF500559FF5003879F4006075
      8800C59D95000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006FB6F3006FB6F3001D55F3006075
      8800C6A49F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001BA8D10027AF
      D70081D7F000A1E3F90092E0F70081D7F00059C1DE008FE0F6009BE0F80076CF
      E9000000000000000000000000000000000000000000000000000000000011EE
      ED0000CCFF000000000000000000076DD400076DD400076DD400076DD400278C
      EC003FA5FA000268D000000000000000000000000000559FF500559FF5003879
      F40060758800C59D950000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006FB6F3006FB6F3001D55
      F30060758800CBA69D0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027AFD70030B2
      D90095E0F700AFE8F900A6E5FA0062C1DE00179BC3006FCBE60095E0F7009BE0
      F80033B3DA000000000000000000000000000000000000000000000000000000
      000000000000000000000B6DD7000B6DD700278CEC0058BDFF0058BDFF00278C
      EC00076DD4000000000000000000000000000000000000000000559FF500559F
      F5003879F40060758800BA9E9600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006FB6F3006FB6
      F3001D55F30060758800BCA2A300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000030B2D9004BBE
      DC00ACE4F800AFE8F900AFE8F9006CC9E4001895BC0062C1DE0095E0F70095E0
      F70033B3DA000000000000000000000000000000000000000000000000000000
      000000000000005F78001277E6003FA5FA002288E0003BA0EE0045ABFF00379C
      FF000268D000000000000000000000000000000000000000000000000000559F
      F500559FF5003879F400656F7700000000009F928D00C59F9700D3B5A900CFAA
      9F00000000000000000000000000000000000000000000000000000000006FB6
      F3006FB6F3006A93D500656F77000000000089878900C6A49F00D3B4A800CDA6
      9D0000000000000000000000000000000000000000000000000037B4DA004BBE
      DC00AFE8F900AFE8F900AFE8F900AFE8F90062C1DE0076CFE90097E0F80095E0
      F70033B3DA000000000000000000000000000000000000000000000000000000
      0000118413001B9A2D0000637500288EEE0058BDFF00187EE0002186EE00379C
      FF000268D0000000000000000000000000000000000000000000000000000000
      0000559FF500D0D0D1009F928D00AD9A9200FAEFC800FDF9DA00FDF9DA00FDF9
      DA00F4D6B200D1ADA10000000000000000000000000000000000000000000000
      00006FB6F3009EBBE10089878900BCA2A300EDE7D300FAF4D400FAF4D400FAF4
      D400E2DACC00D2AEA2000000000000000000000000000000000030B2D9004BBE
      DC0062C1DE006CC9E40066C6E20066C6E2006FCBE60084DAF2009EE1F900A1E3
      F90033B3DA000000000000000000000000000000000000000000000000000672
      0A00128921004BE47E0036BA510000635F002186EE00379CFF001177DE001C82
      E900076DD4000000000000000000000000000000000000000000000000000000
      000000000000CFBDB700D6B9AB00FBEDC400FCF8D700FDF9DA00FDF9DA00FDFA
      DF00FDFAE300F4F1DF00B49C9500000000000000000000000000000000000000
      000000000000D5B9AD00D5B9AD00FCEFC500FAF4D4009EBBE10066A3E700EDE7
      D300F9F5DB00F6F2D900898789000000000000000000000000002BB1D80076CF
      E9001895BC001897BE0081D7F0004BBEDC0027AFD7001BA8D1002BB1D80079D2
      EC0037B4DA000000000000000000000000000000000000000000000000000978
      0E002EC65C00249D380044DD65001296110000605300197EEA00379CFF000A70
      D800076DD4000000000000000000000000000000000000000000000000000000
      000000000000C59D9500F7E0B200F8E2B200FCF6D400FDF9DA00FDF9E100FDFA
      E300FDFAE300FDFAE300F2D0B400000000000000000000000000000000000000
      000000000000C6A49F00FCE6C200FCE6C200FCF4CB0088B9EC000734FB00DDD5
      CC00F9F5DB00F9F5DB00D8CCC5000000000000000000000000000000000030B2
      D9004BBEDC0076CFE90097E0F80089DDF40051C0DE00159FC9001597BF0016A4
      CD0016A4CD000000000000000000000000000000000000000000000000000978
      0E002EC65C001A9E35000C851300059F070001840100006053001277E600076D
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000D6B9AB00F8E2B200AD9A920063A8F1004584F3004584F3004584
      F3005DA2F200DFE0D700FBF4D100C79F96000000000000000000000000000000
      000000000000D5B9AD00FCECC100B6A9B3006998D8003849F5000734FB0066A3
      E7007FB9F000E8DFCE00F3EED600C6A49F000000000000000000000000000000
      0000000000000000000055C1DE004BBEDC004BBEDC00179BC3001597BF0016A4
      CD0016A4CD000000000000000000000000000000000000000000000000000978
      0E0027B84C0018A32E0007800C00037A0500059F0700037A0500026C5B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F2C9B400F8E2B200356DF7002749FC002749FC002749FC002749
      FC002749FC00CBC8CC00FCF8D700CDA59A000000000000000000000000000000
      000000000000D7BFB200FCECC1006C91D0000734FB000734FB000734FB000734
      FB000734FB009EBBE100FAF4D400C6A49F000000000000000000000000000000
      00000000000000000000000000000000000000000000179BC3001597BF000000
      0000000000000000000000000000000000000000000000000000000000001289
      21000D881900088C0D0001840100037A0500006E0000006E00000000000011EE
      ED0000CCFF000000000000000000000000000000000000000000000000000000
      000000000000D6B9AB00F9E5B700CEA79C00D1B0A50063A8F10063A8F10063A8
      F100D0D0D100F0EFDE00FBF4D100CBA297000000000000000000000000000000
      000000000000D7BFB200FCECC100CEA79D00B6A9B30064A1E2000734FB0096BB
      E600DAD1CB00F6F2D900F6F2D900C6A49F000000000000000000000000000000
      00001895BC001895BC00000000000000000000000000179BC3001895BC000000
      00000000000000000000000000000000000000000000000000001D932E0033C3
      4E00047607000065000000650000006E00000065000000000000000000000000
      000011EEED0000CCFF0000000000000000000000000000000000000000000000
      000000000000C79F9600FBEDC400FBEDC400F4D6B200F2D0B400F9E5B700FCF6
      D400FCF6D400FDF9DA00F4D9B100000000000000000000000000000000000000
      000000000000CBA69D00FCEFC500FCECC100FCE6C2006F88C1000734FB00DAD1
      CB00FAF4D400F9F5DB00E2DACC00000000000000000000000000000000000000
      000030B2D900159FC900000000000000000000000000159FC9001895BC000000
      000000000000000000000000000000000000000000001080190036CF5400088C
      0D00006500000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6B9AB00FDFAE300FDFAE300F2C9B400F3BFBB00F2D0
      B400F9E5B700FBF3CD00BF9E9600000000000000000000000000000000000000
      00000000000000000000D7BFB200F9F5DB00F9F5DB00D3B4A800BCA2A300D7BF
      B200FCE6C200FCF4CB00BCA2A300000000000000000000000000000000000000
      000046B9DA0072CDE800000000000000000000000000179BC3001597BF000000
      000000000000000000000000000000000000006E0000046E0800047607000065
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CDBFBD00F4F1DF00FBEDC400F8E2B200F9E5
      B700F5DDB100D1ADA10000000000000000000000000000000000000000000000
      0000000000000000000000000000D7BFB200F6F2D900FCECC100FCECC100FCEC
      C100FCDBC700D0ABA00000000000000000000000000000000000000000000000
      00000000000059C1DE0079D2EC0046B9DA003DB5DA001BA8D100000000000000
      000000000000000000000000000000000000148E2800006E0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBA29700CFAA9F00D6B9AB00D6B9
      AB00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBA69D00D0ABA000D7BFB200D5B9
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000055C1DE0055C1DE0046B9DA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A667C00BE9596000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006666660066666600666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC6802000000000000000000000000009C3B0C009C3B0C009C3B0C009C3B
      0C009C3B0C00000000000000000000000000000000000000000000000000189D
      C60048BDDE0060C6E10051C1E0003CB9DC004DBFDF0000000000000000000000
      0000000000000000000000000000000000006B9CC3001E89E8004B7AA300C896
      9300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000E80AA000E80
      AA0066666600FDFEFD00D6CCCB00D6CCCB006666660000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC680200CC680200CC680200CD6904009C3B0C00F89A9400EBA15E00DA84
      2C009C3B0C0000000000000000000000000000000000000000001EA2CA0022A5
      CE007ED2EC00A2E1F90098DCF80091DBF7007BD1EB0075CFE80048BDDE000000
      0000000000000000000000000000000000004BB4FE0051B5FF002089E9004B7A
      A200C69592000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000078DBB0049D5EE0023D7
      FE0066666600B0ACAC00FDFEFD00D6CCCB006666660000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC6802000000000000000000000000009B3A0C009C3B0C009C3A0C009B3A
      0C009C3B0C00000000000000000000000000000000000000000022A5CE002DAD
      D40086D6F000A2E1F90091DBF70082D3ED0059C5E10091DBF70098DCF80075CF
      E800000000000000000000000000000000000000000051B7FE0051B3FF001D87
      E6004E7AA000CA97920000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE0058585800B9B7B600F2F0EF009A97960066666600666666000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC6802000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002DADD40037B7
      DB0094DCF700B3E9FB00A2E1F90060C6E100169AC4006ECBE50094DCF70098DC
      F80034B1D700000000000000000000000000000000000000000051B7FE004EB2
      FF001F89E6004E7BA200B9949700000000000000000000000000000000000000
      000000000000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF0058585800BFBEBE00F2F0F000CDC9C700D6CCCB006666
      6600666666006666660066666600000000000000000000000000000000000000
      0000CC6802000000000000000000000000009C3B0C009C3B0C009C3B0C009C3B
      0C009C3B0C00000000000000000000000000000000000000000036B5DA0041BA
      DD00B1E5F900B8EBFB00B6EBFB0082D3ED001496C00065C8E20094DCF70094DC
      F70034B1D70000000000000000000000000000000000000000000000000052B8
      FE004BB1FF002787D9005F6A760000000000B0857F00C09F9400C09F9600BC98
      8E0000000000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0058585800C2C1C100F2F0EF00E0DCDC00E9E2
      E100C0B9B700A69F9D00C2B6B400666666000000000000000000000000000000
      0000CC680200CC680200CC680200CC6802009C3B0C00F89A9400EBA15E00DA84
      2C009C3B0C0000000000000000000000000000000000000000003CB9DC0048BD
      DE00B8EBFA00B8EBFB00B8EBFB00B3E9FB0060C6E10082D3ED009CDEF80094DC
      F70034B1D7000000000000000000000000000000000000000000000000000000
      000055BDFF00B5D6ED00BF9D9200BB9B8C00E7DAC200FFFFE300FFFFE500FDFA
      DA00D8C3B300B58D85000000000000000000078DBB00B3FCFE00B6F6FF00C6F5
      FF00E2F9FE00EBFBFF00E2F9FE00AFE4F30058585800C2C1C100F2F0F000C2C1
      C10066666600BFBEBE00B9ADAB00666666000000000000000000000000000000
      0000CC6802000000000000000000000000009B3A0C009C3B0C009C3A0C009B3A
      0C009C3B0C00000000000000000000000000000000000000000034B3D80048BD
      DE0060C6E10065C8E20065C8E20060C6E1006ECBE50086D6F000A2E1F900A2E1
      F90034B1D7000000000000000000000000000000000000000000000000000000
      00000000000000000000CEA79500FDEEBE00FFFFD800FFFFDA00FFFFDB00FFFF
      E600FFFFFB00EADDDC00AE837F0000000000078DBB00BAEEF60030BCDD0011A7
      D200129FCB0020A2CB0035A7CD002692BF0058585800BFBEBE00D6CCCB006666
      6600BFBEBE00666666009A979600666666000000000000000000000000000000
      0000CC6802000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000034B1D70059C5
      E10041BADD0048BDDE0048BDDE0037B7DB004DBFDF0075CFE8009CDEF80086D6
      F00028A8CF000000000000000000000000000000000000000000000000000000
      00000000000000000000C1A09100FBDCA800FEF7D000FFFFDB00FFFFE300FFFF
      F800FFFFFD00FFFFFD00C6A99C0000000000078DBB004AC5DD0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E30058585800C2C1C10066666600D6CC
      CB0066666600000000009A979600666666000000000000000000000000000000
      0000CC6802000000000000000000000000009C3B0C009C3B0C009C3B0C009C3B
      0C009C3B0C00000000000000000000000000000000000000000034B1D70060C6
      E100169AC4003CB9DC008FDCF60059C5E10036B5DA00189DC6002CABD10051C1
      E00022A5CE000000000000000000000000000000000000000000000000000000
      000000000000C1A09100FEE3AC00F1C49100FCF2CA00FFFFDD00FFFFE400FFFF
      F700FFFFF700FFFFE900EEE5CB00B9948C00078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E30058585800C2C1C100D5D2D100E0DC
      DC009A9796009D989700B9B7B600666666000000000000000000000000000000
      0000CC680200CC680200CC680200CC6802009C3B0C00F89A9400EBA15E00DA84
      2C009C3B0C000000000000000000000000000000000000000000000000001196
      C0001196C0002DADD4008FDCF6008FDCF60048BDDE001196C000169AC40022A5
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000C2A19100FFE6AE00EEB58100F7DCAE00FEFDD800FFFFDF00FFFF
      E300FFFFE400FFFFE000F3ECD200BB968E00078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E300089DCF0066666600666666006666
      6600666666006666660066666600000000000000000000000000000000000000
      0000CC6802000000000000000000000000009B3A0C009C3B0C009C3A0C009B3A
      0C009C3B0C000000000000000000000000000000000000000000000000000000
      0000169AC400169AC400000000003CB9DC0022A5CE001196C0001196C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BC978C00FBE7B700F4C79100F2C99400F8E5B900FEFCD800FFFF
      DD00FFFFDC00FFFFE000E2D2BA00B68E8600078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E300089DCF000E80AA00000000000000
      00000000000000000000000000000000000000000000000000009C3B0C009C3B
      0C009C3B0C009C3B0C009C3B0C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000051C1E000189DC6000000000000000000000000001196C0001196C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D9C3A900FFFEE500F7DCB800F2C99400F5D4A500FAE8
      BD00FDF4C900FDFBD600B690890000000000078DBB0091FCFE0082F8FF006FF8
      FF007AFEFF0091FCFE00A0FCFE0063DAF5000DA2D4000E80AA00000000000000
      00000000000000000000000000000000000000000000000000009C3B0C00F89A
      9400EBA15E00DA842C009C3B0C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000028A8CF007BD1EB002CABD100000000001496C000189DC600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B58D8500E8DEDD00FFFEF200F9D8A300F4C48C00F9D4
      9F00FDEAB800D0B49F00B890860000000000078DBB00FDFEFD00F4FFFF00D3FF
      FF00B3FCFE00B3FCFE00ADFFFF00ADFFFF006FF8FF000E80AA00000000000000
      00000000000000000000000000000000000000000000000000009B3A0C009C3B
      0C009C3A0C009B3A0C009C3B0C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000048BDDE007BD1EB006ECBE50048BDDE00169AC400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD827F00C9AA9E00EFE0B700EFDFB200E7CE
      AC00B8908600B89086000000000000000000000000000C92C000F4FFFF00E2F9
      FE00C7FFFF00ADFFFF00A0FCFE009BFBFC001385AF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA968A00BB988C00B791
      8800000000000000000000000000000000000000000000000000078DBB00078D
      BB00078DBB00078DBB00078DBB00078DBB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      000099330000993300009933000099330000993300009933000099330000AD48
      0900000000000000000000000000000000000000000000000000000000000000
      000000650000006400000063000000620000006200000062000000630000006B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000732DE000732DE000000000000000000000000000000
      00000000000000000000000000000000000000000000A3310000A3310000A331
      0000A3310000A3310000A3310000B13F0200000000000000000099330000BD4E
      1200E15D3900F2634B00F6654F00F76E5500F0755300CD552800F5654F00DD5C
      3A00993300000000000000000000000000000000000000000000000000000062
      0000006C0000008A000000980000009A00000CA9180022BC460000790000009D
      000000630000006D00000000000000000000000000000732DE000732DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000732DE000732DE00000000000000000000000000000000000000
      0000000000000000000000000000AC3B0000A3310000FF684D00DD613100FF7C
      5600FF816900FF6A5500EA5D2E00A3310000000000000000000099330000C551
      1A00E65E3E00F4664E00FA7F6000FB886600D4683800BC6A3700DB613900EA61
      4700CC5835009933000000000000000000000000000000000000000000000062
      000000710000008C00000099010025BF4B0036D26F0015973100428940000182
      080000930000007C00000065000000000000000000000732DE000732DE000732
      DE00000000000000000000000000000000000000000000000000000000000000
      00000732DE000732DE0000000000000000000000000000000000000000000000
      0000000000000000000000000000A3310000E5644300EA663700F0C8AD00E57A
      4900FF8F6A00FF8F6A00F1603900A3310000000000000000000099330000CD54
      2300EB654600FA866400FB886600F1805A00BC632E00FAF4F000C1582000EE73
      5400C35530009933000000000000000000000000000000000000000000000062
      000000770000019201002CC65A0036D06D002FC963001A751900FFFFFF000478
      11001DB43D00007500000064000000000000000000000732DE000732DD000732
      DE000732DE000000000000000000000000000000000000000000000000000732
      DE000732DE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A3310000DF674000FC754000FFE8D900E3B9
      9D00E76F3C00FF895E00A3310000000000000000000000000000AD4809009933
      0000F4795800FB886600FB886600C1582000E5C6B200FFFFFF00C1582000FB88
      6600C15931009933000000000000000000000000000000000000074C75000000
      0000006200001FB43D0037D36E0035D26B0007801200BFD6B800FFFFFF000278
      0C0036D570000D851900006400000000000000000000000000000534ED000732
      DF000732DE000732DE00000000000000000000000000000000000732DE000732
      DE00000000000000000000000000000000000000000000000000006900000069
      000000690000006900000069000000690000A3310000945542004C77A7005089
      CF0045649100574D54000000000000000000000000000000000000000000AD48
      090099330000E8784F00AB603F0098766000C1D1DB00C1BAB600CA602C00FB88
      6600A9421100AD480B0000000000000000000000000000000000426A8700043B
      5B00000000000062000021AB3D0011872A001E6546008CA6BB008BA8B4000881
      190037D86E00148F270000640000000000000000000000000000000000000000
      00000732DE000732DE000732DD00000000000732DD000732DE000732DE000000
      000000000000000000000000000000000000000000000069000000890000009A
      00000DB01F0014AA3100008500000095000005602100125FB6001A7CF4002087
      FE002393FF00187DE3000B3E6800000000000000000000000000000000000000
      00002E383F001C496600145DA0001D69C1001A63B80012579B0026517300963A
      0A00AD4809000000000000000000000000000000000000000000426A8700043B
      5B000000000000000000004B3D000F559C001A65C0001F6CDA00145CB9000548
      7800005B0A000063000000000000000000000000000000000000000000000000
      0000000000000732DD000633E6000633E6000633E9000732DC00000000000000
      0000000000000000000000000000000000000000000000690000009500001CC3
      3C0032E0720038A44A0060AA610000950D0004636C002A8CFF0037A3FF003CAB
      FF003CABFF0040B1FF00207BCC00003054000000000000000000000000000333
      51000B436F002B83E4002E8BF0002E8AEF002C85EB00297DE400226FD4000B4F
      8200000000000000000000000000000000000000000000000000426A8700043B
      5B000341630006416A002379D1003292FD003090F9002D8CF3002B82ED002574
      E00008487C000000000000000000000000000000000000000000000000000000
      000000000000000000000633E3000732E3000534EF0000000000000000000000
      000000000000000000000000000000000000055167000066000014AD26003DEC
      780014AA3100BFD8B300A7D5A3000DAD4600146AAC003CABFF0040B1FF0048B8
      FF0048B8FF0048B8FF003291E200013B61000000000000000000000000000639
      5C002E8BE300379CFA00399EFB00389EFA00369BFA003293F5002C86EB001C69
      BD00000000000000000000000000000000000000000000000000426A8700074C
      7500034061002983D3002E86D6003CA4FF003BA2FE00389EFC003599FB002F8D
      F6001A5C91000000000000000000000000000000000000000000000000000000
      0000000000000732DD000534ED000533E9000434EF000434F500000000000000
      000000000000000000000000000000000000315C8700004A350002700A001291
      3700126956007D9DD60040867B0014A53F000E67870039A7FF0048B8FF004FC1
      FF0053C8FF001A669B0000426A00013B6100000000000000000003335100175C
      91003DA3FB0040A7FB0042A8FB0041A8FB003FA5FB003AA0FB003498F8002C87
      EC000E5489000000000000000000000000000000000000000000426A8700043B
      5B00105788002982CA0023669A0044ADFF0043ABFD0041A8FC003DA3FC00379D
      FE002E8CF1001057900000000000000000000000000000000000000000000000
      00000434F4000534EF000533EB0000000000000000000434F4000335F8000000
      000000000000000000000000000000000000315C8700013B6100000000001468
      B300267FFA001D7DFB001567DD00014D5C0000000000247DC30040B1FF0043AA
      F5003188C600105C890000A1DB0000426A00000000000000000003335100216C
      A60043AAFB0046ADFC0047AFFC0047AEFC0045ACFB0041A8FB003BA1FB003295
      F7000D538700000000000000000000000000000000000000000006446800074A
      710010598800083B5D003784C0004CB6FF004AB3FF0047AFFE0043AAFC003DA5
      FE00379DFF001057900000000000000000000000000000000000000000000335
      FC000534EF000434F800000000000000000000000000000000000335FC000335
      FB000000000000000000000000000000000038668A00003D65001E72C4003598
      FF0040B1FF0039A7FF003598FF001D6AC2000000000002395F00094C79000D51
      7F002561870000A1DB000E598100000000000000000000000000033351000333
      5100043B5C00195B86004AB2FC004AB2FC0049B0FC0045ACFB003FA6FB003192
      E8000E5489000000000000000000000000000000000000000000063D5E000749
      7000065B8800083B5D0026659100256490003E93CF004BB2FC0048B0FF0043AA
      FF003CA5FF000F486700000000000000000000000000000000000335FB000335
      FB000335FC000000000000000000000000000000000000000000000000000335
      FB000335FB0000000000000000000000000022547900054A7B001B69A8003A94
      DC004FC1FF0040B1FF0040B1FF003598FF000A508F0000000000002D4E00002F
      5200093C5F000F45680000000000000000000000000000000000033351000661
      8D00065E890015537C004CB4FC004CB4FC004AB2FC0047AFFC0042A9FB001560
      9B000E5489000000000000000000000000000000000000000000063F5F00064D
      7400076B9D000283B300083B5D00083B5D000C4B72003F96D3004CB5FF0047B0
      FF001A5C91000F4867000000000000000000000000000335FB000335FB000335
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000335FB000000000000000000013B61000555860000426A003077
      B000419EE2004FC1FF0048B8FF003CABFF00013B610000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000333
      51001177A30013557700124C72002874A7003993D1003690D1002F86C8000845
      6B00000000000000000000000000000000000000000000000000064061000469
      9400066EA1000283B3000283B30007507900054C74000C4B71003992D400328D
      D200044264000F48670000000000000000000335FB000335FB000335FB000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000426A0000A1DB00017DB2000F45
      6800094671003A94DC0053C8FF001869A1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000333
      5100033351005398B7003E799A001A597E0007456B0006426600033554000333
      510000000000000000000000000000000000000000000000000000000000083B
      5D00055A83000676AB00076EA200035378000353780003537800035378000359
      8200033351000000000000000000000000000335FB000335FB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014F78000360920000A1DB0000A1
      DB00014F7800075481002180C0000D517F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000333510003335100033351000333510003355400033351000000
      0000000000000000000000000000000000000000000000000000000000000000
      000006406000063D5C00063E5F000000000004527800024A6D0005476B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000013B6100014F78000348
      730000000000054A7B0002395F00000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00F8FFFFFF00000000F01FFFFF00000000
      E003000100000000C00000010000000080000001000000008000000100000000
      8000000100000000800000010000000080000001000000008000000100000000
      80010001000000008003000100000000C007000100000000E01F000100000000
      F01F800300000000F93FFFFF00000000F8FFFFFFF81FFE3FF01FC007E007E007
      E0038003C003E007C00080038001800380008003800180018000800300008001
      800080030000800180008003000080018000800300008001800080030000C003
      800180030000E007800380038001F81FC00780038001F81FE01F8003C003F81F
      F01FC007E007F81FF93FFFFFF81FFC3FFFFD9FFF9FFFE07FFFF00FFF0FFFC01F
      CFE107FF07FFC00FE60383FF83FFC007FC07C1FFC1FFC007F807E10FE10FC007
      F007F003F003C007E007F801F801C007E007F801F801E007E00FF800F800FC07
      E01FF800F800FF9FE027F800F800F39FC073F801F801F39F87FFFC01FC01F39F
      0FFFFE03FE03F83F3FFFFF0FFF0FFC7FFFFFFFFF9FFFF8FFF707E07F0FFFC07F
      F007C01F07FF807FF707C00F83FF001FF7FFC007C1FF0001F707C007E10F0000
      F007C007F0030000F707C007FC010000F7FFC007FC010004F707C007F8000000
      F007E00FF8000001F707F21FF800003FC1FFF39FFC01003FC1FFF13FFC01003F
      C1FFF83FFE03807FFFFFFFFFFF8FC0FFE00FF00FFFFCFF80C007E0039FF9FE00
      C003E0018FF3FE00C003E00187E7FE01C003D001C3CFC003E003C801F11F8001
      F007CC03F83F8000E00FC007FC7F0000E00FC007F83F0000C007C003F19F2080
      C007C003E3CF0081C007C003C7E70043C007C0038FFB007FE00FC0031FFF00FF
      E00FE0073FFF00FFF81FF11FFFFF89FF00000000000000000000000000000000
      000000000000}
  end
  object cdsGroups: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 274
    Top = 94
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 96
  end
  object cdsResources: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 98
  end
  object cdsUserResource: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 98
  end
end
