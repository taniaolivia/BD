-- ============================================================================
-- Fichier : testUPDATE_vue_SORTIES_PREVUES.sql 
-- Auteur  : Tania OLIVIA					
-- Date    : 19/03/2020
-- Role    : tester l'utilisation de la vue vue_SORTIES_PREVUES en UPDATE
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

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('1', 'AA', 'LONY', '1', 1, 1);

INSERT  INTO SORTIE (ID_SORTIE, CODPORT, NOMBAT, DATSORTPREV, DATSORTRELLE, DATRETPREV, DATRETRELLE, EFF_PRV)
VALUES ('1', 'AA', 'LONY',  TO_DATE('12/12/2018', 'DD/MM/YYYY'), NULL, TO_DATE('10/01/2019', 'DD/MM/YYYY'), NULL,'PRV');

--CAS 2

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


--=============================================================================
-- Creation du fichier resultat
--=============================================================================
SPOOL  testUPDATE_vue_SORTIES_PREVUES.out

set echo on
--=============================================================================
-- Etat de la base avant UPDATE 
--=============================================================================
set echo off

@presentation.sql
@afficheContenuBase.sql

set echo on
-- ============================================================================
--  Tester UPDATE d'un nuplet à travers la vue vue_SORTIES_PREVUES
-- ============================================================================
-- Contenu de la vue avant UPDATE 
select CODPORT, NOMBAT, DATSORTPREV, DATRETPREV
from   vue_SORTIES_PREVUES;

-- Update d'un nuplet à travers la vue vue_SORTIES_PREVUES
update vue_SORTIES_PREVUES
set DATRETPREV = DATRETPREV + 10
where UPPER(CODPORT) = UPPER('AA')
and UPPER(NOMBAT) = UPPER('LONY');

-- Contenu de la vue apres UPDATE
select CODPORT, NOMBAT, DATSORTPREV, DATRETPREV
from   vue_SORTIES_PREVUES;

set echo off

set echo on
--=============================================================================
-- Etat de la base apres UPDATE 
--=============================================================================
set echo off
@afficheContenuBase.sql

-- ============================================================================
-- Fin programme de test
-- ============================================================================
spool off 
