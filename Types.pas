unit Types;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, System.UITypes, FireDAC.Phys.IBWrapper,
  DataModule;

type
  TfrmTypes = class(TForm)
    Panel1: TPanel;
    bAddType: TButton;
    gType: TDBGrid;
    bDeleteType: TButton;
    leTypeName: TLabeledEdit;
    procedure bAddTypeClick(Sender: TObject);
    procedure bDeleteTypeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDataModule: Tdm;
  public
    { Public declarations }
    property DataModule: TDM read FDataModule write FDataModule;
    procedure SetDataModule(const Value: TDM);
  end;


implementation

{$R *.dfm}

procedure TfrmTypes.bAddTypeClick(Sender: TObject);
var
  sp: TFDStoredProc;
  errmsg: string;
begin
  if Trim(leTypeName.Text) = '' then
  begin
    MessageDlg('Введите значение типа контакта', mtWarning, [mbOK], 0);
    Exit;
  end;

  sp := TFDStoredProc.Create(nil);
  try
    try
      sp.Connection := FDataModule.FDConnection;
      sp.StoredProcName := 'SP_ADD_TYPE';
      sp.Params.Add('P_NAME', leTypeName.Text);

      sp.ExecProc;
      FDataModule.qType.Refresh;
    except
      on E: EIBNativeException do begin
        if E.Message.Contains('_UNIQUE') then
           errmsg := 'Тип с таким именем уже существует!'#13#10#13#10;
        MessageDlg('Ошибка добавления типа контакта: ' + errmsg + E.Message, mtError, [mbOK], 0);
      end;
      on E: Exception do
        MessageDlg('Ошибка добавления типа контакта: ' + E.Message, mtError, [mbOK], 0);
    end;
  finally
    sp.Free;
  end;
end;

procedure TfrmTypes.bDeleteTypeClick(Sender: TObject);
var
  sp: TFDStoredProc;
begin
  if FDataModule.qType.IsEmpty then Exit;
  if MessageDlg('Удалить тип контакта "' +
      FDataModule.qType.FieldByName('Name').AsString +
      '"?', mtConfirmation,
    [mbYes, mbNo], 0) <> mrYes then Exit;

  sp := TFDStoredProc.Create(nil);
  try
    try
      sp.Connection := FDataModule.FDConnection;
      sp.StoredProcName := 'SP_DEL_TYPE';
      sp.Params.Add('P_ID', FDataModule.qType.FieldByName('ID').AsInteger);

      sp.ExecProc;
      FDataModule.qType.Refresh;
    except
      on E: Exception do
        MessageDlg('Ошибка удаления типа: ' + E.Message, mtError, [mbOK], 0);
    end;
  finally
    sp.Free;
  end;
end;

procedure TfrmTypes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FDataModule.qType.Close;
end;

procedure TfrmTypes.FormShow(Sender: TObject);
begin
  if not Assigned(FDataModule) then
    raise Exception.Create('TfrmTypes: свойство DataModule не назначен перед открытием');

  FDataModule.qType.Open;
end;

procedure TfrmTypes.SetDataModule(const Value: TDM);
begin
  FDataModule := Value;

  if Assigned(FDataModule) then
  begin
    gType.DataSource := FDataModule.dsType;
  end;
end;

end.
