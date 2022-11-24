-- ============================================================================
-- Fichier : testRelationContrat_DINV_ck_TYPECONTRAT.sql 
-- Auteur  : Tania OLIVIA					
-- Date    : 09/02/2020						
-- Role    : tester les contraintes d'inegrite statiques definies sur la 
-- 	         relation contrat du check TYPECONTRAT dans le domaine INVALIDE
-- Fichier resultat : testRelationContrat_DINV_ck_TYPECONTRAT.out 
-- ============================================================================
ALTER SESSION SET NLS_DATE_FORMAT='dd/mm/yyyy';

-- ============================================================================
-- NB : le test est effectue sur une base vide, donc on fait la
-- suppression de tous les nuplets de toutes les relations.
-- Prise en charge des dependances de reference dans l'ordre de suppression
-- du contenu des relations de la base de donnees. 
-- ============================================================================
@vide_contenu_base_portPlaisance.sql ;

-- ============================================================================
-- Insertion dans les relations referencees par RelationContrat
-- ============================================================================
INSERT INTO PROPRIETAIRE(ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES (1,'Kimmy','28 RUE DU CORDOUAN' , 'LA ROCHELLE' , 17000 , '0780915143');

INSERT INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES (1 , 22.1 , 23.4 , 45.9);

INSERT INTO EMPLACEMENT (ID_EMPL, BASSIN,PONTON, EMPLNO,TYPE_EMPL)
VALUES (1 , 'JON' , 'J' , 1 , 1 );

-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================
-- Debut de l'ecriture du fichier resultat du programme de test 
spool testRelationContrat_DINV_ck_TYPECONTRAT.out  
prompt fichier resultat du test : testRelationContrat_DINV_ck_TYPECONTRAT.out

set echo on 
-- ============================================================================
-- Contenu de la table RelationContrat avant INSERT 
-- ============================================================================
set echo off
@presentation_portPlaisance.sql
-- On affiche le contenu de la relation RelationContrat
SELECT  *
FROM CONTRAT;

set echo on 
-- ============================================================================
-- Cas 1: 
-- Le différent nom du type contrat qui n'est pas dans la liste du type contrat autorisé
-- ============================================================================
set echo off

-- Il ne va pas afficher ce cas parce qu'il existe une violation dans le check constrainte (TYPECONTRAT)
INSERT INTO CONTRAT(NUMCONTRAT, DATESIGNATURE, DEBCONTRAT, FINCONTRAT, TYPECONTRAT, CONTRACTANT, EMPLACEMENT) 
VALUES (1, TO_DATE('16/12/2019','DD/MM/YYYY'), TO_DATE('18/12/2019','DD/MM/YYYY'),NULL,'faux', 1 , 1) ;


set echo on 
-- ============================================================================
-- Contenu de la table RelationContrat apres INSERT 
-- ============================================================================
set echo off
@presentation_portPlaisance.sql
-- On affiche le contenu de la relation RelationContrat
SELECT  *
FROM CONTRAT;

spool off

-- ============================================================================
