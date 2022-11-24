-- ============================================================================
-- Fichier : testDELETE_vue_SEJOUR_BATPASS.sql 
-- Auteur  : Tania OLIVIA					
-- Date    : 19/03/2020	
-- Role    : tester l'utilisation de la vue vue_SEJOUR_BATPASS en Suppression
-- ============================================================================
ALTER SESSION SET nls_date_format='dd/mm/yyyy';

-- ============================================================================
-- NB : le test est effectué sur une base vide, donc on fait la
-- suppression de tous les nuplets de toutes les relations.
-- Prise en charge des dependances de reference dans l'ordre de suppression
-- du contenu des relations de la base de donnees. 
-- ============================================================================
@videContenuBase.sql ;

set echo on
-- ============================================================================
-- Insertion dans les relations referencees 
-- ============================================================================
set echo off

--CAS 1

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
VALUES ('1', 'AA', 'LONY', TO_DATE('20/01/2019', 'DD/MM/YYYY'), TO_DATE('26/01/2019', 'DD/MM/YYYY') , '1', 'Jean', '0713452311', '24 RUE DE NERVEGE', 1 );

--CAS 2

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('2', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('2', 'Cookie', 'C', 2, 2);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('2', TO_DATE('11/12/2018', 'DD/MM/YYYY'), TO_DATE('31/12/2018', 'DD/MM/YYYY'), 2);

INSERT  INTO PROPRIETAIRE (ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES (2, 'Nilo', '18 RUE DE HILL','LILLE', 50937, 0456823912);

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('2', 'AA', 'KANEKI', TO_DATE('17/01/2019', 'DD/MM/YYYY'), TO_DATE('20/01/2019', 'DD/MM/YYYY') , '1', 'Nilo', '0713452311', '18 RUE DE HILL', 2 );


--=============================================================================
-- Creation du fichier resultat
--=============================================================================
SPOOL  testDELETE_vue_SEJOUR_BATPASS.out

set echo on
--=============================================================================
-- Etat de la base avant DELETE 
--=============================================================================
set echo off

@presentation.sql
@afficheContenuBase.sql

set echo on
-- ============================================================================
--  Tester DELETE d'un nuplet à travers la vue vue_SEJOUR_BATPASS
-- ============================================================================
-- Contenu de la vue avant DELETE 
select CODPORT, NOMBAT, NOMPROP, ADRESSE, NB_SEJOURS
from   vue_SEJOUR_BATPASS;

-- DELETE d'un nuplet à travers la vue vue_SEJOUR_BATPASS
delete from vue_SEJOUR_BATPASS
where NOMPROP = 'Jean';

-- Contenu de la vue apres DELETE
select CODPORT, NOMBAT, NOMPROP, ADRESSE, NB_SEJOURS
from   vue_SEJOUR_BATPASS;

set echo off

set echo on
--=============================================================================
-- Etat de la base apres DELETE 
--=============================================================================
set echo off
@afficheContenuBase.sql

-- ============================================================================
-- Fin programme de test
-- ============================================================================
spool off 
