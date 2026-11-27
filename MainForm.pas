unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, FireDAC.Comp.Client,
  DataModule, IniFiles;

type
  TfrmAuthorize = class(TForm)
    leUsername: TLabeledEdit;
    lePassword: TLabeledEdit;
    OpenDialog1: TOpenDialog;
    bCancel: TButton;
    bConnect: TButton;
    bOpenDialog: TButton;
    lePathDB: TLabeledEdit;
    procedure bCancelClick(Sender: TObject);
    procedure bOpenDialogClick(Sender: TObject);
    procedure bConnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDataModule: Tdm;
    procedure FormInit;
  public
    { Public declarations }
    property DataModule: TDM read FDataModule write FDataModule;
    procedure SetDataModule(const Value: TDM);
  end;

implementation

{$R *.dfm}

procedure TfrmAuthorize.bCancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAuthorize.SetDataModule(const Value: TDM);
begin
  FDataModule := Value;
  FormInit;
end;

procedure TfrmAuthorize.bOpenDialogClick(Sender: TObject);
begin
  if OpenDialog1.Execute
  then lePathDB.Text := OpenDialog1.FileName;
end;

procedure TfrmAuthorize.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FDataModule.IniPath);
  try
    Ini.WriteInteger('frmAuthorize', 'Left', Left);
    Ini.WriteInteger('frmAuthorize', 'Top', Top);
  finally
    Ini.Free;
  end;
end;

procedure TfrmAuthorize.FormInit;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FDataModule.IniPath);
  try
    lePathDB.Text :=Ini.ReadString('Database', 'Path', 'itimus.fdb');
    leUsername.Text := Ini.ReadString('Database', 'UserName', 'sysdba');
    Left := Ini.ReadInteger('frmAuthorize', 'Left', Left);
    Top := Ini.ReadInteger('frmAuthorize', 'Top', Top);
  finally
    Ini.Free;
  end;
end;

procedure TfrmAuthorize.bConnectClick(Sender: TObject);
var
  Conn: TFDConnection;
begin
  Conn := FDataModule.FDConnection;
  Conn.Params.UserName := leUsername.Text;
  Conn.Params.Password := lePassword.Text;
  Conn.Params.Database := lePathDB.Text;
end;

end.
