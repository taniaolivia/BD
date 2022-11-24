-- ==========================
-- fichier 	: ddl_gestionBC.sql
-- base 	: Gestion BC
-- auteur   : Tania OLIVIA
-- date 	: 08/04/2020
-- role 	: créer toutes les relations de la base + les contraintes
-- projet 	: Gestion BC
-- resultat dans : ddl_gestionDT.out
-- ==========================

spool ddl_gestionBC.out

DROP TABLE CLIENT CASCADE CONSTRAINT;

    prompt Création de la table CLIENT :
    prompt ==============================


CREATE TABLE CLIENT(
NUMCLIENT CHAR(5) NOT NULL,
NOMCLIENT VARCHAR2(20) NOT NULL,
ADRESSE VARCHAR2(40) NOT NULL,
TEL VARCHAR2(10) NOT NULL,
CONSTRAINT PK_CLIENT PRIMARY KEY (NUMCLIENT)
);

    set echo on
    DESC CLIENT
    set echo off

DROP TABLE EMPLOYE CASCADE CONSTRAINT;

    prompt Création de la table EMPLOYE:
    prompt ==============================

CREATE TABLE EMPLOYE (
NUMEMP CHAR(5) NOT NULL,
NOMEMP VARCHAR2(20) NOT NULL,
CONSTRAINT  PK_EMPLOYE PRIMARY KEY (NUMEMP)
);

    set echo on
    DESC EMPLOYE
    set echo off

DROP TABLE DROIT_SIGNATURE CASCADE CONSTRAINT;

    prompt Création de la table DROIT_SIGNATURE :
    prompt ==============================

CREATE TABLE DROIT_SIGNATURE (
NUMCLIENT CHAR(5) NOT NULL,
NUMCOMPTE_COURANT CHAR(5) NOT NULL,
EMPLOYE CHAR(5) NOT NULL,
DROIT VARCHAR2(40) NOT NULL,
CONSTRAINT  PK_DROIT_SIGNATURE  PRIMARY KEY (NUMCLIENT, NUMCOMPTE_COURANT)
);

    set echo on
    DESC DROIT_SIGNATURE
    set echo off

DROP TABLE COMPTE CASCADE CONSTRAINT;

    prompt Création de la table COMPTE:
    prompt ==============================

CREATE TABLE COMPTE (
NUMCOMPTE CHAR(5) NOT NULL,
SOLDE NUMBER(10,2) NOT NULL,
DATE_OUVERTURE DATE NOT NULL,
PROPRIETAIRE CHAR(5) NOT NULL,
CONSTRAINT  PK_COMPTE  PRIMARY KEY (NUMCOMPTE)
);

    set echo on
    DESC COMPTE
    set echo off

DROP TABLE COMPTE_COURANT CASCADE CONSTRAINT;

    prompt Création de la table COMPTE_COURANT:
    prompt ==============================

CREATE TABLE COMPTE_COURANT (
NUMCOMPTE_COURANT CHAR(5) NOT NULL,
NB_OP_CB  NUMBER (10) NOT NULL,
CONSTRAINT  PK_COMPTE_COURANT  PRIMARY KEY (NUMCOMPTE_COURANT)
);

    set echo on
    DESC COMPTE_COURANT
    set echo off

DROP TABLE COMPTE_EPARGNE CASCADE CONSTRAINT;

    prompt Création de la table COMPTE_EPARGNE:
    prompt ==============================

CREATE TABLE COMPTE_EPARGNE (
NUMCOMPTE_EPARGNE CHAR(5) NOT NULL,
TX_INTERNET	NUMBER(3,2)	 NOT NULL,
CONSTRAINT  PK_COMPTE_EPARGNE PRIMARY KEY (NUMCOMPTE_EPARGNE)
);

    set echo on
    DESC COMPTE_EPARGNE
    set echo off

DROP TABLE MOUVEMENT CASCADE CONSTRAINT;

    prompt Création de la table MOUVEMENT:
    prompt ==============================

CREATE TABLE MOUVEMENT (
ID_MOUVEMENT CHAR(5) NOT NULL,
MONTANT NUMBER(3,2) NOT NULL,
NUMCLIENT CHAR(5) NOT NULL,
NUMCOMPTE_COURANT CHAR(5) NOT NULL,
DATEOP DATE  NOT NULL,
CONSTRAINT  PK_MOUVEMENT PRIMARY KEY (ID_MOUVEMENT)
);

    set echo on
    DESC MOUVEMENT
    set echo off

spool off;