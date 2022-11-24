
--==========================
--fichier : afficher_base_surgeles.sql
--base:
--auteur(s): Tania OLIVIA
--date : 15/11/2019
--role: Afficher l’ensemble du contenu des tables de la base de données
--projet: surgelés
--resultat dans:  // à renseigner si nécessaire
--==========================

PROMPT Contenu de la table Client :
PROMPT =================================
SELECT *
FROM CLIENT;

PROMPT Contenu de la table Commande:
PROMPT =================================
SELECT *
FROM COMMANDE;

PROMPT Contenu de la table Ligne_Commande:
PROMPT =================================
SELECT *
FROM LIGNE_COMMANDE;

PROMPT Contenu de la table Produit:
PROMPT =================================
SELECT *
FROM PRODUIT;

PROMPT Contenu de la table Livraison:
PROMPT =================================
SELECT *
FROM LIVRAISON;

PROMPT Contenu de la table Livreur:
PROMPT =================================
SELECT *
FROM LIVREUR;