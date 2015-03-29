connect  'D:\PR 11-03\uchebadb\demo.gdb'
user 'SYSDBA' password 'masterkey'
commit;
create generator group_id_gen;
commit;
set term ^;
create trigger set_group_id for GROUPS
active before insert position 0 as
begin
if(new.GroupID is null) then
new.GroupID= gen_id(group_id_gen,1);
end; ^
set term; ^
commit;
create generator semestr_id_gen;
commit;
set term ^;
create trigger set_semestr_id for NSEMESTRA
active before insert position 0 as
begin
if(new.SemestrID is null) then
new.SemestrID= gen_id(semestr_id_gen,1);
end; ^
set term; ^
commit;
create generator predmet_id_gen;
commit;
set term ^;
create trigger set_predmet_id for PREDMET
active before insert position 0 as
begin
if(new.PredmID is null) then
new.PredmID= gen_id(predmet_id_gen,1);
end; ^
set term; ^
commit;
create generator raspisanie_id_gen;
commit;
set term ^;
create trigger set_raspisanie_id for RASPISANIE
active before insert position 0 as
begin
if(new.RaspID is null) then
new.RaspID= gen_id(raspisanie_id_gen,1);
end; ^
set term; ^
commit;
create generator theme_id_gen;
commit;
set term ^;
create trigger set_theme_id for THEMES
active before insert position 0 as
begin
if(new.ThemeID is null) then
new.ThemeID= gen_id(theme_id_gen,1);
end; ^
set term; ^
commit;
