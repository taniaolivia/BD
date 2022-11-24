-- ============================================================================
-- Fichier          : moins5eurosSansSR.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18 Novembre 2019
-- Base				: Surgeles
-- Role             : La requête sans sous-rêquete pour connaître les commandes qui ne possèdent que des lignes 
--                    de commande dont les prix unitaires des produits sont inférieurs à 5
-- ============================================================================

SELECT C.IDCOM, C.DATECOM
FROM COMMANDE C, LIGNE_COMMANDE L
WHERE C.IDCOM = L.IDCOM
GROUP BY C.IDCOM, C.DATECOM
HAVING MAX(L.PRIXUNIT) < 5;