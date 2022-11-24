-- ==========================
-- fichier 	: ddl_contrat.sql
-- base 	: port plaisance
-- auteur   : Tania OLIVIA
-- date 	: 28/01/2020
-- role 	: créer toutes les relations de la base + les contraintes du CONTRAT
-- projet 	: port plaisance
-- resultat dans : ddl_portPlaisance.out
-- ==========================

spool ddl_contrat.out
    prompt Création de la table CONTRAT :
    prompt ==============================

CREATE TABLE CONTRAT(
NUMCONTRAT	NUMBER	NOT NULL,
DATESIGNATURE	DATE   NOT NULL,
DEBCONTRAT DATE   NOT NULL,
FINCONTRAT	DATE  NULL,
TYPECONTRAT	VARCHAR2(20)  NOT NULL,
CONTRACTANT	NUMBER	NOT NULL,
EMPLACEMENT	NUMBER	NOT NULL,
CONSTRAINT PK_CONTRAT PRIMARY KEY (NUMCONTRAT),
CONSTRAINT  UNQ_DEBCONTRAT_EMPLACEMENT  UNIQUE (DEBCONTRAT, EMPLACEMENT),
CONSTRAINT  CHK_TYPECONTRAT  CHECK (TYPECONTRAT IN('annuel', 'saisonnier','darse_ostriecole', 'darse_secondaire', 'hors_darse', 'ponton_communal')),
CONSTRAINT CHK_DEBCONTRAT CHECK (DEBCONTRAT >= DATESIGNATURE),
CONSTRAINT CHK_FINCONTRAT CHECK (FINCONTRAT IS NULL OR (FINCONTRAT >= DEBCONTRAT))
);


ALTER TABLE CONTRAT
    ADD CONSTRAINT  FK_CONPROP 
        FOREIGN KEY (CONTRACTANT)
        REFERENCES  PROPRIETAIRE (ID_PROP);

ALTER TABLE CONTRAT
    ADD CONSTRAINT  FK_CONEMPL 
        FOREIGN KEY (EMPLACEMENT)
        REFERENCES  EMPLACEMENT (ID_EMPL);


    set echo on
    DESC CONTRAT
    set echo off