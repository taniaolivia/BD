--==========================
--fichier           : supprimerMesTables.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 18/02/2020
--role              : La Fonction pour lister toutes les tables du schéma de l'utilisateuur connecté
--projet            : port de plaisance
--resultat dans     : supprimerMesTables.out
--==========================
SPOOL listerMesTables.out

DROP TYPE typeAllTables FORCE;
CREATE TYPE typeAllTables AS OBJECT(
    TABLE_NAME VARCHAR2(20)
);
/
DROP TYPE typeDescTables FORCE;
CREATE OR REPLACE TYPE typeDescTables IS TABLE OF typeAllTables;
/
CREATE OR REPLACE FUNCTION listerMesTables 
RETURN typeDescTables PIPELINED AS
CURSOR cur_allTables IS
    SELECT TABLE_NAME
    FROM USER_TABLES;
BEGIN
    FOR cur_ligne IN cur_allTables LOOP
        PIPE ROW (typeAllTables(cur_ligne.TABLE_NAME));
    END LOOP;
    RETURN;
END;
/

SELECT * FROM TABLE (listerMesTables);


SPOOL OFF