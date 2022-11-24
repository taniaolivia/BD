-- ============================================================================
-- Fichier          : commandesAvecDessertIN.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18 Novembre 2019
-- Base				: Surgeles
-- Role             : La requête avec IN pour connaître les numéros et date de commande pour lesquels des produits de type "dessert" ont été achetés
-- ============================================================================

SELECT C.IDCOM, C.DATECOM
FROM COMMANDE C
WHERE C.IDCOM IN (SELECT L.IDCOM
              FROM LIGNE_COMMANDE L, PRODUIT P
              WHERE L.IDPRO = P.IDPRO
              AND P.TYPEPRO = 'DESSERT'
);