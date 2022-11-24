--==========================
--fichier           : peuplementBD.sql
--base              : Port de plaisance
--auteur(s)         : Tania OLIVIA
--date              : 19/02/2020
--role              : Afficher l’ensemble du contenu des tables de la base de données
--projet            : Bateau Passage Existe
--resultat dans     : 
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
@../utilitaires/vide_contenu_base_portPlaisance.sql

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
VALUES ('1', 'Jean', '24 RUE DE NERVEGE','LA ROCHELLE', 17000, 0713452312);

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('1', 'AA', 'HIONY', TO_DATE('20/01/2019', 'DD/MM/YYYY'), TO_DATE('25/01/2019', 'DD/MM/YYYY') , '1', 'Jean', '0713452311', '27 RUE DU CORDOUAN', 1 );


--CAS 2
INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('CC', 'LA ROCHELLE', 17000);

INSERT  INTO MODELE (ID_MOD, CODMOD, CONSTRUCT, LONGR, LARG, TIRANT)
VALUES ('2', 'JJJJ', 'Benny', 18.33, 25.43, 13.77);

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('2', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('2', 'Jack', 'K', 2, 2);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('2', TO_DATE('12/12/2018', 'DD/MM/YYYY'), TO_DATE('31/12/2018', 'DD/MM/YYYY'), 2);

INSERT  INTO PROPRIETAIRE (ID_PROP, NOMPROP, ADRESSE, VILLE, CODPOSTAL, TEL_PORTABLE)
VALUES ('2', 'Ongy', '28 RUE DU CORDOUAN','LA ROCHELLE', 17000, 0712586422);

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('2', 'CC', 'KIONY', TO_DATE('25/12/2018', 'DD/MM/YYYY'), TO_DATE('30/12/2018', 'DD/MM/YYYY') , '2', 'Ongy', '0712586422', '28 RUE DU CORDOUAN', 2 );


--CAS 3

INSERT  INTO PORT (CODPORT, VILLE, CODPOSTAL)
VALUES ('FF', 'LILLE', 16502);

INSERT  INTO MODELE (ID_MOD, CODMOD, CONSTRUCT, LONGR, LARG, TIRANT)
VALUES ('3', 'HHHHH', 'Benny', 20.33, 20.43, 12.77);

INSERT  INTO TYPE_EMPLACEMENT (TYPE_EMPL, LONGR, LARG, PROFOND)
VALUES ('3', 49.33, 45.43, 54.32);

INSERT  INTO EMPLACEMENT (ID_EMPL, BASSIN, PONTON, EMPLNO, TYPE_EMPL)
VALUES ('3', 'Jack', 'J', 3, 3);

INSERT  INTO EMPLACEMENT_LIBRE (ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL)
VALUES ('3', TO_DATE('10/01/2019', 'DD/MM/YYYY'), TO_DATE('20/01/2019', 'DD/MM/YYYY'), 3);

INSERT  INTO BATEAU_PASSAGE (ID_BATPASS, CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, TEL_PORTABLE, ADRESSE, EMPL_AFF)
VALUES ('3', 'FF', 'QONY', TO_DATE('17/01/2019', 'DD/MM/YYYY'), TO_DATE('20/01/2019', 'DD/MM/YYYY') , '3', 'Ongy', '0712586422', '28 RUE DU CORDOUAN', 3 );



@../utilitaires/presentation_portPlaisance.sql




