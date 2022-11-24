-- ============================================================================
-- Fichier : affiche_privs_tab_user_oper1.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Affichage des privilèges objets attribués à l’utilisateur créé
-- ============================================================================

set linesize 200;
set pagesize 200;
column type format a15;
column privilege format a20;
column grantee format a15;
column owner format a15;
column grantor format a15;
column table_name format a25;


SELECT * 
FROM DBA_TAB_PRIVS
WHERE GRANTEE IN (SELECT granted_role 
                  FROM DBA_ROLE_PRIVS 
                  WHERE GRANTEE = 'TOLIVIA_OPER1');



