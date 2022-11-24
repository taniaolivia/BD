-- ============================================================================
-- Fichier : affiche_privs_sys_user_resport1.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Affichage des privilèges systèmes attribués à l’utilisateur créé
-- ============================================================================

set linesize 200;
set pagesize 200;
column role format a20;
column privilege format a30;
column admin_option format a15;

SELECT  role, privilege, admin_option
FROM    ROLE_SYS_PRIVS
WHERE   upper(role) = 'TOLIVIA_RESPORT'
ORDER BY 3;


