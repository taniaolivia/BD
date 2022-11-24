-- ============================================================================
-- Fichier : testRelation(Nom de la relation)_DV.sql 
-- Auteur  : 					
-- Date    : 						
-- Role    : tester les contraintes d'inegrite statiques definies sur la 
-- 	   (Nom de la relation) dans le domaine VALIDE
-- Fichier resultat : testRelation(Nom de la relation)_DV.out 
-- ============================================================================
ALTER SESSION SET NLS_DATE_FORMAT='dd/mm/yyyy';

-- ============================================================================
-- NB : le test est effectu� sur une base vide, donc on fait la
-- suppression de tous les nuplets de toutes les relations.
-- Prise en charge des dependances de reference dans l'ordre de suppression
-- du contenu des relations de la base de donnees. 
-- ============================================================================
@vide_contenu_base_portPlaisance.sql ;

-- ============================================================================
-- Insertion dans les relations referencees par "xxxxxx" 
-- ============================================================================
INSERT INTO PROPRIETAIRE(ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES (1, 'Yoshi', '10 RUE DU NERVEGE', 'PARIS', 92343, '0932413132');

INSERT INTO TYPE_EMPLACEMENT(TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES(1, 10.23, 57.23, 12.34);

INSERT INTO EMPLACEMENT(ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES(1, 'GO', 'G', 1, 1);

INSERT INTO PROPRIETAIRE(ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES (2,'Kimmy','28 RUE DU CORDOUAN' , 'LA ROCHELLE' , 17000 , '0780915143');

INSERT INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES (2 , 22.1 , 23.4 , 45.9);

INSERT INTO EMPLACEMENT (ID_EMPL, BASSIN,PONTON, EMPLNO,TYPE_EMPL)
VALUES (2 , 'JON' , 'J' , 2 , 2 );

INSERT INTO PROPRIETAIRE(ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES (3,'Yummy','30 RUE DU TONUE' , 'LILLE' , 52314 , '0780914231');

INSERT INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES (3 , 32.1 , 12.4 , 23.2);

INSERT INTO EMPLACEMENT (ID_EMPL, BASSIN,PONTON, EMPLNO,TYPE_EMPL)
VALUES (3 , 'RUT' , 'R' , 3 , 3 );


-- ============================================================================
-- Jeu de test pour le DOMAINE VALIDE 
-- ============================================================================
-- ============================================================================
-- Cas 1
-- insertion d'un nuplet verifiant 
------- toutes les contraintes de check
------- toutes les d�pendances de r�f�rence sur attributs non NULL 
------- avec les valeurs nulles possibles
-- ============================================================================

INSERT INTO CONTRAT (NUMCONTRAT, DATESIGNATURE, DEBCONTRAT, FINCONTRAT, TYPECONTRAT, CONTRACTANT, EMPLACEMENT)
VALUES (1, '17/09/2020', '09/10/2021', NULL, 'annuel', 1, 1 );


-- ============================================================================
-- Cas 2
-- insertion d'un nuplet verifiant : 
------- toutes les contraintes de cl�s
------- toutes les contraintes de check (attributs non null)
------- toutes les d�pendances de reference (attributs non null)
------- avec les valeurs nulles possibles
-- ============================================================================

INSERT INTO CONTRAT (NUMCONTRAT, DATESIGNATURE, DEBCONTRAT, FINCONTRAT, TYPECONTRAT, CONTRACTANT, EMPLACEMENT)
VALUES (2, '12/03/2020', '14/11/2020', NULL, 'annuel', 2, 2 );


-- ============================================================================
-- Cas 3
-- insertion d'un nuplet verifiant : 
------- toutes les contraintes de cles
------- toutes les contraintes de check (attributs non null) 
------- toutes les dependances de reference (attributs non null)
------- avec les valeurs par defaut 
------- et sans les valeurs nulles
-- ============================================================================

INSERT INTO CONTRAT (NUMCONTRAT, DATESIGNATURE, DEBCONTRAT, FINCONTRAT, TYPECONTRAT, CONTRACTANT, EMPLACEMENT)
VALUES (3, '13/04/2020', '15/12/2021', '09/02/2020', 'annuel', 3, 3 );

-- ============================================================================
-- Affichage du contenu des differentes relations et verification de la bonne 
-- affectation des valeurs initiales 
-- Resultats a mettre dans le fichier a nommer obligatoirement: 
-- testRelationContrat_DV.out
-- ============================================================================

-- Debut de l'ecriture du fichier resultat du programme de test 
spool testRelationContrat_DV.out  
prompt fichier resultat du test : testRelationContrat_DV.out

-- appel du fichier de presentation
@presentation_portPlaisance.sql

-- Afficher le contenu des relations de la base de donnees
prompt Contenu de la base : 
set echo on
@afficher_contenu_base_portPlaisance.sql
set echo off

spool off

-- ============================================================================
-- fin du programme de test
-- ============================================================================
