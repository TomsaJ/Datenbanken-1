#define IBPP_WINDOWS
#include <iostream>
#include <iostream>
#include <stdio.h>
#include <typeinfo>
#include "\\Mac\Home\Uni\Datenbanken 1\ibpp-2-5-3-1-src\core\all_in_one.cpp"


using namespace std;

void aufgabe2(IBPP::Database db);
void aufgabe3(IBPP::Database db);


int main() {
    char aufgabe;
    try {
        const char *DbName = "C:/Program Files (x86)/Firebird/Firebird_2_5/examples/empbuild/employee.fdb";
        const string ServerName = "localhost";
        const string UserName = "SYSDBA";
        const string Password = "masterkey";
        IBPP::Database db = IBPP::DatabaseFactory(ServerName, DbName, UserName, Password);
        db->Connect();
        printf("1 - Liste der Mitarbeiter anzeigen\n");
        printf("2 - Aktualisieren eines Mitarbeiters\n");
        printf("9 - Programm beenden\n");
        scanf("%c", &aufgabe);
        switch(aufgabe){
            case '1':
                aufgabe2(db);
                break;
            case '2':
                aufgabe3(db);
                break;
            case '9':
                break;

    }
    db->Disconnect();

    } catch (ExceptionBase exceptionBase) {
        cout << exceptionBase.ErrorMessage();
    }

    return 0;
}

void aufgabe2(IBPP::Database db){
    char eingabe;
          // Start einer Transaktion
        IBPP::Transaction tr = IBPP::TransactionFactory(db);
        tr->Start();
        // Start eines Statements
        IBPP::Statement st = IBPP::StatementFactory(db, tr);
        st->Execute("SELECT first_name, last_name, hire_date, job_country FROM employee  ORDER BY last_name");
        printf("+----------------------+------------+--------------------------+\n");
        printf("+ Mitarbeiter          +  Eintritt  +    Währung               +\n");
        printf("+----------------------+------------+--------------------------+\n");
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
            printf("| %-20s | %02i.%02i.%4i | Dollar                   |\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }else if(job_country == "Canada"){
            printf("| %-20s | %02i.%02i.%4i | CDollar                 |\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }else if(job_country == "England"){
            printf("| %-20s | %02i.%02i.%4i | Pfund                    |\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }else if(job_country == "France" || job_country == "Italy" ){
            printf("| %-20s | %02i.%02i.%4i | Euro                     |\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }else if(job_country == "Japan"){
            printf("| %-20s | %02i.%02i.%4i | Yen                      |\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }else if(job_country == "Switzerland"){
            printf("| %-20s | %02i.%02i.%4i | Schweizer Franken |\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
            date.Year());
        }

            if(i == 15){
                scanf("%c", &eingabe);
                printf("+----------------------+------------+--------------------------+\n");
                printf("Fuer weitere 15 bitte die Taste \"w\" druecke oder \"e\" fuer ende\n");
                scanf("%c", &eingabe);
                if(eingabe == 'w'){
                    i = 0;
                    printf("+----------------------+------------+--------------------------+\n");
                    printf("+ Mitarbeiter          +  Eintritt  +    Währung               +\n");
                    printf("+----------------------+------------+--------------------------+\n");
                }else if(eingabe == 'e'){
                    break;
                }
            }else{
                i++;
            }
        }
        if(eingabe != 'e'){
            printf("+----------------------+------------+--------------------------+\n");
        }
        tr->Commit(); // Oder tr->Rollback(); = alle Änderungen werden verworfen…
    }


    void aufgabe3(IBPP::Database db){
        IBPP::Transaction tr = IBPP::TransactionFactory(db);
        tr->Start();
        // Start eines Statements
        IBPP::Statement st = IBPP::StatementFactory(db, tr);
        st->Execute("UPDATE  Employee SET hire_date = '15.07.1999' where first_name like 'Bruce' and last_name like 'Young'");
        st->Execute("SELECT first_name, last_name, hire_date FROM employee  ORDER BY last_name");
        printf("+----------------------+------------+\n");
        printf("+ Mitarbeiter          + Eintritt   + \n");
        printf("+----------------------+------------+\n");
        string firstname;            // lokale Variable fuer die Ausgabe
        string lastname;            // lokale Variable fuer die Ausgabe
        IBPP::Timestamp hire_date;    // lokale Variable fuer die Ausgabe
        IBPP::Date date;            // lokale Variable fuer die Ausgabe
        double salary;
        while (st->Fetch()) {
            st->Get(1, firstname);

        st->Get(2, lastname);
        st->Get(3, hire_date);
        date = hire_date.GetDate();
        printf("| %-20s | %02i.%02i.%4i |\n", (lastname + ", " + firstname).c_str(), date.Day(), date.Month(),
               date.Year());
        }
        printf("+----------------------+------------+\n");

        tr->Rollback(); // Oder tr->Rollback(); = alle Änderungen werden verworfen…
}



