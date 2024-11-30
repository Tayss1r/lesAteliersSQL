1)
SQL> create table Emp as
  2  select employee_id,
  3           first_name || ' ' || last_name as name,
  4           substr(first_name,1,3) || substr(last_name,1,2) || '@hr.com' as email,
  5           salary,
  6           commission_pct,
  7           department_id
  8  from Employees
  9  where salary > 5000;

Table created.

SQL> select * from Emp;

EMPLOYEE_ID NAME
----------- ----------------------------------------------
EMAIL                           SALARY COMMISSION_PCT DEPARTMENT_ID
--------------------------- ---------- -------------- -------------
        176 Jonathon Taylor
JonTa@hr.com                      8600             .2            80

        177 Jack Livingston
JacLi@hr.com                      8400             .2            80

        178 Kimberely Grant
KimGr@hr.com                      7000            .15


EMPLOYEE_ID NAME
----------- ----------------------------------------------
EMAIL                           SALARY COMMISSION_PCT DEPARTMENT_ID
--------------------------- ---------- -------------- -------------
        179 Charles Johnson
ChaJo@hr.com                      6200             .1            80

        201 Michael Hartstein
MicHa@hr.com                     13000                           20

        202 Pat Fay
PatFa@hr.com                      6000                           20


EMPLOYEE_ID NAME
----------- ----------------------------------------------
EMAIL                           SALARY COMMISSION_PCT DEPARTMENT_ID
--------------------------- ---------- -------------- -------------
        203 Susan Mavris
SusMa@hr.com                      6500                           40

        204 Hermann Baer
HerBa@hr.com                     10000                           70

        205 Shelley Higgins
SheHi@hr.com                     12000                          110


EMPLOYEE_ID NAME
----------- ----------------------------------------------
EMAIL                           SALARY COMMISSION_PCT DEPARTMENT_ID
--------------------------- ---------- -------------- -------------
        206 William Gietz
WilGi@hr.com                      8300                          110


58 rows selected.

2)
SQL> create table dep as
  2  select
  3      d.department_id as dep_id,
  4      d.department_name as dep_name,
  5      d.manager_id,
  6      l.city
  7  from departments d
  8  join locations l on d.location_id = l.location_id;

Table created.

SQL> select * from dep;

    DEP_ID DEP_NAME                       MANAGER_ID
---------- ------------------------------ ----------
CITY
------------------------------
       230 IT Helpdesk
Seattle

       240 Government Sales
Seattle

       250 Retail Sales
Seattle


    DEP_ID DEP_NAME                       MANAGER_ID
---------- ------------------------------ ----------
CITY
------------------------------
       260 Recruiting
Seattle

       270 Payroll
Seattle

        20 Marketing                             201
Toronto


    DEP_ID DEP_NAME                       MANAGER_ID
---------- ------------------------------ ----------
CITY
------------------------------
        40 Human Resources                       203
London

        80 Sales                                 145
Oxford

        70 Public Relations                      204
Munich


27 rows selected.


3)
SQL> insert into Emp
  2  select employee_id,
  3  first_name || ' ' || last_name as name,
  4  substr(first_name,1,3) || substr(last_name,1,2) || '@hr.com' as email,
  5  salary,
  6  commission_pct,
  7  department_id
  8  from Employees
  9  where salary <= 5000;

49 rows created.

4)
SQL> select upper(name) as NAME , nvl(to_char(round(commission_pct * salary,2)),'aucune commission') as commission_info
  2  FROM Emp;
NAME
----------------------------------------------
COMMISSION_INFO
----------------------------------------
BRITNEY EVERETT
aucune commission

SAMUEL MCCAIN
aucune commission

VANCE JONES
aucune commission


NAME
----------------------------------------------
COMMISSION_INFO
----------------------------------------
ALANA WALSH
aucune commission

KEVIN FEENEY
aucune commission

DONALD OCONNELL
aucune commission


