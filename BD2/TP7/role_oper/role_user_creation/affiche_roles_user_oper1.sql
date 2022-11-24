-- ============================================================================
-- Fichier : affiche_role_user_oper1.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Affichage des rôles attribués à l’utilisateur créé
-- ============================================================================

set linesize 200;
set pagesize 200;
column granted_role format a15;
column grantee format a15;

SELECT grantee, granted_role
FROM   DBA_ROLE_PRIVS
WHERE   upper(grantee) = 'TOLIVIA_OPER1'
ORDER BY 2;