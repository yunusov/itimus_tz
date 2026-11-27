object dm: Tdm
  OnCreate = DataModuleCreate
  Height = 340
  Width = 319
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    DriverID = 'FB'
    Embedded = True
    Left = 176
    Top = 16
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'CharacterSet=WIN1251')
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    Left = 56
    Top = 16
  end
  object dsPerson: TDataSource
    DataSet = spPerson
    OnDataChange = dsPersonDataChange
    Left = 136
    Top = 88
  end
  object dsType: TDataSource
    DataSet = spType
    Left = 136
    Top = 168
  end
  object dsContact: TDataSource
    DataSet = spContact
    Left = 136
    Top = 240
  end
  object spPerson: TFDStoredProc
    BeforePost = spPersonBeforePost
    Connection = FDConnection
    StoredProcName = 'SP_GET_PERSONS'
    Left = 64
    Top = 88
    ParamData = <
      item
        Name = 'P_SEX'
        DataType = ftBoolean
        FDDataType = dtBoolean
        ParamType = ptInput
      end
      item
        Name = 'P_AGE'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptInput
      end
      item
        Name = 'P_FIO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'P_CONTACT_DATA'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object spContact: TFDStoredProc
    BeforeOpen = spContactBeforeOpen
    Connection = FDConnection
    StoredProcName = 'SP_GET_CONTACTS'
    Left = 64
    Top = 240
    ParamData = <
      item
        Name = 'P_PERSON_ID'
        ParamType = ptInput
      end>
  end
  object spType: TFDStoredProc
    BeforeOpen = spTypeBeforeOpen
    Connection = FDConnection
    StoredProcName = 'SP_GET_TYPES'
    Left = 64
    Top = 168
  end
end
