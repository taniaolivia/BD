-- ============================================================================
-- Fichier : def_users_oper1.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Creation des utilisateurs
-- Mise en oeuvre : A executer par l'utilisateur LOGIN 
--                  REMPLACER jmalki par tolivia_oper
-- ============================================================================

-- Utilisateur tolivia_oper1 possedant le role oper
DROP USER tolivia_oper1;

CREATE USER tolivia_oper1
IDENTIFIED BY tolivia_oper1
DEFAULT TABLESPACE users;

GRANT tolivia_oper TO tolivia_oper1;






