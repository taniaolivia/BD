-- ============================================================================
-- Fichier : test_invalide_OPER_sortie_bat_resident.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Protocole de test du role OPER
--           Enregistrer une sortie d'un bateau résident 
-- Mise en oeuvre : se connecter avec l'utilisateur ayant le role OPER
-- Precondition : LOGIN : executer le jeu de test : prep_test_affect_empl_bat_resident.sql 
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
spool test_invalide_OPER_sortie_bat_resident.out

set echo on;
-------------------------------------------------------------------------------
-- Etat de la base avant
-------------------------------------------------------------------------------
set echo off;
@presentation.sql ; 
@afficheContenuBase_OPER.sql ;

set echo on;
-------------------------------------------------------------------------------
-- Enregistrer une sortie d'un bateau résident 
-------------------------------------------------------------------------------

-- Bateau résident (BR, LANO) n'existe pas

insert into TOLIVIA.sortie (codport, nombat, datsortprev, datsortrelle, datretprev, 
                            datretrelle, eff_prv)
values ('BR', 'LANO', '10/01/2019', '10/01/2019', '20/01/2019', 
                    '20/01/2019','prv') ;

-------------------------------------------------------------------------------
-- Etat de la base apres
-------------------------------------------------------------------------------
@afficheContenuBase_OPER.sql ;

-------------------------------------------------------------------------------
-- Fin du programme de test
-------------------------------------------------------------------------------
set echo off;
spool off
