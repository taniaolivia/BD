-- ============================================================================
-- Fichier : tolivia_privs_role_technicien.sql
-- Auteur  : Tania OLIVIA					
-- Date    : Mai 2020
-- Role    : privs role tolivia_role_technicien
-- sqlplus : @exercice_2/tolivia_privs_role_technicien.sql
-- ============================================================================
spool ../exercice_2/tolivia_privs_role_technicien.out 
set echo on

-- ============================================================================
-- A completer
-- ============================================================================

-- ==================
-- Privileges SYSTEM
-- ==================
-- Attribution du droit de se connecter à la BD
GRANT CREATE SESSION TO tolivia_dtexier;

-- ==================
-- Privileges OBJETS
-- ==================
-- Affecter les installations
GRANT SELECT , INSERT, UPDATE 
ON technicien TO tolivia_dtexier;

GRANT SELECT, INSERT, UPDATE
ON logiciel TO tolivia_dtexier;

GRANT SELECT, INSERT, UPDATE
ON tolivia_installation TO tolivia_dtexier;

GRANT EXECUTE 
ON listeInstallationAffecte TO tolivia_dtexier;

GRANT SELECT, INSERT, UPDATE
ON  poste TO tolivia_dtexier;




-- ============================================================================
-- Fin à completer
-- ============================================================================

set echo off 
spool off
