--==========================
--fichier           : executeDetailsBateauPassage.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 19/02/2020
--role              : La requete pour l'execution du detail de bateau passage
--projet            : Bateau Passage existe
--resultat dans     : CU_AffEmpl_Cas_BatPassExiste.out
--==========================

SET VERIFY OFF;
VARIABLE V_CODPORT CHAR(2)
VARIABLE V_NOMBAT VARCHAR2(40)
VARIABLE V_ID_MOD NUMBER
VARIABLE V_NOMPROP VARCHAR2(40)
VARIABLE V_TEL_PORTABLE VARCHAR2(10)
VARIABLE V_ADRESSE VARCHAR2(60)
ACCEPT V_CODPORT_LU PROMPT 'CODPORT : ';
ACCEPT V_NOMBAT_LU PROMPT 'NOMBAT : ';
BEGIN
 :V_CODPORT:= &V_CODPORT_LU;
 :V_NOMBAT:= &V_NOMBAT_LU;
 detailsBateauPassage( :V_CODPORT, :V_NOMBAT, :V_ID_MOD, :V_NOMPROP, :V_TEL_PORTABLE, :V_ADRESSE);
END;
/
COL V_NOMPROP FORMAT A20;
COL V_TEL_PORTABLE FORMAT A20;
COL V_ADRESSE FORMAT A20;
PROMPT ===========================================
PROMPT Detail du bateau de passage choisi :
PROMPT ===========================================

PRINT V_ID_MOD V_NOMPROP V_TEL_PORTABLE V_ADRESSE;