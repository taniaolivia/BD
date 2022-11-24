--==========================
--fichier           : videContenuBase.sql
--base              : port plaisance
--auteur(s)         : Tania OLIVIA
--date              : 19/03/2020
--role              : Supprimer des nuplets en suivant un ordre respectant les dépendances de références
--projet            : port plaisance
--resultat dans     :  // à renseigner si nécessaire
--==========================


DELETE FROM SORTIE;
DELETE FROM BATEAU_RESIDENT;
DELETE FROM BATEAU_PASSAGE;
DELETE FROM EMPLACEMENT_LIBRE;
DELETE FROM PROPRIETAIRE;
DELETE FROM PORT;
DELETE FROM MODELE;
DELETE FROM EMPLACEMENT;
DELETE FROM TYPE_EMPLACEMENT;