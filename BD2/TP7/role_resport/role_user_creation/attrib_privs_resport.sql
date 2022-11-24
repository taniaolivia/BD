-- ============================================================================
-- Fichier : attrib_privs_resport.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Création du role RESPORT et attribution des privilèges 
-- Mise en oeuvre : A executer par l'utilisateur LOGIN 
--                  REMPLACER jmalki par votre lOGIN
-- ============================================================================

-- ==================
-- Creation du role
-- ==================
DROP ROLE tolivia_resport;
CREATE ROLE tolivia_resport;

-- ==================
-- Privileges SYSTEM
-- ==================
-- Attribution du droit de se connecter à la BD
GRANT CREATE SESSION TO tolivia_resport;

-- ==================
-- Privileges OBJETS
-- ==================
-- Affecter les emplacements libres aux bateaux de passages
GRANT SELECT 
ON port TO tolivia_resport;

GRANT SELECT
ON modele TO tolivia_resport;

GRANT SELECT 
ON emplacement_libre TO tolivia_resport;
-- ou : 
GRANT EXECUTE 
ON listeEmplacementsLibres TO tolivia_resport;

GRANT SELECT 
ON SEQ_BATEAU_PASSAGE TO tolivia_resport;
GRANT SELECT, INSERT, UPDATE
ON bateau_passage TO tolivia_resport;

-- Enregistrer sortie/retour d'un bateau resident
GRANT SELECT 
ON bateau_resident TO tolivia_resport;

GRANT SELECT 
ON SEQ_SORTIE TO tolivia_resport;
GRANT SELECT, INSERT, UPDATE 
ON sortie TO tolivia_resport;

