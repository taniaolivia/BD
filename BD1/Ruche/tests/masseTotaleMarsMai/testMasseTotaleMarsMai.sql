-- ============================================================================
-- Fichier          : testMasseTotaleMarsMai.sql
-- Auteur           : Tania OLIVIA
-- Date             : 13 Janvier 2020
-- Base				: Ruche
-- Role             : Le test pour afficher une rêquete sur la masse totale de miel récolté entre mars 2018 et mai 2018 par type de miel
-- Fichier resultat : testMasseTotaleMarsMai.out
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
@ ../utilitaires/vider_base_ruche.sql
-- ============================================================================
-- Jeu de test pour le DOMAINE VALIDE 
-- NB : L'insertion de chaque nuplet doit faire l'objet d'un commentaire, 
-- notamment pour motiver le/les cas dans le(s)quel(s) il intervient.
-- ============================================================================


-- CAS1
-- L’apiculteur 2 récolte du miel entre mars 2018 et mai 2018
------- L'apiculteur
INSERT INTO APICULTEUR (IDAPI, NOMAPI, PRENOMAPI, TELAPI, MAILAPI, ADRAPI)
VALUES(2, 'VANILLE', 'Charles', '0607070707', 'vanille@example.org', 'La Rochelle'); 
------- Le rucher
INSERT INTO RUCHER (IDRUCHER, TYPEMIEL)
VALUES(2, 'colza');
------- La ruche
INSERT INTO RUCHE (IDRU, NBCADRE, IDAPI, IDRUCHER)
VALUES(2, 10, 2, 2);
------- Le recolte
INSERT INTO RECOLTE (IDRU, DATEREC, MASSE)
VALUES(2, '23/03/2018', '4');



-- CAS2
-- L’apiculteur 3 récolte du miel entre mars 2018 et mai 2018
------- L'apiculteur
INSERT INTO APICULTEUR (IDAPI, NOMAPI, PRENOMAPI, TELAPI, MAILAPI, ADRAPI)
VALUES(3, 'LALLIC', 'Tituan', '0707070707', 'lallic@example.org', 'La Rochelle'); 
------- Le rucher
INSERT INTO RUCHER (IDRUCHER, TYPEMIEL)
VALUES(3, 'sapin');
------- La ruche
INSERT INTO RUCHE (IDRU, NBCADRE, IDAPI, IDRUCHER)
VALUES(4, 15, 3, 3);
------- Le recolte
INSERT INTO RECOLTE (IDRU, DATEREC, MASSE)
VALUES(4, '25/05/2018', '6');



-- CAS3
-- L’apiculteur 3 récolte du miel entre mars 2018 et mai 2018
------- Le rucher
INSERT INTO RUCHER (IDRUCHER, TYPEMIEL)
VALUES(4, 'thym');
------- La ruche
INSERT INTO RUCHE (IDRU, NBCADRE, IDAPI, IDRUCHER)
VALUES(5, 5, 3, 4);
------- Le recolte
INSERT INTO RECOLTE (IDRU, DATEREC, MASSE)
VALUES(5, '02/04/2018', '8');




-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

-- CAS4
-- L’apiculteur 1 ne récolte pas du miel entre mars 2018 et mai 2018
------- L'apiculteur
INSERT INTO APICULTEUR (IDAPI, NOMAPI, PRENOMAPI, TELAPI, MAILAPI, ADRAPI)
VALUES(1, 'DUPONT', 'Jean', '0606060606', 'dupont@example.org', 'La Rochelle'); 
------- Le rucher
INSERT INTO RUCHER (IDRUCHER, TYPEMIEL)
VALUES(1, 'acacia');
------- La ruche
INSERT INTO RUCHE (IDRU, NBCADRE, IDAPI, IDRUCHER)
VALUES(1, 1, 1, 1);
------- La recolte
INSERT INTO RECOLTE (IDRU, DATEREC, MASSE)
VALUES(1, '01/12/2018', '5');



-- CAS5
-- L’apiculteur 2 ne récolte pas du miel entre mars 2018 et mai 2018
------- Le recolte
INSERT INTO RECOLTE (IDRU, DATEREC, MASSE)
VALUES(2, '10/06/2018', '9');



-- CAS6
-- L’apiculteur 1 ne récolte pas du miel entre mars 2018 et mai 2018
------- La ruche
INSERT INTO RUCHE (IDRU, NBCADRE, IDAPI, IDRUCHER)
VALUES(3, 11, 3, 1);
------- Le recolte
INSERT INTO RECOLTE (IDRU, DATEREC, MASSE)
VALUES(3, '01/12/2018', '9');




-- ============================================================================
-- resultats a mettre dans le fichier a nommer obligatoirement:
-- 
-- ce fichier doit contenir:	
--	1. l'etat de la base avant execution de la requete (donc juste apres 
--         les INSERT)
--	2. le texte SQL de la requete
--	3. le resultat de l'execution de la requete
-- ============================================================================

-- Debut de l'ecriture du fichier resultat du programme de test 
SPOOL masseTotaleMarsMai/testMasseTotaleMarsMai.out
PROMPT fichier resultat du test : masseTotaleMarsMai/testMasseTotaleMarsMai.out

-- Appel du fichier de presentation
@ ../utilitaires/presentation_ruche.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base :
@ ../utilitaires/afficher_base_ruche.sql

-- ============================================================================
-- Requete a tester 
-- ============================================================================
prompt 'Resultat de la requete'
SET echo ON
@masseTotaleMarsMai/masseTotaleMarsMai.sql
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

