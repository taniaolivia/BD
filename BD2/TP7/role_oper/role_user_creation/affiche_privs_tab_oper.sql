-- ============================================================================
-- Fichier : affiche_privs_tab_oper.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Affichage des privilèges objets accordés au rôle OPER
-- ============================================================================

set linesize 200;
set pagesize 200;
column table_name format a25;
column column_name format a15;
column privilege format a15;

SELECT table_name, column_name, privilege, grantable
FROM   ROLE_TAB_PRIVS
WHERE   upper(role) = 'TOLIVIA_OPER'
ORDER BY 3;
