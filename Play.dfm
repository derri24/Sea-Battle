object PlayForm: TPlayForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1052#1086#1088#1089#1082#1086#1081' '#1073#1086#1081
  ClientHeight = 485
  ClientWidth = 792
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
  object TextLabel2: TLabel
    Left = 8
    Top = 48
    Width = 149
    Height = 23
    Caption = #1055#1086#1083#1077' '#1080#1075#1088#1086#1082#1072' 1:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TextLabel3: TLabel
    Left = 400
    Top = 48
    Width = 152
    Height = 23
    Caption = #1055#1086#1083#1077' '#1080#1075#1088#1086#1082#1072' 2:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TextLabel1: TLabel
    Left = 7
    Top = 8
    Width = 150
    Height = 23
    Caption = #1054#1095#1077#1088#1077#1076#1100' '#1093#1086#1076#1072': '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FirstSquareGrid: TStringGrid
    Left = 8
    Top = 77
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
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 0
    OnSelectCell = FirstSquareGridSelectCell
    RowHeights = (
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30)
  end
  object SecondSquareGrid: TStringGrid
    Left = 400
    Top = 77
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
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 1
    OnSelectCell = SecondSquareGridSelectCell
  end
  object ExitButton: TButton
    Left = 8
    Top = 439
    Width = 120
    Height = 38
    Caption = #1057#1076#1072#1090#1100#1089#1103
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = ExitButtonClick
  end
end
