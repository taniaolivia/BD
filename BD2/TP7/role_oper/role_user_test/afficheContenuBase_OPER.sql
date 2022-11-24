-- ============================================================================
-- Fichier : afficheContenuBase_OPER.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Affichage des nuplets de la base de donnees.
--			 Prise en charge des privilèges accordés au rôle OPER
-- ============================================================================

PROMPT Contenu de la table PORT :
SELECT	 CODPORT, VILLE, CODPOSTAL
FROM	 TOLIVIA.PORT;

PROMPT Contenu de la table MODELE :
SELECT	ID_MOD, CODMOD, CONSTRUCT, LONGR, LARG,TIRANT
FROM 	TOLIVIA.MODELE;

PROMPT Contenu de la table EMPLACEMENT_LIBRE :   
SELECT	ID_EMPL, DEB_LIBRE, FIN_LIBRE, TYPE_EMPL
FROM	TOLIVIA.EMPLACEMENT_LIBRE;

PROMPT Contenu de la table BATEAU_PASSAGE :   
SELECT	CODPORT, NOMBAT, ARV, DEPART, ID_MOD, NOMPROP, 
		TEL_PORTABLE, ADRESSE, EMPL_AFF
FROM	TOLIVIA.BATEAU_PASSAGE;

PROMPT Contenu de la table BATEAU_RESIDENT :   
SELECT	  CODPORT, NOMBAT, ID_MOD, EMPL_AFF, ID_PROP
FROM	 TOLIVIA.BATEAU_RESIDENT;

PROMPT Contenu de la table SORTIE :   
SELECT	 CODPORT, NOMBAT, DATSORTRELLE, DATRETRELLE, EFF_PRV
FROM	 TOLIVIA.SORTIE;
