-- ============================================================================
-- Fichier : tolivia_user_technicien.sql
-- Auteur  : Tania OLIVIA				
-- Date    : Mai 2020
-- Role    : creer le technicien 
-- sqlplus : @exercice_2/tolivia_user_technicien.sql
-- ============================================================================
spool ../exercice_2/tolivia_user_technicien.out 
set echo on

-- ============================================================================
-- A completer
-- ============================================================================


CREATE USER tolivia_dtexier
IDENTIFIED BY dtexier_pwd
DEFAULT TABLESPACE users;


-- ============================================================================
-- Fin à completer
-- ============================================================================

set echo off 
spool off

