1)
SQL> create view pieces_jaunes
  2  as select *
  3  from piece
  4  where couleur = 'jaune';

View created.

2)
SQL> create synonym PJ for pieces_jaunes;

Synonym created.

3)
je peux effectuer tout les opérations LMD sur la vue pieces_jaunes;

4)
insert into pieces_jaunes values ('P30', 'cable', 5.5 ,'rouge');
non c pas possible, 
elle existe dans la table piece;

5)
SQL> create or replace view piece_a_envoyer as
  2  select num_p, nom_p, poids * 1.2 as poids_emballe
  3  from piece;

View created.

SQL> select * from piece_a_envoyer;

NUM NOM_P                          POIDS_EMBALLE
--- ------------------------------ -------------
p1  ecran                                    240
p2  bus                                       18
p3  afficheur                              172.8
p4  memoire                                  312
p5  USB                                    651.6
p6  carte                                  916.8
p7  flash                                  115.2
p8  cable                                    240
p9  clavier                                  312
p10 souris                                    18
P30 cable                                    6.6

11 rows selected.

6)
oui, 

7)
non , par ce que la vue est complexe;

8)
non , par ce que la vue est complexe;

9)

SQL> create sequence seq_p
  2  minvalue 10
  3  maxvalue 9000
  4  start with 30
  5  increment by 1
  6  cycle;
Sequence created.


10)
insert into piece values (
'P' || seq_p.nextval,
'npiece', 150 , 'noir'
);

11)
create index idx_piece_poids on piece(poids);
