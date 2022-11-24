--==========================
--fichier           : vide_contenu_base_gestionDT.sql
--base              : Gestion DT
--auteur(s)         : Tania OLIVIA
--date              : 08/04/2020
--role              : Supprimer des nuplets en suivant un ordre respectant les dépendances de références
--projet            : Gestion DT
--resultat dans     :  // à renseigner si nécessaire
--==========================


DELETE FROM AFFECTATION;
DELETE FROM COMMENTAIRE;
DELETE FROM TECHNICIEN;
DELETE FROM DEMANDE_TRAVAUX;
DELETE FROM TYPE_DEMANDE;
DELETE FROM SERVICE;
DELETE FROM EMPLOYE;
DELETE FROM AGENCE;
