--==========================
--fichier           : executeNouveauBateauPassage.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 19/02/2020
--role              : La requete pour l'execution du nouveau bateau passage
--projet            : Bateau Passage non existe
--resultat dans     : CU_AffEmpl_Cas_BatPassNonExiste.out
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
ACCEPT V_ID_MOD_LU PROMPT 'ID_MOD : ';
ACCEPT V_NOMPROP_LU PROMPT 'NOMPROP : ';
ACCEPT V_TEL_PORTABLE_LU PROMPT 'TEL_PORTABLE : ';
ACCEPT V_ADRESSE_LU PROMPT 'ADRESSE : ';
BEGIN
 :V_CODPORT:= &V_CODPORT_LU;
 :V_NOMBAT:= &V_NOMBAT_LU;
 :V_ID_MOD:= &V_ID_MOD_LU;
 :V_NOMPROP:= &V_NOMPROP_LU;
 :V_TEL_PORTABLE:= &V_TEL_PORTABLE_LU;
 :V_ADRESSE:= &V_ADRESSE_LU;
END;
/

