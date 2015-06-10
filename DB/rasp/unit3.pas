unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBCtrls,
  DBGrids, StdCtrls, ExtCtrls, PairSplitter, ExtDlgs, ComCtrls, Buttons,
  Variants, fpspreadsheet, fpsallformats;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    CalendarDialog1: TCalendarDialog;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Splitter2CanOffset(Sender: TObject; var NewOffset: integer;
      var Accept: boolean);
  private
    { private declarations }
  public
    { public declarations }
    ED: string;
    ED2: string;
  end;

const OUTPUT_FORMAT = sfExcel5;

var
  Form2: TForm2;

implementation

uses Unit1, Unit2, Unit4, Unit7;

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
var
  MyWorkbook: TsWorkbook;
  MyWorksheet: TsWorksheet;
  MyDir: string;
  col, col2,i, j:integer;
begin
  // Initialization
  MyDir := ExtractFilePath(ParamStr(0));

  // Create the spreadsheet
  MyWorkbook := TsWorkbook.Create;

//  MyWorksheet := MyWorkbook.AddWorksheet('My Worksheet');
  MyWorksheet := MyWorkbook.AddWorksheet(Utf8ToAnsi(UTF8Encode('Расписание')));

// Write some string cells
  col:=dbgrid1.Columns.Count-1;
  col2:=datamodule1.SQLQuery2.RecordCount;
 { for i:=0 to col2 do
  begin
       //MyWorksheet.WriteUTF8Text(0,i,Utf8ToAnsi(UTF8Encode(dbgrid1.Columns.Items[i].title.Caption)));
       MyWorksheet.WriteUTF8Text(0,i,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['RASPDEN'])));
       datamodule1.SQLQuery2.Next;
  for j:=1 to col2 do
     begin
       datamodule1.SQLQuery2.Open;
       datamodule1.SQLQuery2.First;
       MyWorksheet.WriteUTF8Text(i,j,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['RASPDEN'])));
       MyWorksheet.WriteUTF8Text(i,j,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['NUROKA'])));
       MyWorksheet.WriteUTF8Text(i,j,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['PREDMNAMEKRATK'])));
       MyWorksheet.WriteUTF8Text(i,j,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['GROUPNAME'])));
       MyWorksheet.WriteUTF8Text(i,j,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['RASPCHASOV'])));
       MyWorksheet.WriteUTF8Text(i,j,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['RASPOT'])));
       MyWorksheet.WriteUTF8Text(i,j,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['RASPDO'])));
       datamodule1.SQLQuery2.Next;
      end; }
  //end;
  //datamodule1.SQLQuery2.First;
  //i:=0;
  //datamodule1.SQLQuery2.IndexFieldNames:='raspden';
  //while i<col2 do
  {//not datamodule1.sqlquery2.EOF do
  for i:=1 to col2 do
  }
  datamodule1.SQLQuery2.First;
  while not datamodule1.SQLQuery2.EOF do
  for i:=1 to col2 do
  begin
       //i:=i+1;
       datamodule1.SQLQuery2.Open;
       //datamodule1.SQLQuery2.First;
       MyWorksheet.WriteUTF8Text(i,0,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['RASPDEN'])));
       MyWorksheet.WriteUTF8Text(i,1,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['NUROKA'])));
       MyWorksheet.WriteUTF8Text(i,2,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['PREDMNAMEKRATK'])));
       MyWorksheet.WriteUTF8Text(i,3,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['GROUPNAME'])));
       //MyWorksheet.WriteUTF8Text(i,0,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['RASPDEN'])));
       //MyWorksheet.WriteUTF8Text(i,4,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['RASPCHASOV'])));
       //MyWorksheet.WriteUTF8Text(i,5,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['RASPOT'])));
       //MyWorksheet.WriteUTF8Text(i,6,Utf8ToAnsi(UTF8Encode(datamodule1.SQLQuery2.FieldValues['RASPDO'])));
       datamodule1.SQLQuery2.Next;
       for j:=0 to 3 do
       begin
          MyWorksheet.WriteUTF8Text(0,j,Utf8ToAnsi(UTF8Encode(dbgrid1.Columns.Items[j].title.Caption)));
       end;
  end;

  // Save the spreadsheet to a file
  MyWorkbook.WriteToFile(MyDir + 'test' + STR_EXCEL_EXTENSION,sfExcel8 );//OUTPUT_FORMAT);
  MyWorkbook.Free;

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  form6:=TForm6.Create(Application);
  form6.ShowModal;
  form6.Free;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
   isWhere : boolean;
