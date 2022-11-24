--==========================
--fichier           : ddl_test1.sql
--auteur(s)         : Tania OLIVIA
--date              : 11/03/2020
--role              : ddl de la table test1
--resultat dans     : //
--==========================

DROP TABLE test1;
CREATE TABLE test1 (
    ID NUMBER DEFAULT ON NULL seq_test1.nextval,
    DESCRIPTION VARCHAR2(30),
    CONSTRAINT UNQ_TEST1 UNIQUE(ID)
);