--Aufgabe 1:
	create database 'C:\SQL\Leser_1.fdb'
	user 'SYSDBA' password 'masterkey';
	create domain T_Student as char(30);
	create domain T_Telefon as varchar(18);

	create table Leser_1 (Name T_Student, Vorname T_Student, Postleitzahl char(5) default '?????', Wohnort varchar(40) default '/////', Strasse char(40),
	Hausnummer integer, Geburtstag date, Geschlecht char(4) check (Geschlecht in ('Herr', 'Frau')),
	Bundesland char(2) check (Bundesland in ('BE', 'BB', 'BW', 'BY', 'HB', 'HH', 'MV', 'NI', 'NW', 'RP', 'SH', 'SN', 'ST', 'TH')), Passbild blob, Telefonnummer T_Telefon, Faxnummer T_Telefon,
	Notiz varchar(255), immatrikuliertSeit date check ( immatrikuliertSeit >= '2002.01.01'), Titel varchar(11), Mailadresse varchar(30),
	constraint PrimKey primary key (Name, Vorname, Geburtstag));
