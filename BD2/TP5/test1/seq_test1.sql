--==========================
--fichier           : seq_test1.sql
--auteur(s)         : Tania OLIVIA
--date              : 11/03/2020
--role              : La création de la séquence de test 1
--resultat dans     : //
--==========================

DROP SEQUENCE seq_test1;
CREATE SEQUENCE seq_test1                                                                                                                                                                                                                                                                                                                 
INCREMENT BY 1
START WITH 1
MINVALUE 0
NOCYCLE
CACHE 25;