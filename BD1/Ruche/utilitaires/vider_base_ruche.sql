--==========================
--fichier : vider_base_ruche.sql
--base: ruche
--auteur(s): Tania OLIVIA
--date : 10/12/2019
--role: Supprimer des nuplets en suivant un ordre respectant les dépendances de références
--projet: ruche
--resultat dans:  // à renseigner si nécessaire
--==========================

DELETE FROM RECOLTE;
DELETE FROM RUCHE;
DELETE FROM RUCHER;
DELETE FROM APICULTEUR;
