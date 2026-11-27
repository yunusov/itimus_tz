object frmPerson: TfrmPerson
  Left = 1008
  Top = 582
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1086#1085#1090#1072#1082#1090#1086#1074
  ClientHeight = 606
  ClientWidth = 1067
  Color = clBtnFace
  Constraints.MinHeight = 665
  Constraints.MinWidth = 840
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 281
    Top = 0
    Height = 606
    ExplicitLeft = 250
  end
  object Panel2: TPanel
    Left = 883
    Top = 0
    Width = 184
    Height = 606
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 640
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 182
      Height = 424
      Align = alTop
      Caption = #1055#1077#1088#1089#1086#1085#1072
      TabOrder = 0
      object lDob: TLabel
        Left = 8
        Top = 179
        Width = 164
        Height = 15
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' ('#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077')*'
      end
      object lSex: TLabel
        Left = 8
        Top = 299
        Width = 28
        Height = 15
        Caption = #1055#1086#1083'*'
      end
      object leName: TLabeledEdit
        Left = 8
        Top = 40
        Width = 121
        Height = 23
        EditLabel.Width = 29
        EditLabel.Height = 15
        EditLabel.Caption = #1048#1084#1103'*'
        TabOrder = 0
        Text = ''
      end
      object leSurname: TLabeledEdit
        Left = 8
        Top = 89
        Width = 121
        Height = 23
        EditLabel.Width = 56
        EditLabel.Height = 15
        EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103'*'
        TabOrder = 1
        Text = ''
      end
      object leSecName: TLabeledEdit
        Left = 8
        Top = 142
        Width = 121
        Height = 23
        EditLabel.Width = 51
        EditLabel.Height = 15
        EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        TabOrder = 2
        Text = ''
      end
      object dpDob: TDatePicker
        Left = 8
        Top = 200
        Width = 121
        Height = 25
        Date = 46352.000000000000000000
        DateFormat = 'dd.mm.yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 3
      end
      object leAge: TLabeledEdit
        Left = 8
        Top = 266
        Width = 121
        Height = 23
        Hint = #1041#1086#1083#1100#1096#1077' '#1080#1083#1080' '#1088#1072#1074#1085#1086' '#1083#1077#1090
        EditLabel.Width = 87
        EditLabel.Height = 15
        EditLabel.Caption = #1042#1086#1079#1088#1072#1089#1090' ('#1087#1086#1080#1089#1082')'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = ''
        OnKeyPress = leAgeKeyPress
      end
      object cbSex: TComboBox
        Left = 8
        Top = 320
        Width = 121
        Height = 23
        Style = csDropDownList
        TabOrder = 5
        Items.Strings = (
          ''
          #1052#1059#1046'.'
          #1046#1045#1053'.')
      end
      object bAddPerson: TButton
        Left = 9
        Top = 357
        Width = 75
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 6
        OnClick = bAddPersonClick
      end
      object Button1: TButton
        Left = 89
        Top = 357
        Width = 75
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 7
        OnClick = lDeletePersonClick
      end
      object bAllUsers: TButton
        Left = 88
        Top = 388
        Width = 75
        Height = 25
        Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072
        Caption = #1057#1073#1088#1086#1089
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = bAllUsersClick
      end
      object bSearch: TButton
        Left = 8
        Top = 388
        Width = 75
        Height = 25
        Caption = #1048#1089#1082#1072#1090#1100
        TabOrder = 9
        OnClick = bSearchClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 425
      Width = 182
      Height = 180
      Align = alClient
      Caption = #1050#1086#1085#1090#1072#1082#1090
      TabOrder = 1
      object leContactData: TLabeledEdit
        Left = 8
        Top = 40
        Width = 121
        Height = 23
        EditLabel.Width = 48
        EditLabel.Height = 15
        EditLabel.Caption = #1044#1072#1085#1085#1099#1077'*'
        TabOrder = 0
        Text = ''
      end
      object bAddContactData: TButton
        Left = 8
        Top = 77
        Width = 75
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        OnClick = bAddContactDataClick
      end
      object bDeleteConData: TButton
        Left = 89
        Top = 77
        Width = 75
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 2
        OnClick = bDeleteConDataClick
      end
    end
  end
  object gPerson: TDBGrid
    Left = 284
    Top = 0
    Width = 599
    Height = 606
    Align = alClient
    DataSource = dm.dsPerson
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SURNAME'
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECOND_NAME'
        Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEX'
        Title.Caption = #1055#1086#1083
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOB'
        Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 114
        Visible = True
      end>
  end
  object gContact: TDBGrid
    Left = 0
    Top = 0
    Width = 281
    Height = 606
    Align = alLeft
    DataSource = dm.dsContact
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'VAL'
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1058#1080#1087
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 584
    Top = 48
    object Nbgs1: TMenuItem
      Caption = #1052#1077#1085#1102
      object N2: TMenuItem
        Caption = #1058#1080#1087#1099' '#1082#1086#1085#1090#1072#1082#1090#1086#1074
        OnClick = bContactTypesClick
      end
      object N1: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        Default = True
        OnClick = N1Click
      end
    end
  end
end
