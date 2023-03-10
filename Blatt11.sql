--Aufgabe 1
  select Fon from NN where similar to '\+491[5|6|7][0-9][ ]*[0-9]{6,8}' escape '\'';

--Aufgabe 2
  select fon from NN where similar to  '0[0-9]{2,4}[ ]*[0-9]{2,8}[ ]*[0-9]{0,3}';
