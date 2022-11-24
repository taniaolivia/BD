-- ============================================================================
-- Fichier : affiche_role_user_oper1.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Affichage des rôles accordés à l’utilisateur créé
-- ============================================================================

set linesize 200;
set pagesize 200;
column role format a15;

SELECT *
FROM   SESSION_ROLES
WHERE   upper(role) = 'TOLIVIA_OPER';