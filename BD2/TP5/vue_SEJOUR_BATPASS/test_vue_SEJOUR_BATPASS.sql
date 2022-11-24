-- ============================================================================
-- Fichier          : test_vue_SEJOUR_BATPASS.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18/03/2020
-- Role             : Tester la vue SEJOUR_BATPASS
-- Fichier resultat :  test_vue_SEJOUR_BATPASS.out
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
set echo off
--CAS 1
--SEJOUR BATEAU_PASSAGE 1

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('AA', 'LA ROCHELLE', 17000);

INSERT  INTO MODELE (ID_MOD, CODMOD, CONSTRUCT, LONGR, LARG, TIRANT)
VALUES ('1', 'FFFFF', 'Jontare', 14.33, 16.43, 9.77);

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('1', 20.33, 12.43, 12.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('1', 'Gorgey', 'G', 1, 1);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('1', TO_DATE('10/01/2019', 'DD/MM/YYYY'), TO_DATE('25/01/2019', 'DD/MM/YYYY'), 1);

INSERT  INTO PROPRIETAIRE (ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('1','Jean', '24 RUE DE NERVEGE','LA ROCHELLE', 17000, 0713452312);

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('1', 'AA', 'LONY', TO_DATE('20/01/2019', 'DD/MM/YYYY'), TO_DATE('25/01/2019', 'DD/MM/YYYY') , '1', 'Jean', '0713452311', '24 RUE DE NERVEGE', 1 );

set echo on
-- ============================================================================
-- Jeu de test pour le DOMAINE INVALIDE 
-- NB : L'insertion des nuplets doit faire l'objet de commentaires. 
-- ============================================================================
set echo off

--CAS 2
--SEJOUR BATEAU_PASSAGE 2

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('2', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('2', 'Cookie', 'C', 2, 2);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('2', TO_DATE('11/12/2019', 'DD/MM/YYYY'), TO_DATE('21/12/2019', 'DD/MM/YYYY'), 2);

INSERT  INTO PROPRIETAIRE (ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES (2, 'Nilo', '18 RUE DE HILL','LILLE', 50937, 0456823912);

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('2', 'AA', 'KANEKI', TO_DATE('17/12/2019', 'DD/MM/YYYY'), TO_DATE('24/12/2019', 'DD/MM/YYYY') , '1', 'Nilo', '0713452311', '18 RUE DE HILL', 2 );


set echo on
-- ============================================================================
-- Etat de la base
-- ============================================================================
set echo off
-- Debut de l'ecriture du fichier resultat du programme de test 
SPOOL test_vue_SEJOUR_BATPASS.out
PROMPT fichier resultat du test : test_vue_SEJOUR_BATPASS.out 

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
prompt 'Contenu de la vue : vue_SEJOUR_BATPASS'

select CODPORT, NOMBAT, NOMPROP, ADRESSE, NB_SEJOURS
from   vue_SEJOUR_BATPASS;

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

