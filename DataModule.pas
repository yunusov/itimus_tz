unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.FBDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, IniFiles;

type
  Tdm = class(TDataModule)
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDConnection: TFDConnection;
    dsPerson: TDataSource;
    qPerson: TFDQuery;
    qType: TFDQuery;
    dsType: TDataSource;
    dsContact: TDataSource;
    qContact: TFDQuery;
    procedure dsPersonDataChange(Sender: TObject; Field: TField);
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IniPath: string;
  end;

implementation

{$R *.dfm}


procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  IniPath := ExtractFilePath(ParamStr(0)) + 'config.ini';
end;

procedure Tdm.dsPersonDataChange(Sender: TObject; Field: TField);
begin
  qContact.Close;
  qContact.ParamByName('P_PERSON_ID').AsInteger := qPerson.FieldByName('ID').AsInteger;
  qContact.Open;
end;

procedure Tdm.FDConnectionAfterConnect(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniPath);
  try
    Ini.WriteString('Database', 'Path', FDConnection.Params.Database);
    Ini.WriteString('Database', 'UserName', FDConnection.Params.UserName);
  finally
    Ini.Free;
  end;
end;

end.
