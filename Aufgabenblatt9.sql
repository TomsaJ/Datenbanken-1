--Aufgabenblatt 9

--Aufgabe 1:
select zahlen from "AUFGABE 1" where zahlen similar to '[0-7^89]*[8][0-7^89]*[8][0-7^89]*[8][0-7^89]*';
select zahlen from "AUFGABE 1" where zahlen similar to '%[8]%[8]%[8]%';

--Aufgabe 2:
select telefonnummer, case
when telefonnummer  similar to '\+%\((151|160|170|175)\)%' escape '\'  then 'T-Mobile'
when telefonnummer  similar to '\+%\((152|162|173|174)\)%' escape '\'   then 'Vodafone'
when telefonnummer  similar to '\+%\((155|157|161|163|177|178)\)%' escape '\'  then 'E-Plus, Base, Simyo'
when telefonnummer  similar to '\+%\((159|176|179)\)%' escape '\'  then  'O2'
else 'Kein Netzbetreiber'
end as Netzbetreiber
from aufgabe2 order by  Netzbetreiber, Telefonnummer;

--Aufgabe 3:
select passwort from aufgabe3
where passwort similar to '%?[A-Z]%?'
and passwort similar to '%?[a-z]%?'
and passwort similar to '%?[\_\-#\?]%?' escape '\'
and char_length(trim(passwort))> 8;

--Aufgabe 4
select datum from aufgabe4_new
where datum similar to '__?.__?.____'
and ((datum similar to '%.19[0-9]{2}') or (datum similar to '%.20[01][0-6]'))
and ((datum similar to '__?.0?[1-9].____') or (datum similar to '__?.1[0-2].____'))
and ((datum similar to '[0-2]?[0-9].__?.____')or (datum similar to '3[01].__.____'));

select datum from aufgabe4_new
where datum similar to '([0-2]?[0-9]|3[01]).(0?[1-9]|1[0-2]).(19[0-9]{2}|20[01][0-6])';
