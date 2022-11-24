-- ============================================================================
-- Fichier : testRelationContrat_DINV_uq.sql 
-- Auteur  : Tania OLIVIA					
-- Date    : 09/02/2020							
-- Role    : tester les contraintes d'inegrite statiques definies sur la 
-- 	         relation cle unique dans le domaine INVALIDE
-- Fichier resultat : testRelationContrat_DINV_uq.out 
-- ============================================================================
ALTER SESSION SET NLS_DATE_FORMAT='dd/mm/yyyy';

-- ============================================================================
-- NB : le test est effectue sur une base vide, donc on fait la
-- suppression de tous les nuplets de toutes les relations.
-- Prise en charge des dependances de reference dans l'ordre de suppression
-- du contenu des relations de la base de donnees. 
-- ============================================================================
@vide_Contenu_base_portPlaisance.sql ;

-- ============================================================================
-- Insertion dans les relations referencees par RelationContrat
-- ============================================================================
INSERT INTO PROPRIETAIRE(ID_PROP, NOMPROP,ADRESSE, VILLE,CODPOSTAL,TEL_PORTABLE)
VALUES (1,'James','3 Chateau des freines' , 'Paris' , 85450 , '0545068514');

INSERT INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR,LARG, PROFOND)
VALUES (1 , 5.0 , 5.0 , 5.0);

INSERT INTO EMPLACEMENT (ID_EMPL, BASSIN,PONTON, EMPLNO,TYPE_EMPL)
VALUES (1 , 'Baie aiguillon' , 'A' ,1 , 1 );




-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================
-- Debut de l'ecriture du fichier resultat du programme de test 
spool testRelationContrat_DINV_uq.out  
prompt fichier resultat du test : testRelationContrat_DINV_uq.out

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
-- L'integrité constrainte de la cle unique du DEBCONTRAT n'est pas valide
-- ============================================================================
set echo off

INSERT INTO CONTRAT(NUMCONTRAT, DATESIGNATURE, DEBCONTRAT, FINCONTRAT, TYPECONTRAT, CONTRACTANT, EMPLACEMENT)
VALUES (1, TO_DATE('01/01/2020','DD/MM/YYYY'), TO_DATE('02/01/2020','DD/MM/YYYY'), NULL, 'saisonnier', 1, 1) ;

-- ============================================================================
-- Cas : 2
-- L'integrité constrainte de la cle unique de l'EMPLACEMENT n'est pas valide
-- ============================================================================

INSERT INTO CONTRAT(NUMCONTRAT, DATESIGNATURE, DEBCONTRAT, FINCONTRAT, TYPECONTRAT, CONTRACTANT, EMPLACEMENT) 
VALUES (2, TO_DATE('01/05/2020','DD/MM/YYYY'), TO_DATE('02/01/2021','DD/MM/YYYY'), NULL, 'saisonnier', 1, 2) ;


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
