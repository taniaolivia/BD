--==========================
--fichier           : executeListeBateauPassage.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 19/02/2020
--role              : La requete pour l'execution de la liste de bateau passage
--projet            : Bateau Passage existe
--resultat dans     : CU_AffEmpl_Cas_BatPassExiste.out
--==========================
PROMPT ===========================================
PROMPT Liste des bateaux de passage :
PROMPT ===========================================
COLUMN CODPORT FORMAT A7;
COLUMN NOMBAT FORMAT A10;
COLUMN CODMOD FORMAT A7;
SELECT * FROM TABLE (listeBateauxPassages);