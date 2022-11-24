-- =========================================================================
-- fichier 	            : dict_colonnes_portPlaisance.sql
-- base 	            : Port Plaisance
-- auteur(s)        	: Tania OLIVIA
-- date 	            : 01/02/2020
-- role 	            : Exécuter les ordres COMMENT pour les colonnes de la relation port plaisance
-- projet 	            : Port Plaisance
-- resultat dans        : // à renseigner si nécessaire
-- ==========================================================================
-- ============================================================================
-- COLONNES DE LA TABLE BATEAU_PASSAGE
-- ============================================================================

COMMENT on COLUMN BATEAU_PASSAGE.ID_BATPASS IS 'identifiant du bateau de passage' ;
COMMENT on COLUMN BATEAU_PASSAGE.CODPORT IS 'code port dimmatriculation' ;
COMMENT on COLUMN BATEAU_PASSAGE.NOMBAT IS 'nom du bateau' ;
COMMENT on COLUMN BATEAU_PASSAGE.ARV IS 'date darrivee (debut du sejour)' ;
COMMENT on COLUMN BATEAU_PASSAGE.DEPART IS 'date de depart (fin du sejour)' ;
COMMENT on COLUMN BATEAU_PASSAGE.ID_MOD IS 'identifiant numerique du modele' ;
COMMENT on COLUMN BATEAU_PASSAGE.NOMPROP IS 'nom du proprietaire' ;
COMMENT on COLUMN BATEAU_PASSAGE.TEL_PORTABLE IS 'numero de telephone portable du proprietaire' ;
COMMENT on COLUMN BATEAU_PASSAGE.ADRESSE IS 'adresse du proprietaire' ;
COMMENT on COLUMN BATEAU_PASSAGE.EMPL_AFF IS 'identifiant numerique de lemplacement affecte au bateau' ;

-- ============================================================================
-- COLONNES DE LA TABLE BATEAU_RESIDENT
-- ============================================================================

COMMENT on COLUMN BATEAU_RESIDENT.ID_BATRES IS 'identifiant du bateau resident' ;
COMMENT on COLUMN BATEAU_RESIDENT.CODPORT IS 'code port dimmatriculation' ;
COMMENT on COLUMN BATEAU_RESIDENT.NOMBAT IS 'nom du bateau' ;
COMMENT on COLUMN BATEAU_RESIDENT.ID_MOD IS 'identifiant numerique du modele' ;
COMMENT on COLUMN BATEAU_RESIDENT.EMPL_AFF IS 'identifiant numerique de lemplacement affecte au bateau' ;
COMMENT on COLUMN BATEAU_RESIDENT.ID_PROP IS 'identifiant numerique du proprietaire' ;

-- ============================================================================
-- COLONNES DE LA TABLE EMPLACEMENT
-- ============================================================================

COMMENT on COLUMN EMPLACEMENT.ID_EMPL IS 'identifiant numerique de lemplacement' ;
COMMENT on COLUMN EMPLACEMENT.BASSIN IS 'nom dun bassin' ;
COMMENT on COLUMN EMPLACEMENT.PONTON IS 'nom dun ponton' ;
COMMENT on COLUMN EMPLACEMENT.EMPLNO IS 'numero de lemplacement sur un ponton' ;
COMMENT on COLUMN EMPLACEMENT.TYPE_EMPL IS 'type de lemplacement' ;

-- ============================================================================
-- COLONNES DE LA TABLE EMPLACEMENT_LIBRE
-- ============================================================================

COMMENT on COLUMN EMPLACEMENT_LIBRE.ID_EMPL IS 'identifiant de lemplacement' ;
COMMENT on COLUMN EMPLACEMENT_LIBRE.DEB_LIBRE IS 'date de debut de liberte' ;
COMMENT on COLUMN EMPLACEMENT_LIBRE.FIN_LIBRE IS 'date de fin de liberte' ;
COMMENT on COLUMN EMPLACEMENT_LIBRE.TYPE_EMPL IS 'type de lemplacement' ;

-- ============================================================================
-- COLONNES DE LA TABLE MODELE
-- ============================================================================

COMMENT on COLUMN MODELE.ID_MOD IS 'identifiant numerique du modele' ;
COMMENT on COLUMN MODELE.CODMOD IS 'code du modele de bateau, NULL pour les prototypes' ;
COMMENT on COLUMN MODELE.CONSTRUCT IS 'nom du constructeur de bateau' ;
COMMENT on COLUMN MODELE.LONGR IS 'longueur en metre du modele' ;
COMMENT on COLUMN MODELE.LARG IS 'largeur en metre du modele' ;
COMMENT on COLUMN MODELE.TIRANT IS 'tirant deau en metre du modele' ;

-- ============================================================================
-- COLONNES DE LA TABLE PORT
-- ============================================================================

COMMENT on COLUMN PORT.CODPORT IS 'code port dimmatriculation' ;
COMMENT on COLUMN PORT.VILLE IS 'ville du port dimmatriculation' ;
COMMENT on COLUMN PORT.CODPOSTAL IS 'code postal' ;

-- ============================================================================
-- COLONNES DE LA TABLE PROPRIETAIRE
-- ============================================================================

COMMENT on COLUMN PROPRIETAIRE.ID_PROP IS 'identifiant numerique du proprietaire' ;
COMMENT on COLUMN PROPRIETAIRE.NOMPROP IS 'nom du proprietaire d’un bateau resident' ;
COMMENT on COLUMN PROPRIETAIRE.ADRESSE IS 'adresse du proprietaire' ;
COMMENT on COLUMN PROPRIETAIRE.VILLE IS 'ville du proprietaire' ;
COMMENT on COLUMN PROPRIETAIRE.CODPOSTAL IS 'code postal' ;
COMMENT on COLUMN PROPRIETAIRE.TEL_PORTABLE IS 'numero de telephone portable du proprietaire' ;

-- ============================================================================
-- COLONNES DE LA TABLE SORTIE
-- ============================================================================

COMMENT on COLUMN SORTIE.ID_SORTIE IS 'identifiant de la sortie' ;
COMMENT on COLUMN SORTIE.CODPORT IS 'code port dimmatriculation du bateau resident' ;
COMMENT on COLUMN SORTIE.NOMBAT IS 'nom du bateau resident' ;
COMMENT on COLUMN SORTIE.DATSORT IS 'date de sortie du bateau resident' ;
COMMENT on COLUMN SORTIE.DATRET IS 'date de retour du bateau resident' ;
COMMENT on COLUMN SORTIE.EFF_PRV IS 'retour effectif (EFF) ou prevu (PRV)' ;

-- ============================================================================
-- COLONNES DE LA TABLE TYPE_EMPLACEMENT
-- ============================================================================

COMMENT on COLUMN TYPE_EMPLACEMENT.TYPE_EMPL IS 'type de lemplacement' ;
COMMENT on COLUMN TYPE_EMPLACEMENT.LONGR IS 'longueur en metre de lemplacement' ;
COMMENT on COLUMN TYPE_EMPLACEMENT.LARG IS 'largeur en metre de lemplacement' ;
COMMENT on COLUMN TYPE_EMPLACEMENT.PROFOND IS 'profondeur en metre de lemplacement' ;


