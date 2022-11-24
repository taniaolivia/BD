-- ============================================================================
-- Fichier          : testCommandesSansDessert.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18 Novembre 2019
-- Base		        : Surgeles
-- Role             : Le test pour les commandes sans dessert
-- Fichier resultat : testCommandesSansDessert.out
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

-- CAS 1
-- 1ère commande de Jean MARTIN
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0505050505', 'martin@example.org', 'La Rochelle'); 

-------la commande passée par le client 1
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(4, 1, TO_DATE('01/12/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));

INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES (2, 'B', 'POISSON');

INSERT INTO LIGNE_COMMANDE (IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES (6, 4, 2, '5', '4');



-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

-- CAS 2
-- 1ère commande de Jean MARTIN
------- Le client de la commande
-- Le client est Jean MARTIN de code 1, MEME client que pour la commande 1 de cas 1, donc on ne le recrée pas
-------la commande qui n'a passé par le client 1
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(1, 1, TO_DATE('01/09/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));

INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES (1, 'A', 'DESSERT');

INSERT INTO LIGNE_COMMANDE (IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES (1, 1, 1, '5', '10');



-- 2ème commande de Jean MARTIN
------- Le client de la commande
-- Le client est Jean MARTIN de code 1, MEME client que pour la commande 1 de cas 1, donc on ne le recrée pas
-------la commande qui n'a passé par le client 1
-- L'identifiant du produit est 1, MEME commande que pour la commande 1, donc on ne le recrée pas

INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(2, 1, TO_DATE('01/10/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));

INSERT INTO LIGNE_COMMANDE (IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES (2, 2, 1, '5', '4');



-- 3ème commande de Jean MARTIN
------- Le client de la commande
-- Le client est Jean MARTIN de code 1, MEME client que pour la commande 1 de cas 1, donc on ne le recrée pas
-------la commande qui n'a passé par le client 1
-- L'identifiant de commande est 2, MEME commande que pour la commande 2, donc on ne le recrée pas
-- L'identifiant du produit est 2, MEME commande que pour la commande 1 de cas 1, donc on ne le recrée pas

INSERT INTO LIGNE_COMMANDE (IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES (3, 2, 2, '5', '2');



-- 4ème commande de Jean MARTIN
------- Le client de la commande
-- Le client est Jean MARTIN de code 1, MEME client que pour la commande 1 de cas 1, donc on ne le recrée pas
-------la commande qui n'a passé par le client 1
-- L'identifiant du produit est 1, MEME commande que pour la commande 1, donc on ne le recrée pas
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(3, 1, TO_DATE('01/11/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));

INSERT INTO LIGNE_COMMANDE (IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES (4, 3, 1, '5', '4');



-- 5ème commande de Jean MARTIN
------- Le client de la commande
-- Le client est Jean MARTIN de code 1, MEME client que pour la commande 1 de cas 1, donc on ne le recrée pas
-------la commande qui n'a passé par le client 1
-- L'identifiant de commande est 3, MEME commande que pour la commande 4, donc on ne le recrée pas
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES (3, 'C', 'DESSERT');

INSERT INTO LIGNE_COMMANDE (IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES (5, 3, 3, '5', '10');


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
SPOOL testCommandesSansDessert.out
PROMPT fichier resultat du test : testCommandesSansDessert.out

-- Appel du fichier de presentation
@ ../../utilitaires/presentation_surgeles.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base : 
@ ../../utilitaires/afficher_base_surgeles.sql

-- ============================================================================
-- Requete a tester 
-- ============================================================================

-- Debut de l'affichage du resultat de la requete sur le client SqlPlus
PROMPT 'Resultat de la requete avec IN'
SET echo ON
@commandesSansDessertIN.sql
SET echo OFF

PROMPT 'Resultat de la requete avec Exists'
SET echo ON
@commandesSansDessertExists.sql
SET echo OFF

prompt 'Resultat de la requete sans sous-requete'
SET echo ON
@commandesSansDessertSansSR.sql
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

