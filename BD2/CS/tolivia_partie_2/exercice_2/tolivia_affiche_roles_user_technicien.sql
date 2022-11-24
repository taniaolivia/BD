-- ============================================================================
-- Fichier : tolivia_affiche_roles_user_technicien.sql
-- Auteur  : Tania OLIVIA					
-- Date    : Mai 2020
-- Role    : affiche roles du login_dtexier 
-- sqlplus : @exercice_2/tolivia_affiche_roles_user_technicien.sql
-- ============================================================================
spool ../exercice_2/tolivia_affiche_roles_user_technicien.out 
set echo on

-- ============================================================================
-- A completer
-- ============================================================================

set linesize 200;
set pagesize 200;


SELECT  *
FROM    USER_ROLE_PRIVS;

-- ============================================================================
-- Fin à completer
-- ============================================================================

set echo off 
spool off
