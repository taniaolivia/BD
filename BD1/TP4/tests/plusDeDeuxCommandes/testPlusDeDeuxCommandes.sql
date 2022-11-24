-- ============================================================================
-- Fichier          : testPlusDeDeuxCommandes.sql
-- Auteur           : OLIVIA Tania
-- Date             : 15 Novembre 2019
-- Role             : test pour la requete "nombre plus de deux commandes passées
--					          pour un client".
-- Projet			: surgeles
-- Fichier resultat : testPlusDeDeuxCommandes.out
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

-- CAS1 : Un client qui a passé 2 commandes

-- 1ère commande de Jean MARTIN
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0505050505', 'martin@example.org', 'La Rochelle'); 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(1, 1, TO_DATE('01/05/2013', 'DD/MM/YYYY'), TO_DATE('20/06/2013', 'DD/MM/YYYY'));


-- 2ème commande de Jean MARTIN
------- Le client de la commande
-- Le client est Jean MARTIN de code 1, MEME client que pour la commande 1, donc on ne le recrée pas
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(3, 1, TO_DATE('01/10/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));


-- 3ème commande de Jean MARTIN
------- Le client de la commande
-- Le client est Jean MARTIN de code 1, MEME client que pour la commande 1, donc on ne le recrée pas
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(5, 1, TO_DATE('01/07/2013', 'DD/MM/YYYY'), TO_DATE('10/11/2013', 'DD/MM/YYYY'));


-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE
-- NB : L'insertion de chaque nuplet doit faire l'objet d'un commentaire,
-- notamment pour motiver le/les cas dans le(s)quel(s) il intervient.
-- ============================================================================

-- CAS 2: Un client qui a passé 1 commande

INSERT  INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, ADRCLI, TELCLI, MAILCLI)
VALUES ('2', 'DUPONT', 'Jean', 'La Rochelle', '0506060606', 'dupont@example.org');

INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(2, 2, TO_DATE('01/09/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));


-- CAS 3 : Un client qui a passé 1 commande

INSERT  INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, ADRCLI, TELCLI, MAILCLI)
VALUES ('3', 'CAVIN', 'Pauline', 'La Rochelle', '0507070707', 'cavin@example.org');

INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(4, 3, TO_DATE('01/11/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));

-- ============================================================================
-- resultats a mettre dans le fichier out a nommer obligatoirement:
-- 
-- ce fichier doit contenir:	
--	1. l'etat de la base avant execution de la requete (donc juste apres 
--         les INSERT)
--	2. le texte SQL de la requete
--	3. le resultat de l'execution de la requete
-- ============================================================================

-- Debut de l'ecriture du fichier resultat du programme de test 
SPOOL testNbrCommandeClient.out
PROMPT fichier resultat du test : testPlusDeDeuxCommandes.out

-- Appel du fichier de presentation
@ ../../utilitaires/presentation_surgeles.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base :
@ ../../utilitaires/afficher_base_surgeles.sql

-- ============================================================================
-- Requete a tester 
-- ============================================================================

-- Debut de l'affichage du resultat de la requete sur le client SqlPlus
PROMPT 'Resultat de la requete:'
SET echo ON
@ plusDeDeuxCommandes.sql ;
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

