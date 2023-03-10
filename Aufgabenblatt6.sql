--Aufgabe 1:
	alter table Leser_1  add Status char (1), add constraint kuerzel check (Status in ('S' ,'L' ,'V' ,'E'));


--Aufgabe 2:
	update Leser_1
    	set Status = case
    	when Titel = 'Dr.' then 'L'
    	when Titel = 'Prof.' then 'L'
    	when Titel = 'Prof. Dr.' then 'L'
    	end

--Aufgabe 3:
	alter table Leser_1 add PLZ char(5);

	update Leser_1
    		set PLZ = Postleitzahl;
	
	alter table Leser_1 drop Postleitzahl;
	alter table leser_1 add Postleitzahl char(5) default '00000';
	update Leser_1
            set Postleitzahl = PLZ;
	alter table Leser_1 drop PLZ;

--Aufgabe 4:
	update Leser_1
    set Postleitzahl = case
    when Postleitzahl = '?????' then '00000'
    when Postleitzahl is not null then Postleitzahl
    end 
insert into backup select * from leser_1 where postleitzahl = '?????';
delete from leser_1 where postleitzahl = '?????';
insert into leser_1 (name,vorname, etc aber keine PLZ) select name, vorname etc ohn eplz from backup;
--Aufgabe 5:
	alter table leser_1 add Nummer int not null;
	alter table leser_1 add constraint Leser_0ID primary key (Nummer);

	---
	alter table leser_1_copy add Leser_0ID int not null;

alter table leser_1_copy drop constraint PK_Leser_1_copy;

-- Voraussetzung: 1 Datensatz mit Startnummer belegen

update leser_1_copy set leser_0id = (select max(leser_0id)+1 from leser_1_copy);

alter table leser_1_copy add constraint PK_Leser_1_copy primary key (Leser_0ID);


--Aufgabe 6:
	select * from Leser_1 where TItel ='Student' and Telefonnummer is null;

--Aufgabe 7:
	select Vorname, Name, Wohnort, Mailadresse from Leser_1 where DateAdd(17 year to Geburtstag) >= current_date and Titel = 'Leser' ;

--Aufgabe 8;
	select replace(Name, ' ','') || ',' || Vorname || Notiz as Bemerkung  from Leser_1
	where Notiz is not null;