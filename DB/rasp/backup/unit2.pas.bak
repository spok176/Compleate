unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, IBConnection, FileUtil, IniFiles, Variants, Dialogs, Forms;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    Datasource3: TDatasource;
    Datasource4: TDatasource;
    Datasource5: TDatasource;
    IBConnection1: TIBConnection;
    SQLQuery1: TSQLQuery;
    SQLQuery10: TSQLQuery;
    SQLQuery11: TSQLQuery;
    SQLQuery12: TSQLQuery;
    SQLQuery1RASPID: TLongintField;
    SQLQuery1THEME: TStringField;
    SQLQuery1THEMEDATE: TDateField;
    SQLQuery1THEMEID: TLongintField;
    SQLQuery1THEMETIP: TStringField;
    SQLQuery2: TSQLQuery;
    SQLQuery2GROUPID: TLongintField;
    SQLQuery2NUROKA: TLongintField;
    SQLQuery2PREDMID: TLongintField;
    SQLQuery2RASPCHASOV: TLongintField;
    SQLQuery2RASPDEN: TStringField;
    SQLQuery2RASPDO: TDateField;
    SQLQuery2RASPID: TLongintField;
    SQLQuery2RASPOT: TDateField;
    SQLQuery3: TSQLQuery;
    SQLQuery3GROUPID: TLongintField;
    SQLQuery3GROUPNAME: TStringField;
    SQLQuery3GROUPSPEC: TStringField;
    SQLQuery3SYEAR: TLongintField;
    SQLQuery4: TSQLQuery;
    SQLQuery4PREDMCHASOV: TLongintField;
    SQLQuery4PREDMID: TLongintField;
    SQLQuery4PREDMNAMEKRATK: TStringField;
    SQLQuery4PREDMNAMEPOLN: TStringField;
    SQLQuery5: TSQLQuery;
    SQLQuery5NSEMESTRA: TLongintField;
    SQLQuery5PREDMID: TLongintField;
    SQLQuery5SEMESTRCHASOV: TLongintField;
    SQLQuery5SEMESTRID: TLongintField;
    SQLQuery6: TSQLQuery;
    SQLQuery7: TSQLQuery;
    SQLQuery8: TSQLQuery;
    SQLQuery9: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure IBConnection1AfterConnect(Sender: TObject);
    procedure IBConnection1BeforeConnect(Sender: TObject);
    procedure IBConnection1BeforeDisconnect(Sender: TObject);
    procedure SQLQuery1AfterOpen(DataSet: TDataSet);
    procedure SQLQuery1BeforeOpen(DataSet: TDataSet);
    procedure SQLQuery1NewRecord(DataSet: TDataSet);
    procedure SQLQuery2AfterInsert(DataSet: TDataSet);
    procedure SQLQuery2AfterOpen(DataSet: TDataSet);
    procedure SQLQuery2BeforeOpen(DataSet: TDataSet);
    procedure SQLQuery2FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure SQLQuery2NewRecord(DataSet: TDataSet);
    procedure SQLQuery3AfterOpen(DataSet: TDataSet);
    procedure SQLQuery3AfterPost(DataSet: TDataSet);
    procedure SQLQuery3BeforeClose(DataSet: TDataSet);
    procedure SQLQuery3NewRecord(DataSet: TDataSet);
    procedure SQLQuery4AfterOpen(DataSet: TDataSet);
    procedure SQLQuery4NewRecord(DataSet: TDataSet);
    procedure SQLQuery5BeforeOpen(DataSet: TDataSet);
    procedure SQLQuery5NewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
    ED:String;
    ED2:String;
  end;

var
  DataModule1: TDataModule1;
  ini : TIniFile;

implementation
uses Unit1, Unit3, Unit4, Unit5, Unit6;
{$R *.lfm}

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
   try
      ini:=TIniFile.Create(extractfilepath(paramstr(0))+'MyFile.ini');
      Datamodule1.IBConnection1.DatabaseName:=ini.ReadString('DB','URL','Default string');
      IBconnection1.Open;
      form1.statusbar1.SimpleText:='Сегодня: ' + datetostr(Date) + '. Соеденение с базой успешно установлено!';
   except
    on EIBDatabaseError do
       begin
            ShowMessage('Некоректно указан путь базе данных!');
            Application.Terminate;
       end;
   End;
