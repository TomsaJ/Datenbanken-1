connect "C:\Datenbanken\Leser_1.fdb"
user 'SYSDBA' password 'masterkey';

--Aufgabe 1:
select * from Leser_1 where Bundesland like 'ST' and Titel = 'Student';

--Aufgabe2:
Create table Geburtstagsliste (Name  T_Student,  Vorname T_student, Geburtstag date);
--insert into Geburtstagsliste select Name, Vorname, Geburtstag,
--from Leser_1 ORDER BY Geburtstag asc;
insert into Geburtstagsliste
select Name, Vorname, iif (extract(month from Geburtstag) = extract (month from current_date), Geburtstag ||' ' || 'Heute Geburtstag!', Geburtstag) as Geburtstag from Leser_1 ORDER BY Geburtstag asc;

--Aufgabe 3:
select Name,
  iif (Mailadresse not like '%@%.de', substring (Mailadresse from position ('@' in Mailadresse)+1), '' )
from Leser_1 ;

--Aufgabe 4:
select * from Leser_1 where Telefonnummer is null;

--Aufgabe 5:
select Name, Vorname, Geburtstag, immatrikuliertSeit from Leser_1 where extract immatrikuliertSeit) - extract geburtstag(year)<18;

--Aufgabe 6:
select * from Leser_1 where Name like 'B__er%' and Matrikelnummer like '3452%' and DateAdd(23 year to Geburtstag) >= current_date ;

--Aufgabe 7:
select * from Leser_1 where Wohnort not in  ('Iserlohn','Hemer','Schwerte','Menden','Arnsberg');

--Aufgabe 8:
select Name || ',' || substring(Vorname from 1 for 1) || '.' from Leser_1
where Wohnort in  ('Iserlohn','Hemer','Schwerte','Menden','Arnsberg');

--Aufgabe 9:
select Name, Geburtstag, Postleitzahl from Leser_1 where extract (month from Geburtstag) <= 9 and extract (month from Geburtstag) >=5 ORDER BY substring (Postleitzahl from 1 for 3), Geburtstag desc;
