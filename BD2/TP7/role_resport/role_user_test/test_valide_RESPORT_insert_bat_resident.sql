-- ============================================================================
-- Fichier : test_valide_RESPORT_insert_bat_resident.sql 
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
spool test_valide_RESPORT_insert_bat_resident.out

set echo on;
-------------------------------------------------------------------------------
-- Etat de la base avant
-------------------------------------------------------------------------------
set echo off;
@presentation.sql ; 
@afficheContenuBase_RESPORT.sql ;

set echo on;
-------------------------------------------------------------------------------
--  Tester INSERT d'un nuplet du BATEAU_RESIDENT
-------------------------------------------------------------------------------
-- Contenu avant INSERT
select *
from  TOLIVIA.BATEAU_RESIDENT;

-- INSERT d'un nuplet du BATEAU_RESIDENT
INSERT INTO TOLIVIA.BATEAU_RESIDENT(ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES (5, 'LR', 'PAPO', '1', 3, 14);

-- Contenu apres INSERT
select *
from   TOLIVIA.BATEAU_RESIDENT;

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