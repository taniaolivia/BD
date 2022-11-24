-- ============================================================================
-- Fichier : test_valide_RESPORT_select_bat_resident.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Tester le privilège « gérer un bateau résident » domaine valide
-- Mise en oeuvre : se connecter avec l'utilisateur ayant le role RESPORT
-- ============================================================================

-------------------------------------------------------------------------------
-- Changement du format de la date dans la session courante
-------------------------------------------------------------------------------
alter session set NLS_DATE_FORMAT='dd/mm/yyyy';

-------------------------------------------------------------------------------
-- Autorisation des messages du serveur 
-------------------------------------------------------------------------------
set serveroutput on;

-------------------------------------------------------------------------------
-- Fichier resultat du test
-------------------------------------------------------------------------------
spool test_valide_RESPORT_select_bat_resident.out

set echo on;
-------------------------------------------------------------------------------
-- Etat de la base avant
-------------------------------------------------------------------------------
set echo off;
@presentation.sql ; 
@afficheContenuBase_RESPORT.sql ;

set echo on;

-------------------------------------------------------------------------------
--  Tester SELECT d'un nuplet du BATEAU_RESIDENT
-------------------------------------------------------------------------------
-- Contenu avant SELECT
select *
from  TOLIVIA.BATEAU_RESIDENT;

-- SELECT d'un nuplet du BATEAU_RESIDENT
SELECT *
FROM TOLIVIA.BATEAU_RESIDENT
WHERE NOMBAT='LANO';

set echo off

set echo on


-------------------------------------------------------------------------------
-- Etat de la base apres
-------------------------------------------------------------------------------
@afficheContenuBase_RESPORT.sql ;

-------------------------------------------------------------------------------
-- Fin du programme de test
-------------------------------------------------------------------------------
commit;
set echo off;
spool off