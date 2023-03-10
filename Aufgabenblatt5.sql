connect "C:\Datenbanken\employee.fdb"
user 'SYSDBA' password 'masterkey';

  --1:
    select HIRE_DATE from EMPLOYEE where FULL_NAME = 'Burbank, Jennifer M.';

  --2:
     select Job_Code from employee where FULL_NAME = 'Burbank, Jennifer M.';

  --3:
    select department from department where dept_no = '620';

  --4:
    select SALARY from employee where FULL_NAME = 'Burbank, Jennifer M.';

  --5:
    select Old_Salary from Salary_History where Emp_No = 71;
    ---
    select Old_Salary from Salary_History where New_Salary = 53.167,500;

  --6:
   SELECT  JOB_COUNTRY, 
	CASE
        when JOB_COUNTRY = 'USA'        then min(SALARY)|| ' $'
        when JOB_COUNTRY = 'Canada'     then min(SALARY)|| ' C$'
        when JOB_COUNTRY = 'England'    then min(SALARY)|| ' £'
        when JOB_COUNTRY = 'France'     then min(SALARY)|| ' €'
        when JOB_COUNTRY = 'Italy'      then min(SALARY)|| ' €'
        when JOB_COUNTRY = 'Japan'      then min(SALARY)|| ' ¥'
        when JOB_COUNTRY = 'Switzerland'then min(SALARY)|| ' CHF'
        end AS minimum, 
        CASE
        when JOB_COUNTRY = 'USA'        then max(SALARY)|| ' $'
        when JOB_COUNTRY = 'Canada'     then max(SALARY)|| ' C$'
        when JOB_COUNTRY = 'England'    then max(SALARY)|| ' £'
        when JOB_COUNTRY = 'France'     then max(SALARY)|| ' €'
        when JOB_COUNTRY = 'Italy'      then max(SALARY)|| ' €'
        when JOB_COUNTRY = 'Japan'      then max(SALARY)|| ' ¥'
        when JOB_COUNTRY = 'Switzerland'then max(SALARY)|| ' CHF'
        end AS Maximum,
        case
        when JOB_COUNTRY = 'USA'        then (min(SALARY)*0.95)
        when JOB_COUNTRY = 'Canada'     then (min(SALARY)*0.74)
        when JOB_COUNTRY = 'England'    then (min(SALARY)*1.19)
        when JOB_COUNTRY = 'France'     then (min(SALARY)*0.152)         --da Franc
        when JOB_COUNTRY = 'Italy'      then (min(SALARY)*0.000516457)   --da Lire
        when JOB_COUNTRY = 'Japan'      then (min(SALARY)*0.0073)
        when JOB_COUNTRY = 'Switzerland'then (min(SALARY)*0.95)
        end || ' €' AS Minimum_in_EUR,
        case
        when JOB_COUNTRY = 'USA'        then (max(SALARY)*0.95)
        when JOB_COUNTRY = 'Canada'     then (max(SALARY)*0.74)
        when JOB_COUNTRY = 'England'    then (max(SALARY)*1.19)
        when JOB_COUNTRY = 'France'     then (max(SALARY)*0.152)         --da Franc
        when JOB_COUNTRY = 'Italy'      then (max(SALARY)*0.000516457)   --da Lire
        when JOB_COUNTRY = 'Japan'      then (max(SALARY)*0.0073)
        when JOB_COUNTRY = 'Switzerland'then (max(SALARY)*0.95)
        end||' €' AS Maximum_in_EUR
	FROM EMPLOYEE
	GROUP BY JOB_COUNTRY;

  --7:
    select PROJ_NAME from PROJECT where TEAM_LEADER is null;

  --8:
  select FIRST_NAME, LAST_NAME
  from EMPLOYEE
  where extract(month from HIRE_DATE) = extract (month from current_date)
  and extract(year from HIRE_DATE) = extract (year from current_date);
  --9:


  --10:
  UPDATE CUSTOMER
    SET PHONE_NO = CASE
    when PHONE_NO is null then null
    when COUNTRY = 'Belgium' then '+32 '       || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    when COUNTRY = 'Canada' then '+1 '         || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    when COUNTRY = 'England' then '+44 '       || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    when COUNTRY = 'Fiji' then '+679 '         || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    when COUNTRY = 'France' then '+33 '        || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    when COUNTRY = 'Hong Kong' then '+852 '    || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    when COUNTRY = 'Italy' then '+39 '         || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    when COUNTRY = 'Japan' then '+81 '         || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    when COUNTRY = 'Netherlands' then '+31 '   || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    when COUNTRY = 'Switzerland' then '+41 '   || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    when COUNTRY = 'USA' then '+1 '            || iif(position('0' in replace(replace(PHONE_NO,'(',''),')',''))=1,     substring(replace(replace(PHONE_NO,'(',''),')','') from 2),    replace(replace(PHONE_NO,'(',''),')',''))
    end
