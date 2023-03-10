--Aufgabe1:
select count(Nummer) as AnzahlLeser from Leser_1;

--Aufgabe2:
select Bundesland, count(Bundesland) as AnzahlBundesland
from Leser_1
where Bundesland is not null group by Bundesland;

--Aufgabe 3:
select Bundesland, count(Bundesland) as AnzahlBundesland
from Leser_1
group by Bundesland
having count(Bundesland)>3;

--Aufgabe 4:
select Status, count(Status) as AnzahlLehrende, 
avg(extract(year from current_date) - extract(year from Geburtstag)) as Durchschnittsalter
from Leser_1
where Status = 'L'
group by Status;

--Aufgabe5:
select Status, 
case
when Status is not null then count(Status)
else count(Nummer) - count(Status)
end as AnzahlLeser
from Leser_1
group by Status;


--Aufgabe 6:
select Geschlecht, count(Nummer) - count(Geschlecht) as AnzahlGeschlecht
from Leser_1
where Geschlecht is null
group by Geschlecht;


--Aufgabe 7:

create table Fachbereich(
    FbID char(3) not null primary key,
    FbBezeichnung varchgar(60)
);

alter table Leser_1 add Fachbereich char(3);

alter table Leser_1 add constraint fk_Leser_1_Fachbereich foreign key (Fachbereich) references Fachberech (FbID)
on delete set null on update cascade;
