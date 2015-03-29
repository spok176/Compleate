connect  'D:\PR 11-03\uchebadb\demo.gdb'
user 'SYSDBA' password 'masterkey';
insert into GROUPS(GroupName,sYear) values ('ПР11-10',2011);
commit;
insert into GROUPS(GroupName,sYear) values ('Б11-09',2011);
commit;
insert into GROUPS(GroupName,sYear) values ('КС11-01',2011);
commit;
insert into PREDMET (predmnamekratk) values('русс');
commit;
insert into PREDMET (predmnamekratk) values('мат');
commit;
insert into PREDMET (predmnamekratk) values('прогр');
commit;
insert into PREDMET (predmnamekratk) values('физик');
commit;
insert into PREDMET (predmnamekratk) values('ф-ра');
commit;




