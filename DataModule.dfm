object dm: Tdm
  OnCreate = DataModuleCreate
  Height = 339
  Width = 295
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
    DataSet = qPerson
    OnDataChange = dsPersonDataChange
    Left = 136
    Top = 88
  end
  object qPerson: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select *'
      'from SP_GET_PERSONS(:SEX, :AGE, :FIO, :CONDATA)')
    Left = 64
    Top = 88
    ParamData = <
      item
        Name = 'SEX'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'AGE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'FIO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CONDATA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object qType: TFDQuery
    MasterSource = dsContact
    Connection = FDConnection
    SQL.Strings = (
      'select *'
      'from SP_GET_TYPES')
    Left = 64
    Top = 168
  end
  object dsType: TDataSource
    DataSet = qType
    Left = 136
    Top = 168
  end
  object dsContact: TDataSource
    DataSet = qContact
    Left = 136
    Top = 240
  end
  object qContact: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select *'
      'from SP_GET_CONTACTS(:P_PERSON_ID)')
    Left = 64
    Top = 240
    ParamData = <
      item
        Name = 'P_PERSON_ID'
        ParamType = ptInput
      end>
  end
end
