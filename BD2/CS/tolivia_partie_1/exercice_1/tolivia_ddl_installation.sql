-- ============================================================================
-- fichier : tolivia_ddl_installation.sql 
-- auteur : Tania OLIVIA
-- date : Mai 2020
-- role : creation table installation
-- sqlplus : @exercice_1/tolivia_ddl_installation.sql
-- ============================================================================
@../utilitaires/drop_gestionSallesInformatiques.sql
@../utilitaires/ddl_gestionSallesInformatiques.sql
spool ../exercice_1/tolivia_ddl_installation.out 
set echo on

-- ============================================================================
-- A compléter
-- ============================================================================

create table tolivia_installation (
idinstall		number				not null,
soft		    number				not null,
poste           number				not null,
dateaffect      date                not null,
dateinstallprev date                not null,
dateinstallreel date                null,
etatinstall     varchar2(20)		not null,
responsable		number              null,
constraint pk_idinstall primary key (idinstall),
constraint unq_soft_poste_dateaffect unique (soft, poste, dateaffect),
constraint chk_etatinstall  check (etatinstall in('ouverte', 'encours', 'cloturee')),
constraint chk_dateinstall_prev_reel check (dateinstallprev >= dateaffect),
constraint chk_dateinstallreel check (dateinstallreel IS NULL OR (dateinstallreel >= dateinstallprev))
);

-- ============================================================================
-- Fin à compléter
-- ============================================================================

set echo off 
spool off
