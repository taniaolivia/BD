-- ============================================================================
-- Fichier          : testTypeMielPlusRecolte.sql
-- Auteur           : Tania OLIVIA
-- Date             : 13 Janvier 2020
-- Base				: Ruche
-- Role             : Le test pour afficher une rêquete sur le type miel le plus récolté
-- Fichier resultat : testTypeMielPlusRecolte.out
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
-- La masse totale du type de miel "acacia" est le plus récolté que l'autre type de miel
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


-- CAS2
-- La masse totale du type de miel "acacia" est le plus récolté que l'autre type de miel
------- L'apiculteur
INSERT INTO APICULTEUR (IDAPI, NOMAPI, PRENOMAPI, TELAPI, MAILAPI, ADRAPI)
VALUES(3, 'LALLIC', 'Tituan', '0707070707', 'lallic@example.org', 'La Rochelle'); 
------- La ruche
INSERT INTO RUCHE (IDRU, NBCADRE, IDAPI, IDRUCHER)
VALUES(3, 11, 3, 1);
------- Le recolte
INSERT INTO RECOLTE (IDRU, DATEREC, MASSE)
VALUES(3, '01/12/2018', '9');




-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

-- CAS3
-- La masse totale du type de miel "colza" n'est pas le plus récolté que le type de miel "acacia"
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



-- CAS4
-- La masse totale du type de miel "colza" n'est pas le plus récolté que le type de miel "acacia"
------- Le recolte
INSERT INTO RECOLTE (IDRU, DATEREC, MASSE)
VALUES(2, '10/06/2018', '9');



-- CAS5
-- La masse totale du type de miel "sapin" n'est pas le plus récolté que le type de miel "acacia"
------- Le rucher
INSERT INTO RUCHER (IDRUCHER, TYPEMIEL)
VALUES(3, 'sapin');
------- La ruche
INSERT INTO RUCHE (IDRU, NBCADRE, IDAPI, IDRUCHER)
VALUES(4, 15, 3, 3);
------- Le recolte
INSERT INTO RECOLTE (IDRU, DATEREC, MASSE)
VALUES(4, '25/05/2018', '6');



-- CAS6
-- La masse totale du type de miel "thym" n'est pas le plus récolté que le type de miel "acacia"
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
-- resultats a mettre dans le fichier a nommer obligatoirement:
-- 
-- ce fichier doit contenir:	
--	1. l'etat de la base avant execution de la requete (donc juste apres 
--         les INSERT)
--	2. le texte SQL de la requete
--	3. le resultat de l'execution de la requete
-- ============================================================================

-- Debut de l'ecriture du fichier resultat du programme de test 
SPOOL typeMielPlusRecolte/testTypeMielPlusRecolte.out
PROMPT fichier resultat du test : typeMielPlusRecolte/testTypeMielPlusRecolte.out

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
@typeMielPlusRecolte/typeMielPlusRecolte.sql
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

