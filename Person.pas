unit Person;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.UI.Intf, FireDAC.VCLUI.Login,
  FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.DBCtrls,
  DataModule;

type
  TfrmPerson = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);
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

procedure TfrmPerson.SetDataModule(const Value: TDM);
begin
  FDataModule := Value;

  if Assigned(FDataModule) then
  begin
    DBGrid1.DataSource := FDataModule.dsPerson;
    DBNavigator1.DataSource := FDataModule.dsPerson;
  end;
end;

procedure TfrmPerson.FormShow(Sender: TObject);
begin
  if not Assigned(FDataModule) then
    raise Exception.Create('TfrmPerson: свойство DataModule не назначен перед открытием');

  FDataModule.qPerson.Open;
end;

end.
