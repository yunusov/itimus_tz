program aitimus_test;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  Controls,
  System.SysUtils,
  Person in 'Person.pas' {frmPerson: TfrmPerson},
  MainForm in 'MainForm.pas' {frmAuthorize: TfrmAuthorize},
  DataModule in 'DataModule.pas' {dm: TDataModule},
  Types in 'Types.pas' {frmTypes};

{$R *.res}

var
  frmAuthorize: TfrmAuthorize;
  frmPerson: TfrmPerson;
  dm: Tdm;

  i: integer;
  AuthOk: Boolean;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  dm := Tdm.Create(nil);
  try
    frmAuthorize := TfrmAuthorize.Create(nil);
    try
      frmAuthorize.SetDataModule(dm);

      AuthOk := False;
      for i := 0 to 2 do
      begin
        if frmAuthorize.ShowModal = mrOk then
        begin
          try
            dm.FDConnection.Open;
            AuthOk := dm.FDConnection.Connected;
            if AuthOk then Break;
          except
            on E: Exception do
              MessageDlg('Ошибка при авторизации: ' + E.Message, mtError, [mbOK], 0)
          end
        end
        else
          Break;
      end;

      if AuthOk then
      begin
        Application.CreateForm(TfrmPerson, frmPerson);
  try
          frmPerson.SetDataModule(dm);
          frmPerson.ShowModal;
        finally
          frmPerson.Free;
        end;
      end;
    finally
      frmAuthorize.Free;
    end;
  finally
    dm.Free;
  end;
end.
