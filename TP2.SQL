SQL> SELECT TYP_LP FROM poste WHERE Num_P = 'P6';

TYP_LP
------
UNIX

SQL> SELECT Num_P, Nom_P, Num_S FROM poste WHERE TYP_LP = 'UNIX';

NUM_P   NOM_P      NUM_S
------  -------    ------
P2      Poste2     S01
P6      Poste6     S11

SQL> SELECT Num_L, Nom_L FROM logiciel WHERE TYP_LP = 'UNIX';

NUM_L   NOM_L
------  ---------------
LOG1    ORACLE7
LOG2    ORACLE8
LOG4    FRONT PAGE
LOG5    OPEN OFFICE

SQL> SELECT Num_L FROM installer WHERE Num_P = 'P7';

NUM_L
------
LOG1

SQL> SELECT Nom_L FROM logiciel WHERE SUBSTR(Nom_L, 3, 1) = 'A';

NOM_L
---------------
ORACLE7
SQL*plus

SQL> SELECT Nom_d FROM departement WHERE LOWER(Nom_d) LIKE '%t%';

NOM_D
--------------------
Informatique
Gestion

SQL> SELECT Nom_L FROM logiciel WHERE Nom_L LIKE '%e' OR Version = '5';

NOM_L
---------------
FRONT PAGE
OPEN OFFICE

SQL> SELECT * FROM poste WHERE Num_S IN ('S01', 'S10', 'S21');

NUM_P   NOM_P      NUM_S
------  -------    ------
P1      Poste1     S01
P2      Poste2     S01
P9      Poste9     S21

SQL> SELECT * FROM logiciel ORDER BY Date_Ach ASC, Version DESC;

NUM_L   NOM_L           DATE_ACH  VERSION
------  --------------  --------- -------
LOG3    SQL SERVER      12-APR-03 7
LOG4    FRONT PAGE      03-JUN-03 5
LOG2    ORACLE8         15-MAY-00 8.0
LOG1    ORACLE7         13-MAY-00 7.3.2
LOG5    OPEN OFFICE     03-JUN-02 5

SQL> SELECT Num_L, Nom_L FROM logiciel WHERE TYP_LP <> 'UNIX' ORDER BY Date_Ach DESC;

NUM_L   NOM_L
------  ---------------
LOG6    SQL*plus
LOG3    SQL SERVER

SQL> SELECT Num_L, Nom_L FROM logiciel WHERE Date_Ach BETWEEN TO_DATE('01/01/2000', 'DD/MM/YYYY') AND TO_DATE('01/01/2005', 'DD/MM/YYYY');

NUM_L   NOM_L
------  ---------------
LOG1    ORACLE7
LOG2    ORACLE8
LOG3    SQL SERVER
LOG5    OPEN OFFICE

SQL> SELECT Nom_L FROM logiciel WHERE EXTRACT(YEAR FROM Date_Ach) = 2003;

NOM_L
---------------
SQL SERVER
FRONT PAGE

SQL> SELECT Num_L FROM installer WHERE Date_Inst >= ADD_MONTHS(SYSDATE, -3);

NUM_L
------
LOG2

SQL> SELECT COUNT(*) AS Nombre_Logiciels FROM logiciel;

Nombre_Logiciels
----------------
7

SQL> SELECT Num_P, COUNT(Num_L) AS Nombre_Logiciels FROM installer GROUP BY Num_P;

NUM_P   Nombre_Logiciels
------  ----------------
P1      2
P2      2
P3      1
P4      1
P5      4
P7      1

SQL> SELECT Num_L FROM installer GROUP BY Num_L HAVING COUNT(*) > 2;

NUM_L
------
LOG1
