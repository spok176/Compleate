unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  DbCtrls, DBGrids, StdCtrls, ExtCtrls, iniFiles, eventlog, Variants;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  ini : TIniFile;

implementation
uses Unit2, Unit3, Unit4, Unit5, Unit6;
{$R *.lfm}

{ TForm1 }

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DataModule1.IBConnection1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   //datamodule1.IBConnection1.open;
  //ini:=TIniFile.Create(extractfilepath(paramstr(0))+'MyFile.ini');
  //Datamodule1.IBConnection1.DatabaseName:=ini.ReadString('DB','URL','Default string');;
  //Edit1.Text:=ini.ReadString('FORM','Caption','Default string');
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   Form3.show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form4.show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form5.show;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  datamodule1.sqlquery1.close;
  datamodule1.IBconnection1.close;
  datamodule1.IBconnection1.open;
  datamodule1.sqlquery1.open;
  statusbar1.SimpleText:='Обновлено';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
    DataModule1.SQLTransaction1.CommitRetaining();
    statusbar1.SimpleText:='Сохранено';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
    datamodule1.SQLQuery11.ParamByName('rasp_day').AsString:=combobox1.text;
    datamodule1.SQLQuery11.ExecSQL;
    //Testing Update
    DataModule1.SQLTransaction1.CommitRetaining();
    DataModule1.Sqlquery1.close;
    DataModule1.IBconnection1.close;
    DataModule1.IBconnection1.open;
    DataModule1.Sqlquery1.open;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin

end;

procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
begin

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

end.

