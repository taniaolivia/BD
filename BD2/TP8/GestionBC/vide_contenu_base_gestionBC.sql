--==========================
--fichier           : vide_contenu_base_gestionBC.sql
--base              : Gestion BC
--auteur(s)         : Tania OLIVIA
--date              : 08/04/2020
--role              : Supprimer des nuplets en suivant un ordre respectant les dépendances de références
--projet            : Gestion BC
--resultat dans     :  // à renseigner si nécessaire
--==========================


DELETE FROM MOUVEMENT;
DELETE FROM DROIT_SIGNATURE;
DELETE FROM COMPTE_EPARGNE;
DELETE FROM COMPTE_COURANT;
DELETE FROM COMPTE;
DELETE FROM EMPLOYE;
DELETE FROM CLIENT;
