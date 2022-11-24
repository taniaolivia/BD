-- ============================================================================
-- Fichier : def_users_resport1.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Creation des utilisateurs
-- Mise en oeuvre : A executer par l'utilisateur LOGIN 
--                  REMPLACER jmalki par tolivia_resport
-- ============================================================================

-- Utilisateur tolivia_resport1 possedant le role RESPORT
DROP USER tolivia_resport1;

CREATE USER tolivia_resport1
IDENTIFIED BY tolivia_resport1
DEFAULT TABLESPACE users;

GRANT tolivia_resport TO tolivia_resport1;






