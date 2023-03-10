-- Name: Julian Maximilian Tomsa --
-- Matrikelnummer 30277263 --
--Aufgabe 1:
	create database 'C:\SQL\Leser_0.fdb'
 	user 'SYSDBA' password 'masterkey';
	create table Leser_0 (Name char(20), Vorname char(20), Kundennummer integer, Fon char(20), Fax char(20), Wohnort char(20));

--Aufgabe 3:
	insert into Leser_0 (Name, Vorname, Kundennummer, Fon, Fax, Wohnort)
	values('Bauer', 'Mike', NULL, '01353695','01255965','Wien');
	insert into Leser_0 (Name, Vorname, Kundennummer, Fon, Fax, Wohnort)
	values('Bauer', 'Michael', 256, NULL,'0236595','Wien');
	insert into Leser_0 (Name, Vorname, Kundennummer, Fon, Fax, Wohnort)
	values('Loid', 'Werner', 639, '05563652366',NULL,'Paris');
	insert into Leser_0 (Name, Vorname, Kundennummer, Fon, Fax, Wohnort)
	values('Schmidt', NULL, 680, '017896536',NULL,NULL);
	insert into Leser_0 (Name, Vorname, Kundennummer, Fon, Fax, Wohnort)
	values('Rahen', 'Markus', 2369, '023896596335','0176956352','Mannheim');

--Aufgabe 4:
	insert into Leser_0 values ('Escher', 'Angela', NULL,'015369526', '0123666963','Duisburg');
	insert into Leser_0 values ('Mueller', 'Angela', 745,NULL, NULL,'Duisburg');
	insert into Leser_0 values ('Schneider', 'Laura', 8005,'015996356', '012569953','Dubai');
	insert into Leser_0 values ('Breuer', 'Luca', 23,NULL, '01569932','Hamburg');
	insert into Leser_0 values ('Hartleif', NULL, NULL,'06963335', '0126695','Bremen');

--Aufgabe 5:
	insert into Leser_0 (Name, Vorname, Kundennummer, Fon, Fax, Wohnort)
    values('Baumeister', 'Miaik', 2506, '048556956595','085591255965','Hannover');
  	insert into Leser_0 values ('Eis', 'Angela', 859,'017855369526', NULL,'Duisburg');
  	insert into Leser_0 (Name, Vorname, Kundennummer, Fon, Fax, Wohnort)
    values('Lommberg', 'Michael', 286, NULL,NULL,'Salzburg');
    insert into Leser_0 values ('Myer', 'Tim', NULL,NULL, '0563229889','Unna');
    insert into Leser_0 (Name, Vorname, Kundennummer, Fon, Fax, Wohnort)
    values('Schauer', 'Werner', 6895, '080056956','056996521','Soest');
