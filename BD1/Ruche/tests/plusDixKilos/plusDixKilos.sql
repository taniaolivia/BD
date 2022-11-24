-- ============================================================================
-- Fichier          : moins5euros.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18 Novembre 2019
-- Base				: Surgeles
-- Role             : La requête avec IN pour connaître les commandes qui ne possèdent que des lignes 
--                    de commande dont les prix unitaires des produits sont inférieurs à 5
-- ============================================================================

SELECT R.IDRU, SUM(RE.MASSE) AS MasseTotale
FROM RUCHE R, RECOLTE RE
WHERE R.IDRU = RE.IDRU
GROUP BY R.IDRU
HAVING SUM(RE.MASSE) > 10;
