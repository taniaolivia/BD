-- ============================================================================
-- Fichier          : testMemeEvtMartin.sql
-- Auteur           : C. Faucher
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Q7. Jean MARTIN a acheté des billets pour un événement qui a lieu le 15/12/2013,
--                    quels sont les autres clients qui ont acheté des billets pour ce même événement ?
-- Fichier resultat : testMemeEvtMartin.out
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
VALUES(1, 'Evt A', '15/12/2013', 'concert', 1);
INSERT INTO CLIENT(IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(1, 'MARTIN', 'Jean', '0505050505', 'jean.martin@example.org', 'LR');
INSERT INTO TARIF(IDTARIF, PRIX, TYPETARIF)
VALUES(1,20.00,'plein');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(1, 'AD001', 1, 1, 1, NULL);
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(2, 'DUPONT', 'Charles', '0506060606', 'charles.dupont@example.org', 'La Rochelle');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(2, 'AD002', 1, 2, 1, NULL);

--CAS2
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(3, 'CAVIN', 'Pauline', '0507070707', 'pauline.cavin@example.org', 'La Rochelle');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(3, 'AD003', 1, 3, 1, NULL);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(4, 'AD004', 1, 3, 1, NULL);

--CAS3
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(4, 'DIDOT', 'Ingrid', '0508080808', 'ingrid.didot@example.org', 'La Rochelle');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(5, 'AD005', 1, 4, 1, NULL);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(6, 'AD006', 1, 4, 1, NULL);

--CAS4
INSERT INTO EVENEMENT(IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE)
VALUES(2, 'Evt B', '20/12/2013', 'concert', 1);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(7, 'AD007', 2, 4, 1, NULL);
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(5, 'DELUC', 'Romain', '0509090909', 'romain.deluc@example.org', 'La Rochelle');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(8, 'AD008', 1, 5, 1, NULL);
INSERT INTO EVENEMENT(IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE)
VALUES(3, 'Evt C', '15/12/2013', 'concert', 1);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(9, 'AD009', 3, 5, 1, NULL);

--CAS5
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(6, 'MAUREAU', 'Samuel', '0509090909', 'samuel.maureau@example.org', 'La Rochelle');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(10, 'AD010', 1, 6, 1, NULL);
INSERT INTO EVENEMENT(IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE)
VALUES(4, 'Evt D', '10/01/2014', 'concert', 1);
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(11, 'AD011', 4, 6, 1, NULL);


-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

--CAS6
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(7, 'TRUFFAT', 'Simon', '0511111111', 'simon.truffat@example.org', 'La Rochelle');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(12, 'AD012', 3, 7, 1, NULL);

--CAS7
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(8, 'VIVIEN', 'Thomas', '0512121212', 'thomas.vivien@example.org', 'La Rochelle');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(13, 'AD013', 2, 8, 1, NULL);

--CAS8
INSERT INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI)
VALUES(9, 'VAVIN', 'Victor', '0514141414', 'victor.vavin@example.org', 'La Rochelle');
INSERT INTO BILLET(IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA)
VALUES(14, 'AD014', 4, 9, 1, NULL);

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
SPOOL memeEvtMartin/testMemeEvtMartin.out
PROMPT fichier resultat du test : memeEvtMartin/testMemeEvtMartin.out 

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
@ memeEvtMartin/memeEvtMartin.sql

-- Fin de l'affichage sur le client SqlPlus
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