begin
  Datamodule1.SQLQuery2.Close; Datamodule1.SQLQuery2.SQL.Clear; isWhere:=false;
  Datamodule1.SQLQuery2.SQL.Add('select * from RASPISANIE');

  if checkbox1.Checked then
   if isWhere then
    begin
      Datamodule1.SQLQuery2.SQL.Add(' and RASPDEN>'+ComboBox1.Text);
      isWhere:=true;
    end else Datamodule1.SQLQuery2.SQL.Add(' where RASPDEN>'+ComboBox1.Text);

  if checkbox2.Checked then
   if isWhere then
    begin
      Datamodule1.SQLQuery2.SQL.Add(' and raspot>'+Edit2.Text);
      isWhere:=true;
    end else Datamodule1.SQLQuery2.SQL.Add(' where raspot>'+Edit2.Text);

  if checkbox3.Checked then
   if isWhere then
    begin
      Datamodule1.SQLQuery2.SQL.Add(' and raspdo>'+Edit3.Text);
      isWhere:=true;
    end else Datamodule1.SQLQuery2.SQL.Add(' where raspdo>'+Edit3.Text);

  if checkbox4.Checked then
   if isWhere then
    begin
      Datamodule1.SQLQuery2.SQL.Add(' and groupname>'+ComboBox2.Text);
      isWhere:=true;
    end else Datamodule1.SQLQuery2.Sql.Add(' where groupname>'+ComboBox2.Text);

  Datamodule1.SQLQuery2.SQL.Add(' order by RaspId,RaspDen');
  Datamodule1.SQLQuery2.Open;

  {if checkbox1.Checked = True then
  begin
    if combobox1.Text = '' then
    begin
      Datamodule1.SQLQuery2.Filtered := False;
      DataModule1.ED2 := Edit2.Text;
      DataModule1.SQLQuery2.Filtered := True;
    end
    else
    begin
      Datamodule1.SQLQuery2.Filtered := False;
      DataModule1.ED := combobox1.Text;
      DataModule1.ED2 := Edit2.Text;
      DataModule1.SQLQuery2.Filtered := True;
    end;
  end
  else
  begin
    DataModule1.SQLQuery2.Filtered := False;
    DataModule1.ED := combobox1.Text;
    DataModule1.SQLQuery2.Filtered := True;
  end;   }
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  DataModule1.SQLQuery2.Filtered := False;
  edit2.Text := '';
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Datamodule1.SQLQuery2.Filtered := False;
  DataModule1.ED := combobox2.Text;
  DataModule1.SQLQuery2.Filtered := True;
end;

procedure TForm2.CheckBox1Change(Sender: TObject);
begin

end;

procedure TForm2.Edit1Change(Sender: TObject);
begin

end;

procedure TForm2.Edit2Change(Sender: TObject);
begin

end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
  edit2.Text := '';
  if calendardialog1.Execute then
  begin
    edit2.Text := datetostr(calendardialog1.date);
  end;
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin

end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
  edit3.Text := '';
  if calendardialog1.Execute then
  begin
    edit3.Text := datetostr(calendardialog1.date);
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  datamodule1.SQLQuery3.First;
  while not datamodule1.SQLQuery3.EOF do
  begin
    datamodule1.SQLQuery3.Open;
    ComboBox2.Items.Add(datamodule1.SQLQuery3.FieldValues['GroupName']);
    datamodule1.SQLQuery3.Next;
  end;
end;

procedure TForm2.Label1Click(Sender: TObject);
begin

end;

procedure TForm2.Label3Click(Sender: TObject);
begin

end;

procedure TForm2.Panel1Click(Sender: TObject);
begin

end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin

end;

procedure TForm2.Splitter2CanOffset(Sender: TObject; var NewOffset: integer;
  var Accept: boolean);
begin

end;

{$R *.lfm}

end.
