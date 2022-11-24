--==========================
--fichier           : afficher_contenu_base_portPlaisance.sql
--base              : port plaisance
--auteur(s)         : Tania OLIVIA
--date              : 31/01/2020
--role              : Afficher l’ensemble du contenu des tables de la base de données
--projet            : port plaisance
--resultat dans     :  // à renseigner si nécessaire
--==========================


PROMPT Contenu de la table Emplacement:
PROMPT =================================
SELECT *
FROM EMPLACEMENT;


PROMPT Contenu de la table Proprietaire:
PROMPT =================================
SELECT *
FROM PROPRIETAIRE;


PROMPT Contenu de la table Type Emplacemment:
PROMPT =================================
SELECT *
FROM TYPE_EMPLACEMENT;