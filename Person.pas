unit Person;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.UI.Intf, FireDAC.VCLUI.Login,
  FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.DBCtrls, System.UITypes, FireDAC.Phys.IBWrapper,
  DataModule, Vcl.StdCtrls, Vcl.Mask, Vcl.WinXPickers, Types, Vcl.Menus;

type
  TfrmPerson = class(TForm)
    Panel2: TPanel;
    gPerson: TDBGrid;
    Splitter1: TSplitter;
    MainMenu1: TMainMenu;
    Nbgs1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    gContact: TDBGrid;
    GroupBox1: TGroupBox;
    leName: TLabeledEdit;
    leSurname: TLabeledEdit;
    leSecName: TLabeledEdit;
    lDob: TLabel;
    dpDob: TDatePicker;
    leAge: TLabeledEdit;
    cbSex: TComboBox;
    lSex: TLabel;
    bAddPerson: TButton;
    Button1: TButton;
    bAllUsers: TButton;
    bSearch: TButton;
    GroupBox2: TGroupBox;
    leContactData: TLabeledEdit;
    bAddContactData: TButton;
    bDeleteConData: TButton;
    procedure FormShow(Sender: TObject);
    procedure lDeletePersonClick(Sender: TObject);
    procedure bAddPersonClick(Sender: TObject);
    procedure bSearchClick(Sender: TObject);
    procedure leAgeKeyPress(Sender: TObject; var Key: Char);
    procedure bAllUsersClick(Sender: TObject);
    procedure bContactTypesClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure bAddContactDataClick(Sender: TObject);
    procedure bDeleteConDataClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
var sp: TFDStoredProc;
begin
  if FDataModule.qPerson.IsEmpty then Exit;
  if MessageDlg('Удалить "' +
      FDataModule.qPerson.FieldByName('Name').AsString + ' ' +
      FDataModule.qPerson.FieldByName('Surname').AsString +
      '" и все его контакты?', mtConfirmation,
    [mbYes, mbNo], 0) <> mrYes then Exit;

  sp := TFDStoredProc.Create(nil);
  try
    try
      sp.Connection := FDataModule.FDConnection;
      sp.StoredProcName := 'SP_DEL_PERSON';
      sp.Params.Add('P_ID', FDataModule.qPerson.FieldByName('ID').AsInteger);

      sp.ExecProc;
      FDataModule.qPerson.Refresh;
    except
      on E: Exception do
        MessageDlg('Ошибка удаления: ' + E.Message, mtError, [mbOK], 0);
    end;
  finally
    sp.Free;
  end;
end;

procedure TfrmPerson.leAgeKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', #8, #27]) then
    Key := #0;
end;

procedure TfrmPerson.N1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPerson.SetDataModule(const Value: TDM);
begin
  FDataModule := Value;

  if Assigned(FDataModule) then
  begin
    gPerson.DataSource := FDataModule.dsPerson;
  end;
end;


procedure TfrmPerson.bAddContactDataClick(Sender: TObject);
var
  sp: TFDStoredProc;
  errmsg: string;
begin
  if Trim(leContactData.Text) = '' then
  begin
    MessageDlg('Введите значение контакта', mtWarning, [mbOK], 0);
    Exit;
  end;

  sp := TFDStoredProc.Create(nil);
  try
    try
      sp.Connection := FDataModule.FDConnection;
      sp.StoredProcName := 'SP_ADD_CONTACT';
      sp.Params.Add('P_PERSON_ID', FDataModule.qPerson.FieldByName('ID').AsInteger);
      sp.Params.Add('P_CONTACT_TYPE_ID', FDataModule.qContact.FieldByName('CT_ID').AsInteger);
      sp.Params.Add('P_VAL', leContactData.Text);

      sp.ExecProc;
      FDataModule.qContact.Refresh;
    except
      on E: EIBNativeException do begin
        if E.Message.Contains('_UNIQUE') then
           errmsg := 'Контакт этого типа с таким значением у персоны уже существует!'#13#10#13#10;
        MessageDlg('Ошибка добавления контакта: ' + errmsg + E.Message, mtError, [mbOK], 0);
      end;
      on E: Exception do
        MessageDlg('Ошибка добавления контакта: ' + E.Message, mtError, [mbOK], 0);
    end;
  finally
    sp.Free;
  end;
end;

procedure TfrmPerson.bAddPersonClick(Sender: TObject);
var
  sp: TFDStoredProc;
  errmsg: string;
