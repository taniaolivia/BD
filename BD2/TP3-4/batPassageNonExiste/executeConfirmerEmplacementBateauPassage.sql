--==========================
--fichier           : executeDetailsBateauPassage.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 19/02/2020
--role              : La requete pour l'execution de la confirmation d'emplacement du bateau passage
--projet            : Bateau Passage non existe
--resultat dans     : CU_AffEmpl_Cas_BatPassNonExiste.out
--==========================

SET VERIFY OFF;
VARIABLE V_ID_BATPASS NUMBER
VARIABLE V_EMPL_AFF NUMBER
ACCEPT V_ID_BATPASS_LU PROMPT 'Identifiant : ';
ACCEPT V_EMPL_AFF_LU PROMPT 'Emplacement choisi : ';
BEGIN
 :V_ID_BATPASS := &V_ID_BATPASS_LU;
 :V_EMPL_AFF:= &V_EMPL_AFF_LU ;
END;
/
PROMPT ==================================================================
PROMPT Confirmation de lemplacement du bateau de passage choisi :
PROMPT ==================================================================
EXECUTE confirmerEmplBateauPassage(&V_ID_BATPASS_LU, :V_CODPORT, :V_NOMBAT, :V_ARV, :V_DEPART, :V_ID_MOD, :V_NOMPROP, :V_TEL_PORTABLE, :V_ADRESSE, &V_EMPL_AFF_LU);
SELECT * FROM BATEAU_PASSAGE;
/