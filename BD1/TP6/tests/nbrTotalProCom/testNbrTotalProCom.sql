-- ============================================================================
-- Fichier          : testNbrTotalProCom.sql
-- Auteur           : Tania OLIVIA
-- Date             : 27 Novembre 2019
-- Base             : Surgeles
-- Role             : La requête pour calculer le nombre total de produits par commande
-- Fichier resultat : testNbrTotalProCom.out
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
-- Le client qui possède IDCOM = 1 et n'importe quel produit est un domaine valide
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
VALUES(2, 1, 2, 10, 3.4);

--CAS2
-- Le client qui possède IDCOM = 2 et n'importe quel produit est un domaine valide
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(2, 1, '01/10/2013', '20/10/2013');

------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(3, 2, 1, 2, 3.4);
------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(4, 2, 2, 3, 3.4);

------- Le produit
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(3, 'c', 'DESSERT');
------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(5, 2, 3, 4, 3.4);

-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

-- Néant

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
SPOOL testNbrTotalProCom.out
PROMPT fichier resultat du test : testNbrTotalProCom.out

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
@nbrTotalProCom.sql
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

