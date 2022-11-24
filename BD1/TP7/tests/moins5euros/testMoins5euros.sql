-- ============================================================================
-- Fichier          : testMoins5euros.sql
-- Auteur           : Tania OLIVIA
-- Date             : 10 Decembre 2019
-- Base				: Surgeles
-- Role             : Le test pour les commandes moins de 5 euros
-- Fichier resultat : testMoins5euros.out
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
@ ../../utilitaires/vider_base_surgeles.sql

-- ============================================================================
-- Jeu de test pour le DOMAINE VALIDE 
-- NB : L'insertion de chaque nuplet doit faire l'objet d'un commentaire, 
-- notamment pour motiver le/les cas dans le(s)quel(s) il intervient.
-- ============================================================================

--CAS1
-- 1ère commande de Jean MARTIN
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0505050505', 'martin@example.org', 'La Rochelle'); 

------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(1, 1, TO_DATE('01/10/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));

INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES (1, 'A', 'DESSERT');

INSERT INTO LIGNE_COMMANDE (IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES (1, 1, 1, '5', '4');





-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

--CAS1
-------La commande qui n'a pas passée par le client 1 parce que le prix unitaire est plus de 5 euros
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(2, 1, TO_DATE('01/11/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));

INSERT INTO LIGNE_COMMANDE (IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES (2, 2, 1, '5', '8');



--CAS2
-------La commande qui n'a pas passée par le client 1 parce que le prix unitaire est plus de 5 euros
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES (2, 'B', 'POISSON');

INSERT INTO LIGNE_COMMANDE (IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES (3, 2, 2, '5', '10');


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
SPOOL testMoins5euros.out
PROMPT fichier resultat du test : testMoins5euros.out

-- Appel du fichier de presentation
@ ../../utilitaires/presentation_surgeles.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base : 
@ ../../utilitaires/afficher_base_surgeles.sql

-- ============================================================================
-- Requete a tester 
-- ============================================================================
prompt 'Resultat de la requete avec une sous-requete'
SET echo ON
@moins5euros.sql
SET echo OFF

prompt 'Resultat de la requete sans sous-requete'
SET echo ON
@moins5eurosSansSR.sql
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

