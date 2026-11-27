program aitimus_test;

uses
  Vcl.Forms,
  Controls,
  Person in 'Person.pas' {frmPerson: TfrmPerson},
  MainForm in 'MainForm.pas' {frmAutorize: TfrmAutorize},
  DataModule in 'DataModule.pas' {dm: TDataModule};

{$R *.res}

var
  frmAutorize: TfrmAutorize;
  frmPerson: TfrmPerson;
  dm: Tdm;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  dm := Tdm.Create(nil);
  frmAutorize := TfrmAutorize.Create(nil);
  try
    frmAutorize.SetDataModule(dm);
    if frmAutorize.ShowModal=mrOk then
    try
      Application.CreateForm(TfrmPerson, frmPerson);
  frmPerson.SetDataModule(dm);
      frmPerson.ShowModal;
    finally
      FrmPerson.Free;
    end;
  finally
    frmAutorize.Free;
    dm.Free;
  end;
  Application.Run;
end.
