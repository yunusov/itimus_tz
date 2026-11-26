object frmPerson: TfrmPerson
  Left = 1008
  Top = 582
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1086#1085#1090#1072#1082#1090#1086#1074
  ClientHeight = 502
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object gPerson: TDBGrid
    Left = 0
    Top = 41
    Width = 662
    Height = 461
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dm.dsPerson
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 624
    object lDeletePerson: TButton
      Left = 0
      Top = 10
      Width = 33
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1077#1088#1089#1086#1085#1091
      Caption = '-'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = lDeletePersonClick
    end
  end
  object Panel2: TPanel
    Left = 640
    Top = 41
    Width = 184
    Height = 461
    Align = alRight
    TabOrder = 2
    object lSex: TLabel
      Left = 8
      Top = 291
      Width = 23
      Height = 15
      Caption = #1055#1086#1083
    end
    object lDob: TLabel
      Left = 8
      Top = 187
      Width = 159
      Height = 15
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' ('#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077')'
    end
    object leName: TLabeledEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 23
      EditLabel.Width = 24
      EditLabel.Height = 15
      EditLabel.Caption = #1048#1084#1103
      TabOrder = 0
      Text = ''
    end
    object leSurname: TLabeledEdit
      Left = 8
      Top = 88
      Width = 121
      Height = 23
      EditLabel.Width = 51
      EditLabel.Height = 15
      EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
      TabOrder = 1
      Text = ''
    end
    object leSecName: TLabeledEdit
      Left = 8
      Top = 151
      Width = 121
      Height = 25
      EditLabel.Width = 51
      EditLabel.Height = 15
      EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      TabOrder = 2
      Text = ''
    end
    object leAge: TLabeledEdit
      Left = 8
      Top = 262
      Width = 121
      Height = 23
      EditLabel.Width = 87
      EditLabel.Height = 15
      EditLabel.Caption = #1042#1086#1079#1088#1072#1089#1090' ('#1087#1086#1080#1089#1082')'
      TabOrder = 3
      Text = ''
      OnKeyPress = leAgeKeyPress
    end
    object cbSex: TComboBox
      Left = 8
      Top = 312
      Width = 121
      Height = 23
      Style = csDropDownList
      TabOrder = 4
      Items.Strings = (
        ''
        #1052#1059#1046'.'
        #1046#1045#1053'.')
    end
    object bAddPerson: TButton
      Left = 8
      Top = 352
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 5
      OnClick = bAddPersonClick
    end
    object bSearch: TButton
      Left = 8
      Top = 383
      Width = 75
      Height = 25
      Caption = #1048#1089#1082#1072#1090#1100
      TabOrder = 6
      OnClick = bSearchClick
    end
    object dpDob: TDatePicker
      Left = 8
      Top = 208
      Width = 121
      Height = 25
      DateFormat = 'dd.mm.yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 7
    end
  end
end
