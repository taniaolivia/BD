-- ==========================
-- fichier 	: ddl_ruche.sql
-- base 	: ruche
-- auteur(s): Tania OLIVIA
-- date 	: 10/12/2019
-- role 	: créer toutes les relations de la base + les contraintes
-- projet 	: ruche
-- resultat dans : ddl_ruche.out
-- ==========================

spool /Volumes/tolivia/BD1/Ruche/utilitaires/ddl_ruche.out
    prompt Création de la table RECOLTE :
    prompt ==============================

CREATE TABLE RECOLTE (
IDRU  NUMBER(4)  NOT NULL,
DATEREC DATE  NOT NULL,
MASSE  NUMBER(4,3)  NOT NULL,
CONSTRAINT  PK_RECOLTE  PRIMARY KEY (IDRU, DATEREC),
CONSTRAINT  CHK_MASSE CHECK (MASSE > 0)
);

    set echo on
    DESC RECOLTE
    set echo off


    prompt Création de la table RUCHE :
    prompt ==============================

CREATE TABLE RUCHE (
IDRU  NUMBER(4)  NOT NULL,
NBCADRE  NUMBER(2)  NOT NULL,
IDAPI  NUMBER(4)  NOT NULL,
IDRUCHER  NUMBER(4)  NOT NULL,
CONSTRAINT  PK_RUCHE  PRIMARY KEY (IDRU),
CONSTRAINT  CHK_NBCADRE CHECK (NBCADRE > 0)
);

    set echo on
    DESC RUCHE
    set echo off



    prompt Création de la table APICULTEUR :
    prompt ==============================

CREATE TABLE APICULTEUR (
IDAPI  NUMBER(4)  NOT NULL,
NOMAPI  VARCHAR2(40)  NOT NULL,
PRENOMAPI  VARCHAR2(40)  NOT NULL,
TELAPI  VARCHAR2(10)  NOT NULL,
MAILAPI VARCHAR2(80)  NOT NULL,
ADRAPI VARCHAR2(255)  NOT NULL,
CONSTRAINT  PK_APICULTEUR  PRIMARY KEY (IDAPI),
CONSTRAINT  UNQ_NOMAPI  UNIQUE (NOMAPI),
CONSTRAINT  UNQ_PRENOMAPI  UNIQUE (PRENOMAPI),
CONSTRAINT  UNQ_MAILAPI  UNIQUE (MAILAPI)
);

    set echo on
    DESC APICULTEUR
    set echo off



    prompt Création de la table RUCHER :
    prompt ==============================

CREATE TABLE RUCHER (
IDRUCHER  NUMBER(4)  NOT NULL,
TYPEMIEL  CHAR(6)  NOT NULL,
CONSTRAINT  PK_RUCHER PRIMARY KEY (IDRUCHER),
CONSTRAINT  CHK_TYPEMIEL CHECK (TYPEMIEL IN ('acacia', 'colza', 'sapin', 'thym'))
);

    set echo on
    DESC RUCHER
    set echo off



spool off;