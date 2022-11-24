--==========================
--fichier : vider_base_surgeles.txt
--base:
--auteur(s): Tania OLIVIA
--date : 06/11/2019
--role: Supprimer des nuplets en suivant un ordre respectant les dépendances de références
--projet: surgelés
--resultat dans:  // à renseigner si nécessaire
--==========================

--QUESTION 2
DELETE FROM LIVRAISON;
DELETE FROM LIGNE_COMMANDE;
DELETE FROM LIVREUR;
DELETE FROM PRODUIT;
DELETE FROM COMMANDE;
DELETE FROM CLIENT;