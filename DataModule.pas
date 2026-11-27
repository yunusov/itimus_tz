unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.FBDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, IniFiles, System.IOUtils;

type
  Tdm = class(TDataModule)
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDConnection: TFDConnection;
    dsPerson: TDataSource;
    dsType: TDataSource;
    dsContact: TDataSource;
    spPerson: TFDStoredProc;
    spContact: TFDStoredProc;
    spType: TFDStoredProc;
    procedure dsPersonDataChange(Sender: TObject; Field: TField);
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure spPersonBeforePost(DataSet: TDataSet);
    procedure spTypeBeforeOpen(DataSet: TDataSet);
    procedure spContactBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    IniPath: string;
    procedure logDataSet(DataSet: TDataSet);
  end;

implementation

{$R *.dfm}


procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  IniPath := ExtractFilePath(ParamStr(0)) + 'config.ini';
end;

procedure Tdm.dsPersonDataChange(Sender: TObject; Field: TField);
begin
  spContact.Close;
  spContact.ParamByName('P_PERSON_ID').AsInteger := spPerson.FieldByName('ID').AsInteger;
  spContact.Open;
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

procedure Tdm.logDataSet(DataSet: TDataSet);
var
  LogPath: string;
  i: Integer;
  s: string;
  q: TFDStoredProc;
begin
  if DataSet is TFDStoredProc then
  begin
    q := TFDStoredProc(DataSet);
    LogPath := ExtractFilePath(ParamStr(0)) + 'query_log.txt';
    s := '=== QUERY OPEN ===' + #13#10;
    s := s + 'Date: ' + FormatDateTime('dd-mm-yyyy hh:nn:ss', Now) + #13#10;
    s := s + 'DataSet: ' + q.Name + #13#10;
    s := s + 'SP Name: ' + q.StoredProcName + #13#10;
    s := s + 'PARAMETERS:' + #13#10;
    for i := 0 to q.Params.Count - 1 do
      s := s + Format('  %s = %s (DataType: %d)', [
        q.Params[i].Name,
        q.Params[i].AsString,
        Integer(q.Params[i].DataType)
      ]);
    s := s + #13#10 + #13#10;

    TFile.AppendAllText(LogPath, s, TEncoding.UTF8);
  end;
end;

procedure Tdm.spContactBeforeOpen(DataSet: TDataSet);
begin
  logDataSet(DataSet);
end;

procedure Tdm.spPersonBeforePost(DataSet: TDataSet);
begin
  logDataSet(DataSet);
end;

procedure Tdm.spTypeBeforeOpen(DataSet: TDataSet);
begin
  logDataSet(DataSet);
end;

end.