begin
  if Trim(leSurname.Text) = '' then
  begin
    MessageDlg('Введите значение поля "Фамилия"!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Trim(leName.Text) = '' then
  begin
    MessageDlg('Введите значение поля "Имя"!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Trim(cbSex.Text) = '' then
  begin
    MessageDlg('Введите значение поля "Пол"!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Date < dpDob.Date then
  begin
    MessageDlg('Введите дату рождение сегодня или ранее!', mtWarning, [mbOK], 0);
    Exit;
  end;


  sp := TFDStoredProc.Create(nil);
  try
    try
      sp.Connection := FDataModule.FDConnection;
      sp.StoredProcName := 'SP_ADD_PERSON';
      sp.Params.Add('P_SURNAME', leSurname.Text);
      sp.Params.Add('P_NAME', leName.Text);
      sp.Params.Add('P_SECOND_NAME', leSecName.Text);
      sp.Params.Add('P_SEX', cbSex.Text = 'МУЖ.');
      sp.Params.Add('P_DOB', DateToStr(dpDob.Date));

      sp.ExecProc;
      FDataModule.qPerson.Refresh;
    except
      on E: EIBNativeException do begin
        if E.Message.Contains('_UNIQUE') then
           errmsg := 'Персона с такими данными уже существует!'#13#10#13#10;
        MessageDlg('Ошибка добавления персоны: ' + errmsg + E.Message, mtError, [mbOK], 0);
      end;
      on E: Exception do
        MessageDlg('Ошибка добавления персоны: ' + E.Message, mtError, [mbOK], 0);
    end;
  finally
    sp.Free;
  end;
end;

procedure TfrmPerson.bAllUsersClick(Sender: TObject);
begin
  FDataModule.qPerson.ParamByName('SEX').Value := NULL;
  FDataModule.qPerson.ParamByName('AGE').Value := NULL;
  FDataModule.qPerson.ParamByName('FIO').Value := NULL;
  FDataModule.qPerson.ParamByName('CONDATA').Value := NULL;

  FDataModule.qPerson.Refresh;
  FDataModule.qContact.Refresh;
end;

procedure TfrmPerson.bContactTypesClick(Sender: TObject);
var frmTypes: TfrmTypes;
begin
  frmTypes := TfrmTypes.Create(nil);
  try
    frmTypes.SetDataModule(FDataModule);
    frmTypes.ShowModal;
  finally
    frmTypes.Free;
  end;
end;

procedure TfrmPerson.bDeleteConDataClick(Sender: TObject);
var  sp: TFDStoredProc;
begin
  if FDataModule.qContact.FieldByName('ID').Value = NULL then Exit;
  if MessageDlg('Удалить значение "' +
      FDataModule.qContact.FieldByName('VAL').AsString + '" типа "' +
      FDataModule.qContact.FieldByName('NAME').AsString +
      '"?', mtConfirmation,
    [mbYes, mbNo], 0) <> mrYes then Exit;

  sp := TFDStoredProc.Create(nil);
  try
    try
      sp.Connection := FDataModule.FDConnection;
      sp.StoredProcName := 'SP_DEL_CONTACT';
      sp.Params.Add('P_CONTACT_ID', FDataModule.qContact.FieldByName('ID').AsInteger);

      sp.ExecProc;
      FDataModule.qContact.Refresh;
    except
      on E: Exception do
        MessageDlg('Ошибка удаления контакта: ' + E.Message, mtError, [mbOK], 0);
    end;
  finally
    sp.Free
  end;
end;

procedure TfrmPerson.bSearchClick(Sender: TObject);
var sex, age: Variant;
begin
  sex := NULL;
  age := NULL;

  if cbSex.Text = 'МУЖ.'
  then sex := True
  else if  cbSex.Text = 'ЖЕН.'
  then sex := False;

  if string(leAge.Text).Length > 0
  then age := leAge.Text;


  FDataModule.qPerson.ParamByName('SEX').Value := sex;
  FDataModule.qPerson.ParamByName('AGE').Value := age;
  FDataModule.qPerson.ParamByName('FIO').Value :=
    leName.Text + leSecName.Text + leSurname.Text;
  FDataModule.qPerson.ParamByName('CONDATA').Value := leContactData.Text;

  FDataModule.qPerson.Refresh;
end;

procedure TfrmPerson.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Вы действительно хотите покинуть программу?',
                      mtConfirmation,
                      [mbYes, mbNo],
                      0) = mrYes
  then Application.Terminate
  else CanClose := False;
end;

procedure TfrmPerson.FormShow(Sender: TObject);
var i: integer;
begin
  if not Assigned(FDataModule) then
    raise Exception.Create('TfrmPerson: свойство DataModule не назначен перед открытием');

  FDataModule.qPerson.Open;
  FDataModule.qContact.Open;

  for i := 0 to 4 do
      gPerson.Columns[i].Width := 100;

  for i := 0 to 1 do
      gContact.Columns[i].Width := 100;
end;

end.
