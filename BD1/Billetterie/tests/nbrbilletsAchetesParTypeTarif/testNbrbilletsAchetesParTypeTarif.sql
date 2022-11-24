-- ============================================================================
-- Fichier          : testNbrbilletsAchetesParTypeTarif.sql
-- Auteur           : C. Faucher
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Q1. Quel est le nombre de billets achetés par type de tarif ?
--					  On souhaite afficher l’ensemble des types de tarif existants.
-- Fichier resultat : testNbrbilletsAchetesParTypeTarif.out
-- ============================================================================

-- ============================================================================
-- Modification du format de la date pour se conformer aux donnees du programme de test
-- ============================================================================
alter session set NLS_DATE_FORMAT='dd-mm-yyyy';

-- ============================================================================
-- Suppression des nuplets de la base de donnees
-- NB : Le test est effectué sur une base vide, il est nécessaire 
--      de supprimer tous les nuplets de toutes les relations
-- ============================================================================
@ ../utilitaires/vider_base_billetterie.sql
-- ============================================================================
-- Jeu de test pour le DOMAINE VALIDE 
-- NB : L'insertion de chaque nuplet doit faire l'objet d'un commentaire, 
-- notamment pour motiver le/les cas dans le(s)quel(s) il intervient.
-- ============================================================================

--Cas1
INSERT INTO SALLE(IDSALLE, NOMSALLE, ADRSALLE)
VALUES(1, 'La Sirène', 'LR');
INSERT INTO EVENEMENT(IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE)
VALUES(1, 'Evt A', sysdate, 'concert', 1);
INSERT INTO CLIENT(IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0505050505', 'jean.martin@example.org', 'LR');
INSERT INTO TARIF(IDTARIF, PRIX, TYPETARIF)
VALUES(3,15.00,'etudiant');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(1, 'AD001', 1, 1, 3, NULL);
INSERT INTO EVENEMENT(IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE)
VALUES(2, 'Evt B', sysdate, 'concert', 1);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(3, 'AD003', 2, 1, 3, NULL);
INSERT INTO EVENEMENT(IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE)
VALUES(3, 'Evt C', sysdate, 'concert', 1);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(5, 'AD005', 3, 1, 3, NULL);

--Cas2
INSERT INTO TARIF(IDTARIF, PRIX, TYPETARIF)
VALUES(2,12.00,'enfant');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(2, 'AD002', 2, 1, 2, NULL);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(4, 'AD004', 3, 1, 2, NULL);

--Cas3
INSERT INTO TARIF(IDTARIF, PRIX, TYPETARIF)
VALUES(1,20.00,'plein');


-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================


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
SPOOL nbrMailClient/testNbrMailClient.out  
PROMPT fichier resultat du test : nbrbilletsAchetesParTypeTarif/testNbrbilletsAchetesParTypeTarif.out 

-- Appel du fichier de presentation
@ ../utilitaires/presentation_base_billetterie.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base : 
SET echo ON 
@ ../utilitaires/afficher_base_billetterie.sql

-- ============================================================================
-- Requete a tester 
-- ============================================================================

-- Debut de l'affichage du resultat de la requete sur le client SqlPlus
prompt 'Resultat de la requete'
@ nbrbilletsAchetesParTypeTarif/nbrbilletsAchetesParTypeTarif.sql

-- Fin de l'affichage sur le client SqlPlus
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

