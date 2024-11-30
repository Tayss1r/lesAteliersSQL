SQL> create table departement
  2   ( Num_D CHAR(3) constraint pk_dep primary key,
  3     Nom_d varchar(20));

Table created.

SQL>
SQL> create table salle
  2  ( Num_S char(3) constraint pk_salle primary key,
  3   Nom_S varchar (10),
  4   Num_D char (3) constraint pk_salle_dep references departement  (Num_D));

Table created.

SQL>
SQL> create table poste
  2  ( Num_P char (3) constraint pk_poste primary key,
  3    Nom_P varchar (10),
  4    Num_S char(3) constraint pk_poste_salle references salle  (Num_S));

Table created.

SQL>
SQL> create table logiciel
  2  ( Num_L char (5) constraint pk_logiciel primary key ,
  3    Nom_L varchar (15),
  4    Date_Ach date,
  5    Version varchar (7));

Table created.

SQL>
SQL> create table installer
  2  (  Num_P char (3),
  3     Num_L char(5),
  4     Date_Inst date,
  5    constraint pk_installer primary key (Num_P,Num_L),
  6    constraint pf_installe_poste foreign key (Num_P) references poste (Num_P),
  7    constraint pf_installe_logiciel foreign key (Num_L) references logiciel (Num_L));

Table created.

SQL> ALTER TABLE departement MODIFY DATE_CRE DEFAULT TO_DATE('01/01/1995', 'DD/MM/YYYY');

Table altered.

SQL> ALTER TABLE departement ADD CAPACITE_Max NUMBER(3) NOT NULL;

Table altered.

SQL> ALTER TABLE departement ADD CONSTRAINT chk_capacite_max CHECK (CAPACITE_Max < 5000);

Table altered.

SQL> ALTER TABLE departement ADD CONSTRAINT uq_nom_dep UNIQUE (Nom_d);

Table altered.

SQL> CREATE TABLE DEP AS SELECT * FROM departement;

Table created.

SQL> ALTER TABLE DEP RENAME TO DEP1;

Table altered.

SQL> DROP TABLE DEP1;

Table dropped.


SQL> insert into departement values ('10','Informatique');

1 row created.

SQL> insert into departement values ('20','Gestion');

1 row created.

SQL> insert into departement values ('30','Géni civil');

1 row created.

SQL> insert into salle values ('S01','Salle1','10');

1 row created.

SQL> insert into salle values ('S02','Salle2','10');

1 row created.

SQL> insert into salle values ('S03','Salle3','10');

1 row created.

SQL> insert into salle values ('S11','Salle11','20');

1 row created.

SQL> insert into salle values ('S12','Salle12','20');

1 row created.

SQL> insert into salle values ('S21','Salle21','30');

1 row created.

SQL> insert into poste values ('P1','Poste1','S01');

1 row created.

SQL> insert into poste values ('P2','Poste2','S01');

1 row created.

SQL> insert into poste values ('P3','Poste3','S02');

1 row created.

SQL> insert into poste values ('P4','Poste4','S03');

1 row created.

SQL> insert into poste values ('P5','Poste5','S11');

1 row created.

SQL> insert into poste values ('P6','Poste6','S11');

1 row created.

SQL> insert into poste values ('P7','Poste7','S12');

1 row created.

SQL> insert into poste values ('P8','Poste8','S12');

1 row created.

SQL> insert into poste values ('P9','Poste9','S21');

1 row created.

SQL> insert into Logiciel values ('LOG1','ORACLE7',to_date('13-05-2000','dd/mm/yyyy'),'7.3.2');

1 row created.

SQL> insert into Logiciel values ('LOG2','ORACLE8',to_date('15-05-2000','dd/mm/yyyy'),'8.0');

1 row created.

SQL> insert into Logiciel values ('LOG3','SQL SERVER',to_date('12-04-2003','dd/mm/yyyy'),'7');

1 row created.

SQL> insert into Logiciel values ('LOG4','FRONT PAGE',to_date('03-06-2003','dd/mm/yyyy'),'5');

