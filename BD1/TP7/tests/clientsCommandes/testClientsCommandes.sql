-- ============================================================================
-- Fichier          : testClientsCommandes.sql
-- Auteur           : Tania OLIVIA
-- Date             : 6 Decembre 2019
-- Base				: Surgeles
-- Role             : Le test pour afficher la liste de tous les clients en indiquant leurs commandes passées
-- Fichier resultat : testClientsCommandes.out
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
-- Un client qui a passé une commande
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0605050505', 'martin@example.org', 'La Rochelle'); 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(1, 1, TO_DATE('01/09/2013', 'DD/MM/YYYY'),  TO_DATE('20/12/2013', 'DD/MM/YYYY'));



-- CAS2
-- Un autre client qui a passé une commande
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(2, 1, TO_DATE('02/09/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));



-- CAS3
-- Un autre client qui a passé une commande
------- Le client de la commande
INSERT  INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, ADRCLI, TELCLI, MAILCLI)
VALUES (2, 'DUPONT', 'Jean', 'La Rochelle', '0506060606', 'dupont@example.org');

------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(3, 2, TO_DATE('01/09/2013', 'DD/MM/YYYY'), TO_DATE('20/12/2013', 'DD/MM/YYYY'));



-- CAS 4
-- Un autre client qui n'a pas passé une commande
------- Le client de la commande
INSERT  INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, ADRCLI, TELCLI, MAILCLI)
VALUES (3, 'CAVIN', 'Pauline', 'La Rochelle', '0507070707', 'cavin@example.org');



-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================


-- Il n'y a pas le domaine invalide


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
SPOOL testClientsCommandes.out
PROMPT fichier resultat du test : testClientsCommandes.out

-- Appel du fichier de presentation
@ ../../utilitaires/presentation_surgeles.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base : 
@ ../../utilitaires/afficher_base_surgeles.sql

-- ============================================================================
-- Requete a tester 
-- ============================================================================
prompt 'Resultat de la requete avec une jointure externe'
SET echo ON
@clientsCommandes.sql
SET echo OFF

prompt 'Resultat de la requete avec UNION'
SET echo ON
@clientsCommandesUnion.sql
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

