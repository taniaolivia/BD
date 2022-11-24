--==========================
--fichier           : prep_test_sortie_bat_resident.sql
--base              : Port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 31/03/2020
--role              : La préparation du test sortie bateau résident
--==========================
-- ============================================================================
-- Modification du format de la date pour se conformer aux donnees du programme de test
-- ============================================================================
alter session set NLS_DATE_FORMAT='dd/mm/yyyy';

-- ============================================================================
-- Suppression des nuplets de la base de donnees
-- NB : Le test est effectué sur une base vide, il est nécessaire 
--      de supprimer tous les nuplets de toutes les relations
-- ============================================================================
@vide_prep_test.sql;

-- ============================================================================
-- CAS 1
-- ============================================================================

--INSERTION DU PORT 1
INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('LR', 'LA ROCHELLE', 17000);

--INSERTION DE LA MODELE 1
INSERT  INTO MODELE (ID_MOD, CODMOD, CONSTRUCT, LONGR, LARG, TIRANT)
VALUES ('1', 'FFFFF', 'Jontare', 14.33, 16.43, 9.77);

--INSERTION DU TYPE_EMPLACEMENT 1
INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('1', 49.33, 45.43, 54.32);

--INSERTION DU TYPE_EMPLACEMENT 1
INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('1', 'Cookie', 'C', 1, 1);

--INSERTION DU TYPE_EMPLACEMENT 1
INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('1', TO_DATE('11/12/2018', 'DD/MM/YYYY'), TO_DATE('31/12/2018', 'DD/MM/YYYY'), 1);

--INSERTION DE LA PROPRIETAIRE 1
INSERT  INTO PROPRIETAIRE (NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('Nilo', '18 RUE DE HILL','LILLE', 50937, 0456823912);

--INSERTION DU BATEAU_RESIDENT 1
INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES (seq_BATEAU_RESIDENT.NEXTVAL, 'LR', 'MOMO', '1', 1, seq_PROPRIETAIRE.CURRVAL);

--INSERTION DE SORTIE 1
INSERT INTO SORTIE (id_sortie, codport, nombat, datsortprev, datsortrelle, datretprev, datretrelle, eff_prv)
VALUES (seq_SORTIE.NEXTVAL, 'LR', 'MOMO', '10/01/2019', '10/01/2019', '20/01/2019', '20/01/2019','PRV') ;



-- ============================================================================
-- CAS 2
-- ============================================================================

--INSERTION DU TYPE_EMPLACEMENT 2
INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('2', 20.33, 12.43, 12.32);

--INSERTION DU TYPE_EMPLACEMENT 2
INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('2', 'Gise', 'L', 2, 2);

--INSERTION DU TYPE_EMPLACEMENT 2
INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('2', TO_DATE('11/01/2019', 'DD/MM/YYYY'), TO_DATE('24/01/2019', 'DD/MM/YYYY'), 2);

--INSERTION DU BATEAU_RESIDENT 2
INSERT  INTO BATEAU_RESIDENT (ID_BATRES, CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP)
VALUES (seq_BATEAU_RESIDENT.NEXTVAL, 'LR', 'LANO', '1', 2, seq_PROPRIETAIRE.CURRVAL);

--INSERTION DE SORTIE 2
INSERT INTO SORTIE (id_sortie, codport, nombat, datsortprev, datsortrelle, datretprev, datretrelle, eff_prv)
VALUES (seq_SORTIE.NEXTVAL, 'LR', 'LANO', '14/01/2019', '14/01/2019', '25/01/2019', '25/01/2019','PRV') ;

