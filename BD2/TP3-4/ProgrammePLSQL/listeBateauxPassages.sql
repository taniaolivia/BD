--==========================
--fichier           : listeBateauxPassages.sql
--base              : Bateau Passage
--auteur(s)         : Tania OLIVIA
--date              : 11/02/2020
--role              : La fonction de la liste du bateau passage qui retourne uniquement les données demandées
--projet            : Bateau Passage
--resultat dans     :  // à renseigner si nécessaire
--==========================

DROP TYPE typeBP FORCE;
CREATE TYPE typeBP AS OBJECT(
    CODPORT     CHAR(2),
    NOMBAT      VARCHAR(20),
    CODMOD      VARCHAR2(20));
/
DROP TYPE typeListeBP FORCE;
CREATE TYPE typeListeBP IS TABLE OF typeBP;
/
CREATE OR REPLACE FUNCTION listeBateauxPassages
RETURN typeListeBP PIPELINED AS
CURSOR cur_listeBP IS
        SELECT DISTINCT BP.CODPORT, BP.NOMBAT, M.CODMOD
        FROM BATEAU_PASSAGE BP, MODELE M
        WHERE BP.ID_MOD = M.ID_MOD;
BEGIN
    FOR cur_ligne IN cur_ListeBP LOOP
        PIPE ROW (typeBP (cur_ligne.CODPORT, cur_ligne.NOMBAT, cur_ligne.CODMOD));
    END LOOP;
    RETURN;
END;
/