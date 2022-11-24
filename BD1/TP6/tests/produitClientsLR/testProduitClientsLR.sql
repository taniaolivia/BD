-- ============================================================================
-- Fichier          : testProduitClientsLR_V2.sql
-- Auteur           : Tania OLIVIA
-- Date             : 27 Novembre 2019
-- Base				: Surgeles
-- Role             : La requête pour calculer les produits commandés par tous les clients habitant à La Rochelle
-- Fichier resultat : testProduitClientsLR.out
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
-- Tous les clients (client 1 et 2) qui habitent à La Rochelle sont un domaine valide 
-- Il prend un jointure entre produit, ligne_commande, commande et client
-- Tous les clients qui possèdent le produit 1 est un domaine valide
------- Les clients habitant La Rochelle (2 clients)
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0505050505', 'martin@example.org', 'La Rochelle'); 
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(2, 'DUPONT', 'Jean', '0605050505', 'dupont@example.org', 'La Rochelle');
------- Un produit
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(1, 'a', 'DESSERT');
------- Une commande 
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(10, 1, '01/10/2013', '20/10/2013');
------- Une ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(100, 10, 1, 5, 3);
------- Une commande 
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(20, 2, '02/10/2013', '20/10/2013');
------- Une ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(200, 20, 1, 2, 4);


--CAS2
-- Tous les clients (client 1 et 2) qui habitent à La Rochelle sont un domaine valide 
-- Il prend un jointure entre produit, ligne_commande, commande et client
-- Tous les clients qui possèdent le produit 2 est un domaine valide
------- Un produit
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(2, 'b', 'DESSERT');
------- Une commande 
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(11, 1, '01/10/2013', '20/10/2013');
------- Une ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(300, 11, 2, 5, 3);
------- Une commande 
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(21, 2, '02/10/2013', '20/10/2013');
------- Une ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(400, 21, 2, 2, 4);
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(3, 'CAVIN', 'Pauline', '0606060606', 'cavin@example.org', 'Saintes');
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(30, 3, '03/10/2013', '20/10/2013');
------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(500, 30, 2, 3, 6);






-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE
-- ============================================================================

--CAS3
-- Il prend un jointure entre produit, ligne_commande, commande et client
-- Le client 3 ne habite pas à La Rochelle 
-- Le client qui possèdent le produit 3 est un domaine invalide
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(3, 'c', 'DESSERT');
------- Une commande 
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(12, 1, '01/10/2013', '20/10/2013');
------- Une ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(600, 12, 3, 3, 6);


--CAS4
-- Il prend un jointure entre produit, ligne_commande, commande et client
-- Le client 4 ne habite pas à La Rochelle 
-- Le client qui possèdent le produit 4 est un domaine invalide
------- Un produit
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(4, 'd', 'POISSON');
------- Un client 
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(4, 'DURAND', 'Paul', '0606060606', 'durand@example.org', 'Niort');
------- Une commande 
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(40, 4, '01/10/2013', '20/10/2013');
------- Une ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(700, 40, 4, 2, 6);



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
SPOOL testProduitClientsLR.out
PROMPT fichier resultat du test : testProduitClientsLR.out

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
@produitClientsLR.sql
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

