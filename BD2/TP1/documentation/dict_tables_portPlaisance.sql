-- =========================================================================
-- fichier 	            : dict_colonnes_portPlaisance.sql
-- base 	            : Port Plaisance
-- auteur(s)        	: Tania OLIVIA
-- date 	            : 01/02/2020
-- role 	            : Exécuter les ordres COMMENT pour les tables de la relation port plaisance
-- projet 	            : Port Plaisance
-- resultat dans        : // à renseigner si nécessaire
-- ==========================================================================
-- ============================================================================
-- TABLE BATEAU_PASSAGE
-- ============================================================================

COMMENT on TABLE  BATEAU_PASSAGE IS 'Ensemble des bateau ayant sejourne dans le port depuis le 1/1 de lannee en cours, archivage de lhistoire sur un an';

-- ============================================================================
-- TABLE BATEAU_RESIDENT
-- ============================================================================

COMMENT on TABLE BATEAU_RESIDENT IS 'Ensemble des bateaux residents du port';

-- ============================================================================
-- TABLE EMPLACEMENT 
-- ============================================================================

COMMENT on TABLE EMPLACEMENT IS 'Ensemble des emplacements du port';

-- ============================================================================
-- TABLE EMPLACEMENT_LIBRE
-- ============================================================================

COMMENT on TABLE EMPLACEMENT_LIBRE IS 'Plages des disponibilites des emplacements, seules les disponibilites en cours ou prevues sont gerees';

-- ============================================================================
-- TABLE MODELE
-- ============================================================================

COMMENT on TABLE MODELE IS 'Modeles des bateaux qui ont sejours dans le port';

-- ============================================================================
-- TABLE APICULTEUR
-- ============================================================================

-- Table PORT
COMMENT on TABLE PORT IS 'Code des ports dimmatriculation des bateaux qui ont sejourne dans le port';

-- ============================================================================
-- TABLE PROPRIETAIRE
-- ============================================================================

COMMENT on TABLE PROPRIETAIRE IS 'Proprietaires des bateaux residents du port';

-- ============================================================================
-- TABLE SORTIE
-- ============================================================================

COMMENT on TABLE SORTIE IS 'Historique des sorties effectuees par les bateaux residents ainsi que leurs sorties prevues';

-- ============================================================================
-- TABLE TYPE_EMPLACEMENT 
-- ============================================================================

COMMENT on TABLE TYPE_EMPLACEMENT IS 'Caracteristiques des types demplacement disponibles dans le port';






