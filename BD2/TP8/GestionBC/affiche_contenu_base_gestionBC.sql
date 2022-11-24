-- ============================================================================
-- Fichier 		: affiche_contenu_base_gestionBC.sql 
-- Base         : Gestion BC
-- Auteur  		: Tania OLIVIA
-- Date    		: 08/04/2020
-- Role    		: Affichage des nuplets de la base de donnees.
-- Projet       : Gestion BC
-- ============================================================================

PROMPT Contenu de la table Client:
PROMPT =================================
SELECT *
FROM CLIENT;


PROMPT Contenu de la table Employe:
PROMPT =================================
SELECT *
FROM EMPLOYE;


PROMPT Contenu de la table Compte:
PROMPT =================================
SELECT *
FROM COMPTE;


PROMPT Contenu de la table Compte Courant:
PROMPT =================================
SELECT *
FROM COMPTE_COURANT;


PROMPT Contenu de la table Compte Epargne:
PROMPT =================================
SELECT *
FROM COMPTE_EPARGNE;


PROMPT Contenu de la table Droit Signature:
PROMPT =================================
SELECT *
FROM DROIT_SIGNATURE;


PROMPT Contenu de la table Mouvement:
PROMPT =================================
SELECT *
FROM MOUVEMENT;
