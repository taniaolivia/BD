-- ============================================================================
-- Fichier : testINSERT_vue_SORTIES_PREVUES.sql 
-- Auteur  : Tania OLIVIA					
-- Date    : 19/03/2020	
-- Role    : tester l'utilisation de la vue vue_SORTIES_PREVUES en insertion
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



--=============================================================================
-- Creation du fichier resultat
--=============================================================================
SPOOL  testINSERT_vue_SORTIES_PREVUES.out

set echo on
--=============================================================================
-- Etat de la base avant insertion 
--=============================================================================
set echo off

@presentation.sql
@afficheContenuBase.sql

set echo on
-- ============================================================================
--  Tester l'insertion d'un nuplet dans la vue vue_SORTIES_PREVUES
-- ============================================================================
-- Contenu de la vue avant insertion 
select CODPORT, NOMBAT, DATSORTPREV, DATRETPREV
from   vue_SORTIES_PREVUES;

-- Insertion d'un nuplet dans la vue vue_SORTIES_PREVUES
insert into  vue_SORTIES_PREVUES(CODPORT, NOMBAT, DATSORTPREV, DATRETPREV)
VALUES  ('BB', 'POLIANE',  TO_DATE('20/12/2018', 'DD/MM/YYYY'),  TO_DATE('20/01/2019', 'DD/MM/YYYY'));

-- Contenu de la vue apres insertion
select CODPORT, NOMBAT, DATSORTPREV, DATRETPREV
from   vue_SORTIES_PREVUES;

set echo off

set echo on
--=============================================================================
-- Etat de la base apres insertion 
--=============================================================================
set echo off
@afficheContenuBase.sql

-- ============================================================================
-- Fin programme de test
-- ============================================================================
spool off 
