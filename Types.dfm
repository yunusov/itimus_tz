object frmTypes: TfrmTypes
  Left = 2
  Top = 2
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1080#1087#1086#1074' '#1082#1086#1085#1090#1072#1082#1090#1086#1074
  ClientHeight = 370
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 49
    Align = alTop
    Alignment = taLeftJustify
    TabOrder = 0
    object bAddType: TButton
      Left = 8
      Top = 10
      Width = 33
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1080#1087
      Caption = '+'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bAddTypeClick
    end
    object bDeleteType: TButton
      Left = 47
      Top = 10
      Width = 33
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1080#1087
      Caption = '-'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bDeleteTypeClick
    end
    object leTypeName: TLabeledEdit
      Left = 104
      Top = 20
      Width = 121
      Height = 23
      EditLabel.Width = 85
      EditLabel.Height = 15
      EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1080#1087#1072'*'
      TabOrder = 2
      Text = ''
    end
  end
  object gType: TDBGrid
    Left = 0
    Top = 49
    Width = 427
    Height = 321
    Align = alTop
    DataSource = dm.dsType
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1048#1084#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 126
        Visible = True
      end>
  end
end
