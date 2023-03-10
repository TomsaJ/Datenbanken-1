--Aufgabenblatt 10

--Aufgabe 1
create table STATUS (
    Status0ID char(1) not null,
    Statusbezeichnung varchar(20)
    );

alter table STATUS
add constraint PK_STATUS
primary key (STATUS0ID);

insert into STATUS values('S', 'Student');
insert into STATUS values('L', 'Lehre');
insert into STATUS values('V', 'Verwaltung');
insert into STATUS values('E', 'Extern');

alter table "LESER_1_Copy" add constraint fk_leser_1_copy_Status foreign key (Status)
references status (Status0ID)
on delete set null on update cascade;


--Aufgabe 2:
update "LESER_1_Copy" set Status = 'E' where Status is Null;

--Aufgabe 3

--Aufgabe 4
insert into fachbereich (FBID, FbBezeichnung)
values ('TBW', 'Technische Betribswirtschaft');

insert into "LESER_1_Copy" (NAME,VORNAME,WOHNORT,STRASSE,HAUSNUMMER,GEBURTSTAG,GESCHLECHT,BUNDESLAND,PASSBILD,TELEFONNUMMER,FAXNUMMER,NOTIZ,IMMATRIKULIERTSEIT,TITEL,MAILADRESSE,MATRIKELNUMMER,POSTLEITZAHL,STATUS,NUMMER,FACHBEREICH )
values ('Mueller', 'Hans', 'Aachen','Baumweg', null,  '960-02-12', 'Herr', 'ST', null , '2562541','259956','', '2003-12-02', 'Student', 'Hans.de', '025695', '52596', 'S',30, 'TBW') ;

insert into fachbereich (FBID, FbBezeichnung)
values ('IW', 'Ingenieure- und Wirtschaftswissenschaften');

insert into "LESER_1_Copy" (NAME,VORNAME,WOHNORT,STRASSE,HAUSNUMMER,GEBURTSTAG,GESCHLECHT,BUNDESLAND,PASSBILD,TELEFONNUMMER,FAXNUMMER,NOTIZ,IMMATRIKULIERTSEIT,TITEL,MAILADRESSE,MATRIKELNUMMER,POSTLEITZAHL,STATUS,NUMMER,FACHBEREICH )
values ('Schmidt', 'Bernd', 'Aachen','Baumweg', null,  '2000-02-12', 'Herr', 'NRW', null , '2858858541','23695956','', '2003-12-02', 'Student', 'bernd.de', '0222695', '52596', 'S',31, 'IW') ;

--Aufgabe 5:

-- 1. Gründe:
	-- alle Atribute können null sein
	-- Es kann duplikate auf tauchen
	-- Primärschlüssel fehlt (Hilfreich damit keine Doppelten Personen vorkommen)

-- Aufgabe 7:
select name, vorname from "LESER_1_Copy"
where trim(name) similar to 'Hof+man+';