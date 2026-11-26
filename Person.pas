unit Person;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.UI.Intf, FireDAC.VCLUI.Login,
  FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.DBCtrls, System.UITypes,
  DataModule, Vcl.StdCtrls, Vcl.Mask, Vcl.WinXPickers;

type
  TfrmPerson = class(TForm)
    gPerson: TDBGrid;
    Panel1: TPanel;
    lDeletePerson: TButton;
    Panel2: TPanel;
    leName: TLabeledEdit;
    leSurname: TLabeledEdit;
    leSecName: TLabeledEdit;
    leAge: TLabeledEdit;
    cbSex: TComboBox;
    lSex: TLabel;
    bAddPerson: TButton;
    bSearch: TButton;
    dpDob: TDatePicker;
    lDob: TLabel;
    procedure FormShow(Sender: TObject);
    procedure lDeletePersonClick(Sender: TObject);
    procedure bAddPersonClick(Sender: TObject);
    procedure bSearchClick(Sender: TObject);
    procedure leAgeKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmPerson.lDeletePersonClick(Sender: TObject);
begin
  if FDataModule.qPerson.IsEmpty then Exit;
  if MessageDlg('Удалить ' +
      FDataModule.qPerson.FieldByName('Name').AsString + ' ' +
      FDataModule.qPerson.FieldByName('Surname').AsString +
      ' и все его контакты?', mtConfirmation,
    [mbYes, mbNo], 0) <> mrYes then Exit;

  try
    FDataModule.FDConnection.ExecSQL('EXECUTE PROCEDURE SP_DEL_PERSON(:P_ID)',
        [FDataModule.qPerson.FieldByName('ID').AsInteger]);
    FDataModule.qPerson.Refresh;
  except
    on E: Exception do
      MessageDlg('Ошибка удаления: ' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmPerson.leAgeKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', #8, #27]) then
    Key := #0;
end;

procedure TfrmPerson.SetDataModule(const Value: TDM);
begin
  FDataModule := Value;

  if Assigned(FDataModule) then
  begin
    gPerson.DataSource := FDataModule.dsPerson;
  end;
end;

procedure TfrmPerson.bAddPersonClick(Sender: TObject);
var
  q: TFDQuery;
begin
  q := TFDQuery.Create(nil);

  try
    q.Connection := FDataModule.FDConnection;
    q.SQL.Text := 'SELECT 1 FROM SP_ADD_PERSON(:P_SURNAME, :P_NAME, :P_SECOND_NAME, :P_SEX, :P_DOB)';
    q.ParamByName('P_SURNAME').AsString := leSurname.Text;
    q.ParamByName('P_NAME').AsString := leName.Text;
    q.ParamByName('P_SECOND_NAME').AsString := leSecName.Text;
    q.ParamByName('P_SEX').AsBoolean := cbSex.Text = 'МУЖ.';
    q.ParamByName('P_DOB').AsDate := dpDob.Date;

    q.Open;
    FDataModule.qPerson.Refresh;
  finally
    q.Free;
  end;
end;

procedure TfrmPerson.bSearchClick(Sender: TObject);
begin
  FDataModule.qPerson.ParamByName('SEX').Value := NULL; //cbSex.Text = 'МУЖ.';
  FDataModule.qPerson.ParamByName('AGE').Value := NULL; //AsInteger := integer(leAge.Text);
  FDataModule.qPerson.ParamByName('FIO').AsString :=
    leName.Text + leSecName.Text + leSurname.Text;
  FDataModule.qPerson.ParamByName('CONDATA').Value := NULL;

  FDataModule.qPerson.Refresh;
end;

procedure TfrmPerson.FormShow(Sender: TObject);
var i: integer;
begin
  if not Assigned(FDataModule) then
    raise Exception.Create('TfrmPerson: свойство DataModule не назначен перед открытием');

  FDataModule.qPerson.Open;

  for i := 0 to 4 do
  begin
      gPerson.Columns[i].Width := 100;
  end;
end;

end.
