-- ============================================================================
-- Fichier : affiche_privs_sys_user_oper1.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Affichage des privilèges systèmes attribués à l’utilisateur créé
-- ============================================================================

set linesize 200;
set pagesize 200;
column role format a10;
column privilege format a20;
column admin_option format a15;
column delegate_option format a10;
column default_role format a15;


SELECT  *
FROM    DBA_SYS_PRIVS s, DBA_ROLE_PRIVS r
WHERE   upper(s.grantee) =  upper(r.grantee)
AND upper(s.grantee) = 'TOLIVIA_OPER1';


