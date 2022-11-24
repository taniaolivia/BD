--==========================
--fichier           : executeListeEmplLibres.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 19/02/2020
--role              : La requete pour l'execution de la liste des emplacements libres
--projet            : Bateau passage existe
--resultat dans     : CU_AffEmpl_Cas_BatPassExiste.out
--==========================
SET VERIFY OFF;
VARIABLE V_ARV VARCHAR2(10)
VARIABLE V_DEPART VARCHAR2(10)
ACCEPT V_ARV_LU PROMPT 'Date arrivée du bateau : ';
ACCEPT V_DEPART_LU PROMPT 'Date départ du bateau : ';
BEGIN
 :V_ARV:= &V_ARV_LU;
 :V_DEPART:= &V_DEPART_LU;
 END;
/
PROMPT ===========================================
PROMPT Liste des emplacements libres :
PROMPT ===========================================

SELECT * FROM TABLE (listeEmplacementsLibres(:V_ID_MOD, :V_ARV, :V_DEPART));
/