-- ============================================================================
-- Fichier          : testProduitsCommandes.sql
-- Auteur           : Tania OLIVIA
-- Date             : 6 Decembre 2019
-- Base				: Surgeles
-- Role             : Le test pour afficher la liste de produits qui ont fait l'objet d'une commande
-- Fichier resultat : testProduitsCommandes.out
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
-- Un produit qui a été commandé deux fois
------- Le client de la commande
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0605050505', 'martin@example.org', 'La Rochelle'); 
------- La commande passée par le client
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES(1, 1, '01/10/2013', '20/10/2013');

------- Le produit
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(1, 'Chocolat', 'DESSERT');
------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(1, 1, 1, 5, 3.4);


-- CAS2
-- Un autre produit qui a été commandé une seule fois
------- Le produit
INSERT INTO PRODUIT (IDPRO, NOMPRO, TYPEPRO)
VALUES(2, 'Purée', 'DESSERT');
------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(2, 1, 2, 5, 3.4);

-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

-- CASn
-- Un produit qui n'a pas été commandé
------- La ligne de commande
INSERT INTO LIGNE_COMMANDE(IDLIGCOM, IDCOM, IDPRO, QTECOM, PRIXUNIT)
VALUES(3, 1, 1, 5, 3.4);

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
SPOOL testProduitsCommandes.out  
PROMPT fichier resultat du test : testProduitsCommandes.out 

-- Appel du fichier de presentation
@ ../../utilitaires/presentation_surgeles.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base :
@ ../../utilitaires/afficher_base_surgeles.sql

-- ============================================================================
-- Requete a tester 
-- ============================================================================
prompt 'Resultat de la requete avec Distinct'
SET echo ON
@produitsCommandesDistinct.sql
SET echo OFF

prompt 'Resultat de la requete sans Distinct'
SET echo ON
@produitsCommandesSansDistinct.sql
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

