SQL> select department_name, department_id,
  2  max(salary) as max_salary, min(salary) as min_salary
  3  from departments join employees using (department_id)
  4  group by department_id, department_name;

DEPARTMENT_NAME                DEPARTMENT_ID MAX_SALARY MIN_SALARY
------------------------------ ------------- ---------- ----------
Finance                                  100      12000       6900
Shipping                                  50       8200       2100
Public Relations                          70      10000      10000
Executive                                 90      24000      17000
Purchasing                                30      11000       2500
Administration                            10       4400       4400
Accounting                               110      12000       8300
Human Resources                           40       6500       6500
IT                                        60       9000       4200
Sales                                     80      14000       6100
Marketing                                 20      13000       6000

11 rows selected.