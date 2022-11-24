-- ============================================================================
-- Fichier : test_invalide_OPER_affect_empl_bat_passage.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Protocole de test du role OPER
--           Affecter emplacement a un bateau de passage
-- Mise en oeuvre : se connecter avec l'utilisateur ayant le role OPER
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
spool test_invalide_OPER_affect_empl_bat_passage.out

set echo on;
-------------------------------------------------------------------------------
-- Etat de la base avant
-------------------------------------------------------------------------------
set echo off;
@presentation.sql; 
@afficheContenuBase_OPER.sql;

set echo on;
-------------------------------------------------------------------------------
-- Affectation d'une place libre a un bateau de passage
-------------------------------------------------------------------------------
-- Tester l'exécution de la procédure : listeEmplacementsLibres
-- Chercher une place libre pour le bateau de passage
-- BATEAU_PASSAGE.IDMOD = 1
-- BATEAU_PASSAGE.ARRIVEE = '01/03/2019'
-- BATEAU_PASSAGE.DEPART = '15/03/2019'
select * from table(TOLIVIA.listeEmplacementsLibres(1, '01/03/2019', '15/03/2019'));

-- Tester l'insertion dans la table BATEAU_PASSAGE
-- Affecter la place id_empl=3 au bateau de passage
INSERT INTO TOLIVIA.BATEAU_PASSAGE (ID_BATPASS,CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, 
            TEL_PORTABLE, ADRESSE, EMPL_AFF)
values (1,'LR', 'MOMO', '01/03/2019', '15/03/2019', 1, 'Jean', 
            null, '24 RUE DE NERVEGE', 3);

-------------------------------------------------------------------------------
-- Etat de la base apres
-------------------------------------------------------------------------------
@afficheContenuBase_OPER.sql ;

-------------------------------------------------------------------------------
-- Fin du programme de test
-------------------------------------------------------------------------------
set echo off;
spool off