1 row created.

SQL> insert into Logiciel values ('LOG5','OPEN OFFICE',to_date('03-06-2002','dd/mm/yyyy'),'5');

1 row created.

SQL> insert into Logiciel values ('LOG6','SQL*plus',to_date('03-06-2003','dd/mm/yyyy'),'2.0');

1 row created.

SQL> insert into Logiciel values ('LOG7','OFFICE98',to_date('03-06-2003','dd/mm/yyyy'),'98');

1 row created.

SQL> insert into installer values ('P1','LOG1',to_date('15-05-2000','dd/mm/yyyy'));

1 row created.

SQL> insert into installer values ('P1','LOG3',to_date('01-05-2003','dd/mm/yyyy'));

1 row created.

SQL> insert into installer values ('P2','LOG5',to_date('05-06-2002','dd/mm/yyyy'));

1 row created.

SQL> insert into installer values ('P2','LOG7',to_date('15-07-2000','dd/mm/yyyy'));

1 row created.

SQL> insert into installer values ('P3','LOG5',to_date('16-07-2000','dd/mm/yyyy'));

1 row created.

SQL> insert into installer values ('P4','LOG1',to_date('16-07-2000','dd/mm/yyyy'));

1 row created.

SQL> insert into installer values ('P5','LOG7',to_date('15-08-2000','dd/mm/yyyy'));

1 row created.

SQL> insert into installer values ('P5','LOG2',to_date('01-10-2024','dd/mm/yyyy'));

1 row created.

SQL> insert into installer values ('P5','LOG1',to_date('19-05-2000','dd/mm/yyyy'));

1 row created.

SQL> insert into installer values ('P5','LOG4',to_date('13-05-2003','dd/mm/yyyy'));

1 row created.

SQL> insert into installer values ('P7','LOG1',to_date('13-05-2009','dd/mm/yyyy'));

1 row created.


SQL> AlTER TABLE poste ADD(TYPE_PROC VARCHAR(15));

Table altered.

SQL> ALTER TABLE salle MODIFY(Nom_S VARCHAR(30));

Table altered.

SQL> CREATE TABLE TYPE
  2  (
  3  TYPE_LP VARCHAR(6) constraint pk_TYPE primary key,
  4  NOM_TYPE VARCHAR(20));

Table created.

SQL> ALTER TABLE logiciel ADD(TYPE_LP VARCHAR(6));

Table altered.

SQL> ALTER TABLE poste ADD(TYPE_LP VARCHAR(6));

Table altered.

SQL> ALTER TABLE logiciel
  2  ADD CONSTRAINT fk_Logiciel_type FOREIGN KEY (type_lp) REFERENCES type(type_lp);

Table altered.

SQL> ALTER TABLE poste
  2  ADD CONSTRAINT fk_Poste FOREIGN KEY (TYPE_LP) REFERENCES TYPE(TYPE_LP);

Table altered.

SQL> insert into TYPE
  2  values('TX','terminal x windows');

1 row created.

SQL> insert into TYPE
  2  values('UNIX','systeme unix');

1 row created.

SQL> insert into TYPE
  2  values('PCNT','pc windows nt');

1 row created.

SQL> insert into TYPE
  2  values('PCWS','pc windows 98');

1 row created.

SQL> insert into TYPE
  2  values('NC','network computer');

1 row created.

SQL> insert into TYPE
  2  values('UB','pc ubunto');

1 row created.

SQL> update poste
  2  set type_lp='TX'
  3  where num_p in('P1','P4');

2 rows updated.

SQL> update  poste
  2  set type_lp='NC'
  3  where num_p in('P8','P9');

2 rows updated.

SQL> update  poste
  2  set type_lp='PCNT'
  3  where num_p in('P3');

1 row updated.

SQL> update  poste
  2  set type_lp='UNIX'
  3  where num_p in('P6','P2');

2 rows updated.

SQL> update logiciel
  2  set type_lp='UNIX'
  3  where num_l in('LOG1','LOG2','LOG4','LOG5');

4 rows updated.