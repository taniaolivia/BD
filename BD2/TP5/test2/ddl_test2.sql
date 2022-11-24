--==========================
--fichier           : ddl_test2.sql
--auteur(s)         : Tania OLIVIA
--date              : 11/03/2020
--role              : ddl de la table test2
--resultat dans     : //
--==========================

DROP TABLE test2;
CREATE TABLE test2 (
    ID NUMBER GENERATED ALWAYS AS IDENTITY,
    DESCRIPTION VARCHAR2(30),
    CONSTRAINT UNQ_test2 UNIQUE(ID)
);