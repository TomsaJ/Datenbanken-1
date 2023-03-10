connect "C:\SQL\Leser_1.fdb"
user 'SYSDBA' password 'masterkey';

-- Aufgabe 1
select Name, Vorname, Geburtstag, upper (Bundesland) from Leser_1 where immatrikuliertSeit;

-- Aufgabe 2
select Name, substring (Telefonnummer from 5 for 18) as Fon, substring (Faxnummer from 5 for 18) as Fax, Mailadresse as Mail from Leser_1;

-- Aufgabe 3
Select trim(both' ' from Name) || Vorname || Geburtstag as Daten from Leser_1 ORDER BY Geburtstag desc;

--Aufgabe 4
select Geschlecht,
  replace (Name, ' ', '')
Vorname from Leser_1;

-- Aufgabe 5
select Name ||'@fh-swf.de' as NeueEmailadresse from Leser_1;

-- Aufgabe 6
select Name, Postleitzahl, Wohnort ,
  case
    when Bundesland = 'ST' then 'Sachen-Anhalt'
    when Bundesland = 'BW' then 'Baden-Würtenberg'
    when Bundesland = 'BY' then 'Bayern'
    when Bundesland = 'BE' then 'Berlin'
    when Bundesland = 'BB' then 'Brandenburg'
    when Bundesland = 'HB' then 'Bremen'
    when Bundesland = 'HH' then 'Hamburg'
    when Bundesland = 'HE' then 'Hessen'
    when Bundesland = 'MV' then 'Mecklenburg-Vorprommern'
    when Bundesland = 'NI' then 'Niedersachesen'
    when Bundesland = 'NW' then 'Nordreihn-Westfalen'
    when Bundesland = 'RP' then 'Reihnland-Pfalz'
    when Bundesland = 'SL' then 'Saarland'
    when Bundesland = 'SN' then 'Sachsen'
    when Bundesland = 'SH' then 'Schleswig-Holstein'
    when Bundesland = 'TH' then 'Thüringen'
  end as Bundesland from Leser_1;

--Aufgabe 7
  Select * from Leser_1 ORDER BY extract (month from Geburtstag);

--AUfgabe 8
select Name,
  iif (Mailadresse like '%@%', substring (Mailadresse from position ('@' in Mailadresse)+1), 'Ungültigemailadresse' )
from Leser_1 ;

--Aufgabe 9
Select Name, Vorname, Geburtstag, Bundesland from Leser_1 ORDER BY 4 asc, 1 desc, 3 asc;
