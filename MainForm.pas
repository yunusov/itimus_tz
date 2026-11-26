unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, FireDAC.Comp.Client,
  DataModule;

type
  TfrmAutorize = class(TForm)
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

procedure TfrmAutorize.bCancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAutorize.SetDataModule(const Value: TDM);
begin
  FDataModule := Value;
end;

procedure TfrmAutorize.bOpenDialogClick(Sender: TObject);
begin
  if OpenDialog1.Execute
  then lePathDB.Text := OpenDialog1.FileName;
end;

procedure TfrmAutorize.bConnectClick(Sender: TObject);
var
  Conn: TFDConnection;
begin
  Conn := FDataModule.FDConnection;
  Conn.Params.UserName := leUsername.Text;
  Conn.Params.Password := lePassword.Text;
  Conn.Params.Database := lePathDB.Text;
  Conn.Open;
end;

end.
