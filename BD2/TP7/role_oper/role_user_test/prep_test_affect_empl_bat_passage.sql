--==========================
--fichier           : prep_test_affect_empl_bat_passage.sql
--base              : Port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 31/03/2020
--role              : La préparation du test affect emplacement bateau passage
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

--INSERTION DU TYPE_EMPLACEMENT 3
INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('3', 20.33, 12.43, 12.32);

--INSERTION DE L'EMPLACEMENT 3
INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('3', 'Gorgey', 'G', 3, 3);

--INSERTION DE L'EMPLACEMENT_LIBRE 3
INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('3', TO_DATE('10/01/2019', 'DD/MM/YYYY'), TO_DATE('25/03/2019', 'DD/MM/YYYY'), 3);

--INSERTION DE LA PROPRIETAIRE 1
INSERT  INTO PROPRIETAIRE (ID_PROP,NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('1', 'Jean', '24 RUE DE NERVEGE','LA ROCHELLE', 17000, 0713452312);

--INSERTION DU BATEAU_PASSAGE
INSERT INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES (seq_BATEAU_PASSAGE.NEXTVAL, 'LR', 'MOMO', '01/03/2019', '15/03/2019', 1, 'Jean', null, '24 RUE DE NERVEGE', 3);



-- ============================================================================
-- CAS 2
-- ============================================================================

--INSERTION DU TYPE_EMPLACEMENT 2
INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('2', 49.33, 45.43, 54.32);

--INSERTION DE L'EMPLACEMENT 2
INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('2', 'Jack', 'K', 2, 2);

--INSERTION DE L'EMPLACEMENT_LIBRE 2
INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('2', TO_DATE('12/02/2019', 'DD/MM/YYYY'), TO_DATE('31/05/2019', 'DD/MM/YYYY'), 2);

--INSERTION DE LA PROPRIETAIRE 2
INSERT  INTO PROPRIETAIRE (ID_PROP,NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('2', 'Ongy', '28 RUE DU CORDOUAN','LA ROCHELLE', 17000, 0712586422);

--INSERTION DU BATEAU_PASSAGE
INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES (seq_BATEAU_PASSAGE.NEXTVAL, 'LR', 'KIONY', TO_DATE('15/03/2019', 'DD/MM/YYYY'), TO_DATE('30/03/2019', 'DD/MM/YYYY') , '1', 'Ongy', '0712586422', '28 RUE DU CORDOUAN', 2 );



-- ============================================================================
-- CAS 3
-- ============================================================================

--INSERTION DU TYPE_EMPLACEMENT 4
INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('4', 49.33, 45.43, 54.32);

--INSERTION DE L'EMPLACEMENT 4
INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('4', 'Menni', 'M', 4, 4);

--INSERTION DE L'EMPLACEMENT_LIBRE 4
INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('4', TO_DATE('10/01/2019', 'DD/MM/YYYY'), TO_DATE('20/01/2019', 'DD/MM/YYYY'), 4);

--INSERTION DU BATEAU_PASSAGE
INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES (seq_BATEAU_PASSAGE.NEXTVAL, 'LR', 'SISI', TO_DATE('17/01/2019', 'DD/MM/YYYY'), TO_DATE('20/01/2019', 'DD/MM/YYYY') , '1', 'Ongy', '0712586422', '28 RUE DU CORDOUAN', 4 );

