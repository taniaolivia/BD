--==========================
--fichier           : CU_AffEmpl_Cas_BatPassNonExiste.sql
--base              : port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 19/02/2020
--role              : Afficher tous les execution du cas bateau passage non existe
--projet            : Bateau Passage non existe
--resultat dans     : CU_AffEmpl_Cas_BatPassNonExiste.out
--==========================
 
SPOOL CU_AffEmplBatPass_Cas_BatPassNonExiste.out

-- Debut de l'affichage du resultat de l'executation du detail de bateau passage
prompt 'Resultat de lexecutation du nouveau bateau passage:'
@executeNouveauBateauPassage.sql ;


-- Debut de l'affichage du resultat de l'executation du detail de bateau passage
prompt 'Resultat de lexecutation de la liste des emplacements libres:'
@executeListeEmplLibres.sql ;

-- Debut de l'affichage du resultat de l'executation de la confirmation de l'emplacement du bateau passage
prompt 'Resultat de lexecutation de la confirmation de lemplacement du bateau passage:'
@executeConfirmerEmplacementBateauPassage.sql ;


-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF
