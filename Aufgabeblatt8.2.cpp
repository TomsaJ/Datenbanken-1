#define IBPP_WINDOWS
#include <iostream>
#include <iostream>
#include <stdio.h>
#include <typeinfo>
#include "C:\Users\julia\Uni\Datenbanken 1\ibpp-2-5-3-1-src\core\all_in_one.cpp"

void aufgabe2(){
    const char *DbName = "C:/Program Files (x86)/Firebird/Firebird_2_5/examples/empbuild/employee.fdb";
    const string ServerName = "localhost";
    const string UserName = "SYSDBA";
    const string Password = "masterkey";
    char eingabe;

      IBPP::Database db = IBPP::DatabaseFactory(ServerName, DbName, UserName, Password);
        db->Connect();
          // Start einer Transaktion
        IBPP::Transaction tr = IBPP::TransactionFactory(db);
        tr->Start();
        // Start eines Statements
        IBPP::Statement st = IBPP::StatementFactory(db, tr);
        st->Execute("SELECT first_name, last_name, hire_date, job_country FROM employee  ORDER BY last_name");
        printf("+----------------------+------------+\n");
        printf("+ Mitarbeiter         + Eintritt   + Währung +\n");
        printf("+----------------------+------------+\n");
        string firstname;            // lokale Variable fuer die Ausgabe
        string lastname;            // lokale Variable fuer die Ausgabe
        string job_country;
        IBPP::Timestamp hire_date;    // lokale Variable fuer die Ausgabe
        IBPP::Date date;            // lokale Variable fuer die Ausgabe
        int i = 0;
         while (st->Fetch()) {
        st->Get(1, firstname);
        st->Get(2, lastname);
        st->Get(3, hire_date);
        date = hire_date.GetDate();
        st->Get(4, job_country);
        if(job_country == "USA"){
            printf("| %-20s | %02i.%02i.%4i | Dollar\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }else if(job_country == "Canada"){
            printf("| %-20s | %02i.%02i.%4i | CDollar\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }else if(job_country == "England"){
            printf("| %-20s | %02i.%02i.%4i | Pfund\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }else if(job_country == "France" || job_country == "Italy" ){
            printf("| %-20s | %02i.%02i.%4i | Euro\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }else if(job_country == "Japan"){
            printf("| %-20s | %02i.%02i.%4i | Yen\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }else if(job_country == "Switzerland"){
            printf("| %-20s | %02i.%02i.%4i | Schweizer Franken\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }

            if(i == 15){
                printf("Fuer weitere 15 bitte die Taste ""w"" druecke oder e fuer ende\n");
                scanf("%c", &eingabe);
                if(eingabe == 'w'){
                    i = 0;
                }else if(eingabe == 'e'){
                    break;
                }
            }else{
            i++;
            }
        }
        printf("+----------------------+------------+----------+\n");

        tr->Commit(); // Oder tr->Rollback(); = alle Änderungen werden verworfen…
        db->Disconnect();
    }
