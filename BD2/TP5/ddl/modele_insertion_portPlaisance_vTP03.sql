-- ============================================================================
-- Fichier : modele_insertion_portPlaisance_vTP03.sql
-- Auteur  : Tania OLIVIA
-- Date    : 11/03/2020
-- Role    : Tester le ddl de la table port de plaisane en utilisant la séquence sequences_portPlaisance
-- ============================================================================

-- Debut de l'ecriture du fichier resultat du programme de test 
SPOOL modele_insertion_portPlaisance_vTP03.out
PROMPT fichier resultat du test : modele_insertion_portPlaisance_vTP03.out 

set echo on
-- ============================================================================
-- Suppression des nuplet de la table
-- ============================================================================

set echo off
delete from PROPRIETAIRE;
delete from BATEAU_PASSAGE;
delete from BATEAU_RESIDENT;
delete from SORTIE;

set echo on

-- ============================================================================
-- Mise en oeuvre de la séquence
-- ============================================================================

set echo off

--CAS 1
-- Insertion d'une PROPRIETAIRE

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

INSERT  INTO PROPRIETAIRE (NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('Jean', '24 RUE DE NERVEGE','LA ROCHELLE', 17000, 0713452312);


--CAS 2
-- Insertion d'un BATEAU_RESIDENT

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('2', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('2', 'Jack', 'K', 2, 2);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('2', TO_DATE('12/12/2018', 'DD/MM/YYYY'), TO_DATE('31/12/2018', 'DD/MM/YYYY'), 2);

INSERT  INTO PROPRIETAIRE (NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('George', '38 RUE DU CORDOUAN','PARIS', 90578, 0738904512);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('1', 'AA', 'HIONY', '1', 2, seq_PROPRIETAIRE.currval);


--CAS 3
-- Insertion d'un BATEAU_PASSAGE

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('3', 20.33, 12.43, 12.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('3', 'Gise', 'L', 3, 3);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('3', TO_DATE('11/01/2019', 'DD/MM/YYYY'), TO_DATE('24/01/2019', 'DD/MM/YYYY'), 3);

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('1', 'AA', 'LONY', TO_DATE('20/01/2019', 'DD/MM/YYYY'), TO_DATE('26/01/2019', 'DD/MM/YYYY') , '1', 'Jean', '0713452311', '27 RUE DU CORDOUAN', 3 );


--CAS 4
-- Insertion d'une sortie

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('4', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('4', 'Cookie', 'C', 4, 4);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('4', TO_DATE('11/12/2018', 'DD/MM/YYYY'), TO_DATE('31/12/2018', 'DD/MM/YYYY'), 4);

INSERT  INTO PROPRIETAIRE (NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('Nilo', '18 RUE DE HILL','LILLE', 50937, 0456823912);

INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES ('2', 'AA', 'KONY', '1', 4, seq_PROPRIETAIRE.currval);

INSERT  INTO SORTIE (ID_SORTIE, CODPORT, NOMBAT, DATSORT, DATRET, EFF_PRV)
VALUES ('1', 'AA', 'KONY',  TO_DATE('11/12/2018', 'DD/MM/YYYY'),  TO_DATE('18/01/2019', 'DD/MM/YYYY'), 'EFF');

set echo on

-- ============================================================================
-- Affiche le contenu de la table
-- ============================================================================

set echo off

col description format a40;
select *
from PROPRIETAIRE;

select *
from BATEAU_PASSAGE;

select *
from BATEAU_RESIDENT;

select *
from SORTIE;

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================
