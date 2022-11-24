--==========================
--fichier           : detailsBateauPassage.sql
--base              : Bateau Passage
--auteur(s)         : Tania OLIVIA
--date              : 11/02/2020
--role              : La procedure du détail de bateau passage qui retourne uniquement les données demandées
--projet            : Bateau Passage
--resultat dans     :  // à renseigner si nécessaire
--==========================

CREATE OR REPLACE PROCEDURE detailsBateauPassage(
    V_CODPORT IN BATEAU_PASSAGE.CODPORT%TYPE,
    V_NOMBAT IN BATEAU_PASSAGE.NOMBAT%TYPE,
    V_ID_MOD OUT BATEAU_PASSAGE.ID_MOD%TYPE,
    V_NOMPROP OUT BATEAU_PASSAGE.NOMPROP%TYPE,
    V_TEL_PORTABLE OUT BATEAU_PASSAGE.TEL_PORTABLE%TYPE,
    V_ADRESSE OUT BATEAU_PASSAGE.ADRESSE%TYPE
)
AS
BEGIN
    SELECT DISTINCT BP.ID_MOD, BP.NOMPROP, BP.TEL_PORTABLE, BP.ADRESSE
    INTO V_ID_MOD, V_NOMPROP, V_TEL_PORTABLE, V_ADRESSE
    FROM BATEAU_PASSAGE BP
    WHERE UPPER(BP.CODPORT) = UPPER(V_CODPORT)
    AND UPPER(BP.NOMBAT) = UPPER(V_NOMBAT);
END;
/