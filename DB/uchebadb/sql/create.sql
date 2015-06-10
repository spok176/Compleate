set sql dialect 3;
create database 'C:\Users\misha\Desktop\Compleate\DB\uchebadb\demo1.gdb'
user 'MISHA' password 'MISHA'
default character set UTF8;
commit;
connect  'C:\Users\misha\Desktop\Compleate\DB\uchebadb\demo1.gdb'
user 'MISHA' password 'MISHA'
commit;
create table PREDMET
(PredmID numeric not null primary key,
PredmNameKratk varchar(10),
PredmNamePoln  varchar(255),
PredmChasov numeric
);
commit;
create table GROUPS
(GroupID numeric not null primary key,
GroupName varchar(10),
GroupSpec varchar(100),
sYear numeric
);
commit;
create table RASPISANIE
(RaspID numeric not null primary key,
RaspDen varchar(10),
RaspKab varchar(100),
GroupID numeric references GROUPS(GroupID) on update cascade on delete set null,
PredmID  numeric references PREDMET(PredmID) on update cascade on delete set null,
nUroka numeric,
RaspOt numeric,
RaspDo numeric,
RaspChasov numeric);
commit;
create table nSEMESTRA
(SemestrID numeric not null primary key,
PredmID numeric references PREDMET(PREDMID)
on update cascade on delete set null,
SemestrChasov numeric,
NSEMESTRA numeric
);
commit;
create table THEMES
(ThemeID numeric not null primary key,
ThemeDate date,
RaspID numeric references RASPISANIE(RaspID)
on update cascade on delete set null,
ThemeTip varchar(10),
Theme varchar(255)
);
commit;



