-- ============================================================================
-- Fichier          : NOM DU PG DE TEST
-- Auteur           : 
-- Date             : 
-- Role             : tester l'ordre SQL : (nom du fichier contenant l'ordre)
-- Fichier resultat : (NOM DU PG DE TEST).out
-- ============================================================================

-- ============================================================================
-- Modification du format de la date pour se conformer aux donnees du programme de test
-- ============================================================================
alter session set NLS_DATE_FORMAT='dd/mm/yyyy';

-- ============================================================================
-- Suppression des nuplets de la base de donnees
-- NB : Le test est effectué sur une base vide, il est nécessaire 
--      de supprimer tous les nuplets de toutes les relations
-- ============================================================================
@videContenuBase.sql

-- ============================================================================
-- Jeu de test pour le DOMAINE VALIDE 
-- NB : L'insertion de chaque nuplet doit faire l'objet d'un commentaire, 
-- notamment pour motiver le/les cas dans le(s)quel(s) il intervient.
-- ===========================================================================

-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

-- ============================================================================
-- resultats a mettre dans le fichier a nommer obligatoirement:
-- 
-- ce fichier doit contenir:	
--	1. l'etat de la base avant execution de la requete 
--		(donc juste apres l'ordre LMD)
--	2. le texte SQL de la requete
--	3. le resultat de l'execution de la requete
-- ============================================================================

-- Debut de l'ecriture du fichier resultat du programme de test 
SPOOL (NOM DU PG DE TEST).out  
PROMPT fichier resultat du test : (NOM DU PG DE TEST).out 

-- Appel du fichier de presentation
@presentation.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base avant : PRECISER ORDRE LMD (INSERT, UPDATE, DELETE)
@afficheContenuBase.sql

-- ============================================================================
-- Requete a tester 
-- ============================================================================

-- Debut de l'affichage du resultat de la requete sur le client SqlPlus
prompt 'Resultat de la requete:'
SET echo ON 
@(NOM DU PG REQUETE LMD).sql ;
SET echo OFF

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base apres : PRECISER ORDRE LMD (INSERT, UPDATE, DELETE)
@afficheContenuBase.sql

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF
