-- ============================================================================
-- Fichier : attrib_privs_oper.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Création du role OPER et attribution des privilèges 
-- Mise en oeuvre : A executer par l'utilisateur LOGIN 
--                  REMPLACER jmalki par votre lOGIN
-- ============================================================================

-- ==================
-- Creation du role
-- ==================
DROP ROLE tolivia_oper;
CREATE ROLE tolivia_oper;

-- ==================
-- Privileges SYSTEM
-- ==================
-- Attribution du droit de se connecter à la BD
GRANT CREATE SESSION TO tolivia_oper;

-- ==================
-- Privileges OBJETS
-- ==================
-- Affecter les emplacements libres aux bateaux de passages
GRANT SELECT 
ON port TO tolivia_oper;

GRANT SELECT
ON modele TO tolivia_oper;

GRANT SELECT 
ON emplacement_libre TO tolivia_oper;
-- ou : 
GRANT EXECUTE 
ON listeEmplacementsLibres TO tolivia_oper;

GRANT SELECT 
ON SEQ_BATEAU_PASSAGE TO tolivia_oper;
GRANT SELECT, INSERT, UPDATE
ON bateau_passage TO tolivia_oper;

-- Enregistrer sortie/retour d'un bateau resident
GRANT SELECT 
ON bateau_resident TO tolivia_oper;

GRANT SELECT 
ON SEQ_SORTIE TO tolivia_oper;
GRANT SELECT, INSERT, UPDATE 
ON sortie TO tolivia_oper;

