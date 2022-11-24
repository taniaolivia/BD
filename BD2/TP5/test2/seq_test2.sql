--==========================
--fichier           : seq_test2.sql
--auteur(s)         : Tania OLIVIA
--date              : 11/03/2020
--role              : La création de la séquence de test 2
--resultat dans     : //
--==========================

DROP SEQUENCE seq_test2;
CREATE SEQUENCE seq_test2
INCREMENT BY 1
START WITH 1
MINVALUE 0
NOCYCLE
CACHE 25;