--==========================
--fichier           : listeEmplacementsLibres.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 18/02/2020
--role              : La fonction de la liste des emplacements libres en prenant compte les données tournées et les paramètres
--projet            : emplacament libre
--resultat dans     :  // à renseigner si nécessaire
--==========================

DROP TYPE typeEmplacement FORCE;
CREATE OR REPLACE TYPE typeEmplacement AS OBJECT(
    ID_EMPL     NUMBER,
    BASSIN      VARCHAR(20),
    PONTON      CHAR(1),
    EMPLNO      NUMBER,
    DEB_LIBRE   DATE,
    FIN_LIBRE   DATE
);
/
DROP TYPE listeTypeEmplacement FORCE;
CREATE TYPE listeTypeEmplacement IS TABLE OF typeEmplacement;
/
CREATE OR REPLACE FUNCTION listeEmplacementsLibres(
    V_ID_MOD IN BATEAU_PASSAGE.ID_MOD%TYPE,
    V_ARV IN BATEAU_PASSAGE.ARV%TYPE,
    V_DEPART IN BATEAU_PASSAGE.DEPART%TYPE
)
RETURN listeTypeEmplacement PIPELINED AS
CURSOR cur_listeEmplLibres IS
        SELECT DISTINCT EL.ID_EMPL, E.BASSIN, E.PONTON, E.EMPLNO, EL.DEB_LIBRE, EL.FIN_LIBRE
        FROM EMPLACEMENT E, EMPLACEMENT_LIBRE EL, TYPE_EMPLACEMENT T, MODELE M
        WHERE EL.ID_EMPL = E.ID_EMPL 
        AND EL.TYPE_EMPL = T.TYPE_EMPL
        AND TO_DATE(V_ARV, 'DD/MM/YYYY') >= EL.DEB_LIBRE
        AND TO_DATE(V_DEPART, 'DD/MM/YYYY') <= EL.FIN_LIBRE
        AND M.ID_MOD = V_ID_MOD
        AND M.LONGR < T.LONGR
        AND M.LARG < T.LARG
        AND M.TIRANT < T.PROFOND;
BEGIN
    FOR cur_ligne IN cur_listeEmplLibres LOOP
        PIPE ROW (typeEmplacement (cur_ligne.ID_EMPL, cur_ligne.BASSIN, cur_ligne.PONTON, cur_ligne.EMPLNO, cur_ligne.DEB_LIBRE, cur_ligne.FIN_LIBRE));
    END LOOP;
    RETURN;
END;
/