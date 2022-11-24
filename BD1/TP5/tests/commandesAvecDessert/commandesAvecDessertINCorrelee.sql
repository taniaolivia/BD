-- ============================================================================
-- Fichier          : commandesAvecDessertINCorrelee.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18 Novembre 2019
-- Base				: Surgeles
-- Role             : La requête avec IN et une sous_requête corrélée pour connaître les numéros et date de commande pour lesquels des produits de type "dessert" ont été achetés
-- ============================================================================

SELECT C.IDCOM, C.DATECOM
FROM COMMANDE C
WHERE 'DESSERT' IN (SELECT P.TYPEPRO
                         FROM LIGNE_COMMANDE L, PRODUIT P
                         WHERE C.IDCOM = L.IDCOM
                         AND L.IDPRO = P.IDPRO
);