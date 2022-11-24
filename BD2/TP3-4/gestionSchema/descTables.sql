--==========================
--fichier           : supprimerMesTables.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 18/02/2020
--role              : La fonction pour donner la description d'une table du schéma de l'utilisateur 
--                    connecté avec les types et les noms des contraintes d'intégrité définies sur la table
--projet            : port de plaisance
--resultat dans     : supprimerMesTables.out
--==========================
SPOOL descTables.out

DROP TYPE typeAllTables FORCE;
CREATE TYPE typeAllTables AS OBJECT(
    TABLE_NAME VARCHAR2(20),
    DATA_TYPE VARCHAR2(20)
);
/
DROP TYPE typeDescTables FORCE;
CREATE OR REPLACE TYPE typeDescTables IS TABLE OF typeAllTables;
/
CREATE OR REPLACE FUNCTION descTables 
RETURN typeDescTables PIPELINED AS
CURSOR cur_allTables IS
    SELECT TABLE_NAME, DATA_TYPE
    FROM SYS.TABLES;
BEGIN
    FOR cur_ligne IN cur_allTables LOOP
        PIPE ROW (typeAllTables(cur_ligne.TABLE_NAME, cur_ligne.TABLE_TYPE));
    END LOOP;
    RETURN;
END;
/
SELECT * FROM TABLE (descTables);

SPOOL OFF