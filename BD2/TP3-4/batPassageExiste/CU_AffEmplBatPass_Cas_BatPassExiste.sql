--==========================
--fichier           : CU_AffEmpl_Cas_BatPassExiste.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 19/02/2020
--role              : Afficher tous les execution du cas bateau passage existe
--projet            : Bateau Passage existe
--resultat dans     : CU_AffEmpl_Cas_BatPassExiste.out
--==========================

SPOOL CU_AffEmplBatPass_Cas_BatPassExiste.out

-- Debut de l'affichage du resultat de l'executation de la liste de bateau passage
prompt 'Resultat de lexecutation de la liste de bateau passage:'
@executeListeBateauPassage.sql ;


-- Debut de l'affichage du resultat de l'executation du detail de bateau passage
prompt 'Resultat de lexecutation du detail de bateau passage:'
@executeDetailsBateauPassage.sql ;


-- Debut de l'affichage du resultat de l'executation du detail de bateau passage
prompt 'Resultat de lexecutation de la liste des emplacements libres:'
@executeListeEmplLibres.sql ;


-- Debut de l'affichage du resultat de l'executation de la confirmation de l'emplacement du bateau passage
prompt 'Resultat de lexecutation de la confirmation de lemplacement du bateau passage:'
@executeConfirmerEmplacementBateauPassage.sql ;


-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF
