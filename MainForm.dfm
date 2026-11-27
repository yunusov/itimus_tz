object frmAutorize: TfrmAutorize
  Left = 1062
  Top = 609
  BorderStyle = bsDialog
  Caption = #1040#1081#1090#1080#1084#1091#1089' '#1058#1047
  ClientHeight = 228
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object leUsername: TLabeledEdit
    Left = 8
    Top = 40
    Width = 243
    Height = 23
    EditLabel.Width = 102
    EditLabel.Height = 15
    EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    TabOrder = 0
    Text = ''
  end
  object lePassword: TLabeledEdit
    Left = 8
    Top = 93
    Width = 243
    Height = 23
    EditLabel.Width = 42
    EditLabel.Height = 15
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
  end
  object bCancel: TButton
    Left = 176
    Top = 195
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = bCancelClick
  end
  object bConnect: TButton
    Left = 8
    Top = 195
    Width = 75
    Height = 25
    Caption = #1057#1086#1077#1076#1080#1085#1080#1090#1100
    ModalResult = 1
    TabOrder = 3
    OnClick = bConnectClick
  end
  object bOpenDialog: TButton
    Left = 218
    Top = 151
    Width = 33
    Height = 25
    Caption = '...'
    TabOrder = 4
    OnClick = bOpenDialogClick
  end
  object lePathDB: TLabeledEdit
    Left = 8
    Top = 152
    Width = 209
    Height = 23
    EditLabel.Width = 91
    EditLabel.Height = 15
    EditLabel.Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091' '#1041#1044
    TabOrder = 5
    Text = ''
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'fdb'
    Filter = 'fdb|*.fdb'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083' '#1041#1044
    Left = 144
    Top = 64
  end
end
