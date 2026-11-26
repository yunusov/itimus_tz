object dm: Tdm
  Height = 480
  Width = 640
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    DriverID = 'FB'
    Embedded = True
    Left = 56
    Top = 80
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB'
      'Database=J:\dev\delphi\firebird_data\my_database.fdb'
      'CharacterSet=NONE')
    LoginPrompt = False
    Left = 56
    Top = 16
  end
  object dsPerson: TDataSource
    DataSet = qPerson
    Left = 152
    Top = 328
  end
  object qPerson: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select *'
      'from SP_GET_PERSONS(:SEX, :AGE, :FIO, :CONDATA)')
    Left = 32
    Top = 328
    ParamData = <
      item
        Name = 'SEX'
        ParamType = ptInput
      end
      item
        Name = 'AGE'
        ParamType = ptInput
      end
      item
        Name = 'FIO'
        ParamType = ptInput
      end
      item
        Name = 'CONDATA'
        ParamType = ptInput
      end>
  end
end
