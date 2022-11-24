
--==========================
--fichier           : afficher_contenu_base_portPlaisance.sql
--base              : port plaisance
--auteur(s)         : Tania OLIVIA
--date              : 31/01/2020
--role              : Afficher l’ensemble du contenu des tables de la base de données
--projet            : port plaisance
--resultat dans     :  // à renseigner si nécessaire
--==========================

PROMPT Contenu de la table Bateau Passage :
PROMPT =================================
SELECT *
FROM BATEAU_PASSAGE;

PROMPT Contenu de la table Bateau Resident:
PROMPT =================================
SELECT *
FROM BATEAU_RESIDENT;

PROMPT Contenu de la table Emplacement:
PROMPT =================================
SELECT *
FROM EMPLACEMENT;

PROMPT Contenu de la table Emplacement Libre:
PROMPT =================================
SELECT *
FROM EMPLACEMENT_LIBRE;

PROMPT Contenu de la table Modele:
PROMPT =================================
SELECT *
FROM MODELE;

PROMPT Contenu de la table Port:
PROMPT =================================
SELECT *
FROM PORT;

PROMPT Contenu de la table Proprietaire:
PROMPT =================================
SELECT *
FROM PROPRIETAIRE;

PROMPT Contenu de la table Sortie:
PROMPT =================================
SELECT *
FROM SORTIE;

PROMPT Contenu de la table Type Emplacemment:
PROMPT =================================
SELECT *
FROM TYPE_EMPLACEMENT;