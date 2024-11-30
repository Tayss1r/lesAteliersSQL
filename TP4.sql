1)
select e.first_name, e.last_name,e.department_id,d.department_name 
from employees e 
join departments d on e.department_id = d.department_id;

FIRST_NAME           LAST_NAME                 DEPARTMENT_ID
-------------------- ------------------------- -------------
DEPARTMENT_NAME
------------------------------
Steven               King                                 90
Executive

Neena                Kochhar                              90
Executive

Lex                  De Haan                              90
Executive


FIRST_NAME           LAST_NAME                 DEPARTMENT_ID
-------------------- ------------------------- -------------
DEPARTMENT_NAME
------------------------------
Alexander            Hunold                               60
IT

Bruce                Ernst                                60
IT

David                Austin                               60
IT



2)
select e.first_name, e.last_name,e.department_id,d.department_name
from employees e
join departments d on e.department_id = d.department_id
where d.department_id in (50,90);




FIRST_NAME           LAST_NAME                 DEPARTMENT_ID
-------------------- ------------------------- -------------
DEPARTMENT_NAME
------------------------------
Mozhe                Atkinson                             50
Shipping

Sarah                Bell                                 50
Shipping

Laura                Bissot                               50
Shipping


FIRST_NAME           LAST_NAME                 DEPARTMENT_ID
-------------------- ------------------------- -------------
DEPARTMENT_NAME
------------------------------
Alexis               Bull                                 50
Shipping

Anthony              Cabrio                               50
Shipping

Kelly                Chung                                50
Shipping


FIRST_NAME           LAST_NAME                 DEPARTMENT_ID
-------------------- ------------------------- -------------
DEPARTMENT_NAME
------------------------------
Curtis               Davies                               50
Shipping

Lex                  De Haan                              90
Executive

Julia                Dellinger                            50
Shipping


FIRST_NAME           LAST_NAME                 DEPARTMENT_ID
-------------------- ------------------------- -------------
DEPARTMENT_NAME
------------------------------
Jennifer             Dilly                                50
Shipping

Britney              Everett                              50
Shipping

Kevin                Feeney                               50
Shipping



3)
select e1.first_name, e1.last_name, j.job_title, e2.first_name, e2.last_name
from (employees e1 join employees e2 on e1.manager_id = e2.employee_id) join jobs j on e1.job_id = j.job_id
where e1.department_id = 50;

FIRST_NAME           LAST_NAME
-------------------- -------------------------
JOB_TITLE                           FIRST_NAME
----------------------------------- --------------------
LAST_NAME
-------------------------
Matthew              Weiss
Stock Manager                       Steven
King

Adam                 Fripp
Stock Manager                       Steven
King

FIRST_NAME           LAST_NAME
-------------------- -------------------------
JOB_TITLE                           FIRST_NAME
----------------------------------- --------------------
LAST_NAME
-------------------------

Payam                Kaufling
Stock Manager                       Steven
King

Shanta               Vollman
Stock Manager                       Steven

FIRST_NAME           LAST_NAME
-------------------- -------------------------
JOB_TITLE                           FIRST_NAME
----------------------------------- --------------------
LAST_NAME
-------------------------
King

Kevin                Mourgos
Stock Manager                       Steven
King

Julia                Nayer

FIRST_NAME           LAST_NAME
-------------------- -------------------------
JOB_TITLE                           FIRST_NAME
----------------------------------- --------------------
LAST_NAME
-------------------------
Stock Clerk                         Matthew
Weiss

Irene                Mikkilineni
Stock Clerk                         Matthew
Weiss


4)
select e1.first_name, e1.salary
from employees e1 join employees e2 on e1.manager_id = e2.employee_id
where e2.last_name = 'King';

FIRST_NAME               SALARY
-------------------- ----------
Neena                     17000
Lex                       17000
Den                       11000
Matthew                    8000
Adam                       8200
Payam                      7900
Shanta                     6500
Kevin                      5800
John                      14000
Karen                     13500
Alberto                   12000

FIRST_NAME               SALARY
-------------------- ----------
Gerald                    11000
Eleni                     10500
Michael                   13000

14 rows selected.



5)
select e1.first_name, e1.last_name
from employees e1 join employees e2 on e1.manager_id = e2.manager_id
where e2.last_name = 'King' and e1.last_name != 'King';

FIRST_NAME           LAST_NAME
-------------------- -------------------------
Patrick              Sully
Allan                McEwen
Lindsey              Smith
Louise               Doran
Sarath               Sewall

5 rows selected.




6)
select e.first_name || e.last_name as fullname, d.department_name, v.city, v.state_province
from (employees e join departments d on e.department_id = d.department_id)
join locations v on d.location_id = v.location_id;

FULLNAME                                      DEPARTMENT_NAME
--------------------------------------------- ------------------------------
CITY                           STATE_PROVINCE
------------------------------ -------------------------
StevenKing                                    Executive
Seattle                        Washington

NeenaKochhar                                  Executive
Seattle                        Washington

LexDe Haan                                    Executive
Seattle                        Washington


FULLNAME                                      DEPARTMENT_NAME
--------------------------------------------- ------------------------------
CITY                           STATE_PROVINCE
------------------------------ -------------------------
AlexanderHunold                               IT
Southlake                      Texas

BruceErnst                                    IT
Southlake                      Texas

DavidAustin                                   IT
Southlake                      Texas


FULLNAME                                      DEPARTMENT_NAME
--------------------------------------------- ------------------------------
CITY                           STATE_PROVINCE
------------------------------ -------------------------
ValliPataballa                                IT
Southlake                      Texas

DianaLorentz                                  IT
Southlake                      Texas

NancyGreenberg                                Finance
Seattle                        Washington


