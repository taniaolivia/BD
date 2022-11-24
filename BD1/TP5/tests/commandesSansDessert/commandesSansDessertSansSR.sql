-- ============================================================================
-- Fichier          : commandesAvecDessertSansSR.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18 Novembre 2019
-- Base				: Surgeles
-- Role             : La requête sans sous-requête pour connaître les numéros et date de commande qui ne comportant pas de produit de type "dessert"
-- ============================================================================

SELECT C.IDCOM, C.DATECOM
FROM COMMANDE C, LIGNE_COMMANDE L, PRODUIT P
WHERE C.IDCOM = L.IDCOM
AND L.IDPRO = P.IDPRO 
AND P.TYPEPRO != 'DESSERT';
