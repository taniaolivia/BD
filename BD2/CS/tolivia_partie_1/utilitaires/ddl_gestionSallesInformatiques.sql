-- ============================================================================
-- fichier : ddl_gestionsallesinformatiques.sql
-- auteur : jamal malki
-- date : mai 2020
-- role : creation des tables de la base de donnees "gestion salles informatiques" 
-- ============================================================================

create table salle (
nosalle			number				not null,
nomsalle		varchar2(20)		not null,
nbpostes		number              null,
constraint pk_salle primary key (nosalle)
);

create table poste (
noposte			number				not null,
salle			number				not null,
typeos			number				not null,
ip				char(15)			not null,
constraint pk_poste primary key (noposte)
);

create table logiciel (
nosoft			number				not null,
nomsoft			varchar2(20)		not null,
editeur			varchar2(20)		not null,
version			char(5)				not null,
typeos			number				not null,
dateachat		date				not null,
constraint pk_logiciel primary key (nosoft)
);

create table typeos (
idtypeos		number				not null,
labelos			varchar2(20)		not null,
constraint pk_typeos primary key (idtypeos)
);

create table technicien (
idtech		number		not null,
login		varchar2(8)	not null,
constraint pk_technicien primary key (idtech)
) ; 


