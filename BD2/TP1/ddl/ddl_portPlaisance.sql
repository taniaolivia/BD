﻿-- ==========================
-- fichier 	: ddl_portPlaisance.sql
-- base 	: port plaisance
-- auteur   : Tania OLIVIA
-- date 	: 28/01/2020
-- role 	: créer toutes les relations de la base + les contraintes
-- projet 	: port plaisance
-- resultat dans : ddl_portPlaisance.out
-- ==========================

spool ddl_portPlaisance.out
    prompt Création de la table SORTIE :
    prompt ==============================

CREATE TABLE SORTIE(
ID_SORTIE	NUMBER	NOT NULL,
CODPORT	CHAR(2)	 NOT NULL,
NOMBAT	VARCHAR2(40) NOT NULL,
DATSORT	DATE   NOT NULL,
DATRET	DATE	NOT NULL,
EFF_PRV	CHAR(3)	 NOT NULL,
CONSTRAINT PK_SORTIE PRIMARY KEY (ID_SORTIE),
CONSTRAINT  UNQ_CODPORT_NOMBAT_DATSORTPREV  UNIQUE (CODPORT, NOMBAT, DATSORT),
CONSTRAINT  CHK_EFF_PRV  CHECK (EFF_PRV IN('EFF', 'PRV')),
CONSTRAINT CHK_DATSORT CHECK (DATSORT >= DATSORT),
CONSTRAINT CHK_DATRET CHECK (DATRET >= DATRET)
);

    set echo on
    DESC SORTIE
    set echo off


    prompt Création de la table BATEAU_RESIDENT:
    prompt ==============================

CREATE TABLE BATEAU_RESIDENT (
ID_BATRES  NUMBER  NOT NULL,
CODPORT	CHAR(2)	 NOT NULL,
NOMBAT	VARCHAR2(40) NOT NULL,
ID_MOD  NUMBER  NOT NULL,
EMPL_AFF  NUMBER  NOT NULL,
ID_PROP  NUMBER  NOT NULL,
CONSTRAINT  PK_BATEAU_RESIDENT PRIMARY KEY (ID_BATRES),
CONSTRAINT  UNQ_CODPORT_NOMBAT UNIQUE (CODPORT, NOMBAT),
CONSTRAINT  UNQ_EMPL_AFF UNIQUE (EMPL_AFF)
);

    set echo on
    DESC BATEAU_RESIDENT
    set echo off

    prompt Création de la table BATEAU_PASSAGE :
    prompt ==============================

CREATE TABLE BATEAU_PASSAGE (
ID_BATPASS NUMBER  NOT NULL,
CODPORT	CHAR(2)	 NOT NULL,
NOMBAT	VARCHAR2(40) NOT NULL,
ARV  DATE  NOT NULL,
DEPART DATE NULL,
ID_MOD  NUMBER  NOT NULL,
NOMPROP	VARCHAR2(50) NOT NULL,
TEL_PORTABLE VARCHAR2(10) NULL,
ADRESSE	VARCHAR2(60) NOT NULL,
EMPL_AFF  NUMBER  NOT NULL,
CONSTRAINT  PK_BATEAU_PASSAGE  PRIMARY KEY (ID_BATPASS),
CONSTRAINT  UNQ_CODPORT_NOMBAT_ARV  UNIQUE (CODPORT, NOMBAT, ARV),
CONSTRAINT  CHK_ARV_DEPART CHECK (DEPART > ARV)
);

    set echo on
    DESC BATEAU_PASSAGE
    set echo off

    prompt Création de la table EMPLACEMENT_LIBRE:
    prompt ==============================

CREATE TABLE EMPLACEMENT_LIBRE (
ID_EMPL NUMBER NOT NULL,
DEB_LIBRE  DATE  NOT NULL,
FIN_LIBRE  DATE  NOT NULL,
TYPE_EMPL  NUMBER  NOT NULL,
CONSTRAINT  PK_EMPLACEMENT_LIBRE  PRIMARY KEY (ID_EMPL, DEB_LIBRE),
CONSTRAINT CHK_DEB_FIN_LIBRE CHECK (FIN_LIBRE > DEB_LIBRE)
);

    set echo on
    DESC EMPLACEMENT_LIBRE
    set echo off

    prompt Création de la table PROPRIETAIRE:
    prompt ==============================

CREATE TABLE PROPRIETAIRE (
ID_PROP  NUMBER  NOT NULL,
NOMPROP  VARCHAR(40)  NOT NULL,
ADRESSE	VARCHAR2(60) NOT NULL,
VILLE	VARCHAR2(40) NOT NULL,
CODPOSTAL  NUMBER(5)  NOT NULL,
TEL_PORTABLE VARCHAR2(10) NULL,
CONSTRAINT  PK_PROPRIETAIRE  PRIMARY KEY (ID_PROP)
);

    set echo on
    DESC PROPRIETAIRE
    set echo off

    prompt Création de la table PORT:
    prompt ==============================

CREATE TABLE PORT (
CODPORT	CHAR(2)	 NOT NULL,
VILLE	VARCHAR2(40) NOT NULL,
CODPOSTAL  NUMBER(5)  NOT NULL,
CONSTRAINT  PK_PORT PRIMARY KEY (CODPORT)
);

    set echo on
    DESC PORT
    set echo off

        prompt Création de la table MODELE:
    prompt ==============================

CREATE TABLE MODELE (
ID_MOD  NUMBER  NOT NULL,
CODMOD  VARCHAR(20)  NULL,
CONSTRUCT	VARCHAR2(40) NOT NULL,
LONGR	NUMBER(4,2) NOT NULL,
LARG	NUMBER(4,2) NOT NULL,
TIRANT	NUMBER(4,2) NOT NULL,
CONSTRAINT  PK_MODELE  PRIMARY KEY (ID_MOD),
CONSTRAINT  UNQ_CODMOD  UNIQUE (CODMOD),
CONSTRAINT  CHK_LONGR CHECK (LONGR > 0),
CONSTRAINT  CHK_LARG CHECK (LARG > 0),
CONSTRAINT  CHK_TIRANT CHECK (TIRANT > 0)
);

    set echo on
    DESC MODELE
    set echo off

    prompt Création de la table EMPLACEMENT:
    prompt ==============================

CREATE TABLE EMPLACEMENT (
ID_EMPL NUMBER NOT NULL,
BASSIN	VARCHAR2(20) NOT NULL,
PONTON  CHAR(1)  NOT NULL,
EMPLNO	NUMBER	NOT NULL,
TYPE_EMPL  NUMBER  NOT NULL,
CONSTRAINT  PK_EMPLACEMENT PRIMARY KEY (ID_EMPL),
CONSTRAINT  UNQ_BASSIN_PONTON_EMPL   UNIQUE (BASSIN,PONTON,EMPLNO)
);

    set echo on
    DESC EMPLACEMENT
    set echo off

    prompt Création de la table TYPE_EMPLACEMENT:
    prompt ==============================

CREATE TABLE TYPE_EMPLACEMENT (
TYPE_EMPL  NUMBER  NOT NULL,
LONGR	NUMBER(4,2) NOT NULL,
LARG	NUMBER(4,2) NOT NULL,
PROFOND	NUMBER(4,2) NOT NULL,
CONSTRAINT  PK_TYPE_EMPLACEMENT  PRIMARY KEY (TYPE_EMPL),
CONSTRAINT  CHK_PROFOND CHECK (PROFOND > 0)
);

    set echo on
    DESC TYPE_EMPLACEMENT
    set echo off

spool off;