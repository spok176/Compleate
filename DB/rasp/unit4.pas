unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  DBGrids, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation
uses Unit1, Unit2, Unit3;

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
begin
  DataModule1.SQLTransaction1.CommitRetaining();
end;

procedure TForm3.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  //DataModule1.SQLQuery3.Close;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin

end;

{$R *.lfm}

end.