end;

procedure TDataModule1.IBConnection1AfterConnect(Sender: TObject);
begin
  SQLQuery10.open;
  SQLQuery8.open;
  SQLQuery3.Open;
  SQLQuery7.open;
  SQLQuery4.Open;
  SQLQuery6.Open;
  SQLQuery2.open;
  SQLQuery9.Open;
  SQLQuery5.Open;
  SQLQuery1.open;
end;

procedure TDataModule1.IBConnection1BeforeConnect(Sender: TObject);
begin

end;

procedure TDataModule1.IBConnection1BeforeDisconnect(Sender: TObject);
begin
  SQLTransaction1.CommitRetaining();
  SQLQuery1.close;
  SQLQuery2.Close;
  SQLQuery3.Close;
  SQLQuery4.Close;
  SQLQuery5.Close;
  SQLQuery6.Close;
  SQLQuery7.Close;
  SQLQuery8.Close;
  sqlquery9.Close;
end;

procedure TDataModule1.SQLQuery1AfterOpen(DataSet: TDataSet);
begin

end;

procedure TDataModule1.SQLQuery1BeforeOpen(DataSet: TDataSet);
begin
end;

procedure TDataModule1.SQLQuery1NewRecord(DataSet: TDataSet);
begin
   SQLQuery1.FieldByName('ThemeID').AsInteger:=0;
   SQLQuery1.FieldByName('ThemeDate').AsDateTime:=now;
end;

procedure TDataModule1.SQLQuery2AfterInsert(DataSet: TDataSet);
begin

end;

procedure TDataModule1.SQLQuery2AfterOpen(DataSet: TDataSet);
begin
end;

procedure TDataModule1.SQLQuery2BeforeOpen(DataSet: TDataSet);
begin
end;

procedure TDataModule1.SQLQuery2FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    if form2.checkbox1.checked=true then
    begin
      if form2.combobox1.text='' then
      begin
           Accept:=(DataSet.FieldByName('raspot').AsString=ED2);
      end else
      begin
           Accept:=(DataSet.FieldByName('raspot').AsString=ED2) and (DataSet.FieldByName('raspden').AsString=ED);
      end;
    end
    else Accept:=(DataSet.FieldByName('raspden').AsString=ED);
end;

procedure TDataModule1.SQLQuery2NewRecord(DataSet: TDataSet);
begin
  SQLQuery2.FieldByName('RaspID').AsInteger:=0;
  SQLQuery2.FieldByName('GroupName').AsInteger:=SQLQuery3.FieldByName('GroupID').AsInteger;
  SQLQuery2.FieldByName('PredmNameKratk').AsInteger:=SQLQuery4.FieldByName('PredmID').AsInteger;
end;

procedure TDataModule1.SQLQuery3AfterOpen(DataSet: TDataSet);
begin
end;

procedure TDataModule1.SQLQuery3AfterPost(DataSet: TDataSet);
begin
  TSQLQuery(Dataset).ApplyUpdates;
end;

procedure TDataModule1.SQLQuery3BeforeClose(DataSet: TDataSet);
begin
    if TSQLQuery(Dataset).State in [dsInsert,dsEdit]
     then TSQLQuery(Dataset).Post;
end;

procedure TDataModule1.SQLQuery3NewRecord(DataSet: TDataSet);
begin
 SQLQuery3.FieldByName('GroupID').AsInteger:=0;
end;

procedure TDataModule1.SQLQuery4AfterOpen(DataSet: TDataSet);
begin

end;

procedure TDataModule1.SQLQuery4NewRecord(DataSet: TDataSet);
begin
   SQLQuery4.FieldByName('PredmID').AsInteger:=0;
end;

procedure TDataModule1.SQLQuery5BeforeOpen(DataSet: TDataSet);
begin
end;

procedure TDataModule1.SQLQuery5NewRecord(DataSet: TDataSet);
begin
   SQLQuery5.FieldByName('SemestrID').AsInteger:=0;
   SQLQuery5.FieldByName('PredmID').AsInteger:=SQLQuery4.FieldByName('PredmID').AsInteger;
end;


end.
