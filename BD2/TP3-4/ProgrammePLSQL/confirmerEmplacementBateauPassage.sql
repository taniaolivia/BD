--==========================
--fichier           : confirmerEmplacementBateauPassage.sql
--base              : Bateau Passage
--auteur(s)         : Tania OLIVIA
--date              : 18/02/2020
--role              : La procedure de la confirmation de l'emplacement du bateau passage
--projet            : Bateau Passage
--resultat dans     :  // à renseigner si nécessaire
--==========================

CREATE OR REPLACE PROCEDURE confirmerEmplBateauPassage(
    V_ID_BATPASS IN BATEAU_PASSAGE.ID_BATPASS%TYPE,
    V_CODPORT IN BATEAU_PASSAGE.CODPORT%TYPE,
    V_NOMBAT IN BATEAU_PASSAGE.NOMBAT%TYPE,
    V_ARV IN BATEAU_PASSAGE.ARV%TYPE,
    V_DEPART IN BATEAU_PASSAGE.DEPART%TYPE,
    V_ID_MOD IN BATEAU_PASSAGE.ID_MOD%TYPE,
    V_NOMPROP IN BATEAU_PASSAGE.NOMPROP%TYPE,
    V_TEL_PORTABLE IN BATEAU_PASSAGE.TEL_PORTABLE%TYPE,
    V_ADRESSE IN BATEAU_PASSAGE.ADRESSE%TYPE,
    V_EMPL_AFF IN BATEAU_PASSAGE.EMPL_AFF%TYPE
)
AS
BEGIN
    INSERT INTO BATEAU_PASSAGE(ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF) 
    VALUES (V_ID_BATPASS, V_CODPORT, V_NOMBAT, TO_DATE(V_ARV, 'DD/MM/YYYY'), TO_DATE(V_DEPART, 'DD/MM/YYYY'), V_ID_MOD, V_NOMPROP, V_TEL_PORTABLE, V_ADRESSE, V_EMPL_AFF);
    COMMIT;
END;
/