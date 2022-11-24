-- ============================================================================
-- Fichier          : commandesAvecDessertExists.sql
-- Auteur           : C. Faucher
-- Date             : Novembre 2014
-- Base				: Surgeles
-- Role             : La requête avec EXISTS pour connaître les numéros et date de commande pour lesquels des produits de type "dessert" ont été achetés
-- ============================================================================

SELECT C.IDCOM, C.DATECOM
FROM COMMANDE C
WHERE EXISTS (SELECT *
              FROM LIGNE_COMMANDE L, PRODUIT P
              WHERE L.IDPRO = P.IDPRO
              AND P.TYPEPRO = 'DESSERT'
              AND C.IDCOM = L.IDCOM
);