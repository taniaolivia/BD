-- ============================================================================
-- Fichier          : commandesSansDessertIN.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18 Novembre 2019
-- Base				: Surgeles
-- Role             : La requête avec IN pour connaître les numéros et date de commande qui ne comportant pas de produit de type "dessert"
-- ============================================================================

SELECT C.IDCOM, C.DATECOM
FROM COMMANDE C
WHERE C.IDCOM NOT IN (SELECT L.IDCOM
              FROM LIGNE_COMMANDE L, PRODUIT P
              WHERE L.IDPRO = P.IDPRO
              AND P.TYPEPRO = 'DESSERT'
);