FULLNAME                                      DEPARTMENT_NAME
--------------------------------------------- ------------------------------
CITY                           STATE_PROVINCE
------------------------------ -------------------------
DanielFaviet                                  Finance
Seattle                        Washington

JohnChen                                      Finance
Seattle                        Washington

IsmaelSciarra                                 Finance
Seattle                        Washington




7)
select department_name
from departments
where department_id in (
select department_id
from departments
minus
select department_id
from employees
);

DEPARTMENT_NAME
------------------------------
Treasury
Corporate Tax
Control And Credit
Shareholder Services
Benefits
Manufacturing
Construction
Contracting
Operations
IT Support
NOC

DEPARTMENT_NAME
------------------------------
IT Helpdesk
Government Sales
Retail Sales
Recruiting
Payroll

16 rows selected.




8)
select e.first_name || e.last_name as fullname, d.department_name, v.city, v.state_province
from (employees e join departments d on e.department_id = d.department_id)
join locations v on d.location_id = v.location_id
where e.last_name LIKE '%a%';

FULLNAME                                      DEPARTMENT_NAME
--------------------------------------------- ------------------------------
CITY                           STATE_PROVINCE
------------------------------ -------------------------
NeenaKochhar                                  Executive
Seattle                        Washington

LexDe Haan                                    Executive
Seattle                        Washington

ValliPataballa                                IT
Southlake                      Texas


FULLNAME                                      DEPARTMENT_NAME
--------------------------------------------- ------------------------------
CITY                           STATE_PROVINCE
------------------------------ -------------------------
DanielFaviet                                  Finance
Seattle                        Washington

IsmaelSciarra                                 Finance
Seattle                        Washington

Jose ManuelUrman                              Finance
Seattle                        Washington


FULLNAME                                      DEPARTMENT_NAME
--------------------------------------------- ------------------------------
CITY                           STATE_PROVINCE
------------------------------ -------------------------
DenRaphaely                                   Purchasing
Seattle                        Washington

ShelliBaida                                   Purchasing
Seattle                        Washington

SigalTobias                                   Purchasing
Seattle                        Washington


FULLNAME                                      DEPARTMENT_NAME
--------------------------------------------- ------------------------------
CITY                           STATE_PROVINCE
------------------------------ -------------------------
KarenColmenares                               Purchasing
Seattle                        Washington

PayamKaufling                                 Shipping
South San Francisco            California

ShantaVollman                                 Shipping
South San Francisco            California



9)
select first_name, salary
from employees
where salary > (
select salary
from employees
where employee_id = 103
);

FIRST_NAME               SALARY
-------------------- ----------
Steven                    24000
Neena                     17000
Lex                       17000
Nancy                     12000
Den                       11000
John                      14000
Karen                     13500
Alberto                   12000
Gerald                    11000
Eleni                     10500
Peter                     10000

FIRST_NAME               SALARY
-------------------- ----------
David                      9500
Janette                   10000
Patrick                    9500
Clara                     10500
Danielle                   9500
Lisa                      11500
Harrison                  10000
Tayler                     9600
Ellen                     11000
Michael                   13000
Hermann                   10000

FIRST_NAME               SALARY
-------------------- ----------
Shelley                   12000

23 rows selected.


10)
select employee_id
from employees
where employee_id not in (
select employee_id
from job_history
where job_id in (
select job_id
from job_history
where employee_id = 101
)
);

EMPLOYEE_ID
-----------
        202
        112
        189
        110
        201
        122
        153
        161
        186
        109
        177

EMPLOYEE_ID
-----------
        198
        149
        106
        145
        118
        111
        132
        192
        113
        171
        127

EMPLOYEE_ID
-----------
        167
        130
        100
        147
        158
        199

105 rows selected.


11)
select d.department_id, d.department_name
from departments d
where d.location_id =(
select location_id
from departments
where department_id = 90
);

DEPARTMENT_ID DEPARTMENT_NAME
------------- ------------------------------
           10 Administration
           30 Purchasing
           90 Executive
          100 Finance
          110 Accounting
          120 Treasury
          130 Corporate Tax
          140 Control And Credit
          150 Shareholder Services
          160 Benefits
          170 Manufacturing

DEPARTMENT_ID DEPARTMENT_NAME
------------- ------------------------------
          180 Construction
          190 Contracting
          200 Operations
          210 IT Support
          220 NOC
          230 IT Helpdesk
          240 Government Sales
          250 Retail Sales
          260 Recruiting
          270 Payroll

21 rows selected.


12)
select e.last_name, e.hire_date
from employees e
where e.hire_date > (
select hire_date
from employees
where employee_id = 101
);

LAST_NAME                 HIRE_DATE
------------------------- ---------
Johnson                   04-JAN-00
Taylor                    24-JAN-98
Fleaur                    23-FEB-98
Sullivan                  21-JUN-99
Geoni                     03-FEB-00
Sarchand                  27-JAN-96
Bull                      20-FEB-97
Dellinger                 24-JUN-98
Cabrio                    07-FEB-99
Chung                     14-JUN-97
Dilly                     13-AUG-97

LAST_NAME                 HIRE_DATE
------------------------- ---------
Gates                     11-JUL-98
Perkins                   19-DEC-99
Bell                      04-FEB-96
Everett                   03-MAR-97
McCain                    01-JUL-98
Jones                     17-MAR-99
Walsh                     24-APR-98
Feeney                    23-MAY-98
OConnell                  21-JUN-99
Grant                     13-JAN-00
Hartstein                 17-FEB-96

LAST_NAME                 HIRE_DATE
------------------------- ---------
Fay                       17-AUG-97
Mavris                    07-JUN-94
Baer                      07-JUN-94
Higgins                   07-JUN-94
Gietz                     07-JUN-94

104 rows selected.