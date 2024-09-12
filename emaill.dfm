object SMTP_SV: TSMTP_SV
  Left = 308
  Top = 241
  BorderStyle = bsDialog
  Caption = #1045#1084#1072#1081#1083#1077#1088#1080#1082' 1.03'
  ClientHeight = 321
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzMarqueeStatus2: TRzMarqueeStatus
    Left = 0
    Top = 301
    Width = 577
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = RzMarqueeStatus2Click
    Caption = #1057#1072#1081#1090' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1072': www.svadmsv.narod.ru'
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 577
    Height = 301
    ActivePage = TabSheet1
    Align = alClient
    ParentColor = False
    ShowFocusRect = False
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = #1054#1090#1087#1088#1072#1074#1082#1072' 1 '#1087#1080#1089#1100#1084#1072
      object RzLabel1: TRzLabel
        Left = 0
        Top = 15
        Width = 22
        Height = 13
        Caption = #1048#1084#1103
      end
      object RzLabel2: TRzLabel
        Left = 168
        Top = 16
        Width = 35
        Height = 13
        Caption = #1044#1086#1084#1077#1085
      end
      object RzLabel3: TRzLabel
        Left = 337
        Top = 16
        Width = 38
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100
      end
      object RzLabel4: TRzLabel
        Left = 0
        Top = 75
        Width = 90
        Height = 13
        Caption = #1050#1086#1084#1091' '#1086#1090#1087#1088#1072#1074#1083#1103#1077#1084
      end
      object RzLabel5: TRzLabel
        Left = 221
        Top = 97
        Width = 66
        Height = 13
        Caption = #1058#1077#1083#1086' '#1087#1080#1089#1100#1084#1072
      end
      object RzLabel12: TRzLabel
        Left = 0
        Top = 48
        Width = 54
        Height = 13
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
      end
      object RzLabel14: TRzLabel
        Left = 406
        Top = 73
        Width = 92
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1087#1080#1081
      end
      object ImiaReg: TRzEdit
        Left = 40
        Top = 8
        Width = 121
        Height = 21
        Text = 'Halvyavka'
        Color = clInactiveCaptionText
        TabOrder = 0
      end
      object PassReg: TRzEdit
        Left = 376
        Top = 8
        Width = 121
        Height = 21
        Text = 'qwerty'
        Color = clInactiveCaptionText
        TabOrder = 1
      end
      object DomenReg: TRzEdit
        Left = 211
        Top = 8
        Width = 121
        Height = 21
        Text = 'narod.ru'
        Color = clInactiveCaptionText
        TabOrder = 2
      end
      object ContentReg: TRzMemo
        Left = 0
        Top = 115
        Width = 573
        Height = 163
        Align = alBottom
        Color = clInactiveCaptionText
        Lines.Strings = (
          #1053#1072#1073#1080#1088#1072#1077#1084' '#1090#1077#1082#1089#1090' '#1082#1086#1090#1086#1088#1099#1081' '#1093#1086#1090#1080#1084' '#1086#1090#1087#1088#1072#1074#1080#1090#1100)
        TabOrder = 3
      end
      object RzEdit4: TRzEdit
        Left = 104
        Top = 69
        Width = 297
        Height = 21
        Text = 'svadmsv@narod.ru'
        Color = clInactiveCaptionText
        TabOrder = 4
      end
      object RzButton2: TRzButton
        Left = 504
        Top = 8
        Width = 65
        Height = 57
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
        TabOrder = 5
        OnClick = RzButton2Click
      end
      object ZagalovokReg: TRzComboBox
        Left = 104
        Top = 40
        Width = 393
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 6
        Text = #1047#1076#1088#1072#1074#1089#1090#1074#1091#1081#1090#1077
        Items.Strings = (
          #1047#1076#1088#1072#1074#1089#1090#1074#1091#1081#1090#1077
          #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
          #1053#1086#1074#1086#1089#1090#1080
          #1056#1072#1089#1089#1099#1083#1082#1072' '#1079#1072#1103#1074#1086#1082)
      end
      object KolCopyReg: TRzSpinEdit
        Left = 504
        Top = 69
        Width = 64
        Height = 21
        Min = 1.000000000000000000
        Value = 1.000000000000000000
        TabOrder = 7
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #1052#1072#1089#1089#1086#1074#1072#1103' '#1086#1090#1087#1088#1072#1074#1082#1072
      object RzLabel6: TRzLabel
        Left = 0
        Top = 24
        Width = 22
        Height = 13
        Caption = #1048#1084#1103
      end
      object RzLabel7: TRzLabel
        Left = 176
        Top = 24
        Width = 35
        Height = 13
        Caption = #1044#1086#1084#1077#1085
      end
      object RzLabel8: TRzLabel
        Left = 377
        Top = 24
        Width = 38
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100
      end
      object RzLabel9: TRzLabel
        Left = 2
        Top = 101
        Width = 151
        Height = 13
        Caption = #1057#1087#1080#1089#1086#1082' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1099#1093' '#1072#1076#1088#1077#1089#1086#1074
      end
      object RzLabel10: TRzLabel
        Left = 32
        Top = 157
        Width = 66
        Height = 13
        Caption = #1058#1077#1083#1086' '#1087#1080#1089#1100#1084#1072
      end
      object RzLabel13: TRzLabel
        Left = 2
        Top = 56
        Width = 54
        Height = 13
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
      end
      object ImiaRegMas: TRzEdit
        Left = 32
        Top = 16
        Width = 121
        Height = 21
        Text = 'Halvy'
        Color = clInactiveCaptionText
        TabOrder = 0
      end
      object DomenRegMas: TRzEdit
        Left = 230
        Top = 16
        Width = 121
        Height = 21
        Text = 'narod.ru'
        Color = clInactiveCaptionText
        TabOrder = 1
      end
      object PassRegMas: TRzEdit
        Left = 432
        Top = 16
        Width = 121
        Height = 21
        Text = '123456'
        Color = clInactiveCaptionText
        TabOrder = 2
      end
      object RzMemo2: TRzMemo
        Left = 0
        Top = 171
        Width = 573
        Height = 107
        Align = alBottom
        Color = clInactiveCaptionText
        Lines.Strings = (
          #1053#1072#1073#1080#1088#1072#1077#1084' '#1090#1077#1082#1089#1090' '#1082#1086#1090#1086#1088#1099#1081' '#1093#1086#1090#1080#1084' '#1086#1090#1087#1088#1072#1074#1080#1090#1100)
        TabOrder = 3
      end
      object SpisEmail: TRzMemo
        Left = 156
        Top = 77
        Width = 289
        Height = 89
        Color = clInactiveCaptionText
        Lines.Strings = (
          'guru@narod.ru'
          'sub@rambler.ru'
          'svekla@mail.ru')
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object RzButton1: TRzButton
        Left = 469
        Top = 48
        Height = 41
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
        TabOrder = 5
        OnClick = RzButton1Click
      end
      object RzButton3: TRzButton
        Left = 470
        Top = 96
        Height = 41
        Caption = #1056#1072#1079#1086#1089#1083#1072#1090#1100' '#1087#1080#1089#1100#1084#1072
        TabOrder = 6
        OnClick = RzButton3Click
      end
      object RzComboBox2: TRzComboBox
        Left = 155
        Top = 48
        Width = 289
        Height = 21
        ItemHeight = 13
        TabOrder = 7
        Text = #1047#1076#1088#1072#1074#1089#1090#1074#1091#1081#1090#1077
        Items.Strings = (
          #1047#1076#1088#1072#1074#1089#1090#1074#1091#1081#1090#1077
          #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
          #1053#1086#1074#1086#1089#1090#1080
          #1056#1072#1089#1089#1099#1083#1082#1072' '#1079#1072#1103#1074#1086#1082)
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'O-o-o-o-O'
      object RzLabel11: TRzLabel
        Left = 222
        Top = 103
        Width = 110
        Height = 24
        Caption = #1055#1086#1082#1072' '#1087#1091#1089#1090#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuHighlight
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzSeparator1: TRzSeparator
        Left = 0
        Top = 128
        Width = 561
        Height = 9
        ShowGradient = True
        Color = clBtnFace
        ParentColor = False
      end
    end
  end
  object idSMTP1: TIdSMTP
    ASCIIFilter = True
    MaxLineAction = maException
    ReadTimeout = 0
    BoundPort = 25
    Port = 25
    AuthenticationType = atLogin
    Left = 368
    Top = 8
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 400
    Top = 8
  end
  object XPManifest1: TXPManifest
    Left = 432
    Top = 8
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 328
    Top = 8
  end
  object RzOpenDialog1: TRzOpenDialog
    Left = 472
    Top = 8
  end
end
