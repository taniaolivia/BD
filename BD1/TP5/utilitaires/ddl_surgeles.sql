-- ==========================
-- fichier 	: ddl_surgeles.sql
-- base 	: surgeles
-- auteur(s)	: Tania OLIVIA
-- date 	: 17/10/2019
-- role 	: créer toutes les relations de la base + les contraintes
-- projet 	: surgeles
-- resultat dans : ddl_surgeles.out
-- ==========================

spool /Volumes/tolivia/BD1/TP2/ddl_surgeles.out
    prompt Création de la table LIVREUR :
    prompt ==============================

CREATE TABLE LIVREUR(
IDLIV	NUMBER(4)	NOT NULL,
NOMLIV	VARCHAR2(50)	NOT NULL,
CONSTRAINT PK_LIVREUR PRIMARY KEY (IDLIV)
);

    set echo on
    DESC LIVREUR
    set echo off


    prompt Création de la table CLIENT :
    prompt ==============================

CREATE TABLE CLIENT (
IDCLI  NUMBER(4)  NOT NULL,
NOMCLI  VARCHAR2(50)  NOT NULL,
PRENOMCLI  VARCHAR2(50)  NOT NULL,
TELCLI  NUMBER(10)  NOT NULL,
MAILCLI  VARCHAR2(255)  NULL,
ADRCLI  VARCHAR2(255)  NOT NULL,
CONSTRAINT  PK_CLIENT  PRIMARY KEY (IDCLI),
CONSTRAINT  UNQ_MAILCLI  UNIQUE (MAILCLI)
);

    set echo on
    DESC CLIENT
    set echo off

    prompt Création de la table COMMANDE :
    prompt ==============================

CREATE TABLE COMMANDE (
IDCOM  NUMBER(4)  NOT NULL,
IDCLI  NUMBER(4)  NOT NULL,
DATECOM  DATE  NOT NULL,
DATERECEPPREVI  DATE  NOT NULL,
CONSTRAINT  PK_COMMANDE  PRIMARY KEY (IDCOM),
CONSTRAINT  CHK_DATERECEPPREVI CHECK (DATECOM < DATERECEPPREVI)
);

    set echo on
    DESC COMMANDE
    set echo off

    prompt Création de la table LIGNE_COMMANDE :
    prompt ==============================

CREATE TABLE LIGNE_COMMANDE (
IDLIGCOM  NUMBER(4)  NOT NULL,
IDCOM  NUMBER(4)  NOT NULL,
IDPRO  NUMBER(4)  NOT NULL,
QTECOM  NUMBER(4)  NOT NULL,
PRIXUNIT  NUMBER(5,2)  NOT NULL,
CONSTRAINT  PK_LIGNE_COMMANDE  PRIMARY KEY (IDLIGCOM),
CONSTRAINT  CHK_QTECOM CHECK (QTECOM > 0),
CONSTRAINT  CHK_PRIXUNIT CHECK (PRIXUNIT > 0)
);

    set echo on
    DESC LIGNE_COMMANDE
    set echo off

    prompt Création de la table PRODUIT:
    prompt ==============================

CREATE TABLE PRODUIT (
IDPRO  NUMBER(4)  NOT NULL,
NOMPRO  VARCHAR(50)  NOT NULL,
TYPEPRO  CHAR(7)  NOT NULL,
CONSTRAINT  PK_PRODUIT  PRIMARY KEY (IDPRO),
CONSTRAINT  CHK_TYPEPRO CHECK (TYPEPRO IN ('VIANDE', 'POISSON', 'DESSERT'))
);

    set echo on
    DESC PRODUIT
    set echo off

    prompt Création de la table LIVRAISON :
    prompt ==============================

CREATE TABLE LIVRAISON (
IDLIV  NUMBER(4)  NOT NULL,
IDCOM  NUMBER(4)  NOT NULL,
DATELIV  DATE  NOT NULL,
CONSTRAINT  PK_LIVRAISON  PRIMARY KEY (IDLIV, IDCOM)
);

    set echo on
    DESC LIVRAISON
    set echo off

spool off;