-- ============================================================================
-- Fichier          : testCoutMartinConcertSport.sql
-- Auteur           : C. Faucher
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Q5. Pour chacun des événements de type "concert" ou "sport",
--                    quel est le montant dépensé par Jean MARTIN ?
-- Fichier resultat : testCoutMartinConcertSport.out
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
VALUES(1, 'Evt A', sysdate, 'concert',1);
INSERT INTO CLIENT(IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0505050505', 'jean.martin@example.org', 'LR');
INSERT INTO TARIF(IDTARIF, PRIX, TYPETARIF)
VALUES(1,20.00,'plein');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(1, 'AD001', 1, 1, 1, NULL);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(2, 'AD002', 1, 1, 1, NULL);

--Cas2
INSERT INTO EVENEMENT(IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE)
VALUES(2, 'Evt B', sysdate, 'concert',1);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(3, 'AD003', 2, 1, 1, NULL);

--Cas3
INSERT INTO EVENEMENT(IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE)
VALUES(3, 'Evt C', sysdate, 'sport',1);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(4, 'AD004', 3, 1, 1, NULL);


-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

--Cas4
INSERT INTO EVENEMENT(IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE)
VALUES(4, 'Evt D', sysdate, 'comedie',1);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(5, 'AD005', 4, 1, 1, NULL);

--Cas5
INSERT INTO CLIENT(IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(2, 'DUPONT', 'Charles', '0506060606', 'charles.dupont@example.org', 'LR');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(6, 'AD006', 2, 2, 1, NULL);


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
SPOOL coutMartinConcertSport/testCoutMartinConcertSport.out  
PROMPT fichier resultat du test : acheteursUniques/testAcheteursUniques.out 

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
@ coutMartinConcertSport/coutMartinConcertSport.sql

-- Fin de l'affichage sur le client SqlPlus
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

