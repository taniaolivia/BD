-- ============================================================================
-- Fichier : affiche_role_user_resport1.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Affichage des rôles attribués à l’utilisateur créé
-- ============================================================================

set linesize 200;
set pagesize 200;
column granted_role format a15;
column grantee format a20;

SELECT grantee, granted_role
FROM   DBA_ROLE_PRIVS
WHERE   upper(grantee) = 'TOLIVIA_RESPORT1'
ORDER BY 2;