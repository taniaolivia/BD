
--==========================
--fichier : afficher_base_ruche.sql
--base: ruche
--auteur(s): Tania OLIVIA
--date : 10/12/2019
--role: Afficher l’ensemble du contenu des tables de la base de données
--projet: ruche
--resultat dans:  // à renseigner si nécessaire
--==========================

PROMPT Contenu de la table Apiculteur :
PROMPT =================================
SELECT *
FROM APICULTEUR;

PROMPT Contenu de la table Rucher:
PROMPT =================================
SELECT *
FROM RUCHER;

PROMPT Contenu de la table Ruche:
PROMPT =================================
SELECT *
FROM RUCHE;

PROMPT Contenu de la table Recolte:
PROMPT =================================
SELECT *
FROM RECOLTE;
