-- ============================================================================
-- Fichier          : moins5euros.sql
-- Auteur           : Tania OLIVIA
-- Date             : 10 Decembre 2019
-- Base				: Surgeles
-- Role             : La requête avec NOT IN pour connaître les commandes qui ne possèdent que des lignes 
--                    de commande dont les prix unitaires des produits sont inférieurs à 5
-- ============================================================================

SELECT C.IDCOM, C.DATECOM
FROM COMMANDE C
WHERE C.IDCOM NOT IN (SELECT L.IDCOM
              FROM LIGNE_COMMANDE L, COMMANDE C
              WHERE L.PRIXUNIT >= 5
);