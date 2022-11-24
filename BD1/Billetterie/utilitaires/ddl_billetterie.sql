-- ============================================================================
-- Fichier          : ddl_billetterie.sql
-- Auteur           : Brouillé Théo
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Création des tables
-- ============================================================================

@ drop_billetterie.sql

CREATE TABLE CLIENT(
IDCLI	NUMBER(4)	NOT NULL,
NOMCLI	VARCHAR2(40)	NOT NULL,
PRENOMCLI	VARCHAR2(40)	NOT NULL,
TELCLI CHAR(10)	NOT NULL,
MAILCLI	VARCHAR2(80)	NOT NULL,
ADRCLI	VARCHAR2(255)	NOT NULL,
CONSTRAINT PK_CLIENT PRIMARY KEY (IDCLI),
CONSTRAINT U_MAIL UNIQUE (MAILCLI)
);

CREATE TABLE BILLET(
IDBILLET	NUMBER(4)	NOT NULL,
CODEBILLET	CHAR(15)	NOT NULL,
IDEVT		NUMBER(4)	NOT NULL,
IDCLI		NUMBER(4)	NOT NULL,
IDTARIF		NUMBER(4)	NOT NULL,
IDSITERESA	NUMBER(4)	NULL,
CONSTRAINT PK_BILLET PRIMARY KEY (IDBILLET),
CONSTRAINT U_CODEBILLET UNIQUE (CODEBILLET)
);

CREATE TABLE EVENEMENT(
IDEVT		NUMBER(4)	NOT NULL,
TITREEVT	VARCHAR2(50)	NOT NULL,
DATEEVT		DATE	NOT NULL,
TYPEEVT		CHAR(7)	NOT NULL,
IDSALLE		NUMBER(4)	NOT NULL,
CONSTRAINT PK_EVT PRIMARY KEY (IDEVT),
CONSTRAINT CHK_TYPEEVT CHECK (TYPEEVT IN('concert ', 'sport', 'comedie', 'enfant'))
);

CREATE TABLE SALLE(
IDSALLE		NUMBER(4)	NOT NULL,
NOMSALLE	VARCHAR2(50)	NOT NULL,
ADRSALLE	VARCHAR2(255)	NOT NULL,
CONSTRAINT PK_SALLE PRIMARY KEY (IDSALLE)
);

CREATE TABLE TARIF(
IDTARIF	NUMBER(4)	NOT NULL,
PRIX	NUMBER(5,2)	NOT NULL,
TYPETARIF	CHAR(8)	NOT NULL,
CONSTRAINT PK_TARIF PRIMARY KEY (IDTARIF),
CONSTRAINT CHK_PRIX CHECK (PRIX>=0),
CONSTRAINT CHK_TYPETARIF CHECK (TYPETARIF IN('etudiant ', 'plein', 'enfant'))
);

CREATE TABLE SITERESA(
IDSITERESA	NUMBER(4)	NOT NULL,
NOMSITERESA	VARCHAR2(50)	NOT NULL,
URLSITERESA	VARCHAR2(80)	NOT NULL,
CONSTRAINT PK_SITERESA PRIMARY KEY (IDSITERESA)
);

create table PARTENAIRE (
  idpart number(4) not null,
  nompart varchar2(30) not null,
  nationalite varchar(30) null,
  constraint pk_partenaire primary key (idpart)
);

create table SPONSORING (
  idevt number(4) not null,
  idpart number(4) not null,
  prime number(5, 3) not null,
  constraint pk_sponsoring primary key (idevt, idpart),
  constraint chk_sponsoring check (prime > 0)
);

@ dr_billetterie.sql
