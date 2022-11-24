-- ============================================================================
-- Fichier : testRelationContrat_DINV_fk.sql 
-- Auteur  : Tania OLIVIA					
-- Date    : 09/02/2020								
-- Role    : tester les contraintes d'inegrite statiques definies sur la 
-- 	         relation cle etrangere dans le domaine INVALIDE
-- Fichier resultat : testRelationContrat_DINV_fk.out 
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
VALUES (1, 'Yoshi', '10 RUE DU NERVEGE', 'PARIS', 92343, '0932413132');

INSERT INTO TYPE_EMPLACEMENT(TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES(1, 10.23, 57.23, 12.34);

INSERT INTO EMPLACEMENT(ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES(1, 'GO', 'G', 1, 1);


-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================
-- Debut de l'ecriture du fichier resultat du programme de test 
spool testRelationContrat_DINV_fk.out  
prompt fichier resultat du test : testRelationContrat_DINV_fk.out

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
-- Cas : 1
-- L'integrité constrainte de la dépendence de référence CONTRACTANT n'est pas valide
-- ============================================================================
set echo off

INSERT INTO CONTRAT (NUMCONTRAT, DATESIGNATURE, DEBCONTRAT, FINCONTRAT, TYPECONTRAT, CONTRACTANT, EMPLACEMENT)
VALUES (1, '15/04/2020', '15/05/2021', NULL, 'annuel', 2, 1 );

-- ============================================================================
-- Cas : 2
-- L'integrité constrainte de la dépendence de référence EMPLACEMENT n'est pas valide
-- ============================================================================
INSERT INTO CONTRAT (NUMCONTRAT, DATESIGNATURE, DEBCONTRAT, FINCONTRAT, TYPECONTRAT, CONTRACTANT, EMPLACEMENT)
VALUES (2, '11/02/2020', '20/02/2021', NULL, 'annuel', 1, 2 );



set echo on 
-- ============================================================================
-- Contenu de la table RelationContrat apr�s INSERT 
-- ============================================================================
set echo off
@presentation_portPlaisance.sql
-- On affiche le contenu de la relation RelationContrat
SELECT  *
FROM CONTRAT;

spool off

-- ============================================================================