NAME
----------------------------------------------
COMMISSION_INFO
----------------------------------------
DOUGLAS GRANT
aucune commission

JENNIFER WHALEN
aucune commission


107 rows selected.

5)
SQL> SELECT first_name,hire_date,TO_CHAR(
  2  NEXT_DAY(ADD_MONTHS(hire_date, 6),'MONDAY'),
  3  'Day, "the" DDspth "of" Month, YYYY') as evaluation
  4  FROM employees;

FIRST_NAME           HIRE_DATE
-------------------- ---------
EVALUATION
--------------------------------------------------------------------------------
Douglas              13-JAN-00
Monday   , the SEVENTEENTH of July     , 2000

Jennifer             17-SEP-87
Monday   , the TWENTY-FIRST of March    , 1988

Michael              17-FEB-96
Monday   , the NINETEENTH of August   , 1996


FIRST_NAME           HIRE_DATE
-------------------- ---------
EVALUATION
--------------------------------------------------------------------------------
Pat                  17-AUG-97
Monday   , the TWENTY-THIRD of February , 1998

Susan                07-JUN-94
Monday   , the TWELFTH of December , 1994

Hermann              07-JUN-94
Monday   , the TWELFTH of December , 1994


FIRST_NAME           HIRE_DATE
-------------------- ---------
EVALUATION
--------------------------------------------------------------------------------
Shelley              07-JUN-94
Monday   , the TWELFTH of December , 1994

William              07-JUN-94
Monday   , the TWELFTH of December , 1994


107 rows selected.

6)
SQL> select employee_id, job_id,
  2  case
  3      when job_id = 'AD_PRES' then 'a'
  4      when job_id = 'ST_MAN' then 'b'
  5      when job_id = 'IT_PROG' then 'c'
  6      when job_id = 'SA_REP' then 'd'
  7      when job_id = 'ST_CLERK' then 'e'
  8      else '0'
  9  end as niveau
 10  from employees;

EMPLOYEE_ID JOB_ID     N
----------- ---------- -
        100 AD_PRES    a
        101 AD_VP      0
        102 AD_VP      0
        103 IT_PROG    c
        104 IT_PROG    c
        105 IT_PROG    c
        106 IT_PROG    c
        107 IT_PROG    c
        108 FI_MGR     0
        109 FI_ACCOUNT 0
        110 FI_ACCOUNT 0

EMPLOYEE_ID JOB_ID     N
----------- ---------- -
        111 FI_ACCOUNT 0
        112 FI_ACCOUNT 0
        113 FI_ACCOUNT 0
        114 PU_MAN     0
        115 PU_CLERK   0
        116 PU_CLERK   0
        117 PU_CLERK   0
        118 PU_CLERK   0
        119 PU_CLERK   0
        120 ST_MAN     b
        121 ST_MAN     b

EMPLOYEE_ID JOB_ID     N
----------- ---------- -
        122 ST_MAN     b
        123 ST_MAN     b
        124 ST_MAN     b
        125 ST_CLERK   e
        126 ST_CLERK   e
        127 ST_CLERK   e
        128 ST_CLERK   e
        129 ST_CLERK   e
        130 ST_CLERK   e
        131 ST_CLERK   e
        132 ST_CLERK   e

EMPLOYEE_ID JOB_ID     N
----------- ---------- -
        133 ST_CLERK   e
        134 ST_CLERK   e
        135 ST_CLERK   e
        136 ST_CLERK   e
        137 ST_CLERK   e
        138 ST_CLERK   e
        139 ST_CLERK   e
        140 ST_CLERK   e
        141 ST_CLERK   e
        142 ST_CLERK   e
        143 ST_CLERK   e

EMPLOYEE_ID JOB_ID     N
----------- ---------- -
        144 ST_CLERK   e
        145 SA_MAN     0
        146 SA_MAN     0
        147 SA_MAN     0
        148 SA_MAN     0
        149 SA_MAN     0
        150 SA_REP     d
        151 SA_REP     d
        152 SA_REP     d
        153 SA_REP     d
        154 SA_REP     d
		
