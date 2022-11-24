-- ============================================================================
-- Fichier : tolivia_affiche_privs_user_technicien.sql
-- Auteur  : Tania OLIVIA					
-- Date    : Mai 2020
-- Role    : affiche privs du login_dtexier 
-- sqlplus : @exercice_2/tolivia_affiche_privs_user_technicien.sql
-- ============================================================================
spool ../exercice_2/tolivia_affiche_privs_user_technicien.out 
set echo on

-- ============================================================================
-- A completer
-- ============================================================================

set linesize 200;
set pagesize 200;
column role format a20;
column privilege format a30;
column admin_option format a15;

SELECT  role, privilege, admin_option
FROM    ROLE_SYS_PRIVS
WHERE   upper(role) = 'tolivia_dtexier_technicien'
ORDER BY 3;

set linesize 200;
set pagesize 200;
column table_name format a25;
column column_name format a15;
column privilege format a15;

SELECT table_name, column_name, privilege, grantable
FROM   ROLE_TAB_PRIVS
WHERE   upper(role) = 'tolivia_dtexier_techinicien'
ORDER BY 3;

-- ============================================================================
-- Fin à completer
-- ============================================================================

set echo off 
spool off

