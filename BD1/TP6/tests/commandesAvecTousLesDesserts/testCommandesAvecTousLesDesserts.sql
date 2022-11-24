============================================================================
-- Fichier          : testCommandesAvecTousLesDesserts.sql
-- Auteur           : Tania OLIVIA
-- Date             : 27 Novembre 2019
-- Base		        : Surgeles
-- Role             : La requête pour calculer les commandes qui possèdent tous les produits de type "dessert"
-- Fichier resultat : testCommandesAvecTousLesDesserts.out
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
-- Domaine valide parce qu'il possède un produit de type "DESSERT" en voyant le commande 1
-- Tous les LIGNE_COMMANDE qui possèdent IDCOM = 1 sont un domaine valide 
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0605050505', 'martin@example.org', 'La Rochelle'); 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(1, 1, '01/10/2013', '20/10/2013');

------- Le produit
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(1, 'a', 'DESSERT');
------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(1, 1, 1, 5, 3.4);

------- Le produit
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(2, 'b', 'DESSERT');
------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(2, 1, 2, 5, 3.4);

------- Le produit
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(3, 'c', 'VIANDE');
------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(3, 1, 3, 5, 3.4);


-- CAS2
-- Domaine valide parce qu'il possède un produit de type "DESSERT" en voyant le commande 2
-- Tous les LIGNE_COMMANDE qui possèdent IDCOM = 2 sont un domaine valide 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(2, 1, '01/10/2013', '25/10/2013');

------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(4, 2, 1, 5, 3.4);

------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(5, 2, 2, 5, 3.4);


-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE
-- ============================================================================

-- CAS3
-- Domaine invalide parce qu'il ne possède pas un produit de type "DESSERT" en voyant le commande 3
-- Tous les LIGNE_COMMANDE qui possèdent IDCOM = 3 sont un domaine invalide 
-- CAS 3 possède un produit de type "VIANDE"
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(3, 1, '05/10/2013', '20/11/2013');

------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(6, 3, 1, 5, 3.4);

------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(7, 3, 3, 5, 3.4);

-- CAS4
-- Domaine invalide parce qu'il ne possède pas un produit de type "dessert" en voyant le commande 4
-- Tous les LIGNE_COMMANDE qui possèdent IDCOM = 4 sont un domaine invalide
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(4, 1, '05/10/2013', '20/11/2013');

------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(8, 4, 3, 5, 3.4);

------- Le produit
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(4, 'd', 'POISSON');
------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(9, 4, 4, 5, 3.4);

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
SPOOL testCommandesAvecTousLesDesserts.out
PROMPT fichier resultat du test : testCommandesAvecTousLesDesserts.out

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
@commandesAvecTousLesDesserts.sql
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

