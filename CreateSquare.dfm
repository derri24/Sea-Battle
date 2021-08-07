object CreateSquareForm: TCreateSquareForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1052#1086#1088#1089#1082#1086#1081' '#1073#1086#1081
  ClientHeight = 403
  ClientWidth = 568
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TextLabel1: TLabel
    Left = 8
    Top = 8
    Width = 425
    Height = 23
    Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1088#1072#1089#1089#1090#1072#1074#1100#1090#1077' '#1082#1086#1088#1072#1073#1083#1080' '#1085#1072' '#1087#1086#1083#1077':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TextLabel2: TLabel
    Left = 367
    Top = 101
    Width = 173
    Height = 16
    Caption = #1058#1088#1077#1073#1091#1077#1090#1089#1103' '#1088#1072#1089#1089#1090#1072#1074#1080#1090#1100':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Georgia'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object TextLabel3: TLabel
    Left = 367
    Top = 124
    Width = 136
    Height = 15
    Caption = #1063#1077#1090#1099#1088#1105#1093#1087#1072#1083#1091#1073#1085#1099#1077' -'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TextLabel5: TLabel
    Left = 367
    Top = 174
    Width = 111
    Height = 15
    Caption = #1044#1074#1091#1093#1087#1072#1083#1091#1073#1085#1099#1077' -'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TextLabel4: TLabel
    Left = 367
    Top = 149
    Width = 112
    Height = 15
    Caption = #1058#1088#1105#1093#1087#1072#1083#1091#1073#1085#1099#1077' - '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TextLabel6: TLabel
    Left = 367
    Top = 199
    Width = 114
    Height = 15
    Caption = #1054#1076#1085#1086#1087#1072#1083#1091#1073#1085#1099#1077' - '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TextLabel7: TLabel
    Left = 367
    Top = 37
    Width = 107
    Height = 29
    Caption = #1048#1075#1088#1086#1082': 1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SquareGrid: TStringGrid
    Left = 8
    Top = 37
    Width = 353
    Height = 356
    ColCount = 11
    DefaultColWidth = 30
    DefaultRowHeight = 30
    RowCount = 11
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 0
  end
  object ClearButton: TButton
    Left = 367
    Top = 304
    Width = 186
    Height = 33
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = ClearButtonClick
  end
  object ShipButton: TButton
    Left = 367
    Top = 265
    Width = 186
    Height = 33
    Caption = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1082#1086#1088#1072#1073#1083#1100
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = ShipButtonClick
  end
  object OKButton: TButton
    Left = 367
    Top = 343
    Width = 186
    Height = 50
    Caption = #1043#1086#1090#1086#1074#1086
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = OKButtonClick
  end
end
