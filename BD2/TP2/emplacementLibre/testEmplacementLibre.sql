-- ============================================================================
-- Fichier          : testEmplacementLibre.sql
-- Auteur           : Tania OLIVIA
-- Date             : 04/02/2020
-- Role             : tester l'ordre SQL : (emplacementLibre.sql)
-- Fichier resultat : testEmplacementLibre.out
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
@vide_contenu_base_portPlaisance.sql

-- ============================================================================
-- Jeu de test pour le DOMAINE VALIDE 
-- NB : L'insertion de chaque nuplet doit faire l'objet d'un commentaire, 
-- notamment pour motiver le/les cas dans le(s)quel(s) il intervient.
-- ===========================================================================
-- CAS 1
-- Un emplacement (id = 1) non affecté à un BR et jamais affecté à un BP

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('1', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('1', 'Jenni', 'J', 1, 1);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('1', TO_DATE('10/01/2019', 'DD/MM/YYYY'), TO_DATE('15/01/2019', 'DD/MM/YYYY'), 1);


-- CAS 2
-- Un emplacement (id = 2) non affecté à un BR et affecté à un BP en dehors de la période

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('AA', 'LA ROCHELLE', 17000);

INSERT  INTO MODELE (ID_MOD, CODMOD, CONSTRUCT, LONGR, LARG, TIRANT)
VALUES ('1', 'FFFFF', 'Jontare', 20.33, 12.43, 45.77);

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('2', 20.33, 12.43, 12.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('2', 'Gorgey', 'G', 2, 2);

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('1', 'AA', 'HIONY', TO_DATE('20/01/2019', 'DD/MM/YYYY'), TO_DATE('25/01/2019', 'DD/MM/YYYY') , '1', 'Jean', 0713452311, '27 RUE DU CORDOUAN', 2 );

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('2', TO_DATE('01/01/2019', 'DD/MM/YYYY'), TO_DATE('15/01/2019', 'DD/MM/YYYY'), 2);


-- CAS 3
-- Un emplacement (id = 3) affecté à un BR qui est sorti pendant toute la période et jamais affecté à un BP

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('BB', 'LA ROCHELLE', 17000);

INSERT  INTO MODELE (ID_MOD, CODMOD, CONSTRUCT, LONGR, LARG, TIRANT)
VALUES ('2', 'HHHHH', 'Benny', 49.33, 45.43, 12.77);

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('3', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('3', 'Jack', 'J', 3, 3);

INSERT  INTO PROPRIETAIRE (ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('1', 'Jenue', '24 RUE DE NERVEGE','LA ROCHELLE', 17000, 0713452312);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('1', 'BB', 'KONY', '2', 3, '1' );

INSERT  INTO SORTIE (ID_SORTIE, CODPORT, NOMBAT, DATSORT, DATRET, EFF_PRV)
VALUES ('1', 'BB', 'KONY',  TO_DATE('20/12/2018', 'DD/MM/YYYY'),  TO_DATE('19/01/2019', 'DD/MM/YYYY'), 'EFF');

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('3', TO_DATE('01/01/2019', 'DD/MM/YYYY'), TO_DATE('15/01/2019', 'DD/MM/YYYY'), 3);



-- CAS 4
-- Un emplacement (id = 4) affecté à un BR qui est sorti pendant toute la période et qui est affecté à un BP pendant la sortie du BR mais en dehors de la période

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('CC', 'LA ROCHELLE', 17000);

INSERT  INTO MODELE (ID_MOD, CODMOD, CONSTRUCT, LONGR, LARG, TIRANT)
VALUES ('3', 'JJJJ', 'Benny', 49.33, 45.43, 12.77);

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('4', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('4', 'Jack', 'K', 4, 4);

INSERT  INTO PROPRIETAIRE (ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('2', 'Ongy', '28 RUE DU CORDOUAN','LA ROCHELLE', 17000, 0712586422);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('2', 'CC', 'HIONY', '3', 4, '2' );

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('2', 'CC', 'KIONY', TO_DATE('25/12/2018', 'DD/MM/YYYY'), TO_DATE('30/12/2018', 'DD/MM/YYYY') , '3', 'Ongy', 0712586422, '28 RUE DU CORDOUAN', 2 );

INSERT  INTO SORTIE (ID_SORTIE, CODPORT, NOMBAT, DATSORT, DATRET, EFF_PRV)
VALUES ('2', 'CC', 'HIONY',  TO_DATE('31/12/2018', 'DD/MM/YYYY'),  TO_DATE('18/01/2019', 'DD/MM/YYYY'), 'EFF');

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('4', TO_DATE('01/01/2019', 'DD/MM/YYYY'), TO_DATE('15/01/2019', 'DD/MM/YYYY'), 4);



-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- ============================================================================

-- CAS 5
-- Un emplacement (id = 5) affecté à un BR jamais sorti

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('DD', 'PARIS', 16502);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('5', 'Kessy', 'Y', 5, 3);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('3', 'DD', 'MONY', '3', 5, 1 );

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('5', TO_DATE('06/01/2019', 'DD/MM/YYYY'), TO_DATE('27/01/2019', 'DD/MM/YYYY'), 3);

-- CAS 6
-- Un emplacement (id = 6) affecté à un BR, déjà sorti mais pas pendant toute la période

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('EE', 'LILLE', 16502);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('6', 'Jessy', 'D', 6, 4);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('4', 'EE', 'BONBON', '3', 6, '2' );

INSERT  INTO SORTIE (ID_SORTIE, CODPORT, NOMBAT, DATSORT, DATRET, EFF_PRV)
VALUES ('4', 'EE', 'BONBON',  TO_DATE('12/12/2018', 'DD/MM/YYYY'),  TO_DATE('29/12/2018', 'DD/MM/YYYY'), 'EFF');

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('6', TO_DATE('01/01/2019', 'DD/MM/YYYY'), TO_DATE('15/01/2019', 'DD/MM/YYYY'), 4);

-- CAS 7
-- Un emplacement (id = 7) jamais affecté à un BR, mais affecté à un BP sur la période

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('FF', 'LILLE', 16502);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('7', 'Joy', 'F', 7, 4);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('5', 'FF', 'BON', '2', 7, '1' );

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('3', 'FF', 'QONY', TO_DATE('17/01/2019', 'DD/MM/YYYY'), TO_DATE('20/01/2019', 'DD/MM/YYYY') , '2', 'Ongy', 0712586422, '28 RUE DU CORDOUAN', 7 );

INSERT  INTO SORTIE (ID_SORTIE, CODPORT, NOMBAT, DATSORT, DATRET, EFF_PRV)
VALUES ('5', 'FF', 'BON',  TO_DATE('09/01/2019', 'DD/MM/YYYY'),  TO_DATE('20/01/2019', 'DD/MM/YYYY'), 'EFF');

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('7', TO_DATE('16/01/2019', 'DD/MM/YYYY'), TO_DATE('25/01/2019', 'DD/MM/YYYY'), 4);


-- CAS 8
-- Un emplacement (id = 8) affecté à un BR sorti pendant toute la période mais affecté à un BP pendant cette sortie et la période

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('GG', 'LILLE', 16502);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('8', 'Ko', 'Q', 8, 2);

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('4', 'GG', 'UONY', TO_DATE('10/01/2019', 'DD/MM/YYYY'), TO_DATE('15/01/2019', 'DD/MM/YYYY') , '2', 'Ongy', 0712586422, '28 RUE DU CORDOUAN', 8);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('8', TO_DATE('16/01/2019', 'DD/MM/YYYY'), TO_DATE('25/01/2019', 'DD/MM/YYYY'), 2);


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
SPOOL testEmplacementLibre.out  
PROMPT fichier resultat du test : testEmplacementLibre.out 

-- Appel du fichier de presentation
@presentation_portPlaisance.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base : 
@afficher_contenu_base_portPlaisance.sql

-- ============================================================================
-- Requete a tester 
-- ============================================================================

-- Debut de l'affichage du resultat de la requete sur le client SqlPlus
prompt 'Resultat de la requete:'
SET ECHO ON
@emplacementLibre.sql ;
SET echo OFF

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

