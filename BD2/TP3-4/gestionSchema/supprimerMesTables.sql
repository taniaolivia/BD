--==========================
--fichier           : supprimerMesTables.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 18/02/2020
--role              : La procedure pour supprimer toutes les tables du schéma de l'utilisateuur connecté
--projet            : port de plaisance
--resultat dans     : supprimerMesTables.out
--==========================

CREATE OR REPLACE PROCEDURE supprimerMesTables 
AS
CURSOR cur_allTables IS
    SELECT TABLE_NAME
    FROM USER_TABLES;
BEGIN
    FOR cur_ligne IN cur_allTables LOOP
        EXECUTE IMMEDIATE 'DROP TABLE '||cur_ligne.TABLE_NAME||' CASCADE CONSTRAINTS';
    END LOOP;
END;
/
BEGIN
    supprimerMesTables();
END;
/
