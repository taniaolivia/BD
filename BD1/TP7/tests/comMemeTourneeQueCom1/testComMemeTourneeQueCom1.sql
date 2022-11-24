-- ============================================================================
-- Fichier          : testComMemeTourneeQueCom1.sql
-- Auteur           : Tania OLIVIA
-- Date             : 10 Decembre 2019
-- Base				: Surgeles
-- Role             : Le test pour les commandes livrées à la même date que la commande de code 1
-- Fichier resultat : testComMemeTourneeQueCom1.out
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

-- CAS1
--Cas 1 a la commande livrée à la même date que la commande de code 1 
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(2, 'DUPONT', 'Jean', '0606060606', 'dupont@example.org', 'La Rochelle'); 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(2, 2, '01/10/2013', '25/10/2013');
------- Le liveur de la tournée
INSERT INTO LIVREUR (IDLIV, NOMLIV)
VALUES(1, 'BERTRAND');
------- La livraison
INSERT INTO LIVRAISON (IDLIV, IDCOM, DATELIV)
VALUES(1, 2, '25/11/2013');

-- CAS2
--Cas 2 a la commande livrée à la même date que la commande de code 1 
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(3, 'VANILLE', 'Charles', '0607070707', 'vanille@example.org', 'La Rochelle'); 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(3, 3, '05/10/2013', '20/11/2013');
------- La livraison
INSERT INTO LIVRAISON (IDLIV, IDCOM, DATELIV)
VALUES(1, 3, '25/11/2013');


-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

-- CAS3
--Cas 3 est les références pour la commande de code 1
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0605050505', 'martin@example.org', 'La Rochelle'); 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(1, 1, '01/10/2013', '20/10/2013');
------- La tournée
INSERT INTO LIVRAISON (IDLIV, IDCOM, DATELIV)
VALUES(1, 1, '25/11/2013');

-- CAS4
--Cas 4 n'a pas la commande livrée à la même date que la commande de code 1 
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(4, 'LALLIC', 'Tituan', '0707070707', 'lallic@example.org', 'La Rochelle'); 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(4, 4, '01/10/2013', '20/11/2013');
------- La livraison
INSERT INTO LIVRAISON (IDLIV, IDCOM, DATELIV)
VALUES(1, 4, '26/11/2013');

-- CAS5
--Cas 5 n'a pas la commande livrée à la même date que la commande de code 1 
------ Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(5, 'CAVIN', 'Pauline', '0608080808', 'cavin@example.org', 'La Rochelle'); 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(5, 5, '01/10/2013', '25/10/2013');
------- Le liveur de la tournée
INSERT INTO LIVREUR (IDLIV, NOMLIV)
VALUES(2, 'MAURICE');
------- La livraison
INSERT INTO LIVRAISON (IDLIV, IDCOM, DATELIV)
VALUES(2, 5, '25/11/2013');

-- CAS6
--Cas 6 n'a pas la commande livrée à la même date que la commande de code 1 
------ Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(6, 'VOTIN', 'Elodie', '0609080808', 'votin@example.org', 'La Rochelle'); 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(6, 6, '05/10/2013', '25/10/2013');
------- La livraison
INSERT INTO LIVRAISON (IDLIV, IDCOM, DATELIV)
VALUES(2, 6, '26/11/2013');

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
SPOOL testComMemeTourneeQueCom1.out
PROMPT fichier resultat du test : testComMemeTourneeQueCom1.out

-- Appel du fichier de presentation
@ ../../utilitaires/presentation_surgeles.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base :
@ ../../utilitaires/afficher_base_surgeles.sql

-- ============================================================================
-- Requete a tester 
-- ============================================================================
prompt 'Resultat de la requete'
SET echo ON
@comMemeTourneeQueCom1.sql
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