107 rows selected.


7)
SQL> update emp
  2  set salary=(select max(salary)
  3  from employees
  4  where department_id=20)
  5  where department_id=10;

1 rows updated.

8) 
SQL> update employees e
  2  set e.salary = (
  3      select max(salary)
  4      from employees
  5      where department_id = e.department_id
  6  )
  7  where e.department_id in (10, 20);

3 rows updated.

9)
SQL> update employees e
  2  set e.hire_date = sysdate,
  3  e.email = 'ferhitayssir' || e.employee_id || '@gmail.com'
  4  where e.manager_id = 108;

5 rows updated.


10)
update employees e
set e.salary = e.salary + (
    select max(commission_pct)
    from employees
    where department_id = 20
)
where e.manager_id = 100;

11) 
SQL> update employees e
  2  set e.salary = e.salary + (
  3  select max(commission_pct)
  4  from employees
  5  where department_id = 20
  6  )
  7  where e.manager_id = 100;

14 rows updated.

12)
SQL> update employees
  2  set commission_pct = 0
  3  where commission_pct is null;

72 rows updated.

13)
delete from employees
where hire_date < (
    select hire_date
    from employees
    where employee_id = 112
);

14)
delete from employees e
where e.department_id in (
    select department_id
    from departments
    where location_id in (
        select location_id
        from locations
        where city = 'Oxford'
    )
);

15)
SQL> select employee_id, first_name
  2  from employees
  3  where first_name like '%li%' or department_id = 50;
  
  EMPLOYEE_ID FIRST_NAME
----------- --------------------
        140 Joshua
        141 Trenna
        142 Curtis
        143 Randall
        144 Peter
        155 Oliver
        171 William
        172 Elizabeth
        180 Winston
        181 Jean
        182 Martha

EMPLOYEE_ID FIRST_NAME
----------- --------------------
        183 Girard
        184 Nandita
        185 Alexis
        186 Julia
        187 Anthony
        188 Kelly
        189 Jennifer
        190 Timothy
        191 Randall
        192 Sarah
        193 Britney

EMPLOYEE_ID FIRST_NAME
----------- --------------------
        194 Samuel
        195 Vance
        196 Alana
        197 Kevin
        198 Donald
        199 Douglas
        206 William

51 rows selected.

16)
SQL> select to_char(hire_date, 'yyyy-mm') as month_year, count(*) as num_recruits
  2  from employees
  3  group by to_char(hire_date, 'yyyy-mm')
  4  order by month_year;

MONTH_Y NUM_RECRUITS
------- ------------
1987-06            1
1987-09            1
1989-09            1
1990-01            1
1991-05            1
1993-01            1
1994-06            4
1994-08            1
1994-12            1
1995-05            2
1995-07            1

MONTH_Y NUM_RECRUITS
------- ------------
1995-10            1
1996-01            2
1996-02            2
1996-03            1
1996-05            1
1996-06            1
1996-07            1
1996-08            1
1996-10            1
1997-01            3
1997-02            2

MONTH_Y NUM_RECRUITS
------- ------------
1997-03            6
1997-04            1
1997-06            2
1997-07            2
1997-08            4
1997-10            3
1997-11            1
1997-12            2
1998-01            2
1998-02            3
1998-03            4

MONTH_Y NUM_RECRUITS
------- ------------
1998-04            3
1998-05            1
1998-06            1
1998-07            3
1998-08            1
1998-09            1
1998-11            2
1998-12            1
1999-01            1
1999-02            3
1999-03            3

MONTH_Y NUM_RECRUITS
------- ------------
1999-04            1
1999-05            1
1999-06            2
1999-08            1
1999-10            1
1999-11            2
1999-12            2
2000-01            4
2000-02            3
2000-03            2
2000-04            2

MONTH_Y NUM_RECRUITS
------- ------------
2024-11            5

56 rows selected.
