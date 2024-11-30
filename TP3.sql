1)
select i.num_p, i.num_l, l.nom_l 
from installer i 
join logiciel l on i.num_l = l.num_l 
order by i.num_p;

NUM_P  NUM_L  NOM_L
------ ------ ---------------
P1     LOG1   ORACLE7
P1     LOG3   SQL SERVER
P2     LOG5   OPEN OFFICE
P2     LOG7   OFFICE98
P3     LOG5   OPEN OFFICE
P4     LOG1   ORACLE7
P5     LOG7   OFFICE98
P5     LOG2   ORACLE8
P5     LOG1   ORACLE7
P5     LOG4   FRONT PAGE
P7     LOG1   ORACLE7

2)
select p.num_p, p.typ_lp, d.nom_d 
from poste p 
join salle s on p.num_s = s.num_s 
join departement d on s.num_d = d.num_d 
where p.typ_lp != 'NC';


NUM_P  TYP_LP NOM_D
------ ------ -----------
P1     TX     Informatique
P2     UNIX   Informatique
P3     PCNT   Informatique
P4     TX     Informatique
P6     UNIX   Gestion

3)
select l.Nom_L 
from installer i 
join logiciel l on i.Num_L = l.Num_L 
where i.Num_P = 'P1';

NOM_L
---------------
ORACLE7
SQL SERVER

4)
select num_p, count(num_l) as nombre_logiciels 
from installer 
where num_p in ('P1', 'P3', 'P4', 'P7') 
group by num_p;

NUM_P  Nombre_Logiciels
------ ----------------
P1     2
P3     1
P4     1
P7     1

5)
select d.nom_d, count(s.num_s) as nombre_salles 
from departement d 
left join salle s on d.num_d = s.num_d 
group by d.nom_d;

NOM_D         Nombre_Salles
-----------   -------------
Informatique  3
Gestion       2
Géni civil    1

6)
select p.num_p 
from poste p 
join salle s on p.num_s = s.num_s 
join departement d on s.num_d = d.num_d 
where d.nom_d = 'informatique';

NUM_P
------
P1
P2
P3
P4

7)
select l.nom_l 
from logiciel l 
join installer i on l.num_l = i.num_l 
where extract(month from l.date_ach) = 6 
group by l.nom_l 
having count(i.num_l) > 3;

NOM_L
---------------
No row selected.

8)
select nom_l 
from logiciel 
where num_l not in (select num_l from installer);

NOM_L
---------------
SQL*plus

9)
select nom_d 
from departement d 
left join salle s on d.num_d = s.num_d 
left join poste p on s.num_s = p.num_s 
where p.num_p is null;

NOM_D
---------------
Géni civil

10)
select num_p 
from installer 
group by num_p 
having count(num_l) =(
select max(nb_ins) 
from (
select count(*) as nb_ins 
from installer 
group by num_l));



NUM_P
------
P5

11)
select num_p 
from installer 
group by num_p 
having count(num_l) = (select count(*) from logiciel);

NUM_P
------
No row selected

12)
select i1.num_p 
from installer i1 
join installer i2 on i1.num_l = i2.num_l 
where i2.num_p = 'P5';

NUM_P
------
P1
P2
P3
P4
P5
P7

13)
select num_l 
from installer 
group by num_l 
having count(*) > (select count(*) from installer where num_l = 'LOG4');

NUM_L
------
LOG1
LOG5

14)
select i.num_l 
from installer i 
group by i.num_l 
having count(*) >= all(
select count(*) 
from installer i2 
group by i2.num_l
);


NUM_L
------
LOG1

15)
select num_l 
from installer 
group by num_l 
having count(distinct num_p) = (select count(*) from poste);

NUM_L
------
No row selected.

16)
select distinct s.num_s 
from salle s 
join poste p on s.num_s = p.num_s 
join installer i on p.num_p = i.num_p 
where i.date_inst > (select max(date_inst) 
from installer i2 
join poste p2 on i2.num_p = p2.num_p 
where p2.num_s = 'S01');

NUM_S
------
S11
S21

17)
select num_l, date_inst 
from installer 
group by num_l, date_inst 
having count(*) > 1;

NUM_L  DATE_INST
------ ----------
LOG1   15-MAY-00
LOG1   03-JUN-03

18)
select num_p 
from poste 
where num_p not in (select i.num_p 
from installer i 
where i.num_l in (select num_l 
from installer 
where num_p = 'P1'));

NUM_P
------
P5
P8
P9
