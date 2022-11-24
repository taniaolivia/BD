-- ==========================
-- fichier 	: drop_surgeles.sql
-- base 	: surgeles
-- auteur(s)	: Tania OLIVIA
-- date 	: 17/10/2019
-- role 	: supprimer l'ensemble des tables
-- projet 	: surgeles
-- resultat dans :
-- ==========================

DROP TABLE CLIENT CASCADE CONSTRAINTS;
DROP TABLE COMMANDE CASCADE CONSTRAINTS;
DROP TABLE LIGNE_COMMANDE CASCADE CONSTRAINTS;
DROP TABLE PRODUIT CASCADE CONSTRAINTS;
DROP TABLE LIVREUR CASCADE CONSTRAINTS;
DROP TABLE LIVRAISON CASCADE CONSTRAINTS;