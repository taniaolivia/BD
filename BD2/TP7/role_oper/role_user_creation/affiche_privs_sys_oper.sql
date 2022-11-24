-- ============================================================================
-- Fichier : affiche_privs_sys_oper.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Affichage des privilèges systèmes accordés au rôle OPER
-- ============================================================================

set linesize 200;
set pagesize 200;
column role format a20;
column privilege format a30;
column admin_option format a15;

SELECT  role, privilege, admin_option
FROM    ROLE_SYS_PRIVS
WHERE   upper(role) = 'TOLIVIA_OPER'
ORDER BY 3;

