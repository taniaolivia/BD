-- ============================================================================
-- Fichier          : test_vue_SORTIES_PREVUES.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18/03/2020
-- Role             : Tester la vue SORTIES_PREVUES
-- Fichier resultat : test_vue_SORTIES_PREVUES.out
-- ============================================================================
ALTER SESSION SET nls_date_format='dd/mm/yyyy';

set echo on
-- ============================================================================
-- Suppression des nuplet de la base de donnees
-- NB : Le test est effectué sur une base vide donc on fait 
--      la suppression de tous les nuplets de toutes les relations
-- ============================================================================
set echo off
@videContenuBase.sql

set echo on
-- ============================================================================
-- Jeu de test pour le DOMAINE VALIDE 
-- NB : L'insertion des nuplets doit faire l'objet de commentaires. 
-- ============================================================================

--CAS 1
-- SORTIE PREVUE 1

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('AA', 'LA ROCHELLE', 17000);

INSERT  INTO MODELE (ID_MOD, CODMOD, CONSTRUCT, LONGR, LARG, TIRANT)
VALUES ('1', 'FFKKK', 'UOI', 14.33, 16.43, 9.77);

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('1', 20.33, 12.43, 12.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('1', 'Gorgey', 'G', 1, 1);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('1', TO_DATE('10/01/2019', 'DD/MM/YYYY'), TO_DATE('25/01/2019', 'DD/MM/YYYY'), 1);

INSERT  INTO PROPRIETAIRE (ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('1','Jean', '24 RUE DE NERVEGE','LA ROCHELLE', 17000, 0713452312);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('1', 'AA', 'LONY', '1', 1, 1);

INSERT  INTO SORTIE (ID_SORTIE, CODPORT, NOMBAT, DATSORTPREV, DATSORTRELLE, DATRETPREV, DATRETRELLE, EFF_PRV)
VALUES ('1', 'AA', 'LONY',  TO_DATE('12/12/2018', 'DD/MM/YYYY'), NULL, TO_DATE('10/01/2019', 'DD/MM/YYYY'), NULL,'PRV');

--CAS 2
-- SORTIE PREVUE 2

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('2', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('2', 'Cookie', 'C', 2, 2);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('2', TO_DATE('11/12/2018', 'DD/MM/YYYY'), TO_DATE('31/12/2018', 'DD/MM/YYYY'), 2);

INSERT  INTO PROPRIETAIRE (ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('2', 'Nilo', '18 RUE DE HILL','LILLE', 50937, 0456823912);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('2', 'AA', 'KONY', '1', 2, 2);

INSERT  INTO SORTIE (ID_SORTIE, CODPORT, NOMBAT, DATSORTPREV, DATSORTRELLE, DATRETPREV, DATRETRELLE, EFF_PRV)
VALUES ('2', 'AA', 'KONY',  TO_DATE('11/12/2018', 'DD/MM/YYYY'), NULL, TO_DATE('18/01/2019', 'DD/MM/YYYY'), NULL, 'PRV');


-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- NB : L'insertion des nuplets doit faire l'objet de commentaires. 
-- ============================================================================
set echo off

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('BB', 'LILLE', 16502);

INSERT  INTO MODELE (ID_MOD, CODMOD, CONSTRUCT, LONGR, LARG, TIRANT)
VALUES ('2', 'HHHHH', 'Benny', 20.33, 20.43, 12.77);

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('3', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('3', 'Jack', 'J', 3, 3);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('3', TO_DATE('12/01/2019', 'DD/MM/YYYY'), TO_DATE('24/01/2019', 'DD/MM/YYYY'), 3);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('3', 'AA', 'SUMI', '2', 3, 2);

INSERT  INTO SORTIE (ID_SORTIE, CODPORT, NOMBAT, DATSORTPREV, DATSORTRELLE, DATRETPREV, DATRETRELLE, EFF_PRV)
VALUES ('3', 'AA', 'SUMI',  TO_DATE('11/12/2018', 'DD/MM/YYYY'), NULL, TO_DATE('18/01/2019', 'DD/MM/YYYY'), NULL, 'EFF');

--CAS 4
--SORTIE NON PREVUE 2

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('4', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('4', 'Jelly', 'I', 4, 4);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('4', TO_DATE('13/12/2018', 'DD/MM/YYYY'), TO_DATE('31/01/2019', 'DD/MM/YYYY'), 4);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('4', 'AA', 'KEN', '2', 4, 1);

INSERT  INTO SORTIE (ID_SORTIE, CODPORT, NOMBAT, DATSORTPREV, DATSORTRELLE, DATRETPREV, DATRETRELLE, EFF_PRV)
VALUES ('4', 'AA', 'KEN',  TO_DATE('11/12/2018', 'DD/MM/YYYY'), NULL, TO_DATE('18/01/2019', 'DD/MM/YYYY'), NULL, 'EFF');



set echo on
-- ============================================================================
-- Etat de la base
-- ============================================================================
set echo off
-- Debut de l'ecriture du fichier resultat du programme de test 
SPOOL test_vue_SORTIES_PREVUES.out
PROMPT fichier resultat du test : test_vue_SORTIES_PREVUES.out 

-- Appel du fichier de presentation
@presentation.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base : 
SET echo ON 
@afficheContenuBase.sql

set echo on
-- ============================================================================
-- Afficher le contenu de la vue 
-- ============================================================================
set echo off

-- Debut de l'affichage du contenu de la vue sur le client SqlPlus
prompt 'Contenu de la vue : vue_SORTIES_PREVUES'

select CODPORT, NOMBAT, DATSORTPREV, DATRETPREV
from   vue_SORTIES_PREVUES;

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

